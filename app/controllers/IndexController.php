<?php
    
class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenido');
        parent::initialize();
        $this->view->setTemplateAfter('main');
        $this->view->username=$this->session->get("name");
        $this->view->access_type = $this->session->get("access_type");
        
        
    }


    public function setLanguageAction($language='')
    {

        if(in_array($language,$this->_avalaibleLangs)) {
            $this->session->set('language', $language);
        } else {
            $this->session->set('language', 'es');
        }
        
        $referer = $this->request->getHTTPReferer();
     
        if(strpos($referer, $this->request->getHttpHost()."/")!==false) {
            return $this->response->setHeader("Location", $referer);
        } else {
            return $this->dispatcher->forward(array('controller' => 'index', 'action' => 'index'));
        }
    }

    public function termsAction()
    {
        echo "<label style color:white >terminos y condiciones aqui</label>";
    }

    public function indexAction()
    {   
            $url = $this->serverapi2.'establishment/getAllEstablishment';
            $base = new ControllerBase();
            
            $data = array();
            $response = $base->sendRedirect($url,$data);
            // $response = file_get_contents($url);
            // echo print_r($url);die;
            $response = json_decode($response);
            // echo print_r($response);die;
            if($response->return) { 
                $this->view->dataintegration = $response;
            }        
    }
    public function auctionAction()
    {
    }
    
    public function layoutAction()
    {
    }

    public function developersAction()
    {
    }  


    public function buyersAction()
    {
    }        


    public function businessAction()
    {
    }         


    public function supportAction()
    {
    }


    public function checkoutAction()
    {
    }

    public function investmentAction()
    {
    }

    public function quienessomosAction()
    {
    }

    public function coberturaAction()
    {
    }

    public function responsabilidadsocialAction()
    {
    }

    public function certificacionesAction()
    {
    }

    public function seaportsAction()
    {
    }

    public function contactenosAction()
    {
    }

    public function glosarioAction()
    {
    }

    public function vinculacionAction()
    {
    }

    public function acuerdoAction()
    {
    }

    public function proteccionAction()
    {
    }

    public function reorganizacionempresarialAction()
    {
    }

    public function transportAction()
    {
        $url = $this->serverapi."/truck/listSelectTruck";
        $base = new ControllerBase();
   
        $response = $base->sendRedirect($url, $data);

        $response = json_decode($response);

        if(isset($response->return) && $response->return) { 
            $this->view->dat = $response->data;
            $this->view->data = $response->departament;
            $this->view->dato = $response->city;

        }

        if ($this->session->get("auth") != null){
            if ($this->session->get("access_type") == 1) {
                //print_r($this->session->get("access_type"));die;
                return $this->response->redirect("client/indexClient");
            } if ($this->session->get("access_type") == 3) {
                //print_r($this->session->get("access_type"));die;
                $this->session->set("access_type", 1);
                return $this->response->redirect("quotation/billingTruck");
            } else {
                //print_r($this->session->get("access_type"));die;
                $this->session->set("access_type", 1);
                return $this->response->redirect("quotation/billingCellar");
            }
        }else{
            if ($this->session->get("access_type") == 2 || $this->session->get("access_type") == 3) {
                $this->session->set("access_type", 0);
            }
        }
    }

    public function logisticsAction()
    {
    }

    public function operationAction()
    {
    }

    public function commerceAction()
    {
    }

    public function managementAction()
    {
    }

    public function fulfillmentAction()
    {
    }

    public function distributionAction()
    {
    }

    public function pruebaAction()
    {
    }

    public function almaboxAction()
    {
        $url = $this->serverapi."/cellar/listSelect";
        $base = new ControllerBase();
                
        $response = $base->sendRedirect($url, $data);
        $response = json_decode($response);

        if(isset($response->return) && $response->return) { 
            $this->view->dat = $response->data;
            $this->view->data = $response->departament;
            $this->view->dato = $response->city;
        }
    }

    public function storageAction()
    {
       $url = $this->serverapi."/cellar/listSelect";
       $base = new ControllerBase();
 
       
       $response = $base->sendRedirect($url);

       $response = json_decode($response);

       if(isset($response->return) && $response->return) {
           $this->view->dat = $response->data;
           $this->view->data = $response->departament;
           $this->view->dato = $response->city;
       }
    }

    public function supportIndexAction()
    {
        $this->view->msg = $this->t->_("warning");
        $this->view->msg2 = $this->t->_("supportindex");
        $this->dispatcher->forward(array(
            "controller" => "index",
            "action" => "support"
        ));
    }


    public function withUsAction()
    {
        include_once ControllerBase::URLMAIL;
        include_once ControllerBase::URLMAILCONFIG;

        if (!empty($_POST["name_contact"]) and !empty($_POST["email_contact"])) {

            $html = file_get_contents(__DIR__ . '/../library/plantilla_correo.html');

            $html = str_replace("[1]", strtoupper($_POST['name_contact']), $html);
            $html = str_replace("[2]", strtoupper($_POST['email_contact']), $html);
            $html = str_replace("[3]", strtoupper($_POST['text']), $html);

            $mail->From = $_POST['email_contact'];
            $mail->FromName = $_POST['name_contact'];
            $mail->Subject = utf8_decode("CONTÁCTANOS ALMAGRARIO PAGINA WEB");
            $mail->AltBody = utf8_decode("CONTÁCTANOS ALMAGRARIO PAGINA WEB");
            $mail->MsgHTML($html);

            $mail->AddAddress("servicioalcliente@almagrario.com", "Almagrario");
            $mail->IsHTML(true);
            //$mail->AddAttachment($filename);

            if(!$mail->Send()) {
                echo "Fallo en envio de correo\n";
                print_r("fallo");die;
            } else {
                echo "En breve uno de nuestros asesores se contactará contigo\n";
            }

        } else{
            echo 'Hola! Por favor escriba en los campos del formulario';
        }

        // if ($_SERVER["REQUEST_METHOD"] == "POST") {

        //     include_once ControllerBase::URLMAIL;
        //     include_once ControllerBase::URLMAILCONFIG;

        //     $name = strip_tags(trim($_POST["name_contact"]));
        //             $name = str_replace(array("\r","\n"),array(" "," "),$name);
        //     $email = filter_var(trim($_POST["email_contact"]), FILTER_SANITIZE_EMAIL);
        //     $phone = strip_tags(trim($_POST["phone_contact"]));

        //     if (empty($name) OR !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        //         http_response_code(400);
        //         echo "Oops! There was a problem with your submission. Please complete the form and try again.";
        //         exit;
        //     }
        //     // Build the email content.
        //     $email_content = "Felicidades el correo se enviooo";
        //     $email_content = "<b> Nombre:   </b> $name  <br>";
        //     $email_content .= "<b> Correo electronico:    </b> $email <br>";
        //     $email_content .= "<b> Telefono: </b> $phone <br>";
        //     // Send the email.
          
        //     $mail->From = "colombia@logisticapp.org";
        //     $mail->FromName = "Brinks";
        //     $mail->Subject = "BrinksCashCommerce";
        //     $mail->MsgHTML($email_content);
        //     $mail->AddAddress($email, $name);
        //     //$mail->IsHTML(true);
        //     $mail->Send();
    
        //     $this->view->msg = "email_contact_success";
        //     $this->dispatcher->forward(array(
        //         "controller" => "index",
        //         "action" => "support"
        //     )); 

        // } else {
            
        //     $this->view->msg = "email_contact_failure";
        //     $this->dispatcher->forward(array(
        //         "controller" => "index",
        //         "action" => "support"
        //     ));             
        // }
    }
}
