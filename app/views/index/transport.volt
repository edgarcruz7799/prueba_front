<script type="text/javascript">localStorage.clear();</script>
<!DOCTYPE html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

  <body>

    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="">
    <div id="mostrar" class="alert alert-danger" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      
    </div>

    
        <section id="mu-hero" class="mu-hero-section1" style="background-image: url({{url('img/FIL11.JPG')}});">
          <div class="container" >
              <div class="row" style="margin-top: -5px;">
                  <div class="col-md-6 col-sm-6">
                      <div class="mu-hero-left" style="float: none;">
                          <hr class="hrstyle" style="">
                          <p class="fonth1transport" style="">TU SOLUCIÓN EN</p>
                          <p class="fonth2transport" style="">TRANSPORTE DE CARGA</p>
                      </div>                    
                  </div>

                  <div id="div_form" class="col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2" style="">
                      <form id="formtransportuno" action="{{ url('transport/listTransport') }}" method="post" style="margin-top: -15px;">
                          <center>
                              <h3 style="">
                                  <?php echo $t->_("boxindex") ?>
                              </h3>
                          </center>
                          <div class="col-md-12" style="margin-top: -15px;">
                              <p style="">
                                  Origen
                              </p>
                              <div>
                                  <select class="address form-control"  name="city1" required>
                                    {% if dato is empty %}
                                      <!-- No se encontraron direcciones -->
                                    {% else %}
                                    
                                      {% for item in dato %}
                                        
                                        <option value="{{item.id_city}}">{{item.city}} </option>
                                      {% endfor %}
                                    {% endif %}
                                  </select>
                              </div>
                          </div>
                          <div class="col-md-12" style="margin-top: -15px;">
                              <p style="margin-top: 15px;">
                                  Destino
                              </p>
                              <div>
                                  <select class="address form-control"  name="city2" required>
                                    {% if dato is empty %}
                                      <!-- No se encontraron direcciones -->
                                    {% else %}
                                    
                                      {% for item in dato %}
                                        
                                        <option value="{{item.id_city}}">{{item.city}} </option>
                                      {% endfor %}
                                    {% endif %}
                                  </select>
                              </div>
                          </div>
                          <div class="col-md-6">
                              <p style="">
                                  Fecha
                              </p>
                              <input style="background: white; color: black;" type="date" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="<?php $hoy=date('Y-m-d'); echo $hoy;?>" id="datepicker" name="initial_date">
                          </div>
                          <div class="col-md-6">
                              <p style="">
                                  Hora
                              </p>
                              <input style="background: white; color: black;" type="time" value="00:00:00" max="24:59:00" min="00:00:00" id="datepicker" name="hour">
                          </div>
                          <p style="margin-bottom: 15px;">
                              Tipo de carga
                          </p>
                          <div class="col-md-12" style="margin-top: -15px;">
                            <div>
                              <select class="address form-control"  name="type_load" required>
                                <option value="General">General</option>
                                <option value="Granel">Granel</option>
                                <option value="Peligrosa">Peligrosa</option>
                                <option value="Perecedera">Perecedera</option>
                                <option value="Frágil">Frágil</option>
                              </select>
                            </div>
                          </div>
                          <p style="margin-bottom: 15px;">
                              Tipo de transporte
                          </p>
                          <div class="col-md-12" style="margin-top: -15px;">
                              <div>
                                <select class="address form-control"  name="type_truck" required>
                                  <option value="Turbo">Turbo</option>
                                  <option value="Sencillo">Sencillo</option>
                                  <option value="Minimula">Minimula</option>
                                  <option value="Tractomula">Tractomula</option>
                                </select>
                              </div>
                            </div>
                          <div class="col-md-12">
                              <center style="">
                                  <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                                  <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex buttonboxtransport" value="<?php echo $t->_('boxindex7') ?>" style="" />
                              </center>
                          </div>
                      </form>
                  </div>
                </div>


                <div class='row'>
                  <div class='col-md-10 boxpublicidad' style="">                      
                    <div class="carousel slide media-carousel" id="media" style="">
                      <div class="row">
                        <div class="col-md-1 col-md-offset-1 fontboxdes" style="">ESTE MES</div>
                        <!-- <div class="col-md-1 col-md-offset-1 divline" style="border-left: 2px solid #fff; height: 130px; width: 0px;"></div> -->
                        <div class="col-md-4 col-md-offset-2 divtextindex" style="" >Obtén un descuento del 20% para transporte de carga a nivel nacional. </div>
                        <div class="col-md-4"><img src="{{url('img/Assets_Pallets.png')}}" style=""></div>
                        <div class="col-md-12" style="">
                          <center >
                            <a href="#" class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton1") ?></a>
                          </center>
                        </div>     
                      </div>
                    </div>
                  </div>
                </div>

              </div>
      </section>
    

    <!-- Start video -->
    <section class="clearfix videobrinks" id="mu-book-overview">
        <div class="row">
          <div class="col-md-12">
            <video width="400" controls poster="{{url('img/PantallaVideo.png')}}">
              <source src="{{url('img/ALMAGRARIO 2018.mp4')}}" type="video/mp4">
            </video>
          </div>
        </div>
    </section>
    <!-- End video -->


    <section class="clearfix" id="mu-book-overview">
        <div class="row">
          <div class="col-md-12">
            <div class="mu-book-overview-area">

              <div class="mu-heading-area">
                  <h2 class="mu-heading-title h2-cobertura">
                      NUESTRA INFRAESTRUCTURA
                  </h2>
                  <br><br>
              </div>

              <div class="row">
                <a>
                  <div id="1" class="col-xs-1 col-sm-3 col-md-3 col-md-offset-1 text-center div_cobertura">
                        <div class="div_box_cobertura">
                            <span class="">
                              Camión cerrado
                            </span>
                        </div>
                    
                        <img id="img1" src="{{url('img/Camiones01.jpg')}}" style="border-radius: 15px; height: auto; width: 100%;">
                    
                        <!-- <p>Sucursal</p>
                        <p>Agencia de aduanas</p>
                        <p>Bodega</p>
                        <p>Zona franca</p>
                        <p>Depósito</p> -->
                    
                  </div>
                </a>
                
                <a>
                  <div id="2" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                        <div class="div_box_cobertura">
                            <span class="">
                              Camión remolque
                            </span>
                        </div>
                    
                        <img id="img2" src="{{url('img/Camiones02.jpg')}}" style="border-radius: 15px; height: auto; width: 100%;">
                    
                        <!-- <p>Bodega</p>
                        <p>Planta de silos</p> -->
                    
                  </div>
                </a>
                
              
                <a>
                  <div id="3" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                        <div class="div_box_cobertura">
                            <span class="">
                              Camión cisterna
                            </span>
                        </div>
                    
                        <img id="img3" src="{{url('img/Camiones03.jpg')}}" style="border-radius: 15px; height: auto; width: 100%;">
                    
                        <!-- <p>Bodega</p> -->
                    
                  </div>
                </a>
                <a>
                  <div id="4" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                        <div class="div_box_cobertura">
                            <span class="">
                              Camión de granel
                            </span>
                        </div>
                    
                        <img id="img4" src="{{url('img/Camiones04.jpg')}}" style="border-radius: 15px; height: auto; width: 100%;">
                    
                        <!-- <p>Bodega</p>
                        <p>Planta de silos</p> -->
                    
                  </div>
                </a>                
                
              </div>
            </div>
          </div>
        </div>
    </section>


    <section id="mu-hero" class="mu-hero-section6">
        
            <div class="row" >
                <div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2" >
                    <div class="mu-hero-left" style="float: none;" >
                        <center>
                            <h1 style="color: black;" ><span style="font-weight: lighter; display: contents;">NUESTRAS</span> ALIANZAS</h1>
                        </center>
                        <br><br>
                        <center>
                            <p style="color: black;"><?php echo $t->_("SectionText6") ?></p>
                        </center>                       
                    </div>
                </div>
            </div>

        
            <div class="row">
                <div class="col-md-8 col-sm-8 logosbrinks">
                    <center>
                        <img class="logosbrinksind" src="{{ url('img/logos-aliados.jpg') }}">
                    </center>
                </div>
                <div class="col-md-8 col-sm-8 logosbrinkstwo">
                    <div>
                      <center>
                        <img class="logosbrinksind" style="height: 11vw; margin-top: 4vw;" src="{{ url('img/logo servade.png') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoRedServi.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                          <img class="logosbrinksind" style="height: 11vw;" src="{{ url('img/datia-logo.png') }}">      
                      </center>
                    </div>
                </div>
            </div>
    </section>

    <section id="mu-hero" class="mu-hero-section6">
            <div class="row" >
                <div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2" >
                    <div class="mu-hero-left" style="float: none;" >
                        <center>
                            <h1 style="color: black;" ><span style="font-weight: lighter; display: contents;"><?php echo $t->_("SectionTitle6") ?></span> <?php echo $t->_("SectionTitle66") ?></h1>
                        </center>
                        <br><br>
                        <center>
                            <p style="color: black;"><?php echo $t->_("SectionText66") ?></p>
                        </center>                       
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8 col-sm-8 logosbrinks">
                    <center>
                      <img class="logosbrinksind" src="{{ url('img/Clientes_LogosClientes01.jpg') }}">                        
                    </center>
                    <center>
                      <img class="logosbrinksind" src="{{ url('img/Clientes_LogosClientes02.jpg') }}">
                    </center>
                </div>
                <div class="col-md-8 col-sm-8 logosbrinkstwo">
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoItalcol.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoColjuegos.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/AssetsLogoIngenioProvidencia.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/AssetsLogoPlaneta.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoBavaria.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoContinentalTire.jpg') }}">
                      </center>
                    </div>
                    <div>
                      <center>
                        <img class="logosbrinksind" src="{{ url('img/Assets_LogoEmcali.jpg') }}">
                      </center>
                    </div>
                </div>
            </div>
    </section>

    <section id="mu-book-overview" class="mu-book-overview-support-section1" style="background-image: url({{url('img/ImagenPQRS.jpg')}});">
        <div class="container-fluid">

            <div class="center">
                <div class="mu-hero-left" style="float: none;" >
                    <center><h1 style="">Quieres radicar un PQRS?</h1></center>
                </div>
            </div>

            <!-- <form action="{{ url('index/supportIndex') }}" method="post">
                <section class="form-group">
                    <div class="row form_pqrs">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <input class="form-control input-name-support" type="text" name="name_contact" title="Full Name" id="name_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormName17') ?>">
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">                            
                            <input class="form-control input-email-support" type="email" name="email_contact" title="Email" id="email_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormEmail17') ?>">                           
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <select  class="form-control select-support">
                              <option class="uno" value=""><?php echo $t->_("FormTypes17") ?></option>
                              <option class="dos" value="">Soporte</option>
                              <option class="uno" value="">Tecnico</option>
                              <option class="uno" value="">Pedidos</option>
                              <option class="uno" value="">Quejas</option>
                              <option class="uno" value="">Reclamos</option>
                              <option class="uno" value="">Solicitud</option>
                            </select>
                        </div>
                    </div>
                </section>
                <input type="hidden" value={{token}} name="CSRFtoken">
                <section class="form-group">
                    <center><textarea placeholder="<?php echo $t->_('FormArea') ?>" class="form-control textarea-support" name ="text" rows=8 cols=10></textarea></center>
                </section><br>


                <div align="center">
                    <input style="height: 40px; border-radius: 15px; background-color: #f71e14; border-color: #f71e14;" type="submit" name="" class="btn btn-primary btn-lg" value="<?php echo $t->_('SectionButton17') ?>"/>
                </div>
            </form> -->
            <div align="center">
              <a href="https://www.almalogix.com/almalogix/scripts/pqrweb/pnt00003.php" target="_blank">
                <input style="height: 40px; border-radius: 15px; background-color: #f71e14; border-color: #f71e14; color: #fff;" type="button" name="" class="btn btn-primary btn-lg" value="Haz click aquí"/>
              </a>
            </div>
            </div>
        </div>
    </section>
    <!-- End main content -->

    <div class="scrollup">
        <a href="#"><i class="fa fa-chevron-up"></i></a>
    </div>

<!--Modal login y registro - Error -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("Log_in_failure") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("Log_in_failure_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal Log out - Success -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("Logout") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("Log_out_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal ForgotPassword - Success -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("Forgot_password_success") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("Forgot_password_success_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal ChangePassword - Success -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("Change_password_success") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("Change_password_success_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal ChangePassword - Failure -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("Change_password_failure") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("Change_password_failure_msg") ?>
            </div>
        </div>
    </div>
</div>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>



{{ javascript_include('js/script.js') }}

<script type="text/javascript">
$(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false,
  });
});
</script>
<script type="text/javascript">
      $('.address').select2({
        
      });
</script>

<script type="text/javascript">
    {% if msg is empty %}

    {% else %}
        document.getElementById("mostrar").style.display="block";
    {% endif %}
</script>

<script type="text/javascript">
    var elInput = document.querySelector('#input');
    
    if (elInput) {
      var etiqueta = document.querySelector('#etiqueta');
      if (etiqueta) {
        etiqueta.innerHTML = elInput.value;

        elInput.addEventListener('input', function() {
          etiqueta.innerHTML = elInput.value;
        }, false);
      }
    }

    var elInput2 = document.querySelector('#input2');

    if (elInput2) {
      var etiqueta2 = document.querySelector('#etiqueta2');
      if (etiqueta2) {
        etiqueta2.innerHTML = elInput2.value;

        elInput2.addEventListener('input', function() {
          etiqueta2.innerHTML = elInput2.value;
        }, false);
      }
    }

    var elInput3 = document.querySelector('#input3');

    if (elInput3) {
      var etiqueta3 = document.querySelector('#etiqueta3');
      if (etiqueta3) {
        etiqueta3.innerHTML = elInput3.value;

        elInput3.addEventListener('input', function() {
          etiqueta3.innerHTML = elInput3.value;
        }, false);
      }
    }

    var elInput4 = document.querySelector('#input4');

    if (elInput4) {
      var etiqueta4 = document.querySelector('#etiqueta4');
      if (etiqueta4) {
        etiqueta4.innerHTML = elInput4.value;

        elInput4.addEventListener('input', function() {
          etiqueta4.innerHTML = elInput4.value;
        }, false);
      }
    }

    var elInput5 = document.querySelector('#input5');

    if (elInput5) {
      var etiqueta5 = document.querySelector('#etiqueta5');
      if (etiqueta5) {
        etiqueta5.innerHTML = elInput5.value;

        elInput5.addEventListener('input', function() {
          etiqueta5.innerHTML = elInput5.value;
        }, false);
      }
    }

    var elInput6 = document.querySelector('#input6');

    if (elInput6) {
      var etiqueta6 = document.querySelector('#etiqueta6');
      if (etiqueta6) {
        etiqueta6.innerHTML = elInput6.value;

        elInput6.addEventListener('input', function() {
          etiqueta6.innerHTML = elInput6.value;
        }, false);
      }
    }
</script>


<script type="text/javascript">
  var slider = document.getElementById("deposit_capacity");
var output = document.getElementById("temp");
output.innerHTML = slider.value;

slider.oninput = function() {
    output.innerHTML = this.value;
}

</script>


