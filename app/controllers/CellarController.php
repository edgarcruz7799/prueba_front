<?php

class CellarController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();

    }

     /*
    * Acción detail: Retorna el detalle de una bodega seleccionada
    */
    public function detailCellarAction()
    {   


        if($this->request->isPost() ){

            $post = $this->request->getPost();
            
            $url = $this->serverapi."/cellar/detailCellar";

            $base = new ControllerBase();
            $data = array(
                "id" => $post['id'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date'],
                "space_require" => $post['space_require']

            ); 

            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

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
    * Acción detail: Retorna listas de bodegas seleccionada
    */
    public function listCellarAction()
    {

        if($this->request->isPost() ){
            $url = $this->serverapi."/cellar/listSelect";
            $base = new ControllerBase();
       
            $response = $base->sendRedirect($url, $data);
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
                "measure" => $post['measure'],
                "initial_date" => $post['initial_date'],
                "final_date" => $post['final_date'],
                "category" => $post['category'],
            ); 
//print_r($data);die;
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
//print_r($response);die;
            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            $this->view->typearea = $response->type_area;

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