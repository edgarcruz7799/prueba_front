
{{ content() }}


  <div class="col-md-12">
      <h4 class="section-title"> SOLICITAR RETIRO </h4>
      <p>Aqui puede realizar la solicitud de retiro de dinero a domicilio sobre el saldo de su cuenta</p>
  </div>
  <!-- <div class="row headhed sup" id="divleg">
    <legend id="" class="legendd"><b><img src="{{url('img/admin_menu-4.png')}}"> SOLICITAR RETIRO</b></legend>
  </div> -->
<!--     <h5 class="title" style=""><b>SOLICITAR RETIRO</b></h5> -->
    
 <div id="divbackground" style=""><!--Div para el background-->   
  <div class="col-md-12">
        <!-- <img id="img" src="{{url('img/ktronix-logo.png')}}"> -->
      <div class="col-md-10">
        <img id="img" src="{{url('img/logobrinks.png')}}">
      </div>
<!--     <div style="padding-top: 4%" align="right" class="col-sm-6">
        <h5><b>RETIRO</b></h5>
        <p id="datosretiro">No. #5970</p> 
        <hr id="hr" style="">
        <p id="datosretiro">26 Enero 2018</p> 
    </div> -->
      <div class="col-md-2">
          <p id="datosretiro">Retiro #5970</p> 
          <p id="datosretiro">26 de Enero 2018</p> 
      </div>
  </div>
  <hr style="width: 98%; height: 15px; border-bottom: 3px solid #eee; border-top: 0px">
  <div class="col-md-12">    
    <div class="col-md-4">
      <b id="datretiro">TIPO DE RETIRO:</b>
      <input id="tipretradio" type="radio" name="gender" value="Efectivo"> Efectivo
      <input id="tipretradio" type="radio" name="gender" value="Efectivo"> Transferencia Bancaria
    </div>
    <div class="col-md-4">
      <b id="datretiro">VALOR RETIRO:</b>
      <label id="retval">$50.000.000</label>
    </div>
    <div class="col-md-4">
      <b id="datretiro">DIRECCION DE ENTREGA:</b> 
      <select id="selectdir">
        <option class="uno" value="">Oficina calle 15 # 127</option>
        <option class="dos" value="">Oficina calle 15 # 127</option>
        <option class="uno" value="">Oficina calle 15 # 127</option>
      </select>
    </div>
  </div>
  <hr style="width: 98%; height: 15px; border-bottom: 3px solid #eee; border-top: 0px">
  <div class="col-md-12">
    <div class="col-md-6">

        <b>DATOS DE ENTREGA:</b>
      
        <p id="info">Julian Camilo Parra</p> 
        <p id="info">Ktronix Carrera15 (frente a Unicentro) Cra 5 # 122-59</p> 
        <p id="info">310 258 5456</p>

    </div>
    <div class="col-md-6">

        <b>DATOS DE RETIRO:</b>

        <p id="iddd">ID: #5971</p>
        <p id="info">FECHA: Enero 26,2018</p> 
        <p id="info">ESTADO: <b id="pendiente">Pendiente</b></p>  
  

    </div>
<!--     <div class="col-sm-4">

        <b>DETALLE RETIRO:</b><br><br>
        <textarea id="areadetalle" placeholder="" class="form-control" name ="text" rows=4 cols=5>  </textarea>

    </div>  -->       
  </div>

  <div class="col-md-12">
    <div id="divtable" class="col-md-12 table-responsive">
      <!--Inicio de la tabla-->
        <table class="table table-striped">
          <thead style="background-color: #cccaca; color:#005eae">
            <tr>
              <th scope="col"> No </th>          
              <th scope="col">Descripción</th>  
              <th scope="col">Valor</th>                                                         
            </tr>
          </thead>
          <tbody id="tbodydiv" style="">
            <tr>
              <th scope="row">1</th>
              <td>Valor a entregar</td> 
              <td>$50.000.000</td>                                                            
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Costo Entrega a Domicilio</td>   
              <td>$700.000</td>                                                         
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Valor a Debitar</td> 
              <td><b id="valdeb">$50.700.000</b></td>                                                          
            </tr>
          </tbody>
        </table> 
      <!--Fin de la tabla-->
    </div>

    <div class="col-md-6">
      <button id="btngreen" type="button" class="btn btn-success">Solicitar Retiro</button>
      <button id="btnred" type="button" class="btn btn-danger">Cancelar Retiro</button>
    </div>

    
  </div>
  <!--diferenciador para el background-->
  <!--Mapa-->

  <div class="col-md-12">
    <div id="mapadiv" class="mapaa">
        <!--INICIO MAPA-->
        <div class="form-control" id="map" style="width:100%;height:480px;">
          
        </div>
        <!--FIN MAPA-->
    </div>
  </div>


<!--SCRIPT para mapa-->
<script>
        function initMap() {
          
        var latitude = 4.6663342;
        var longitude = -74.1139979;
        
          var map = new google.maps.Map(document.getElementById('map'), {
              zoom: 15,
              center: {lat: latitude, lng: longitude  }
          });

          var marker = new google.maps.Marker({
              position: {lat: latitude , lng:  longitude  },
              map: map
          });


          google.maps.event.addListener(map,'click',function(event) {

              marker.setPosition(event.latLng);

                  var geocoder = new google.maps.Geocoder();

                  var yourLocation = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());

                  geocoder.geocode({ 'latLng': yourLocation },function(results, status) {

                  });

          });


        } 
  
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA70fslcm8mwK6ZSGPOc_S0SNaAn74G_6Y&callback=initMap&libraries=places"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
