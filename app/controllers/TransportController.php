<?php

class TransportController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();

    }

     /*
    * Acción detail: Retorna el detalle de un camion seleccionado
    */
    public function detailTransportAction()
    {   

        if($this->request->isPost() ){

            $post = $this->request->getPost();
            $url = $this->serverapi."/truck/detailTruck";

            $base = new ControllerBase();
            $data = array(
                "id_city" => $post['id_city']-2000,
                "id_city2" => $post['id_city2']-2000,
                "name_city" => $post['name_city'],
                "name_city2" => $post['name_city2'],
                "initial_date" => $post['initial_date'],
                "id" => $post['id_truck'],
                "hora" => $post['hour'],
                "tipo_carga" => $post['type_load'],
                "tipo_transporte" => $post['type_truck'],

            );
//print_r($data);die;
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
//print_r($response);die;
            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            $this->view->distance = $response->distance;
        }

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }

       
    }

    /*
    * Acción detail: Retorna listas de los camiones seleccionados
    */
    public function listTransportAction()
    {
        if($this->request->isPost() ){
            $url = $this->serverapi."/truck/listSelectTruck";
            $base = new ControllerBase();
       
            $response = $base->sendRedirect($url,$data);
  
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 

            $this->view->dat = $response->data;
            $this->view->data = $response->departament;
            $this->view->dato2 = $response->city;

            }

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/truck/listTruck";

            $base = new ControllerBase();
            $data = array(
                "type_load" => $post['type_load'],
                "type_truck" => $post['type_truck'],
                "idorigen" => $post['city1']-2000,
                "iddestino" => $post['city2']-2000,
                "initial_date" => $post['initial_date'],
                "hora" => $post['hour']
            );
//echo '<pre>',print_r($data,1),'</pre>';die;
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
//echo '<pre>',print_r($response,1),'</pre>';die;
            if(isset($response->return) && $response->return) {
//echo '<pre>',print_r($response->data,1),'</pre>';die;
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
    public function listCellarAction()
    {

        if($this->request->isPost() ){
            $url = $this->serverapi."/cellar/listSelect";
            $base = new ControllerBase();
       
            
            $response = $base->sendRedirect($url);
  
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dat = $response->data;
            $this->view->data = $response->departament;
            $this->view->dato2 = $response->city;

            }

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/listCellar";

            $base = new ControllerBase();
            $data = array(
                "deposit_capacity" => $post['deposit_capacity'],
                "id" => $post['city'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date']
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