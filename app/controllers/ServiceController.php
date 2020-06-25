
<?php

class ServiceController extends ControllerBase
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


    public function payorbuyAction(){
        if ($this->session->get("access_type") == 1) {
            $data = array(
                "client_id" => $this->session->get("id"),
                "type_user" => $this->session->get("access_type"),
            );
        } 

        if ($this->session->get("access_type") == 2) {
            $data = array(
                "client_id" => $this->session->get("id_comercio"),
                "type_user" => $this->session->get("access_type"),
            );
        }

        $base = new ControllerBase();
        $url = $this->serverapi."/service/getServicesByProvider"; 

	    $response = $base->sendRedirect($url,$data);   
	    $response = json_decode($response); 

        if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
        }
        
//print_r($response);die;
//echo '<pre>',print_r($response,1),'</pre>';die;
        /* $url = $this->serverapi."/service/getServicesByProvider";
        $base = new ControllerBase();

        $data = array(
            "key" => $_POST['key']
        );

        $answer = $base->sendRedirect($url,$data);   
        $answer = json_decode($answer);

        if(isset($answer->return) && $answer->return) { 
            $this->view->dato = $answer->data;
        } else {
            return $this->response->redirect("index/index");
        } */
    }

    public function acceptCashCommerceAction(){
        if ($this->session->get("access_type") == 1) {
            $data = array(
                "client_id" => $this->session->get("id"),
                "type_user" => $this->session->get("access_type"),
            );
        } 

        if ($this->session->get("access_type") == 2) {
            $data = array(
                "client_id" => $this->session->get("id_comercio"),
                "type_user" => $this->session->get("access_type"),
            );
        }

        $base = new ControllerBase();
        $url = $this->serverapi."/commerce/getList"; 

	    $response = $base->sendRedirect($url,$data);   
	    $response = json_decode($response);

        if(isset($response->return) && $response->return) { 
            $this->view->dato = $response->data;
        }
//echo '<pre>',print_r($response,1),'</pre>';die;
    }
}
