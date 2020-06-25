
<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>


<div id="mostrar" class="alert alert-success" style="display: none">
    <strong>{{ msg }}!</strong> {{ msg2 }}
</div>


<div class="col-sm-12 container contenido">
  <div class="col-md-12">
      <h4 class="section-title"> <?php echo $t->_("INTEGRATIONOPTIONS") ?> </h4>
  </div>
  <!-- <div class="row headhed sup" id="divleg">
    <legend id="" class="legendd"><b><img src="{{url('img/admin_menu-8.png')}}"> <?php echo $t->_("INTEGRATIONOPTIONS") ?></b></legend>
  </div> -->  
  <div id="nav-sub" class="sup navv">
      <ul class="nav nav-tabs">
        <li id="liapi" class="active" onclick="mostrar('api'); mostrarli('liapi')"><a href="#"><b><?php echo $t->_("ApiIntegration") ?></b></a></li>
        <li id="liwcheck" onclick="mostrar('wcheck'); mostrarli('liwcheck')"><a href="#"><b>Web Checkout</b></a></li>
        <li id="liplug" onclick="mostrar('plug'); mostrarli('liplug')"; mostrarli('lint')><a href="#"><b>Plugins</b></a></li>
        <li id="lilpay" onclick="mostrar('lpay'); mostrarli('lilpay')"><a href="#"><b><?php echo $t->_("Paymentlink") ?></b></a></li>
        <li id="libpay" onclick="mostrar('bpay'); mostrarli('libpay')"><a href="#"><b><?php echo $t->_("Paymentbutton") ?></b></a></li>
        <li id="lisp" onclick="mostrar('sp'); mostrarli('lisp')"><a href="#"><b><?php echo $t->_("Technicalsupport") ?></b></a></li>        
      </ul>
  </div>



<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

   <div id="api" style="display: block;" class="trans col-sm-11 col-xs-12">

    <div id="limitt">
      <div class="container-fluid">
         <h1 style="color:rgb(133, 133, 133); font-weight: bold;"><?php echo $t->_("CheckTitle2") ?></h1>

          <p>
             <?php echo $t->_("CheckText1") ?>
          </p>  
          <p>
            <?php echo $t->_("CheckText2") ?>
          </p>  
          <div style="padding-left: 2em;">
          <ul>
           <li><?php echo $t->_("CheckText11") ?></li>
           <li><?php echo $t->_("CheckText12") ?></li>
           <li><?php echo $t->_("CheckText13") ?></li>
           <li><?php echo $t->_("CheckText14") ?></li>
           <li><?php echo $t->_("CheckText15") ?></li>
           <li><?php echo $t->_("CheckText16") ?></li>
           </ul>
          </div>
          <br><br>
          <p>
            <?php echo $t->_("CheckText3") ?>
          </p>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no1.png') }}"></center> 
          </div>
          <div class="row">
            <p>
             <?php echo $t->_("first_step") ?>
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im1.jpg') }}"></center>

        </div>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im2.jpg') }}"></center>

        </div>      
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no2.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("second_step") ?>
            </p> 
          </div>          
        </div>
      </div> 
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no3.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("third_step") ?>
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im3.jpg') }}"></center>

        </div>        
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im4.jpg') }}"></center> 

        </div>      
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no4.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("fourth_step") ?>
            </p> 
          </div>          
        </div>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no5.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("fifth_step") ?> 
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im5.jpg') }}"></center>

        </div>        
      </div>
      </div><!--Borrarrrrrrrrrr-->

     
   </div>


  <div id="wcheck" style="display: none" class="trans col-sm-11 col-xs-12">
   <div id="limitt">
     <h1>Contenido WebChecout...</h1>
   </div>
  </div>

  <div id="plug" style="display: none" class="trans col-sm-11 col-xs-12">
    <h1>Contenido Plugins...</h1>
  </div>

  <div id="lpay" style="display: none" class="trans col-sm-11 col-xs-12">
    <h1>Contenido Link de pago...</h1>
  </div>

  <div id="bpay" style="display: none" class="trans col-sm-11 col-xs-12">
    <h1>Contenido Botón de pago...</h1>
  </div>

  <div id="sp" style="display: none" class="trans col-sm-11 col-xs-12">
    <div class="">
      <h1>Formulario de Solicitud de Servicio Técnico</h1>
    </div>
    <div style="" class="col-md-12 box_support_t">
    {{ form("register/supporttechnical", "method": "post") }}
      <fieldset>
        <input type="hidden" value='{{client_gateway_id}}' name="client_gateway_id">
        <!-- Name -->
        <div class="col-md-3">
        
          <div class="control-group">
            <!-- <label class="control-label labell"  for="username"><?php echo $t->_("First_name") ?>:</label> -->
            <input type="text" id="username" name="nombre" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("First_name") ?>" required>

          </div>

          <!-- Card Number -->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Last_name") ?>:</label> -->
            <input type="text" id="lastname" name="apellido" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Last_name") ?>" required>
          </div>

          <!-- Expiry-->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("E-mail") ?>:</label> -->
            <input type="email" id="rs" name="email" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("E-mail") ?>" required>
          </div>


          <!-- Expiry-->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Affair") ?>:</label> -->
            <input type="text" id="affair" name="asunto" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Affair") ?>" required>
          </div>

          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Request") ?>:</label> -->
            <input type="text" id="request" name="requerimiento" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Request") ?>" required>
          </div>
        </div>
        <div class="col-md-9">
             <!-- <label class="control-label labell" for="email"><?php echo $t->_('Your_message') ?>:</label> -->
             <textarea  class="form-control control-group txtarea_soporte" name="mensaje" style="" placeholder="<?php echo $t->_('Your_message') ?>" required></textarea>
        </div>
        <!-- Submit -->
        <div class="col-md-12 css_Div_Botones_Soporte">
            <button class="css_Boton_Enviar" type="submit" name="button">
              <?php echo $t->_("Submit") ?></button>
        </div>
      </fieldset>
      {{ end_form() }}
  </div>
    
  </div>   

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
{{ javascript_include('js/script.js') }}


<script type="text/javascript">
function mostrar(capilla)
{
  //Cerrando otras secciones
    obj1 = document.getElementById('api');
    obj2 = document.getElementById('wcheck');
    obj3 = document.getElementById('plug');
    obj4 = document.getElementById('lpay');
    obj5 = document.getElementById('bpay');
    obj6 = document.getElementById('sp');    

  //cerrando..
   if (obj1) {
     obj1.style.display = "none";
   }
   if (obj2) {
     obj2.style.display = "none";
   }
   if (obj3) {
     obj3.style.display = "none";
   }
   if (obj4) {
     obj4.style.display = "none";
   }
   if (obj5) {
     obj5.style.display = "none";
   }
   if (obj6) {
     obj6.style.display = "none";
   }         
//mostrando seccion señalada
    obj = document.getElementById(capilla);
    obj.style.display = "block";

}  

</script>

<script type="text/javascript">
function mostrarli(capilla)
{
    //Cerrando otras secciones
    li1 = document.getElementById('liapi');
    li2 = document.getElementById('liwcheck');
    li3 = document.getElementById('liplug');
    li4 = document.getElementById('lilpay');
    li5 = document.getElementById('libpay');
    li6 = document.getElementById('lisp');

    //cerrando..
    if (li1) {
        li1.className = "";
    }
    if (li2) {
        li2.className = "";
    }
    if (li3) {
        li3.className = "";
    }
    if (li4) {
        li4.className = "";
    }
    if (li5) {
        li5.className = "";
    }
    if (li6) {
        li6.className = "";
    }
    //mostrando seccion señalada
    li = document.getElementById(capilla);
    li.className = "active";

}  
</script>

<script type="text/javascript">
    {% if msg is empty %}

    {% else %}
        document.getElementById("mostrar").style.display="block";
    {% endif %}
</script>