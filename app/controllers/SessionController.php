<?php


class SessionController extends ControllerBase
{

    public function initialize()
    {
        $this->tag->setTitle('Bienvenido');
        parent::initialize();
        $this->view->setTemplateAfter('main');
        $this->view->username=$this->session->get("name_cli");
        $this->view->access_type = $this->session->get("access_type");

        if ($this->session->get("imagen_comercio") != null) {
            $this->view->imagen_comercio = $this->session->get("imagen_comercio");
        }
        
        $_COOKIE["register"] = $_SESSION["CSRF"]; 
        $_COOKIE["register"] = $_SESSION["CSRF"]; 
        
    }

    /*
    *Funcion _registerSession: Registra la sesión del usuario
    */
    private function _registerSession($name, $access_type, $client_id)
    {
        $this->session->set('auth', [
          'name'        => $name,
          'client_id'   => $id
        ]);
    }

    /*
    *Acción end: Cierra la sesión del usuario
    */
    public function endAction()
    {   
        $this->session->remove('auth');
        // $this->session->remove();
        $this->view->msg = $this->t->_("sessionclose");
        $this->dispatcher->forward(array(
            "controller" => "index",
            "action" => "index"
        ));
    }

    /*
    * Función _encryptPass: Encripta contraseña
    */
    private function _encryptPass($password)
    {
        return hash("sha256", $password);
    }

    /*
    *Acción registerClient: Registro del cliente
    */
    public function registerClientAction()
    {   
        if($this->request->isPost()){

            if(isset($_POST["CSRFtoken"]) and isset($_COOKIE["register"])){
                
                if($_POST["CSRFtoken"]  == $_COOKIE["register"] ){

                    $url = $this->serverapi."/client/post";
                    $base = new ControllerBase();

                    $post = $this->request->getPost();
//echo '<pre>',print_r($post,1),'</pre>';die;
                    
                    if($this->session->get("access_type") == 2 || $this->session->get("access_type") == 3){
                        $document = ($this->request->getPost("document") == "") ? 0 : $this->request->getPost("document");
                        $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                        $id_cellar = ($this->session->get("id_cellar") == "") ? 0 : $this->session->get("id_cellar");
                        $name = ($this->session->get("name") == "") ? 0 : $this->session->get("name");
                        $city = ($this->session->get("city") == "") ? 0 : $this->session->get("city");
                        $address = ($this->session->get("address") == "") ? 0 : $this->session->get("address");
                        $deposit_capacity = ($this->session->get("deposit_capacity") == "") ? 0 : $this->session->get("deposit_capacity");
                        $storage_cost = ($this->session->get("storage_cost") == "") ? 0 : $this->session->get("storage_cost");
                        $initial_date = ($this->session->get("initial_date") == "") ? 0 : $this->session->get("initial_date");
                        $final_date = ($this->session->get("final_date") == "") ? 0 : $this->session->get("final_date");
                        $supervisor = ($this->session->get("supervisor") == "") ? 0 : $this->session->get("supervisor");
                        $space_require = ($this->session->get("space_require") == "") ? 0 : $this->session->get("space_require");
                        $deptotal = ($this->session->get("deptotal") == "") ? 0 : $this->session->get("deptotal");
                        $id_truck = ($this->session->get("id_truck") == "") ? 0 : $this->session->get("id_truck");
                        $name_city = ($this->session->get("name_city") == "") ? 0 : $this->session->get("name_city");
                        $name_city2 = ($this->session->get("name_city2") == "") ? 0 : $this->session->get("name_city2");
                        $capacity = ($this->session->get("capacity") == "") ? 0 : $this->session->get("capacity");
                        $cost = ($this->session->get("cost") == "") ? 0 : $this->session->get("cost");
                        $initial_date_truck = ($this->session->get("initial_date_truck") == "") ? 0 : $this->session->get("initial_date_truck");
                        $hour = ($this->session->get("hour") == "") ? 0 : $this->session->get("hour");
                        $conductor = ($this->session->get("conductor") == "") ? 0 : $this->session->get("conductor");
                        $type_load = ($this->session->get("type_load") == "") ? 0 : $this->session->get("type_load");
                    } else {
                        $document = (isset($_POST["document"])) ? $_POST["document"] : 0;
                        $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                        $id_cellar = 0;
                        $name = 0;
                        $city = 0;
                        $address = 0;
                        $deposit_capacity = 0;
                        $storage_cost = 0;
                        $initial_date = 0;
                        $final_date = 0;
                        $supervisor = 0;
                        $space_require = 0;
                        $deptotal = 0;
                        $id_truck = 0;
                        $name_city = 0;
                        $name_city2 = 0;
                        $capacity = 0;
                        $cost = 0;
                        $initial_date_truck = 0;
                        $hour = 0;
                        $conductor = 0;
                        $type_load = 0;
                    }

                    $data = array(
                        //"pass" => $this->request->getPost("password", "string"),
                        "pass" => $this->_encryptPass($this->request->getPost("password")),
                        "email" => $this->request->getPost("email"),
                        "name_cli" => $this->request->getPost("name"),
                        "document" => $document,
                        "access_type" => $access_type,
                        "id_cellar" => $id_cellar,
                        "name" => $name,
                        "city" => $city,
                        "address" => $address,
                        "deposit_capacity" => $deposit_capacity,
                        "storage_cost" => $storage_cost,
                        "initial_date" => $initial_date,
                        "final_date" => $final_date,
                        "supervisor" => $supervisor,
                        "space_require" => $space_require,
                        "deptotal" => $deptotal,
                        "id_truck" => $id_truck,
                        "name_city" => $name_city,
                        "name_city2" => $name_city2,
                        "capacity" => $capacity,
                        "cost" => $cost,
                        "initial_date_truck" => $initial_date_truck,
                        "hour" => $hour,
                        "conductor" => $conductor,
                        "type_load" => $type_load,

                    );
//echo '<pre>',print_r($data,1),'</pre>';die;
                    $response = $base->sendRedirect($url,$data);
                    $response = json_decode($response);
//echo '<pre>',print_r($response,1),'</pre>';die;
                    if(isset($response->return) && $response->return) { 

                        $this->_registerSession($response->data->name, $response->data->access_type, $response->data->client_id);
                        $this->session->set("email", $this->request->getPost("email", "string"));
                        $this->session->set("name_cli",$response->data->name_cli);
                        $this->session->set("id",$response->data->id);

                        if ($response->data->access_type == 2){
                            $this->session->set("id_cellar", $response->data->id_cellar);
                            $this->session->set("name", $response->data->name);
                            $this->session->set("city", $response->data->city);
                            $this->session->set("address", $response->data->address);
                            $this->session->set("deposit_capacity", $response->data->deposit_capacity);
                            $this->session->set("storage_cost", $response->data->storage_cost);
                            $this->session->set("initial_date", $response->data->initial_date);
                            $this->session->set("final_date", $response->data->final_date);
                            $this->session->set("supervisor", $response->data->supervisor);
                            $this->session->set("space_require", $response->data->space_require);
                            $this->session->set("deptotal", $response->data->deptotal);
                        }
                        if ($response->data->access_type == 3){
                            $this->session->set("id_truck", $response->data->id_truck);
                            $this->session->set("name", $response->data->name);
                            $this->session->set("name_city", $response->data->name_city);
                            $this->session->set("name_city2", $response->data->name_city2);
                            $this->session->set("capacity", $response->data->capacity);
                            $this->session->set("cost", $response->data->cost);
                            $this->session->set("initial_date_truck", $response->data->initial_date_truck);
                            $this->session->set("hour", $response->data->hour);
                            $this->session->set("conductor", $response->data->conductor);
                            $this->session->set("type_load", $response->data->type_load);
                        }

                        if ($response->data->client_image == ""){
                            $this->session->set("client_image","http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png");
                        }else{
                            $this->session->set("client_image",$response->data->client_image);
                        }

                        return $this->response->redirect("index/index");

                    } else {
                        $this->view->msg = $this->t->_("error");
                        $this->view->msg2 = $this->t->_("loginfailure");
                        $this->dispatcher->forward(array(
                            "controller" => "index",
                            "action" => "index"
                        ));
                    }
                }
            }
        }
    }

    /*
    *Acción loginClient: Inicio de sesión del cliente
    */
    public function loginClientAction()
    {      
        
        if($this->request->isPost()){
            
            if(isset($_POST["CSRFtoken"]) and isset($_COOKIE["register"])){

                if($_POST["CSRFtoken"]  == $_COOKIE["register"] ){
                   
                    $url = $this->serverapi."/client/loginClient"; 
                    $base = new ControllerBase();

                    $post = $this->request->getPost();

                    $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                    $id_cellar = ($this->session->get("id_cellar") == "") ? 0 : $this->session->get("id_cellar");
                    $name = ($this->session->get("name") == "") ? 0 : $this->session->get("name");
                    $city = ($this->session->get("city") == "") ? 0 : $this->session->get("city");
                    $address = ($this->session->get("address") == "") ? 0 : $this->session->get("address");
                    $deposit_capacity = ($this->session->get("deposit_capacity") == "") ? 0 : $this->session->get("deposit_capacity");
                    $storage_cost = ($this->session->get("storage_cost") == "") ? 0 : $this->session->get("storage_cost");
                    $initial_date = ($this->session->get("initial_date") == "") ? 0 : $this->session->get("initial_date");
                    $final_date = ($this->session->get("final_date") == "") ? 0 : $this->session->get("final_date");
                    $supervisor = ($this->session->get("supervisor") == "") ? 0 : $this->session->get("supervisor");
                    $space_require = ($this->session->get("space_require") == "") ? 0 : $this->session->get("space_require");
                    $deptotal = ($this->session->get("deptotal") == "") ? 0 : $this->session->get("deptotal");
                    $id_truck = ($this->session->get("id_truck") == "") ? 0 : $this->session->get("id_truck");
                    $name_city = ($this->session->get("name_city") == "") ? 0 : $this->session->get("name_city");
                    $name_city2 = ($this->session->get("name_city2") == "") ? 0 : $this->session->get("name_city2");
                    $capacity = ($this->session->get("capacity") == "") ? 0 : $this->session->get("capacity");
                    $cost = ($this->session->get("cost") == "") ? 0 : $this->session->get("cost");
                    $initial_date_truck = ($this->session->get("initial_date_truck") == "") ? 0 : $this->session->get("initial_date_truck");
                    $hour = ($this->session->get("hour") == "") ? 0 : $this->session->get("hour");
                    $conductor = ($this->session->get("id_conductor") == "") ? 0 : $this->session->get("conductor");
                    $type_load = ($this->session->get("type_load") == "") ? 0 : $this->session->get("type_load");

                    $data = array(
                        "email" => $post['login-email'],
                        "pass"  => hash('sha256', $this->request->getPost("password")),
                        "access_type" => $access_type,
                        "id_cellar" => $id_cellar,
                        "name" => $name,
                        "city" => $city,
                        "address" => $address,
                        "deposit_capacity" => $deposit_capacity,
                        "storage_cost" => $storage_cost,
                        "initial_date" => $initial_date,
                        "final_date" => $final_date,
                        "supervisor" => $supervisor,
                        "space_require" => $space_require,
                        "deptotal" => $deptotal,
                        "id_truck" => $id_truck,
                        "name_city" => $name_city,
                        "name_city2" => $name_city2,
                        "capacity" => $capacity,
                        "cost" => $cost,
                        "initial_date_truck" => $initial_date_truck,
                        "hour" => $hour,
                        "conductor" => $conductor,
                        "type_load" => $type_load,
                    );

                    $answer = $base->sendRedirect($url,$data);  
                    $answer = json_decode($answer);


                    if (isset($answer->return) && $answer->return) {
                        $this->_registerSession($answer->data->name, $answer->data->access_type, $answer->data->id);
                        $this->session->set("email", $post['login-email']);
                        $this->session->set("name_cli",$answer->data->name_cli);
                        $this->session->set("id",$answer->data->id); 
                        $this->session->set("access_type", $answer->data->access_type); // Validar que tipo de usuario esta ingresando (1 = Cliente / 2 = Compañia) 
                        $this->session->set("signature_key", $answer->data->signature_key);
                        $this->session->set("created_at", $answer->data->created_at);
                        if ($answer->data->access_type == 2){
                            $this->session->set("id_cellar", $answer->data->id_cellar);
                            $this->session->set("name", $answer->data->name);
                            $this->session->set("city", $answer->data->city);
                            $this->session->set("address", $answer->data->address);
                            $this->session->set("deposit_capacity", $answer->data->deposit_capacity);
                            $this->session->set("storage_cost", $answer->data->storage_cost);
                            $this->session->set("initial_date", $answer->data->initial_date);
                            $this->session->set("final_date", $answer->data->final_date);
                            $this->session->set("supervisor", $answer->data->supervisor);
                            $this->session->set("space_require", $answer->data->space_require);
                            $this->session->set("deptotal", $answer->data->deptotal);
                        }
                        if ($answer->data->access_type == 3){
                            $this->session->set("id_truck", $answer->data->id_truck);
                            $this->session->set("name", $answer->data->name);
                            $this->session->set("name_city", $answer->data->name_city);
                            $this->session->set("name_city2", $answer->data->name_city2);
                            $this->session->set("capacity", $answer->data->capacity);
                            $this->session->set("cost", $answer->data->cost);
                            $this->session->set("initial_date_truck", $answer->data->initial_date_truck);
                            $this->session->set("hour", $answer->data->hour);
                            $this->session->set("conductor", $answer->data->conductor);
                            $this->session->set("type_load", $answer->data->type_load);
                        }


                        if ($answer->data->client_image == ""){
                            $this->session->set("client_image","http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png"); 
                        }else{
                            $this->session->set("client_image",$answer->data->client_image);
                        }

                        return $this->response->redirect("index/index");

                    } else {
                        $this->view->msg = $this->t->_("error");
                        $this->view->msg2 = $this->t->_("loginerror");
                        $this->dispatcher->forward(array(
                            "controller" => "index",
                            "action" => "index"
                        ));
                    }
                }
            }
        }
    } 

    /*
    *Acción editClient: Modifica los datos y carga la información del cliente
    */
    public function editClientAction()
    {   
        
        $this->view->setTemplateAfter('adminlayout');
        $url = $this->serverapi."/client/detailClient"; 
        $base = new ControllerBase();

        $data = array(
          "id_client" => $this->session->get("id"),
        ); 

        $answer = $base->sendRedirect($url,$data);    
        $answer = json_decode($answer);  

        if (isset($answer->return) && $answer->return) { 
            
            $this->view->access = $this->session->get("access_type");
            $this->view->data = $answer->data;
            $this->view->city = $answer->city;
                 
        } else {
            $this->flashSession->error("No se pudieron cargar sus datos");
        }

        if($this->request->isPost()){ 

            $url = $this->serverapi."/client/editClient"; 
            $base = new ControllerBase();

            $post = $this->request->getPost();

            $name_client = $this->request->getPost('name') != null ? $this->request->getPost('name') : " ";
            $document = $this->request->getPost('document') != null ? $this->request->getPost('document') : " ";
            $phone = $this->request->getPost('phone') != null ? $this->request->getPost('phone') : " ";

            if ( 0 < 1) {
                
 
               
               /* $folder = "client";
                $name = $_FILES['foto']['name'];
                $name = str_replace(" ", "_", $name);
                $tmp = $_FILES['foto']['tmp_name'];

                include ControllerBase::URLS3;

                $fl_Foto = $s3file;*/
                
             $data = array(
                  "id_client" => $this->session->get("id"),
                  "name" => $name_client,
                  "phone" => $phone,
                  "document" => $document,
                  "id_city" => $post['city'],
                  "address" => $post['address'],
                  "access_type" => $this->session->get("access_type")
                ); 

            } else {


                $data = array(
                  "id_client" => $this->session->get("id"),
                  "name" => $post['name'],
                  "phone" => $phone,
                  "document" => $document,
                  "access_type" => $this->session->get("access_type")  
                ); 
                
            }

            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer); 

            if (isset($answer->return) && $answer->return) { 

                $this->session->set("name",$answer->data->name);
                $this->session->set("client_image",$answer->data->client_image);

                return $this->response->redirect("session/editClient");

            } else {

                $this->flashSession->error("No se pudieron guardar los cambios");

            }
        }
    }

    /*
    *Acción forgotPasswordClient: Enviar email cambio de contraseña
    */
    public function forgotPasswordClientAction()
    {
        if($this->request->isPost()){

            $url = $this->serverapi."/clientgateway/forgotpassword"; 
            $base = new ControllerBase();

            $email = $this->request->getPost('login-email') != null ? $this->request->getPost('login-email') : " ";
            $phone = $this->request->getPost('phone') != null ? $this->request->getPost('phone') : " ";

            $data = array(
                "email" => $email,
                // "route" => "https://" .$_SERVER['SERVER_NAME'] ."/session/changePasswordClient",     
                "route" => "http://localhost/brinkscashcommerce/session/changePasswordClient",       
                "phone" => $phone,
            );

            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer);   
           
            //$msg = $answer->message; 

            if (isset($answer->return) && $answer->return) {
                //$this->view->msg = "forgot_password_success";
                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));    
            } else {    

                //$this->flashSession->success($msg);
                return $this->response->redirect("index/index"); 

            }
        }    
    }

    /*
    *Acción changePasswordClient: Cambiar contraseña
    */
    public function changePasswordClientAction()
    {
        $url = $this->serverapi."/clientgateway/changepassword"; 
        $base = new ControllerBase();
    
        $this->view->token = $_GET["token"];

        if($this->request->isPost()){

            $post = $this->request->getPost();
    
            $data = array(
                "token" => $_POST["token"],    
                "pass" => hash('sha256', $this->request->getPost("password")),
            );

            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer);

            if (isset($answer->return) && $answer->return) {
                //$this->view->msg = "change_password_success";
                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));   
            } else {
                $this->view->msg = $this->t->_("error");
                $this->view->msg2 = $this->t->_("changepasswordfailure");
                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));  
            }
        }
    }

    /*
    *Acción facebook: Inicio de sesión y registro con facebook
    */
    public function facebookAction()
    {
        if($this->request->isPost()){

            if($this->session->get("access_type") == 2 || $this->session->get("access_type") == 3){
                $document = ($this->request->getPost("document") == "") ? 0 : $this->request->getPost("document");
                $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                $id_cellar = ($this->session->get("id_cellar") == "") ? 0 : $this->session->get("id_cellar");
                $name = ($this->session->get("name") == "") ? 0 : $this->session->get("name");
                $city = ($this->session->get("city") == "") ? 0 : $this->session->get("city");
                $address = ($this->session->get("address") == "") ? 0 : $this->session->get("address");
                $deposit_capacity = ($this->session->get("deposit_capacity") == "") ? 0 : $this->session->get("deposit_capacity");
                $storage_cost = ($this->session->get("storage_cost") == "") ? 0 : $this->session->get("storage_cost");
                $initial_date = ($this->session->get("initial_date") == "") ? 0 : $this->session->get("initial_date");
                $final_date = ($this->session->get("final_date") == "") ? 0 : $this->session->get("final_date");
                $supervisor = ($this->session->get("supervisor") == "") ? 0 : $this->session->get("supervisor");
                $space_require = ($this->session->get("space_require") == "") ? 0 : $this->session->get("space_require");
                $deptotal = ($this->session->get("deptotal") == "") ? 0 : $this->session->get("deptotal");
                $id_truck = ($this->session->get("id_truck") == "") ? 0 : $this->session->get("id_truck");
                $name_city = ($this->session->get("name_city") == "") ? 0 : $this->session->get("name_city");
                $name_city2 = ($this->session->get("name_city2") == "") ? 0 : $this->session->get("name_city2");
                $capacity = ($this->session->get("capacity") == "") ? 0 : $this->session->get("capacity");
                $cost = ($this->session->get("cost") == "") ? 0 : $this->session->get("cost");
                $initial_date_truck = ($this->session->get("initial_date_truck") == "") ? 0 : $this->session->get("initial_date_truck");
                $hour = ($this->session->get("hour") == "") ? 0 : $this->session->get("hour");
                $conductor = ($this->session->get("conductor") == "") ? 0 : $this->session->get("conductor");
                $type_load = ($this->session->get("type_load") == "") ? 0 : $this->session->get("type_load");
            } else {
                $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                $id_cellar = 0;
                $name = 0;
                $city = 0;
                $address = 0;
                $deposit_capacity = 0;
                $storage_cost = 0;
                $initial_date = 0;
                $final_date = 0;
                $supervisor = 0;
                $space_require = 0;
                $deptotal = 0;
                $id_truck = 0;
                $name_city = 0;
                $name_city2 = 0;
                $capacity = 0;
                $cost = 0;
                $initial_date_truck = 0;
                $hour = 0;
                $conductor = 0;
                $type_load = 0;
            }

            $post = $this->request->getPost();
            $url = $this->serverapi."/client/postAdminFacebook";
            $base = new ControllerBase();


            $data = array(
                "pass" => $post["token_fb"],
                "email" => $post["mail_fb"],    
                "name" => $post["name_fbb"],
                "access_type" => $access_type,
                "id_cellar" => $id_cellar,
                "name" => $name,
                "city" => $city,
                "address" => $address,
                "deposit_capacity" => $deposit_capacity,
                "storage_cost" => $storage_cost,
                "initial_date" => $initial_date,
                "final_date" => $final_date,
                "supervisor" => $supervisor,
                "space_require" => $space_require,
                "deptotal" => $deptotal,
                "id_truck" => $id_truck,
                "name_city" => $name_city,
                "name_city2" => $name_city2,
                "capacity" => $capacity,
                "cost" => $cost,
                "initial_date_truck" => $initial_date_truck,
                "hour" => $hour,
                "conductor" => $conductor,
                "type_load" => $type_load,
            );
    
            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer);

            if (isset($answer->return) && $answer->return) { 

                $this->_registerSession($answer->data->name, $answer->data->access_type, $answer->data->client_id);

                $this->session->set("email", $post['login-email']);
                $this->session->set("name_cli",$answer->data->name_cli);
                $this->session->set("id",$answer->data->id); 
                $this->session->set("access_type", $answer->data->access_type); // Validar que tipo de usuario esta ingresando

                if ($response->data->access_type == 2){
                    $this->session->set("id_cellar", $response->data->id_cellar);
                    $this->session->set("name", $response->data->name);
                    $this->session->set("city", $response->data->city);
                    $this->session->set("address", $response->data->address);
                    $this->session->set("deposit_capacity", $response->data->deposit_capacity);
                    $this->session->set("storage_cost", $response->data->storage_cost);
                    $this->session->set("initial_date", $response->data->initial_date);
                    $this->session->set("final_date", $response->data->final_date);
                    $this->session->set("supervisor", $response->data->supervisor);
                    $this->session->set("space_require", $response->data->space_require);
                    $this->session->set("deptotal", $response->data->deptotal);
                }
                if ($response->data->access_type == 3){
                    $this->session->set("id_truck", $response->data->id_truck);
                    $this->session->set("name", $response->data->name);
                    $this->session->set("name_city", $response->data->name_city);
                    $this->session->set("name_city2", $response->data->name_city2);
                    $this->session->set("capacity", $response->data->capacity);
                    $this->session->set("cost", $response->data->cost);
                    $this->session->set("initial_date_truck", $response->data->initial_date_truck);
                    $this->session->set("hour", $response->data->hour);
                    $this->session->set("conductor", $response->data->conductor);
                    $this->session->set("type_load", $response->data->type_load);
                }

                if ($answer->data->client_image == ""){
                    $this->session->set("client_image","http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png"); 
                }else{
                    $this->session->set("client_image",$answer->data->client_image);
                }
                
                return $this->response->redirect("index/index");      

            } else {
                $this->view->msg = $this->t->_("error");
                $this->view->msg2 = $this->t->_("loginerrorfacebook");
                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));
            }            
        }       
    } 

    /*
    *Acción google: Inicio de sesión y registro con google
    */   
    public function googleAction()
    {
        if($this->request->isPost()){

            if($this->session->get("access_type") == 2 || $this->session->get("access_type") == 3){
                $document = ($this->request->getPost("document") == "") ? 0 : $this->request->getPost("document");
                $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                $id_cellar = ($this->session->get("id_cellar") == "") ? 0 : $this->session->get("id_cellar");
                $name = ($this->session->get("name") == "") ? 0 : $this->session->get("name");
                $city = ($this->session->get("city") == "") ? 0 : $this->session->get("city");
                $address = ($this->session->get("address") == "") ? 0 : $this->session->get("address");
                $deposit_capacity = ($this->session->get("deposit_capacity") == "") ? 0 : $this->session->get("deposit_capacity");
                $storage_cost = ($this->session->get("storage_cost") == "") ? 0 : $this->session->get("storage_cost");
                $initial_date = ($this->session->get("initial_date") == "") ? 0 : $this->session->get("initial_date");
                $final_date = ($this->session->get("final_date") == "") ? 0 : $this->session->get("final_date");
                $supervisor = ($this->session->get("supervisor") == "") ? 0 : $this->session->get("supervisor");
                $space_require = ($this->session->get("space_require") == "") ? 0 : $this->session->get("space_require");
                $deptotal = ($this->session->get("deptotal") == "") ? 0 : $this->session->get("deptotal");
                $id_truck = ($this->session->get("id_truck") == "") ? 0 : $this->session->get("id_truck");
                $name_city = ($this->session->get("name_city") == "") ? 0 : $this->session->get("name_city");
                $name_city2 = ($this->session->get("name_city2") == "") ? 0 : $this->session->get("name_city2");
                $capacity = ($this->session->get("capacity") == "") ? 0 : $this->session->get("capacity");
                $cost = ($this->session->get("cost") == "") ? 0 : $this->session->get("cost");
                $initial_date_truck = ($this->session->get("initial_date_truck") == "") ? 0 : $this->session->get("initial_date_truck");
                $hour = ($this->session->get("hour") == "") ? 0 : $this->session->get("hour");
                $conductor = ($this->session->get("conductor") == "") ? 0 : $this->session->get("conductor");
                $type_load = ($this->session->get("type_load") == "") ? 0 : $this->session->get("type_load");
            } else {
                $access_type = ($this->session->get("access_type") == "") ? 0 : $this->session->get("access_type");
                $id_cellar = 0;
                $name = 0;
                $city = 0;
                $address = 0;
                $deposit_capacity = 0;
                $storage_cost = 0;
                $initial_date = 0;
                $final_date = 0;
                $supervisor = 0;
                $space_require = 0;
                $deptotal = 0;
                $id_truck = 0;
                $name_city = 0;
                $name_city2 = 0;
                $capacity = 0;
                $cost = 0;
                $initial_date_truck = 0;
                $hour = 0;
                $conductor = 0;
                $type_load = 0;
            }

            $post = $this->request->getPost();
            $url = $this->serverapi."/client/postAdminGoogle"; 
            $base = new ControllerBase();

            $data = array(
                "pass" => $post["token_goo"],
                "access_type" => $access_type,
                "id_cellar" => $id_cellar,
                "name" => $name,
                "city" => $city,
                "address" => $address,
                "deposit_capacity" => $deposit_capacity,
                "storage_cost" => $storage_cost,
                "initial_date" => $initial_date,
                "final_date" => $final_date,
                "supervisor" => $supervisor,
                "space_require" => $space_require,
                "deptotal" => $deptotal,
                "id_truck" => $id_truck,
                "name_city" => $name_city,
                "name_city2" => $name_city2,
                "capacity" => $capacity,
                "cost" => $cost,
                "initial_date_truck" => $initial_date_truck,
                "hour" => $hour,
                "conductor" => $conductor,
                "type_load" => $type_load,
            );

            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer);

            if (isset($answer->return) && $answer->return) {
                $this->_registerSession($answer->data->name, $answer->data->access_type, $answer->data->id);

                $this->session->set("email", $post['login-email']);
                $this->session->set("name_cli",$answer->data->name_cli);
                $this->session->set("id",$answer->data->id); 
                $this->session->set("access_type", $answer->data->access_type); // Validar que tipo de usuario esta ingresando

                if ($response->data->access_type == 2){
                    $this->session->set("id_cellar", $response->data->id_cellar);
                    $this->session->set("name", $response->data->name);
                    $this->session->set("city", $response->data->city);
                    $this->session->set("address", $response->data->address);
                    $this->session->set("deposit_capacity", $response->data->deposit_capacity);
                    $this->session->set("storage_cost", $response->data->storage_cost);
                    $this->session->set("initial_date", $response->data->initial_date);
                    $this->session->set("final_date", $response->data->final_date);
                    $this->session->set("supervisor", $response->data->supervisor);
                    $this->session->set("space_require", $response->data->space_require);
                    $this->session->set("deptotal", $response->data->deptotal);
                }
                if ($response->data->access_type == 3){
                    $this->session->set("id_truck", $response->data->id_truck);
                    $this->session->set("name", $response->data->name);
                    $this->session->set("name_city", $response->data->name_city);
                    $this->session->set("name_city2", $response->data->name_city2);
                    $this->session->set("capacity", $response->data->capacity);
                    $this->session->set("cost", $response->data->cost);
                    $this->session->set("initial_date_truck", $response->data->initial_date_truck);
                    $this->session->set("hour", $response->data->hour);
                    $this->session->set("conductor", $response->data->conductor);
                    $this->session->set("type_load", $response->data->type_load);
                }

                if ($answer->data->client_image == ""){
                    $this->session->set("client_image","http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png"); 
                }else{
                    $this->session->set("client_image",$answer->data->client_image);
                }
                
                return $this->response->redirect("index/index");

            } else {                
                $this->view->msg = $this->t->_("error");
                $this->view->msg2 = $this->t->_("loginerrorgoogle");
                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));
            }             
        } 
    }  


    /*
    * Acción registerCommerce: Registro de comercio
    */
    public function registerCommerceAction()
    {
        if($this->request->isPost()){

            if(isset($_POST["CSRFtoken"]) and isset($_COOKIE["register"])){
                
                if($_POST["CSRFtoken"]  == $_COOKIE["register"] ){
                    
                    $url = $this->serverapi."/commerce/new"; 
                    $base = new ControllerBase();

                    $data = array(
                        "pass" => $this->_encryptPass($this->request->getPost("password")),
                        "email" => $this->request->getPost("email", "string"),
                        "name" => $this->request->getPost("name", "string"),
                        "commerce_name" => $this->request->getPost("commerce_name", "string"),
                        "nit" => $this->request->getPost("nit", "string")
                    );

                    $response = $base->sendRedirect($url,$data);   
                    $response = json_decode($response);
                
                    if(isset($response->return) && $response->return) { 
                        
                        $this->_registerSession($response->data->name, 2, $response->data->id);
                        
                        $this->session->set("name",$response->data->name);
                        $this->session->set("id",$response->data->id);
                        $this->session->set("access_type", 2); // Validar que tipo de usuario esta ingresando (1 = Cliente / 2 = Compañia)   

                        return $this->response->redirect("index/index"); 

                    } else {                        
                        $this->view->msg = $this->t->_("error");
                        $this->view->msg2 = $this->t->_("loginfailure");
                        $this->dispatcher->forward(array(
                            "controller" => "index",
                            "action" => "index"
                        ));
                    }
                }
            }
        } 
    }


    /*
    * Acción editCommerce: Editar datos basicos del comercio
    */
    public function editCommerceAction()
    {
        if ($this->session->get("access_type") == 1) {

            return $this->response->redirect("errors/show401");

        } else {   

            $url = $this->serverapi."/commerce/detail"; 
            $base = new ControllerBase();

            $data = array(
              "commerce_id" => $this->session->get("id_comercio"),
            ); 

            $answer = $base->sendRedirect($url,$data);    
            $answer = json_decode($answer);  

            if (isset($answer->return) && $answer->return) { 
                $this->view->data = $answer->data;
            } else {
                $this->flashSession->error("No se pudieron cargar sus datos");
            }

            if($this->request->isPost()) { 

                $url = $this->serverapi."/commerce/edit"; 
                $base = new ControllerBase();

                $commerce_name = $this->request->getPost('commerce_name') != null ? $this->request->getPost('commerce_name') : " ";
                $nit = $this->request->getPost('nit') != null ? $this->request->getPost('nit') : " ";
                $email = $this->request->getPost('email') != null ? $this->request->getPost('email') : " ";
                $phone = $this->request->getPost('phone') != null ? $this->request->getPost('phone') : " ";
                $answer_page = $this->request->getPost('answer_page') != null ? $this->request->getPost('answer_page') : " ";
                $confirm_page = $this->request->getPost('confirm_page') != null ? $this->request->getPost('confirm_page') : " ";

                $data = array(
                  "commerce_id" => $this->session->get("id_comercio"),
                  "nit" => $nit,
                  "commerce_name" => $commerce_name,
                  "email" => $email,
                  "phone" => $phone,
                  "answer_page" => $answer_page,
                  "confirm_page" => $confirm_page
                ); 

                $answer = $base->sendRedirect($url,$data);    
                $answer = json_decode($answer);  

                if (isset($answer->return) && $answer->return) { 

                    return $this->response->redirect("session/edit");

                } else {

                    $this->flashSession->error("No se pudieron guardar los cambios");
                }
            }        
        }    
    }        
}