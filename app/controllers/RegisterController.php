<?php

/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('adminlayout');  
        $this->view->username = ucwords($this->session->get("name_cli"));
        $this->view->access_type = $this->session->get("access_type"); 

        if ($this->session->get("imagen_comercio") != null) {
            $this->view->imagen_comercio = $this->session->get("imagen_comercio");
        }    
    }




    public function supportAdmAction(){
        
        $this->flash->success('Su correo se ha enviado satisfactoriamente.');
      if ($_SERVER["REQUEST_METHOD"] == "POST") {

            include_once ControllerBase::URLMAIL;
            include_once ControllerBase::URLMAILCONFIG;
            
            $name = strip_tags(trim($_POST["username"]));
            $name = str_replace(array("\r","\n"),array(" "," "),$name);
            $lastname = strip_tags(trim($_POST["lastname"]));
            $lastname = str_replace(array("\r","\n"),array(" "," "),$lastname);                    
            $email = filter_var(trim($_POST["email"]), FILTER_SANITIZE_EMAIL);
            $affair = strip_tags(trim($_POST["affair"]));
            $textmsg = strip_tags(trim($_POST["textmsg"]));

            if ( empty($name) OR !filter_var($email, FILTER_VALIDATE_EMAIL)) {
                http_response_code(400);
                echo "Oops! There was a problem with your submission. Please complete the form and try again.";
                exit;
            }else{
                $this->flash->success('Su correo se ha enviado satisfactoriamente.');
                // Build the email content.
                $email_content = "Felicidades el correo se enviooo";
                $email_content = "<b> Nombre:   </b> $name $lastname <br>";
                $email_content .= "<b> Correo electronico:    </b> $email <br>";
                $email_content .= "<b> Asunto: </b> $affair <br>";
                $email_content .= "<b> Tu mensaje: </b> $textmsg <br>";
                // Send the email.
                
                $mail->From = "colombia@logisticapp.org";
                $mail->FromName = "Brinks";
                $mail->Subject = "$affair";
                $mail->MsgHTML($email_content);
                $mail->AddAddress($email, $name);
                //$mail->IsHTML(true);
                $this->flash->success('Su correo se ha enviado satisfactoriamente.');
                $mail->Send();
                $this->flash->success('Su correo se ha enviado satisfactoriamente.');
                return $this->response->redirect("register/support");
            }

        } else {
            // Not a POST request, set a 403 (forbidden) response code.
            http_response_code(403);
            echo "There was a problem with your submission, please try again.";
        } 
    }    

    /*
     * Solicitud de retiro de dinero
    */
    public function requestwithdrawalAction(){
        
    }

    /*
     * Consultar retiro de dinero
    */
    public function checkwithdrawalAction(){
        
    }

    /*
     * Soporte
    */     
    public function supportAction(){

        if($this->request->isPost()){
            $message = $this->request->getPost();
            $url = $this->serverapi."/sos/support";
                $data = array(
                    "key" => $this->key,
                    "client_gateway_id"=> $message["client_gateway_id"],
                    "nombre" => $message["nombre"],
                    "apellido" => $message["apellido"],
                    "email" => $message["email"],
                    "asunto" => $message["asunto"],
                    "requerimiento" => $message["requerimiento"],
                    "mensaje" => $message["mensaje"],
                    "estado" => 1,
                    "tipo" => 1
                );

            $answer = $this->sendRedirect($url,$data);
            $answer = json_decode($answer);

            if(isset($answer->return) && $answer->return) { 
                $this->view->msg = $this->t->_("enviado");
                $this->view->msg2 = $this->t->_("enviadoexi");
                $this->dispatcher->forward(array(
                    "controller" => "register",
                    "action" => "integrationoptions"
                ));
            }
        }
    }

    /*
     * Soporte Tecnico
    */     
    public function supporttechnicalAction(){

        if($this->request->isPost()){
            $message = $this->request->getPost();
            $url = $this->serverapi."/sos/support";
                $data = array(
                    "key" => $this->key,
                    "client_gateway_id"=> $message["client_gateway_id"],
                    "nombre" => $message["nombre"],
                    "apellido" => $message["apellido"],
                    "email" => $message["email"],
                    "asunto" => $message["asunto"],
                    "requerimiento" => $message["requerimiento"],
                    "mensaje" => $message["mensaje"],
                    "estado" => 1,
                    "tipo" => 2
                ); 

            $answer = $this->sendRedirect($url,$data);   
            $answer = json_decode($answer);

            if(isset($answer->return) && $answer->return) { 
                $this->view->msg = $this->t->_("enviado");
                $this->view->msg2 = $this->t->_("enviadoexi");
                $this->dispatcher->forward(array(
                    "controller" => "register",
                    "action" => "integrationoptions"
                ));
            }

        }
    }
    
    /*
     * Datos de integración
    */
    public function integrationdataAction(){
       // print_r($this->session->get("created_at"));die;
        $this->view->client_name = $this->session->get("name");
        $this->view->client_gateway_id = $this->session->get("email");
        $this->view->key_commerce = $this->session->get("signature_key");
        $this->view->created_at = $this->session->get("created_at");
    } 

    /*
     * Opciones de integración
    */
    public function integrationoptionsAction(){
    }    

}
