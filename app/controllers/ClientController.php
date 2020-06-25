<?php

class ClientController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();
        $this->view->setTemplateAfter('adminlayout');  
        $this->view->username = ucwords($this->session->get("name_cli"));
        $this->view->access_type = $this->session->get("access_type"); 

        if ($this->session->get("client_image") != null) {
            $this->view->client_image = $this->session->get("client_image");
        }    
    }

    public function servicesPayBuyAction()
    {

    	
    }

    public function indexClientAction(){

        if ($this->session->get("access_type") == 2) {
            return $this->response->redirect("errors/show401");
        } else {

            if($this->request->isPost()){ 

                $url = $this->serverapi."/consultreserveclient/listReserve";
                $base = new ControllerBase();

                $post = $this->request->getPost();

                $data = array(
                    "id_client" => $this->session->get("id"),
                    "start_date" => $post['startdate'],
                    "end_date" => $post['enddate']
                );
               
                $response = $base->sendRedirect($url,$data);   
                $response = json_decode($response); 

                if(isset($response->return) && $response->return) { 
                    $this->view->dato = $response->data;
                } else {
                    $this->flash->error('No se han encontrado transacciones.');
                }

            } else {

                //print_r($this->session->get("access_type"));die;
          
                $url = $this->serverapi."/consultreserveclient/listReserve";
                $base = new ControllerBase();

                if (isset($_GET['search'])) {

                    $search = $_GET['search'];

                    if ($search == 1) {
                        $data = array(
                          "id_client" => $this->session->get("id"),
                          "start_date" => date('Y-m-d'),
                          "end_date" => date('Y-m-d', strtotime('+1 day')) 
                        );
                    }

                    if ($search == 2) {
                        $data = array(
                          "id_client" => $this->session->get("id"),
                          "start_date" => date('Y-m-d', strtotime('-1 week')),
                          "end_date" => date('Y-m-d', strtotime('+1 day')) 
                        );
                    }

                    if ($search == 3) {
                        $data = array(
                          "id_client" => $this->session->get("id"),
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

                    $url = $this->serverapi."/consultreserveclient/listReserve";
                    $base = new ControllerBase();
                    
                    $data = array(
                              "id_client" => $this->session->get("id"),
                            );
                    
                    $response = $base->sendRedirect($url, $data);
                    $response = json_decode($response);

                    if(isset($response->return) && $response->return) { 
                        $this->view->dato = $response->data;
                    }
                }
            }            
        }

        //  if ($this->session->get("access_type") == 2) {
        //     return $this->response->redirect("errors/show401");
        // } else {
        //     $active = 0;
        //     $base = new ControllerBase();
        //     $url = $this->serverapi."/pin/getTransactionsClient"; 

        //     if (isset($_GET['search'])) {

        //         $search = $_GET['search'];
        //         $active = $search;

        //         if ($search == 1) {
        //             $data = array(
        //               "client_id" => $this->session->get("id"),
        //               "start_date" => date('Y-m-d'),
        //               "end_date" => date('Y-m-d', strtotime('+1 day')) 
        //             );
        //         }

        //         if ($search == 2) {
        //             $data = array(
        //               "client_id" => $this->session->get("id"),
        //               "start_date" => date('Y-m-d', strtotime('-1 week')),
        //               "end_date" => date('Y-m-d', strtotime('+1 day')) 
        //             );
        //         }

        //         if ($search == 3) {
        //             $data = array(
        //               "client_id" => $this->session->get("id"),
        //               "start_date" => date('Y-m-d', strtotime('-1 month')),
        //               "end_date" => date('Y-m-d', strtotime('+1 day')) 
        //             );
        //         }

        //         $answer = $base->sendRedirect($url,$data);   
        //         $answer = json_decode($answer);

        //         if(isset($answer->return) && $answer->return) { 
        //             $this->view->dato = $answer->data;
        //         } else {
        //             $this->flash->error('No se han encontrado transacciones.');
        //         }
        //     } else {

        //         if($this->request->isPost()){ 

        //             $post = $this->request->getPost();
                    
        //             $data = array(
        //                 "client_id" => $this->session->get("id"),
        //                 "start_date" => $post['startdate'],
        //                 "end_date" => $post['enddate']
        //             );
        //             $active = 4;
                   
        //             $response = $base->sendRedirect($url,$data);   
        //             $response = json_decode($response); 

        //             if(isset($response->return) && $response->return) { 
        //                 $this->view->dato = $response->data;
        //             } else {
        //                 $this->flash->error('No se han encontrado transacciones.');
        //             }
        //         }                
        //     }
        //     $this->view->active = $active;
        // }
    }

    /*
    * Acción detail: Retorna el detalle de una bodega seleccionada
    */
    public function detailReserveClientAction()
    {   


        if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/ConsultReserveclient/detailReserveClient";

            $base = new ControllerBase();
            $data = array(
                "id" => $post['id'],
                "id_client" => $post['id_client']

            );

            $response = $base->sendRedirect($url, $data);

            $response = json_decode($response);
            
            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            $this->view->service = $response->service;

        }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }

       
    }

    public function reservationsProgressClientAction()
    {       
        if($this->request->isPost() ){

            $post = $this->request->getPost();            
            $url = $this->serverapi."/consultreserveclient/listReserveCurso";

            $base = new ControllerBase();
            $data = array(
                "id_client" => $this->session->get("id"),
                "status" => $post['status'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date']

            );

        }else{

            $url = $this->serverapi."/consultreserveclient/listReserveCurso";
            $base = new ControllerBase();
            
            $data = array(
                "id_client" => $this->session->get("id"),
            );
// print_r($data);die;
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
// print_r($response);die;            
            if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;
            } else {
                $this->response->setStatusCode(404, "Not Found");
                $this->response->send();
            }
        }

    }

    public function checkReservationsClientAction()
    {
            if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/consultreserveclient/listReserveCurso";

            $base = new ControllerBase();
            $data = array(
                "id_client" => $this->session->get("id"),
                "status" => $post['status'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date']

            );
            
        }else{
            $url = $this->serverapi."/consultreserveclient/checkReservationsClient";
            $base = new ControllerBase();
            
            $data = array(
                      "id_client" => $this->session->get("id"),
                    );
        }   
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
    }

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

    public function historyClientAction()
    {
        
    }

    public function mySpacesClientAction()
    {
        
    }

    public function reportsClientAction()
    {
        
    }
}