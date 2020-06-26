<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
	protected $serverapi;
    protected $key = "";
    protected $platform;
    const URLMAIL = __DIR__ . '/../library/PHPMailer/PHPMailerAutoload.php';
    const URLMAILCONFIG = __DIR__ . '/../library/PHPMailer/phpmailer_config.php';    
    const URLPDF = __DIR__ . '/../library/dompdf/autoload.inc.php';
    const URLS3 = __DIR__ . '/../library/s3_config.php';

    /**
    * @desc - array con los lenguajes disponibles en la app
    */
    protected $_avalaibleLangs = array("es","en","esBol","enBol");
    protected $t;
     
    /**
    * @desc - cargamos la traducción correspondiente
    */
    protected function initialize()
    {

    	$this->serverapi = $this->config->application->baseUriApi;
    	$this->serverapi2 = $this->config->application->baseUriApi2;
        //$this->serverapi = "http://api.devel.logisticappweb.com";
        $this->recipient = "daniel.cardenas@logisticapp.org";
        $this->tag->prependTitle('PARKING ');
        $this->view->setTemplateAfter('main');
        $this->getTranslation();
        $auth = $this->session->get('auth');
        $this->view->auth = $auth;
        // echo print_r($auth);die; 
        if(!isset($_SESSION["CSRF"])){
            $token = bin2hex(openssl_random_pseudo_bytes(16));
            $_SESSION["CSRF"] = $token;
            $this->view->token = $token;
        }else{
            $this->view->token = $_SESSION["CSRF"];
        }
    }


    /**
    * @desc - obtenemos las traducciones por la sesión del usuario, por defecto español
    */
    public function getTranslation()
    {
     //obtenemos el archivo con las traducciones
     require "../app/messages/".($this->session->has("language") ? $this->session->get("language") : 'es') .".php";
     
     //devolvemos el objeto con las traducciones del idioma escogido
     $translate = new Phalcon\Translate\Adapter\NativeArray(array(
        "content" => $messages
     ));
     
     //establece la variable $t disponible en todas las vistas
     $this->view->t = $translate;
     $this->t = $translate;
    }


   //Magic Para los servicios
    public function sendRedirect($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $serverOutput = curl_exec ($ch);
        curl_close ($ch);
        return $serverOutput;
    }
}
