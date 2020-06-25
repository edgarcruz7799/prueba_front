<?php

class PartnerController extends ControllerBase
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

     /*
    * 
    */
    public function addCellarAction()
    {   
        if ($this->session->get("access_type") == 2) {
            return $this->response->redirect("errors/show401");
        } else {

            $url = $this->serverapi."/cellar/listCityCellar";
            $base = new ControllerBase();
       
            
            $response = $base->sendRedirect($url);

            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->data = $response->data;

            }

            if($this->request->isPost() ){

                $post = $this->request->getPost();
                
                $url = $this->serverapi."/cellar/new";

                $base = new ControllerBase();

                if (isset($post['id_service'])) {
                        $data = array(
                        "name" => $post['name'],
                        "cellar_type" => 'hola',
                        "description" => $post['cellar_type'],
                        "id_city" => $post['id_city'],
                        "address" => $post['address'],
                        "type_area" => $post['type_area'],
                        "deposit_capacity" => $post['deposit_capacity'],
                        "collection_frequency" => $post['collection_frequency'],
                        "storage_cost" => $post['storage_cost'],
                        "handling_cost" => 2000,
                        "minimum_time" => $post['minimum_time'],
                        "image" => 4152, 
                        "name_contact" => $post['name_contact'],
                        "phone_contact" => $post['phone_contact'],
                        "email_contact" => $post['email_contact'],
                        "weekday_opening" => $post['weekday_opening'],
                        "saturday_opening" => $post['saturday_opening'],
                        "sunday_opening" => $post['sunday_opening'],
                        "festive_opening" => $post['festive_opening'],
                        "weekday_closing" => $post['weekday_closing'],
                        "saturday_closing" => $post['saturday_closing'],
                        "sunday_closing" => $post['sunday_closing'],
                        "festive_closing" => $post['festive_closing'],
                        "id_service" => $post['id_service'],
                        "description_service" => $post['description_service'],
                        "cost_service" => $post['cost_service'],
                    );
                }else { 

                $data = array(
                    "name" => $post['name'],
                    "cellar_type" => 'hola',
                    "description" => $post['cellar_type'],
                    "id_departament" => 1,
                    "id_city" => $post['id_city'],
                    "address" => $post['address'],
                    "type_area" => $post['type_area'],
                    "deposit_capacity" => $post['deposit_capacity'],
                    "collection_frequency" => $post['collection_frequency'],
                    "storage_cost" => $post['storage_cost'],
                    "handling_cost" => 2000,
                    "minimum_time" => $post['minimum_time'],
                    "image" => 4152, 
                    "name_contact" => $post['name_contact'],
                    "phone_contact" => $post['phone_contact'],
                    "email_contact" => $post['email_contact'],
                    "weekday_opening" => $post['weekday_opening'],
                    "saturday_opening" => $post['saturday_opening'],
                    "sunday_opening" => $post['sunday_opening'],
                    "festive_opening" => $post['festive_opening'],
                    "weekday_closing" => $post['weekday_closing'],
                    "saturday_closing" => $post['saturday_closing'],
                    "sunday_closing" => $post['sunday_closing'],
                    "festive_closing" => $post['festive_closing'],
                );

                } 


                $response = $base->sendRedirect($url, $data);
                $response = json_decode($response);

                if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;

                }

                return $this->response->redirect("partner/editCellar");

            } else {

                $this->response->setStatusCode(404, "Not Found");
                $this->response->send();
                
            }
        }
       
    }
     /*
    * 
    */
    public function editCellarAction()
    {   

        $url = $this->serverapi."/cellar/listCellarPartner";
        $base = new ControllerBase();
   
        
        $response = $base->sendRedirect($url);

        $response = json_decode($response);

        if(isset($response->return) && $response->return) { 
        $this->view->data = $response->data;

        }

    }

        /*
    * 
    */
    public function detailCellarPartnerAction()
    {   
            $url = $this->serverapi."/cellar/listCityCellar";
            $base = new ControllerBase();
       
            
            $response = $base->sendRedirect($url);

            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->data = $response->data;

            }

           $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/detailCellarPartner";

            $base = new ControllerBase();
            $data = array(
                "id" => $post['id_cellar'],
            );  
            
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;

            }

         else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
         

        }
    }

    /*
    * 
    */
    public function editCellarPartnerAction()
    {   

        if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/updateCellar";

            $base = new ControllerBase();
            $data = array(
                "id" => $post['id'],
                "name" => $post['name'],
                "cellar_type" => 'hola',
                "description" => $post['cellar_type'],
                "id_city" => $post['id_city'],
                "address" => $post['address'],
                "type_area" => $post['type_area'],
                "deposit_capacity" => $post['deposit_capacity'],
                "collection_frequency" => $post['collection_frequency'],
                "storage_cost" => $post['storage_cost'],
                "handling_cost" => 2000,
                "minimum_time" => $post['minimum_time'],
                "image" => 4152, 
                "name_contact" => $post['name_contact'],
                "phone_contact" => $post['phone_contact'],
                "email_contact" => $post['email_contact'],
                "weekday_opening" => $post['weekday_opening'],
                "saturday_opening" => $post['saturday_opening'],
                "sunday_opening" => $post['sunday_opening'],
                "festive_opening" => $post['festive_opening'],
                "weekday_closing" => $post['weekday_closing'],
                "saturday_closing" => $post['saturday_closing'],
                "sunday_closing" => $post['sunday_closing'],
                "festive_closing" => $post['festive_closing'],
            );  
            
            $response = $base->sendRedirect($url, $data);

            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
                return $this->response->redirect("partner/editCellar");
            }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
       
    }

    /*
    * 
    */
    public function deleteCellarAction()
    {   

         if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/deleteCellar";

            $base = new ControllerBase();
            $data = array(
                "id" => $post['id_delete'],

            );  

            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
                return $this->response->redirect("partner/editCellar");
            }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
    }


}