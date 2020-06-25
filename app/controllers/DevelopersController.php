
<?php

class PaymentflowController extends ControllerBase
{


    public function initialize()
    {
        $this->tag->setTitle('Developers');
        parent::initialize();

        $this->view->setTemplateAfter('main');
    }

    public function indexAction(){}

    public function developersAction(){  
    

    }  




}