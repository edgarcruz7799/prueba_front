<?php

class QuotationController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();

    }

     /*
    * Acción detail: Retorna el detalle de una bodega seleccionada
    */
    public function reservationCellarAction()
    {   

        if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/quotation/reservationCellar";

            $base = new ControllerBase();
            $data = array(
                "phone" => $post['phone'],
                "id_cellar" => $post['id_cellar'],
                "storage_cost" => $post['storage_cost'],
                "handling_cost" => 0,
                "cubic_meters" => $post['cubic_meters'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date'],
                "deposit_capacity" => $post['deposit_capacity'],
                "id_client" => $post['id_client'],
                "type_pay" => $post['type_pay'],
                "service" => $post['service'],
            );  

            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;
            }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
         
    }

     /*
    * Acción detail: Retorna listas de bodegas seleccionada
    */
    public function quotationCellarAction()
    {

        if($this->request->isPost() ){

            $post = $this->request->getPost();            
            $url = $this->serverapi."/quotation/quotationCellar";
            $base = new ControllerBase();

            if(isset($post['service'])) {
                $data = array(
                    "id_cellar" => $post['id'],
                    "initial_date" => $post['initial_date'],
                    "final_date" => $post['final_date'],
                    "cubic_meters" => $post['deposit_capacity'],
                    "service" => $post['service']
                );
            }else {

                $data = array(
                    "id_cellar" => $post['id'],
                    "initial_date" => $post['initial_date'],
                    "final_date" => $post['final_date'],
                    "cubic_meters" => $post['deposit_capacity']
                );
                
            }

            $response = $base->sendRedirect($url, json_encode($data));
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            $this->view->service = $response->service;
            $this->session->set("access_type", 2);
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
            $this->session->set("reserved_service", $response->data->service5);
            }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
        
    }


     /*
    * Acción detail: Retorna el camion seleccionado
    */
    public function quotationTruckAction()
    {

        if($this->request->isPost() ){

            $post = $this->request->getPost();            
            $url = $this->serverapi."/quotation/quotationTruck";

            $base = new ControllerBase();

            // if(isset($post['service'])) {
            //     $data = array(
            //     "id_cellar" => $post['id'],
            //     "initial_date" => $post['initial_date'],
            //     "final_date" => $post['final_date'],
            //     "cubic_meters" => $post['deposit_capacity'],
            //     "service" => $post['service']
            //     );
            // }else {

                $data = array(
                    "id" => $post['id_truck'],
                    "initial_date" => $post['initial_date'],
                    "hour" => $post['hour'],
                    "type_load" => $post['type_load'],
                    "id_city" => $post['id_city'],
                    "id_city2" => $post['id_city2'],
                    "name_city" => $post['name_city'],
                    "name_city2" => $post['name_city2'],
                    "type_truck" => $post['type_truck'],
                );
             
            // }  

            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
//print_r($response);die;
            if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;
                $this->view->service = $response->service;
                $this->session->set("access_type", 3);
                $this->session->set("id_truck", $response->data[0]->id);
                $this->session->set("name", $response->data[0]->name);
                $this->session->set("name_city", $response->data[0]->name_city);
                $this->session->set("name_city2", $response->data[0]->name_city2);
                $this->session->set("capacity", $response->data[0]->capacity);
                $this->session->set("cost", $response->data[0]->cost);
                $this->session->set("initial_date_truck", $response->data[0]->initial_date);
                $this->session->set("hour", $response->data[0]->hour);
                $this->session->set("conductor", $response->data[0]->conductor);
                $this->session->set("type_load", $response->data[0]->type_load);
                $this->session->set("type_truck", $response->data[0]->type_truck);
            }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
        
    }

    public function billingCellarAction() {

        $this->view->setTemplateAfter("checkoutlayout");

        if ($this->session->get("auth") != null){

            if($this->request->isPost() ){

                $post = $this->request->getPost();
                
                $url = $this->serverapi."/quotation/billingCellar";

                $base = new ControllerBase();

                $service = '';

                $data = array(
                    "id_client" => $this->session->get('id'),
                    "id_cellar" => $post['id'],
                    "initial_date" => $post['initial_date'],
                    "final_date" => $post['final_date'],
                    "cubic_meters" => $post['deposit_capacity'],
                    "storage_cost" => $post['storage_cost'],
                    "service" => $service,
                    "deposit_capacity" => $post['deposit_capacity']
                );  
//print_r($data);die;
                $response = $base->sendRedirect($url, $data);

                $response = json_decode($response);
//print_r($response);die;
                if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;
//print_r($response->data);die;
                }

                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));

            } else {
//print_r("dos");die;
                
                $url = $this->serverapi."/quotation/billingCellar";
                $base = new ControllerBase();

                $deposit_capacity = 0;
                $service = 0;

                $data = array(
                    "id_client" => $this->session->get('id'),
                    "id_cellar" => $this->session->get('id_cellar'),
                    "initial_date" => $this->session->get('initial_date'),
                    "final_date" => $this->session->get('final_date'),
                    "cubic_meters" => $this->session->get('space_require'),
                    "storage_cost" => $this->session->get('storage_cost'),
                    "service" => $this->session->get('reserved_service'),
                    "deposit_capacity" => $this->session->get('deposit_capacity'),
                );  
//print_r($data);die;
                $response = $base->sendRedirect($url, $data);
                $response = json_decode($response);

//echo '<pre>',print_r($response,1),'</pre>';die;
                if(isset($response->return) && $response->return) { 
                    $this->view->dato = $response->data;
                    $this->view->service = $response->service;

                }
            }

        }
        
    }


    public function billingTruckAction() {

        $this->view->setTemplateAfter("checkoutlayout");

        if ($this->session->get("auth") != null){

            if($this->request->isPost() ){

                $post = $this->request->getPost();
                $url = $this->serverapi."/quotation/billingTruck";
                $base = new ControllerBase();
                $service = '';

                $data = array(
                    "id_client" => $this->session->get('id'),
                    "id_truck" => $post['id_truck'],
                    "initial_date_truck" => $post['initial_date_truck'],
                    "hour" => $post['hour'],
                    "type_load" => $post['type_load'],
                    "capacity" => $post['capacity'],
                    "cost" => $post['cost'],
                    "name_city" => $post['name_city'],
                    "name_city2" => $post['name_city2'],
                );  
//print_r($data);die;
                $response = $base->sendRedirect($url, $data);
                $response = json_decode($response);
//print_r($response);die;
                if(isset($response->return) && $response->return) { 
                $this->view->dato = $response->data;
//print_r($response->data);die;
                }

                $this->dispatcher->forward(array(
                    "controller" => "index",
                    "action" => "index"
                ));

            } else {
                
                $url = $this->serverapi."/quotation/billingTruck";
                $base = new ControllerBase();

                $data = array(
                    "id_client" => $this->session->get('id'),
                    "id_truck" => $this->session->get('id_truck'),
                    "initial_date_truck" => $this->session->get('initial_date_truck'),
                    "hour" => $this->session->get('hour'),
                    "type_load" => $this->session->get('type_load'),
                    "capacity" => $this->session->get('capacity'),
                    "cost" => $this->session->get('cost'),
                    "name_city" => $this->session->get('name_city'),
                    "name_city2" => $this->session->get('name_city2'),
                );  
//print_r($data);die;
                $response = $base->sendRedirect($url, $data);
                $response = json_decode($response);

//echo '<pre>',print_r($response,1),'</pre>';die;
                if(isset($response->return) && $response->return) { 
                    $this->view->dato = $response->data;
                    $this->view->service = $response->service;

                }
            }

        }
        
    }
    

     /*
    * Acción detail: Retorna el detalle de una bodega seleccionada
    */
    public function deleteCellarAction()
    {

        $this->view->disable();

        if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/deleteCellar";

            $base = new ControllerBase();

            $data = array(
                "id" => $post['id']
            ); 
    
            $answer = $base->sendRedirect($url, $data);
            $answerA = json_decode($answer);

            $this->response->setJsonContent(array(
                $this->view->id_cellar => $answerA->data
            ));

            $this->response->setStatusCode(200, "OK");
            $this->response->send();


        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }

        $this->response->redirect("index/business");
    }

}