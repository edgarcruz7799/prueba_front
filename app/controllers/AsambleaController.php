<?php
    
class AsambleaController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenido');
        parent::initialize();
        $this->view->setTemplateAfter('main');
        $this->view->username=$this->session->get("name");
        $this->view->access_type = $this->session->get("access_type");
        
        
    }

    public function indexAction()
    {   
        
    }

}