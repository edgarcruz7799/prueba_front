
<?php

class RequestController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Welcome');
        parent::initialize();
        $this->view->setTemplateAfter('checkoutlayout');
        $this->view->access_type = $this->session->get("access_type");
    }  


    public function checkoutAction(){

        $menu_item = Menu_checkout::find();

        foreach ($menu_item as $men) {

                if (!isset($men->heritage)) {     

                $carrier = Menu_checkout::find(array(
                        "conditions" => "heritage = ?1",
                        "bind" => array(1 => $men->id)
                        ));

                $cararray = array(); //instacia para sobreescribir arreglo

                foreach ($carrier as $car) {

                     $cons = Menu_checkout::find(array(
                            "conditions" => "heritage = ?1",
                            "bind" => array(1 => $car->id)
                            ));      
                            
                        $cararray[] = (object) array(

                          'id' => $car->id,
                          'name' => $car->name,
                          'description' => $car->description,
                          'url' => $car->url,
                          'heritage' => $car->heritage,
                          'hijo' => $cons

                        ); 

                } 

                    $menarray[] = (object) array(

                      'id' => $men->id,
                      'name' => $men->name,
                      'description' => $men->description,
                      'url' => $men->url,
                      'heritage' => $men->heritage,
                      'hijo' => $cararray

                    );
                }
       }

       $this->view->data = $menarray;
    }
}
