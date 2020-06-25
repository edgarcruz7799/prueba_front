<?php

class CommerceController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();
        $this->view->setTemplateAfter('adminlayout');  
        $this->view->username = ucwords($this->session->get("name"));
        $this->view->access_type = $this->session->get("access_type"); 

        if ($this->session->get("imagen_comercio") != null) {
            $this->view->imagen_comercio = $this->session->get("imagen_comercio");
        }    
    }

    public function servicesPayBuyAction()
    {

        
    }

    public function indexCommerceAction()
    {
        if ($this->session->get("access_type") == 1) {
            return $this->response->redirect("errors/show401");
        } else {
            $active = 0;
            $base = new ControllerBase();
            $url = $this->serverapi."/pin/getTransactionsCommerce"; 

            if (isset($_GET['search'])) {

                $search = $_GET['search'];
                $active = $search;

                if ($search == 1) {
                    $data = array(
                      "commerce_id" => $this->session->get("id_comercio"),
                      "start_date" => date('Y-m-d'),
                      "end_date" => date('Y-m-d', strtotime('+1 day')) 
                    );
                }

                if ($search == 2) {
                    $data = array(
                      "commerce_id" => $this->session->get("id_comercio"),
                      "start_date" => date('Y-m-d', strtotime('-1 week')),
                      "end_date" => date('Y-m-d', strtotime('+1 day')) 
                    );
                }

                if ($search == 3) {
                    $data = array(
                      "commerce_id" => $this->session->get("id_comercio"),
                      "start_date" => date('Y-m-d', strtotime('-1 month')),
                      "end_date" => date('Y-m-d', strtotime('+1 day')) 
                    );
                }

                $answer = $base->sendRedirect($url,$data);   
                $answer = json_decode($answer);

                if(isset($answer->return) && $answer->return) { 
                    $this->view->dato = $answer->data;
                } else {
                    $this->flash->error('No se han encontrado transacciones.');
                }
                
            } else {

                if($this->request->isPost()){ 

                    $post = $this->request->getPost();
                    
                    $data = array(
                        "commerce_id" => $this->session->get("id_comercio"),
                        "start_date" => $post['startdate'],
                        "end_date" => $post['enddate']
                    );
                    $active = 4;
                   
                    $response = $base->sendRedirect($url,$data);   
                    $response = json_decode($response); 

                    if(isset($response->return) && $response->return) { 
                        $this->view->dato = $response->data;
                    } else {
                        $this->flash->error('No se han encontrado transacciones.');
                    }
                }                
            }
            $this->view->active = $active;
        }
    }

    /*
     * Administrar Cuenta
    */
    public function manageaccountAction(){
        if ($this->session->get("access_type") == 1) {
            return $this->response->redirect("errors/show401");
        } else {
            
        }
    }        

}    