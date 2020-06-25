<?php

namespace Logisticapp\Admin\Controllers;

use Logisticapp\Admin\Controllers\ControllerBase as Controller;
const URLPDF = __DIR__ . '/../library/dompdf/autoload.inc.php';
ini_set('memory_limit', '256M');

use Logisticapp\Models\SubsidiaryUser;
use Logisticapp\Models\Subsidiary;
use Logisticapp\Models\CarrierBag;
use Logisticapp\Models\CarrierBagHolder;
use Logisticapp\Models\Route;
use Logisticapp\Models\Empleado;
use Logisticapp\Models\RecursoLogistico;
use Logisticapp\Models\Ciudad;
use Logisticapp\Models\RoutePoint;
use Logisticapp\Models\Company;
use Logisticapp\Models\Departamento;
use Logisticapp\Models\ModelBase;
use Logisticapp\Models\CarrierBagCompanyOffload;
use Logisticapp\Models\SubsidiaryEmployee;

class CarrierbagController extends Controller{

    public function initialize(){
        $this->view->setLayout("panel");
        $this->_date = new \DateTime();
        $this->view->vardump = "";
    }

    public function addcarrierbagAction()
    {

        $id_subsidiaries = SubsidiaryUser::find(array('columns' => 'id_subsidiary',
                                                    'conditions' => 'id_user = ?1',
                                                    'bind' => array(1 => $this->session->get("auth")->id_user)));

        $this->view->carrier_bag_ns_count=0;

        $dataSubsidiaries = $this->_dataSubsidiaries($id_subsidiaries);
        $this->view->subsidiaries  = json_encode($dataSubsidiaries);
        $subsidiaries = $dataSubsidiaries;
        
        //subsidiary COM enviar a select
        $subsidiaries_user = new SubsidiaryUser();
        $response = $subsidiaries_user->getSubsidiariesByUser($this->session->get('auth')->id_user);

        foreach ($response as $itemsubsidiary) {

            $fixsubsidiary[] = (object) array(

                "id_subsidiary" => $itemsubsidiary->id_subsidiary,
                "subsidiary_name" => $itemsubsidiary->subsidiary_name
            );
        };
        
        $this->view->subsidiaries_user  = $fixsubsidiary;

         //recorremos poblaciones y empujamos los resultados dentro de rows
         $rows = array();

         foreach ($subsidiaries as $subsidiary) {

            $points = (new Subsidiary)->getUserByCompany($subsidiary->id_subsidiary,$this->session->get("auth")->id_proveedor);

                foreach ($points as $value) {

                           $fixroutes[] = (object) array(
                                "id_company" => $value->id_company,
                                "business_name" => $value->business_name

                            );
                }
         }

        $response = $this->eraseRepeated($fixroutes);

        $this->view->companies = $response;
        $this->view->clasificationtypes = RouteController::classification;

        $carrier = 0;
        $dont_add = [];
        $dont_add['count'] = 0;
         if($this->request->isPost()){
            $post = $this->request->getPost();
            if( !empty($post["countCarrier"]) and ($post["countCarrier"] > 0)  ){
                for ($i=1; $i <= $post["countCarrier"]  ; $i++) {                     
                    if (!$post["companies_1"] == 0){
                        if( !empty( $post["companies".$i])  and  !empty($post["precint".$i])){

                            $destination_company = SubsidiaryUser::findFirst(array(
                                'conditions' => 'id_user = ?1',
                                'bind' => array(1 => $this->session->get("auth")->id_user)));

                            $carrierbagitem = new CarrierBag();
                            $carrierbagitem->serial = $post["precint".$i];
                            $carrierbagitem->type = $post["type".$i];
                            $carrierbagitem->provider_id = $this->session->get("provider")->id_proveedor;
                            $carrierbagitem->pickup_subsidiary_id = $post["punto_1"];
                            if ($carrierbagitem->save()){
                                if( isset($carrierbagitem->id) and $carrierbagitem->id>0 ){
                                    $carrierbagholderitem = new CarrierBagHolder();
                                    $carrierbagholderitem->carrier_bag_id = $carrierbagitem->id;
                                    $carrierbagholderitem->holder_id = $post["punto".$i];
                                    $carrierbagholderitem->origin_company = $post["companies_1"];
                                    $carrierbagholderitem->holder_type = 2;
                                    $carrierbagholderitem->assigned_hour = date("H:i:s");
                                    $carrierbagholderitem->assigned_date = date('Y-m-d');
                                    $carrierbagholderitem->state = 1;
                                    $carrierbagholderitem->save();
                                    $carrierbagitem->carrier_bag_holder_id = $carrierbagholderitem->id;
                                    if($carrierbagitem->save()){
                                        $carrier++;
                                    }
                                } else {
                                     array_push($dont_add, Array(
                                        "id" => $i,
                                        "companies_".$i => $post["companies_1"],
                                        "punto_".$i => $post["punto_1"],
                                        "companies".$i => $post["companies".$i],
                                        "punto".$i => $post["punto".$i],
                                        "precint".$i => $post["precint".$i],
                                        "type".$i => $post["type".$i] 
                                    ));
                                    $dont_add['count']++;
                                }
                            }
                            
                        }
                    }else{
                       $this->flash->warning( "Debe seleccionar un punto ");
                    }
                }

                if($carrier > 0) {
                    $this->flash->success( "Se agregaron ".$carrier." tulas");
                    
                }
                if($dont_add['count'] > 0) {
                    $this->flash->warning('No se agregaron ' . $dont_add['count'] . ' tulas, <button type="button" class="btn btn-warning" onclick="response_to_dont_add()">Precargar</button>');
                    $this->view->dont_add = json_encode($dont_add);
                }
            }
        }
    }

    public function _dataSubsidiaries($id_subsidiaries)
    {

          foreach ($id_subsidiaries as $itemsubsidiary) {

                $subsidiary = Subsidiary::findFirst(array(
                    "conditions" => "id_subsidiary = ?1",
                    "bind" => array(1 => $itemsubsidiary->id_subsidiary)
                ));

                $fixroutes[] = (object) array(

                    "id_subsidiary" => $subsidiary->id_subsidiary,
                    "name" => $subsidiary->subsidiary_name

                );
            }

         return $fixroutes;
    }

    public function eraseRepeated($array)
    {
        $nuevoArray=Array();
     
        # bucle recorriendo todo el array
        for($i=0;$i<count($array);$i++)
        {
            $repetido=false;
            for($j=0;$j<$i;$j++)
            {
                if($array[$i]==$array[$j])
                    $repetido=true;
            }
     
            if(!$repetido)
                $nuevoArray[]=$array[$i];
        }
     
        return $nuevoArray;
    }

    public function indexAction()
    {
        if($this->request->isPost()){
            $post = $this->request->getPost();
            $date = $post['date'];
        }else{
            $date = date('Y-m-d');
        }
        
        $carrierbag = new CarrierBag();
        $this->view->date = $date;
        $var_int = $carrierbag->getCarrierBagDate($date,$this->session->get("auth")->id_user);
        foreach ($var_int as $itemcarrie) {
            $fixroutes[] = (object) array(

                "id" => $itemcarrie[id],
                "serial" => $itemcarrie[serial],
                "holder_type" =>$itemcarrie[holder_type],
                "holder_name" => $itemcarrie[holder_name],
                "hour" => $itemcarrie[assigned_hour],
                "holder_id" => $itemcarrie[holder_id],
                "type" => $itemcarrie[type],
                "initial_date" => $itemcarrie[initial_date],
                "final_date" => $itemcarrie[final_date],
                "ciudad" =>  $itemcarrie[ciudad_origen],
                "company" => $itemcarrie[business_name],
                "office_code" => $itemcarrie[office_code],
                "sucursal" => $itemcarrie[sucursal],
                "state" => $itemcarrie[state]
             );
           }
        $this->view->carriers = $fixroutes;
        }
        public function indexSubsidiaryAction()
        {
            $ts = new \DateTime();
            $date = $ts->format('Y-m-d');

            $subsidiaries = new SubsidiaryUser();
            

            $response = $subsidiaries->getSubsidiariesByUser($this->session->get('auth')->id_user);

            foreach ($response as $itemsubsidiary) {

                $fixsubsidiary[] = (object) array(

                    "id" => $itemsubsidiary->id_subsidiary,
                    "subsidiary_name" => $itemsubsidiary->subsidiary_name,
                    "responsable_person" => $itemsubsidiary->responsable_person,
                    "subsidiary_phone" => $itemsubsidiary->subsidiary_phone
                );
            }

            $this->view->date = $date;

            if($fixsubsidiary!=false and count($fixsubsidiary)!=0){
                $this->view->subsidiaries = $fixsubsidiary;
            }else{
                $this->view->emptyMessage = "No se encontro COM asociado al usuario";
            }
    }

    public function indexCarrierbagCompanyOffloadAction()
    {
        if (isset($_POST["id_proveedor"])) {
            $prov = (int) $this->crypt->decryptBase64($_POST["id_proveedor"], $this->session->get('key_app'));
        } else {
            $prov = $this->session->get("auth")->id_proveedor;
        }
        $this->view->id_proveedor = $prov;
        if($company_type == 0){

           if($this->request->isPost()){

                $post = $this->request->getPost();

                    if( $post["company"] != 0 and $post["company_nit"] == 0){
                        $companies = Company::find(array(
                            "conditions" => "business_type != ?1 and id_provider = ?2 and id_company = ?3",
                            "bind" => array(1 => -2,
                                            2 => $prov,
                                            3 =>  $post["company"]),
                            "order" => "id_company DESC"
                         ));
                    }
                    elseif( $post["company_nit"] != 0 and $post["company"] == 0 ){
                          $companies = Company::find(array(
                            "conditions" => "business_type != ?1 and id_provider = ?2 and id_company = ?3",
                            "bind" => array(1 => -2,
                                            2 => $prov,
                                            3 =>  $post["company_nit"]),
                            "order" => "id_company DESC"
                         ));
                    }else{
                            $companies = Company::find(array(
                            "conditions" => "business_type != ?1 and id_provider = ?2",
                            "bind" => array(1 => -2,
                                            2 => $prov),
                            "order" => "id_company DESC"
                          ));

                    }
        
             }else{
              $companies = Company::find(array(
                "conditions" => "business_type != ?1 and id_provider = ?2",
                "bind" => array(1 => -2,
                                2 => $prov),
                "order" => "id_company DESC"
              ));

           }

        }else{

            
            $companies = Company::find(array(
                "conditions" => "business_type = ?1 and id_provider = ?2",
                "bind" => array(1 => $company_type,
                                2 => $prov),
                "order" => "id_company DESC"
            ));

        }

        $companiesSelect = Company::find(array(
                "conditions" => "business_type != ?1 and id_provider = ?2",
                "bind" => array(1 => -2,
                                2 => $prov),
                "order" => "id_company DESC"
         ));
            
      
        if($companies!=false and count($companies)!=0){
            $this->view->companies = $companies;
            $this->view->companiesSelect = $companiesSelect;
           
        }else{
            $this->view->emptyMessage = Constants::COMPANY_LIST_EMPTY_MESSAGE;
        }
    }

    public function companyConfigRouteAction()
    {
        if($this->request->isAjax()){
            $this->view->disable();
            $post = $this->request->getPost();
            
            $num = 0;
            if(isset($post['num'])){
                $num = $post['num'];
            }            

            $cities = Ciudad::find(array(
                'columns' => 'id_ciudad, ciudad',
                "conditions" => "id_departamento = ?1",
                "bind" => array(1 => $post["value"])
            ));

            $data = array(
                'cities'=> $cities,
                'num'=> $num
            );

            echo json_encode($data);
            return;
        }

        $com = new SubsidiaryUser();
        $com = $com->getSubsidiariesByUser($this->session->get('auth')->id_user);    
        $this->view->com = $com;

        $post = $this->request->getPost();
        $company_id = (int) $this->crypt->decryptBase64($post["value"], $this->session->get('key_app'));

        $provider = $this->session->get("auth")->id_proveedor;
        
        $department = Departamento::find(array(
            'columns' => 'id_departamento, departamento'
        ));

        $model = new CarrierbagCompanyOffload();
        
        $company = Company::find(array(
            "conditions" => "id_provider = ?1 and  is_inactive = FALSE and (business_type NOT IN ({myvar:array}) )",
            "bind" => array(1 => $this->session->get('auth')->id_proveedor,
                            'myvar' => array(-1 , -2)
                            )
        ));
        $company = (new Company)->getCompaniesWithPoints();
        $company_to_configure = Company::findFirst($company_id);
       
        $carriebagoofloads = CarrierbagCompanyOffload::find(array(
            "conditions" => "company_id = ?1",
            "bind" => array(1 => $company_id)
        ));
        
        $companies = $company->fetchAll();
        $subsidiaries = Subsidiary::find(array(
            'columns' => 'id_subsidiary, subsidiary_name, id_company',
            "conditions" => "id_company = ?1 and point_type=1  or id_company = ?2 and point_type=1 " ,
            "bind" => array(1 => $companies[0]['id_company'],
                            2 => $companies[1]['id_company'])
        ));         
                
        foreach($carriebagoofloads as $carrierbagitem){
            
            $val = Subsidiary::findfirst($carrierbagitem->point_offload_id)->id_company;
            $dataSubsidiaries = Subsidiary::find(array(
                'columns' => 'id_subsidiary, subsidiary_name, id_company',
                "conditions" => "id_company = ?1 and point_type = 1" ,
                "bind" => array(1 => $val)
            )); 
                        
            $data [] = (object) array(
                "id"    => $carrierbagitem->id,
                'company_id' => $val,
                'com_id'        => $carrierbagitem->com_id,
                'carrierbag_type' => $carrierbagitem->carrierbag_type,
                'point_offload_id' => $carrierbagitem->point_offload_id,
                'point_offload' => $dataSubsidiaries->toArray()
            );
        }

        $this->view->ciudades = Ciudad::find();
        

        $this->view->CarrierbagCompanyOffloads = $data;
        
        $this->view->departments    = $department;
        $this->view->point_offload  = $subsidiaries;
        $this->view->deliver_type   = CarrierbagController::deliver_type;
        $this->view->companies      = $companies;
        $this->view->company_config = $company_to_configure;
    }

    public function deleteConfigRouteAction()
    {
        $this->view->disable();
        if($this->request->isAjax()){
            
            //$id = $this->crypt->decryptBase64($this->request->getPost('config_id'), $this->session->get('key_app'));
            $configRoute = CarrierbagCompanyOffload::findFirst($this->request->getPost('config_id'));

            if($configRoute->delete() == false){
                echo json_decode("No se pudo eliminar la configuración");
            } else {
                echo json_encode("Se eliminó la configuración");
            }

        }
    }
   

    public function addCarrierbagCompanyOffloadAction()
    {
        $this->view->disable();
        if($this->request->isAjax()){
            
            $data = $this->request->getPost('data');
            
            $item = explode('&', $data);

            foreach ($item as $key => $value) {
                $c = explode("=", $value);
                $k = explode("-", $c[0]);                
                $post[$k[0]] = $c[1];
            }

            $id = -1;
            if(isset( $post['value'] )){
                $id = $post['value'];
            }

            $carrierbagCompanyOffload = new CarrierbagCompanyOffload();
            //$offload = $carrierbagCompanyOffload->findToUpdateCarrierBagCompanyOffload($id);

                //Valida si ya se configuro una tula para esa ciudad con ese tipo de tula
                $review = CarrierBagCompanyOffload::findFirst(array(
                    "conditions" => "company_id = ?1 AND carrierbag_type = ?2 AND com_id = ?3 ",
                    "bind" => array(1 => $post['value'], 2 => $post['deliver'], 3 => $post['com'])
                ));

                if (isset($review->id)) {
                    echo json_encode("Ya existe la configuración");
                    return;         
                } else {
                    
                    $review2 = CarrierBagCompanyOffload::findFirst(array(
                        "conditions" => "company_id = ?1  AND com_id = ?2 ",
                        "bind" => array(1 => $post['data_company'], 2 => $post['com'])
                    ));

                    if(!empty($review2)){
                        $review2->carrierbag_type    = $post['deliver'];
                        $review2->com_id            = $post['com'];
                        $review2->point_offload_id   = $post['punto'];
                     

                        if($review2->save()){
                            echo json_encode("Se ha actualizo la configuración.");
                        } else {
                            echo json_encode("Error no se ha podido cargar la configuración");
                        }
                    }else{
                        
                        $companyOffload = new CarrierBagCompanyOffload();
                        $companyOffload->company_id         = $post['value'];
                        $companyOffload->carrierbag_type    = $post['deliver'];
                        $companyOffload->com_id            = $post['com'];
                        $companyOffload->point_offload_id   = $post['punto'];
                        //$companyOffload->save();

                        if($companyOffload->save()){
                            echo json_encode("Se ha agregado la configuración.");
                        } else {
                            echo json_encode("Error no se ha podido cargar la configuración");
                        }
                    }
                }
        }
    }

    public function viewCompanyConfigRouteAction()
    {
        if($this->request->isPost()){

            $post = $this->request->getPost();
            $key =  $this->crypt->decryptBase64($post["value"], $this->session->get('key_app'));            

            $carrierbagCompanyOffload =  CarrierBagCompanyOffload::find(array(
                "conditions" => "company_id = ?1",
                "bind" => array(1 => $key)
            ));

            $model = new CarrierBagCompanyOffload();
            $response = $model->getCarrierbagCompanyOffload($key);

            foreach($carrierbagCompanyOffload as $carrierbagitem){
            
                $val = Subsidiary::findfirst($carrierbagitem->point_offload_id)->id_company;
                $val2 = Subsidiary::findfirst($carrierbagitem->point_offload_id)->subsidiary_name;
                $val3 = Company::findfirst($val)->business_name;
                $val_subsidiary_city = Subsidiary::findfirst($carrierbagitem->com_id)->subsidiary_city;
                $val4 = Ciudad::findfirst($val_subsidiary_city)->ciudad;
                $val_id_departamento = Ciudad::findfirst($val_subsidiary_city)->id_departamento;
                $val5 = Departamento::findfirst($val_id_departamento)->departamento;

                $data [] = (object) array(
                    "id"    => $carrierbagitem->id,
                    'company_id' => $val,
                    'com_id'        => $carrierbagitem->com_id,
                    'carrierbag_type' => $carrierbagitem->carrierbag_type,
                    'point_offload_id' => $carrierbagitem->point_offload_id,

                    'business_name' => $val3,
                    'ciudad'        => $val4,
                    'departamento'  => $val5,
                    'point_offload' => $val2
                );

            }

            /* foreach ($response as $key => $item) {
                
                $datas [] = (object) array(
                    'business_name' => $item->business_name,
                    'ciudad'        => $item->ciudad,
                    'departamento'  => $item->departamento,
                    'carrierbag_type' => $item->carrierbag_type,
                    'point_offload' => $item->subsidiary_name                                      
                );
            }*/
            $this->view->data = $data;
        }      
    }

    public function viewAction()
    {

        if($this->request->isPost()){
            $post = $this->request->getPost();
            $carrierbag = new CarrierBag();
            $carries = $carrierbag->getCarrierBagView((int) $this->crypt->decryptBase64($post["value"], $this->session->get('key_app')));
            $this->view->carriers =  $this->_dataCarriers($carries);
            $this->view->holder =  $post["holder"];
        }
    }
    public function viewcarrierAction()
    {
        if($this->request->isPost()){
            $post = $this->request->getPost();
            $CarrierBagHolder = CarrierBagHolder::find(array(
                "conditions" => "carrier_bag_id = ?1",
                "bind" => array(1 => (int) $this->crypt->decryptBase64($post["value"], $this->session->get('key_app'))),
                "order" => "id ASC"
            ));
            $arrayStates = array('1' => 'Registrado interno' , '2' => 'Programado' , '3' => 'Confirmado recibido recurso', '4' => 'Entregado sucursal', '5' => 'Recogio sucursal' , '6' => 'Entregado' );
            $arrayTypes = array('1' => 'Recurso' , '2' => 'Sucursal' , '3' => 'Empleado', '4' => 'Ruta');

            $fecha1 = "";
            foreach ($CarrierBagHolder as $itemcarrie) {
                $fecha = $itemcarrie->assigned_date;
                if ($fecha === $fecha1) {
                    $fecha1 = "";
                } else {
                    $fecha1 = $itemcarrie->assigned_date;
                }
                
                $fixcurrier[] = (object) array(
                    "id" => $itemcarrie->id,
                    "state" => $arrayStates[$itemcarrie->state],
                    "holder_type" =>$arrayTypes[$itemcarrie->holder_type],
                    "holder_name" => $this->_dataTypes($itemcarrie->holder_type,$itemcarrie->holder_id),
                    "hour" => $itemcarrie->assigned_hour,
                    "holder_id" => $itemcarrie->holder_id,
                    "date" => $fecha1
                );             
            }
            $this->view->carriers = $fixcurrier;
            $this->view->serial = $post['serial'];
            $this->view->carrier_type = $post['carrier_type'];
            $this->view->holder_name = $post['holder_name'];
            $this->view->company = $post['company'];
            $this->view->office_code = $post['code'];
            $this->view->ciudad = $post['ciudad'];
            $this->view->sucursal = $post['sucursal'];
        } 
    }

    public function assignResourceAction()
    {
        if($this->request->isPost())
        {
            $post = $this->request->getPost();
            if( !empty($post["value"]) )
            {        
                $idcom = (int) $this->crypt->decryptBase64($post["value"], $this->session->get('key_app'));
                $this->view->comname = Subsidiary::findFirst($idcom)->subsidiary_name.$countcarrierbagas;
                $this->view->idcom = $idcom;
                $this->view->empleado =  (new RecursoLogistico)->getResourceBySubsidiary($this->session->get("provider")->id_proveedor,$idcom, 0, 0, 0, 1, 1000);

                $id_subsidiaries = SubsidiaryUser::find(array(
                    'columns' => 'id_subsidiary',
                    'conditions' => 'id_user = ?1',
                    'bind' => array(1 => $this->session->get("auth")->id_user)));


                $dataSubsidiaries = $this->_dataSubsidiaries($id_subsidiaries);
                $this->view->subsidiaries  = $dataSubsidiaries;

                $subsidiaries = $dataSubsidiaries;

                foreach ($subsidiaries as $subsidiary) {

                    $points = (new Subsidiary)->getUserByCompany($subsidiary->id_subsidiary,$this->session->get("auth")->id_proveedor);

                        foreach ($points as $value) {

                                $fixroutes[] = (object) array(
                                        "id_company" => $value->id_company,
                                        "business_name" => $value->business_name

                                    );
                        }
                }

                $response = $this->eraseRepeated($fixroutes);

                $this->view->companies = Company::find(array(
                    "conditions" => "id_provider = ?1 and  is_inactive = FALSE and (business_type NOT IN ({myvar:array}) )",
                    "bind" => array(1 => $this->session->get('auth')->id_proveedor,
                                    'myvar' => array(-1 , -2)
                                    )
                ));
                    
                $this->view->clasificationtypes = RouteController::classification;

                $carrier = 0;
        
                $data = (new CarrierBag)->countCarrierbagsBySubisidiary($idcom);
                $carrierbags = $data->fetchAll();
                $countcarrier = count($carrierbags);
                $this->view->countcarrier = $countcarrier;
                if( !empty($post["countCarrier"]) and ($post["countCarrier"] > 0)  ){
                    if (!empty( $post["companies1"])){

                        if (!empty( $post["punto1"])){
                            $RecursoLogistico = RecursoLogistico::findFirst($post['empleado']);

                            $destination_company = SubsidiaryUser::findFirst(array(
                                'conditions' => 'id_user = ?1',
                                'bind' => array(1 => $this->session->get("auth")->id_user)));

                            if(isset($RecursoLogistico->id_recurso_logistico) and $RecursoLogistico->id_recurso_logistico > 0 and isset($destination_company->id) and $destination_company->id > 0 ){
                                $noasociados = "";
                                $countnoasociados = 0;
                                $route_point_to_delivery = RoutePoint::findFirst(array( 'columns' => 'id',
                                                    'conditions' => "point_id = ?1 and state = 1 and date = '". date('Y-m-d') ."' and resource_id = ?2",
                                                    'bind' => array(1 => $post["punto1"],
                                                                    2 => $post["empleado"])));
                                if (isset($route_point_to_delivery) && $route_point_to_delivery->id > 0) {
                                    $delivery_point = $route_point_to_delivery->id;
                                    for ($i=1; $i <= $post["countCarrier"]  ; $i++) {
                                        if(!empty($post["precint".$i]))
                                        {
                                            $datacbvalidate = (new CarrierBag)-> validateCarrierbag($idcom,$post["precint".$i]);
                                            $carrierbagsvalidate = $datacbvalidate->fetchAll();                                       
                                            if(count($carrierbagsvalidate) > 0){
                                                $carrierbagitem =  CarrierBag::findfirst($carrierbagsvalidate[0][carrier_bag_id]);
                                                
                                                if(isset($carrierbagitem->id) and $carrierbagitem->id > 0 ){

                                                    $carrierbagholderitem = new CarrierBagHolder();
                                                    $carrierbagholderitem->carrier_bag_id = $carrierbagitem->id;
                                                    $carrierbagholderitem->holder_id = $RecursoLogistico->id_recurso_logistico;
                                                    $carrierbagholderitem->origin_company = $post["companies1"];
                                                    $carrierbagholderitem->destination_company = $destination_company->id_subsidiary;
                                                    $carrierbagholderitem->holder_type = 1;
                                                    $carrierbagholderitem->assigned_hour = date("H:i:s");
                                                    $carrierbagholderitem->assigned_date = date('Y-m-d');
                                                    $carrierbagholderitem->state = 3;
                                                    $carrierbagholderitem->save();
                                                    $carrierbagitem->carrier_bag_holder_id = $carrierbagholderitem->id;
                                                    $carrierbagitem->route_point_id = $delivery_point;
                                                    $carrierbagitem->save();
                                                    $carrier++;
                                                }
                                                
                                            }else{
                                                $countnoasociados++;
                                                $noasociados = $noasociados." , ".$post["precint".$i];
                                            }                                    
                                        }
                                    }
                                }                                
                                if($carrier > 0){
                                    $this->flash->success( "Se agregaron ".$carrier." tulas");
                                    $data = (new CarrierBag)->countCarrierbagsBySubisidiary($idcom);
                                    $carrierbags = $data->fetchAll();
                                    $countcarrier = count($carrierbags);
                                    $this->view->countcarrier = $countcarrier;
                                }
                                if($countnoasociados > 0){
                                    $this->flash->warning( "No se pudieron agregar las siguientes ".$countnoasociados."tulas ".$noasociados);
                                }
                            }
    
                        }else
                        {
                            $this->flash->warning( "Debe seleccionar un punto ");
                        }   
                    }else
                    {
                        $this->flash->warning( "Debe seleccionar una compañia ");
                    }
                }

            }
        }
    }
    
    public function reportOperationAction()
    {
        $var_id_user_int=$this->session->get("auth")->id_user;
        $id_subsidiaries = SubsidiaryUser::find(array(
            'columns' => 'id_subsidiary',
            'conditions' => 'id_user = ?1',
            'bind' => array(1 => $var_id_user_int)));



        $dataSubsidiaries = $this->_dataSubsidiaries($id_subsidiaries);
        $this->view->subsidiaries  = $dataSubsidiaries;

        $subsidiaries = $dataSubsidiaries;

         //recorremos poblaciones y empujamos los resultados dentro de rows
         $rows = array();

         foreach ($subsidiaries as $subsidiary) {

            $points = (new Subsidiary)->getUserByCompany($subsidiary->id_subsidiary,$this->session->get("auth")->id_proveedor);

                foreach ($points as $value) {

                           $fixroutes[] = (object) array(
                                "id_company" => $value->id_company,
                                "business_name" => $value->business_name

                            );
                }
         }

        $response = $this->eraseRepeated($fixroutes);

        $this->view->companies = $response;
        $this->view->clasificationtypes = RouteController::classification;

        

        $this->view->departamentos = Departamento::find(array(
            "conditions" => "estado = 1 and id_pais = ".$this->session->get("provider")->pais,
            "order" => "departamento"
        ));



        if(true){
            $post = $this->request->getPost();
            $actionexcel = $this->request->getPost("botonexcel");
            $actionpdf = $this->request->getPost("botonpdf");

            if(isset($post['date'])){
                $date = $post['date'];
            } else {
                $ts = new \DateTime();
                $date = $ts->format('Y-m-d');
            }

            if($post["subsidiary_city"] != ("Seleccione un departamento")){
                $subsidiary_city = $post['subsidiary_city'];
            }else{
                $subsidiary_city = 0;
            }

            //echo '<pre>'; print_r($post). '</pre>'; die;
            
            $carrierbag = new CarrierBag();
            $carriescom = $carrierbag->getFilterByParametersCOMDEPARMENTSTADEDATE($post['companies1'], $subsidiary_city, $state1="", $post['subsidiary'], $date,$var_id_user_int);
            $totalcarriers = $carriescom->fetchAll();
            $this->view->date = $date;
            $this->view->carriers = $totalcarriers;

            //String de tipos
            //$arrayTypes = array('1' => 'Recurso' , '2' => 'Sucursal' , '3' => 'Empleado', '4' => 'Ruta');
                
            $headers = array(
                'type' => 'TIPO',
                'origin' => 'ORIGEN', 
                'destination' => 'DESTINO',
                'serial' => 'PRECINTO',
                'hour' => 'HORA RECEPCIÓN', 
                'delivery' => 'HORA ENTREGA'
            );

            //print_r($totalcarriers);die;
            //echo "<pre>".print_r($totalcarriers,1)."</pre>";die;
            

            if ($actionexcel == "Exportar Excel") {
                
                $name = "Reporte de operacion interoficinas ";
                ModelBase::exportExcel3($totalcarriers,$headers,$name);

            } elseif($actionpdf == "Exportar PDF") {
                include_once ControllerBase::URLPDF;
                $pdf = new \Dompdf\Dompdf();
                $pdf->set_paper("A3", "portrait");
                $html = $this->view->getRender("carrierbag", "pdfdos");
                $pdf->load_html($html);
                $pdf->render();
                $output = $pdf->output();
                $filename = "Reporte de operaciones interoficinas ";
                $pdf->stream($filename);
                return;
            }
        }
    }

    public function controlBoardAction()
    {
        $var_id_user_int=$this->session->get("auth")->id_user;
        $id_subsidiaries = SubsidiaryUser::find(array(
            'columns' => 'id_subsidiary',
            'conditions' => 'id_user = ?1',
            'bind' => array(1 => $var_id_user_int)));



        $dataSubsidiaries = $this->_dataSubsidiaries($id_subsidiaries);
        $this->view->subsidiaries  = $dataSubsidiaries;

        $subsidiaries = $dataSubsidiaries;

         //recorremos poblaciones y empujamos los resultados dentro de rows
         $rows = array();

         foreach ($subsidiaries as $subsidiary) {

            $points = (new Subsidiary)->getUserByCompany($subsidiary->id_subsidiary,$this->session->get("auth")->id_proveedor);

                foreach ($points as $value) {

                    $fixroutes[] = (object) array(
                        "id_company" => $value->id_company,
                        "business_name" => $value->business_name

                    );
                }
         }

        $response = $this->eraseRepeated($fixroutes);

        $this->view->companies = $response;
        $this->view->clasificationtypes = RouteController::classification;
        $this->view->departamentos = Departamento::find(array(
            "conditions" => "estado = 1 and id_pais = ".$this->session->get("provider")->pais,
            "order" => "departamento"
        ));

        

        if($this->request->isPost()){

            $post = $this->request->getPost();
            
            if(isset($post['date'])){
                $date = $post['date'];
            } else {
                $ts = new \DateTime();
                $date = $ts->format('Y-m-d');
            }
            if( $post["companies1"] != 0 or $post["subsidiary_city"] != ("Seleccione un departamento") or $post["state1"] != 0 or !empty($date))
            {
                $actionexcel = $this->request->getPost("botonexcel");
                $actionpdf = $this->request->getPost("botonpdf");

                $companies1 = $post['companies1'];
                if($post["subsidiary_city"] != ("Seleccione un departamento")){
                    $subsidiary_city = $post['subsidiary_city'];
                    $departamento = $post['departamento'];
                }else{
                    $subsidiary_city = 0;
                }
               
                $state1 = $post['state1'];

                $totalcarriers = (new CarrierBag())->getFilterByParametersCOMDEPARMENTSTADEDATE($companies1,$subsidiary_city,$state1,$subsidiary="",$date,$var_id_user_int);
                $var_int = $totalcarriers->fetchAll();
                $total = 0;
                $transito = 0;
                $entregadas = 0;
                $data = array();

                foreach ($var_int as $key => $carrier) {

                    if ($carrier['state'] == 'Entregado sucursal') {
                        $entregadas++;
                    } else {
                        $transito++;
                    }
                    $total++;

                    $data[] = (object) array(
                        'serial' => $carrier['serial'],
                        'type' => $carrier['type'],
                        'origin_city' => $carrier['origin_city'],
                        'origin_company' => $carrier['origin_company'],
                        'origin_code' => $carrier['origin_code'],
                        'origin' => $carrier['origin'],
                        'destination' => $carrier['destination'],
                        'reception_hour' => $carrier['reception_hour'],
                        'delivery_hour' => $carrier['delivery_hour'],
                        'holder_type' => $carrier['holder_type'],
                        'holder_name' => $carrier['holder_name'],
                        'nombres' => $carrier['nombres'],
                        'apellidos' => $carrier['apellidos'],
                        'holder_type' => $carrier['holder_type'],
                        'holder_name' => $carrier['holder_name'],
                        'subsidiary_name' => $carrier['subsidiary_name'],
                        'destination_city' =>  $carrier['destination_city'],
                        'destination_company' => $carrier['destination_company'],
                        'state' => $carrier['state'],
                        "responsable" => $carrier['holder_name'],
                        "estado" => $carrier['state']
                    );
                    
                    $fixcarriers[] = (object) array(
                        "serial" => $carrier['serial'],
                        "tipo" => $carrier['type'] == 1 ? 'Correspondencia' : 'Canje',
                        "ciudad" => $carrier['origin_city'] .' / '. $carrier['destination_city'],
                        "entidad" => $carrier['origin_company'] .' / '. $carrier['destination_company'],
                        "codigo_punto" => $carrier['origin_code'],
                        "origen" => $carrier['origin'],
                        "destino" => $carrier['destination'],
                        "hora_recepcion" => $carrier['reception_hour'],
                        "hora_entrega" => $carrier['delivery_hour'],
                        "responsable" => $carrier['holder_name'],
                        "estado" => $carrier['state']
                    );
                }
                if ($total != 0 || $entregadas != 0){
                    $cumplimiento = ((($entregadas) / ($total)) * 100 );
                    $cumplimiento = number_format($cumplimiento, 1);
                    $cumplimiento = $cumplimiento."%";
                }else{
                    $cumplimiento = "0%";
                }
                $this->view->total = $total;
                $this->view->transito = $transito;
                $this->view->entregadas = $entregadas;
                $this->view->cumplimiento = $cumplimiento;
                $this->view->carriers = $data;
                $this->view->date = $date;
                $this->view->companies1 = $companies1;
                $this->view->subsidiary_city = $subsidiary_city;
                $this->view->state1 = $state1;
                $this->view->departamento = $departamento;

                $headers = array(
                    "_" => '_', 
                    "serial" => 'SERIAL', 
                    "tipo" => 'TIPO', 
                    "ciudad" => 'CIUDAD',
                    "entidad" => 'ENTIDAD', 
                    "codigo_punto" => 'CODIGO DE PUNTO', 
                    "origen" => 'ORIGEN', 
                    "destino" => 'DESTINO',
                    "hora_recepcion" => 'HORA RECEPCION',
                    "hora_entrega" => 'HORA ENTREGA',
                    "responsable" => 'RESPONSABLE',
                    "estado" => 'ESTADO'
                );
                
                if ($actionexcel == "Exportar Excel") {

                    $name = "Tablero de control de tulas ";
                    ModelBase::exportExcel3($fixcarriers, $headers, $name);

                } elseif($actionpdf == "Exportar PDF") {

                    include_once ControllerBase::URLPDF;
                    $this->view->carriers = $var_int;
                    $pdf = new \Dompdf\Dompdf();
                    $pdf->set_paper("A3", "portrait");
                    $html = $this->view->getRender("carrierbag", "pdf");
                    $pdf->load_html($html);
                    $pdf->render();
                    $output = $pdf->output();
                    $filename = "Tablero de control de tulas ";
                    $pdf->stream($filename);
                    $this->view->carriers = $data;
                    return;

                }
            } else {
                $this->flash->warning( "Debe seleccionar una opcion");
            }
        }else{
            $ts = new \DateTime();
            $date = $ts->format('Y-m-d');
            
            $totalcarriers = (new CarrierBag())->getFilterByParametersCOMDEPARMENTSTADEDATE($companies1,$subsidiary_city,$state1,$subsidiary="",$date,$var_id_user_int);
            $total = 0;
            $transito = 0;
            $entregadas = 0;
            $data = array();
            $var_int = $totalcarriers->fetchAll();
            foreach ($var_int as $carrier) {

                if ($carrier['state'] == 'Entregado sucursal') {
                    $entregadas++;
                } else {
                    $transito++;
                }
                $total++;

                $data[] = (object) array(
                    'serial' => $carrier['serial'],
                    'type' => $carrier['type'],
                    'origin_city' => $carrier['origin_city'],
                    'origin_company' => $carrier['origin_company'],
                    'origin_code' => $carrier['origin_code'],
                    'origin' => $carrier['origin'],
                    'destination' => $carrier['destination'],
                    'reception_hour' => $carrier['reception_hour'],
                    'delivery_hour' => $carrier['delivery_hour'],
                    'holder_type' => $carrier['holder_type'],
                    'holder_name' => $carrier['holder_name'],
                    'nombres' => $carrier['nombres'],
                    'apellidos' => $carrier['apellidos'],
                    'holder_type' => $carrier['holder_type'],
                    'subsidiary_name' => $carrier['subsidiary_name'],
                    'destination_city' =>  $carrier['destination_city'],
                    'destination_company' => $carrier['destination_company'],
                    'state' => $carrier['state']
                );
            }
            //$var_int=$data;
            if ($total != 0 || $entregadas != 0){
                $cumplimiento = ((($entregadas) / ($total)) * 100 );
                $cumplimiento = number_format($cumplimiento, 1) ."%";
            }else{
                $cumplimiento = "0%";
            }
            
            $this->view->total = $total;
            $this->view->transito = $transito;
            $this->view->entregadas = $entregadas;
            $this->view->cumplimiento = $cumplimiento;
            $this->view->carriers = $data;
            $this->view->date = $date;
        }
    }

    public function _dataCarriers($carries)
    {
      // develop11
        $arrayStates = array('1' => 'Registrado interno' , '2' => 'Programado' , '3' => 'Confirmado recibido recurso', '4' => 'Entregado sucursal', '5' => 'Recogio sucursal' , '6' => 'Entregado' );

        $arrayTypes = array('1' => 'Recurso' , '2' => 'Sucursal' , '3' => 'Empleado', '4' => 'Ruta');
        
        $arrayTypesCarrier = array('1' => 'Correspondencia' , '2' => 'Canje');

        $fixroutes = [];

        foreach ($carries as $itemcarrie) {

            $CarrierBagHolderIn = CarrierBagHolder::findFirst(array(
                "conditions" => "carrier_bag_id = ?1",
                "bind" => array(1 => $itemcarrie->c->id),
                "order" => "id DESC"
            ));

            $CarrierBagHolderFi = CarrierBagHolder::findFirst(array(
                "conditions" => "id = ?1",
                "bind" => array(1 => $itemcarrie->c->carrier_bag_holder_id)
            ));

            $ciudad = "";

            if($itemcarrie->route_point_id != null){
                $routepoint = RoutePoint::findFirst($itemcarrie->route_point_id);
               
                $subsidiary = Subsidiary::findFirst(array(
                    "conditions" => "id_subsidiary = ?1",
                    "bind" => array(1 => $routepoint->point_id)
                ));
                $ciudad = Ciudad::findFirst($subsidiary->subsidiary_city)->ciudad;

            } else {
                if ($CarrierBagHolderIn->holder_type == 2) {
                    $subsidiary = Subsidiary::findFirst(array(
                        "conditions" => "id_subsidiary = ?1",
                        "bind" => array(1 => $CarrierBagHolderIn->holder_id)
                    ));
                    $ciudad = Ciudad::findFirst($subsidiary->subsidiary_city)->ciudad;
                } elseif ($CarrierBagHolderIn->holder_type == 1) {
                    $recurso_logistico = RecursoLogistico::findFirst($CarrierBagHolderIn->holder_id);
                    $empleado = Empleado::findFirst($recurso_logistico->id_empleado);
                    $ciudad = Ciudad::findFirst($empleado->ciudad)->ciudad;
                }
            }
            //ciudad resuelto en sql

            $company = Company::findFirst(array(
                "conditions" => "id_company = ?1",
                "bind" => array(1 => $subsidiary->id_company)
            )); // Company solucuinado en sql


            $com = SubsidiaryUser::find(array(
                "conditions" => "id_user = ?1 ",
                "bind" => array(1 => $this->session->get('auth')->id_user),
                "order" => "id DESC"
            ));

            $name_com = "No se encontro COM";
            foreach ($com as $itemsubsidiary) {
                $subsidiaryitem = Subsidiary::findFirst(array(
                    "conditions" => "id_subsidiary = ?1 and subsidiary_city = ?2",
                    "bind" => array(1 => $itemsubsidiary->id_subsidiary,
                                    2 => $subsidiary->subsidiary_city)
                ));
                if (isset($subsidiaryitem->subsidiary_name)) {
                    $name_com = $subsidiaryitem->subsidiary_name;
                    break;
                } 
            }

            
            $fixroutes[] = (object) array(

                "id" => $itemcarrie->c->id,
                "serial" => $itemcarrie->c->serial,
                "state" => $arrayStates[$itemcarrie->state],
                "holder_type" =>$arrayTypes[$itemcarrie->holder_type],
                "holder_name" => $this->_dataTypes($itemcarrie->holder_type,$itemcarrie->holder_id),
                "hour" => $itemcarrie->assigned_hour,
                "holder_id" => $itemcarrie->holder_id,
                "type" => $arrayTypesCarrier[$itemcarrie->type],
                "initial_date" => $CarrierBagHolderIn->assigned_date,
                "final_date" => $CarrierBagHolderFi->assigned_date,
                "ciudad" => $ciudad,
                "company" => $company->business_name,
                "office_code" => $subsidiary->office_code,
                "sucursal" => $name_com,
                "origin" => $CarrierBagHolderIn->origin_company." - ".Subsidiary::findFirst($CarrierBagHolderIn->origin_company)->subsidiary_name,
                "destination" => $CarrierBagHolderIn->destination_company." - ".Subsidiary::findFirst($CarrierBagHolderIn->destination_company)->subsidiary_name,
                "delivery" => $CarrierBagHolderIn->delivery_time,
            );
                
        }

        return $fixroutes;

    }            

    public function _dataTypes($holder_type,$holder_id)
    {


        if($holder_type == 1){
            $holder = RecursoLogistico::findFirst(array(
                  "conditions" => "id_recurso_logistico = ?1",
                  "bind" => array(1 => $holder_id)
              ));
            $empledado = Empleado::findFirst($holder->id_empleado);
            $name = $empledado->nombres." ".$empledado->apellidos;
        }elseif ($holder_type == 2) {
            $holder = Subsidiary::findFirst(array(
                  "conditions" => "id_subsidiary = ?1",
                  "bind" => array(1 => $holder_id)
              ));
            $name = $holder->subsidiary_name;
        }elseif ($holder_type == 3) {
            $holder = Empleado::findFirst(array(
                  "conditions" => "id_empleado = ?1",
                  "bind" => array(1 => $holder_id)
              ));
            $name = $holder->nombres . " " . $holder->apellidos;
        }elseif ($holder_type == 4) {
            $holder = Route::findFirst(array(
                  "conditions" => "id= ?1",
                  "bind" => array(1 => $holder_id)
              ));
            $name = $holder->name;
        }

        return $name;

    }
    
    public function pdf_report()
    {
        
        // .....
    }

    public function getAjaxPuntosAction()
    {

        //deshabilitamos la vista para peticiones ajax
        
        
        $subsidiaries = Subsidiary::find(array('conditions' => 'id_company = ?1 and point_type = 1',
                                                   'bind' => array(1 => $this->request->get("company_id"))));


        $this->view->disable();
        //si es una petición get y es una petición ajax
        if($this->request->isGet() == true && $this->request->isAjax() == true)
        {   
            $num = 0; 
            $get = $this->request->get();
            
            if(isset($get['num'])){
                $num = $get['num'] ;
            }

            $rows = [];
            foreach ($subsidiaries as $subsidiary) {
                array_push($rows, ['id_sub' => $subsidiary->id_subsidiary, 'subsidiary_name' => $subsidiary->subsidiary_name, 'office_code' => $subsidiary->office_code]);
            }
            
            //devolvemos un json
            $this->response->setJsonContent(array(
                "puntos" =>  $rows,
                "num" => $num
                
            ));
            //devolveos un 200, todo ha ido bien
            $this->response->setStatusCode(200, "OK");
            $this->response->send();
        }
        else
        {
            $this->response->setStatusCode(404, "Not Found");
            $this->response->send();
        }
    }

    public function getResourceWithRoutePointAction()
    {
        $this->view->disable();
        if($this->request->isGet() == true && $this->request->isAjax() == true) {
            $requested_point_id = $this->request->get("point_id");
            $route_points = RoutePoint::find(array( 'columns' => 'resource_id',
                                                    'conditions' => "point_id = ?1 and state = 1 and date = '". date('Y-m-d') ."' and resource_id is not null",
                                                    'bind' => array(1 => $requested_point_id),
                                                    'group' => 'resource_id'));
            $com_resources =  (new RecursoLogistico)->getResourceBySubsidiary($this->session->get("provider")->id_proveedor,$this->request->get("com"), 0, 0, 0, 1, 1000);
            $resources = []; 
            foreach ($route_points as $point) {
                foreach ($com_resources as $resource) {
                    if ($point->resource_id == $resource->id) {
                        array_push($resources, ['id' => $resource->id, 'nick' => $resource->nick]);
                    }
                }
            }
            echo json_encode($resources);
        }        
    }

   
}
