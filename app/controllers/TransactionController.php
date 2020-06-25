<?php

class TransactionController extends ControllerBase
{
    public function initialize()
    {    
        parent::initialize();
        $this->view->setTemplateAfter('adminlayout');  
        $this->view->username = $this->session->get("name_cli");
        $this->view->access_type = $this->session->get("access_type");

        if ($this->session->get("imagen_comercio") != null) {
            $this->view->imagen_comercio = $this->session->get("imagen_comercio");
        }
    }

    /*
    * Acción detail: Retorna las reservas del dia del cliente
    */
    public function reportsTodayAction()
    {   

        $date = date ( 'Y-m-d' );

        $url = $this->serverapi."/pin/reportsToday";
            $base = new ControllerBase();
            
            $data = array(
                    "id_client" => $this->session->get("id"),
                    "date" => $date
            );
            
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);

            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }
       
    } 

        /*
    * Acción detail: Retorna las reservas de los ultimos 7 dias del cliente
    */
    public function reportsLastDayAction()
    {   
        $fecha = date('Y-m-d');
        $date = strtotime ( '-7 day' , strtotime ( $fecha ) ) ;
        $date = date ( 'Y-m-d' , $date );

        $url = $this->serverapi."/pin/reportsToday";
            $base = new ControllerBase();
            
            $data = array(
                    "id_client" => $this->session->get("id"),
                    "date" => $date
            );
  
            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }

       
    }

    /*
    * Acción detail: Retorna las reservas de los ultimos 30 dias del cliente
    */
    public function reportsLastMonthAction()
    {   
        $fecha = date('Y-m-d');
        $date = strtotime ( '-30 day' , strtotime ( $fecha ) ) ;
        $date = date ( 'Y-m-d' , $date );

        $url = $this->serverapi."/pin/reportsToday";
            $base = new ControllerBase();
            
            $data = array(
                    "id_client" => $this->session->get("id"),
                    "date" => $date
            );

            $response = $base->sendRedirect($url, $data);
            $response = json_decode($response);
            if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
            

        } else {

            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
            
        }

       
    } 
}