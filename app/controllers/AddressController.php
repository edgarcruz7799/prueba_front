<?php

class AddressController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();
        $this->view->setTemplateAfter('adminlayout');  
        $this->view->username = $this->session->get("name");
        $this->view->access_type = $this->session->get("access_type"); 

        if ($this->session->get("imagen_comercio") != null) {
            $this->view->imagen_comercio = $this->session->get("imagen_comercio");
        }    
    }
    
    /*
    * Acción index: Carga todas las direcciones asociadas al cliente o comercio
    */
    public function indexAction()
    {
        if ($this->session->get("access_type") == 1) {
            $data = array(
                "id_user" => $this->session->get("id"),
                "type_user" => $this->session->get("access_type"),
            );
        } 

        if ($this->session->get("access_type") == 2) {
            $data = array(
                "id_user" => $this->session->get("id_comercio"),
                "type_user" => $this->session->get("access_type"),
            );
        } 

        $base = new ControllerBase();
        $url = $this->serverapi."/location/getLocationAdmin"; 

	    $response = $base->sendRedirect($url,$data);   
	    $response = json_decode($response); 

        if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
        } else {
            $this->flash->error('No se han encontrado direcciones.');
        }
    }

    /*
    * Acción delete: Elimina dirección asociada al cliente o comercio
    */
    public function deleteAction()
    {
        $url = $this->serverapi."/location/deleteAddressAdmin"; 
        $base = new ControllerBase();

        $data = array(
            "id_location" => $_GET['address']
        );

        $answer = $base->sendRedirect($url,$data);   
        $answer = json_decode($answer);

        if(isset($answer->return) && $answer->return) { 
            $this->view->msg = "delete_address_success";
            $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));  
        } else {
            $this->view->msg = "delete_address_failure";
            $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }
    }

    /* 
    * Acción addAddress: Agrega o edita una dirección y la asocia a cliente o comercio
    */
    public function addAddressAction()
    {
        if($this->request->isPost()){

            $url = $this->serverapi."/location/postAddressAdmin"; 
            $base = new ControllerBase();

            $post = $this->request->getPost();

            if ($post['id_address'] != "") {
                if ($this->session->get("access_type") == 1) {
                    $data = array(
                        "id_user" => $this->session->get("id"),
                        "email" => $this->session->get("email"),
                        "name_address" => $post['name_address'],
                        "address" => $post['direccion'],
                        "latitude" => $post['latitud'],
                        "longitude" => $post['longitud'],
                        "contact_phone" => $post['phone'],
                        "id_location" => $post['id_address']
                    ); 
                } elseif ($this->session->get("access_type") == 2) {
                    $data = array(
                        "id_user" => $this->session->get("id"),
                        "email" => $this->session->get("email"),
                        "name_address" => $post['name_address'],
                        "address" => $post['direccion'],
                        "latitude" => $post['latitud'],
                        "longitude" => $post['longitud'],
                        "contact_phone" => $post['phone'],
                        "commerce_id" => $this->session->get("id_comercio"),
                        "id_location" => $post['id_address'],
                    );
                }

            } else {

                if ($this->session->get("access_type") == 1) {
                    $data = array(
                        "id_user" => $this->session->get("id"),
                        "email" => $this->session->get("email"),
                        "name_address" => $post['name_address'],
                        "address" => $post['direccion'],
                        "latitude" => $post['latitud'],
                        "longitude" => $post['longitud'],
                        "contact_phone" => $post['phone'],
                    ); 

                } elseif ($this->session->get("access_type") == 2) {
                    $data = array(
                        "id_user" => $this->session->get("id"),
                        "email" => $this->session->get("email"),
                        "name_address" => $post['name_address'],
                        "address" => $post['direccion'],
                        "latitude" => $post['latitud'],
                        "longitude" => $post['longitud'],
                        "contact_phone" => $post['phone'],
                        "commerce_id" => $this->session->get("id_comercio")
                    );
                }
            }

            $response = $base->sendRedirect($url,$data);

            $response = json_decode($response);
          
            if(isset($response->return) && $response->return) {   
                $this->view->msg = "add_address_success";
                $this->dispatcher->forward(array(
                    "controller" => "address",
                    "action" => "index"
                ));
            } else {
                $this->view->msg = "add_address_failure";
                $this->dispatcher->forward(array(
                    "controller" => "address",
                    "action" => "index"
                ));
            }
        }
    } 

    /*
    * Acción detail: Retorna el detalle de una dirección seleccionada (Ajax)
    */
    public function detailAction()
    {
        $this->view->disable();

        if($this->request->isGet() == true && $this->request->isAjax() == true){

            $id = $this->request->get("address");

            $url = $this->serverapi."/location/detailAddressAdmin";
            $base = new ControllerBase();

            $data = array(
                "id_location" => $id,
            ); 

            $answer = $base->sendRedirect($url, $data);
            $answerA = json_decode($answer);
            
            $this->response->setJsonContent(array(
                "address" => $answerA->data,
            ));

            $this->response->setStatusCode(200, "OK");
            $this->response->send();

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
    }

    public function favoriteAction()
    {
        $url = $this->serverapi."/location/addressFavorite";
        $base = new ControllerBase();

        $data = array(
            "id_location" => $_GET['address'],
            "id_user" => $_GET['id_address']
        );

        $answer = $base->sendRedirect($url,$data);
        $answer = json_decode($answer);
        
        if(isset($answer->return) && $answer->return) {
            $this->view->msg = "delete_address_success";
            $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        } else {
            $this->view->msg = "delete_address_failure";
            $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }
    }
}