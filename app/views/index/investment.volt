<script type="text/javascript">localStorage.clear();</script>
<!DOCTYPE html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


  <body>

    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="">
    <div id="mostrar" class="alert alert-danger" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      
    </div>

    
    
        <section id="mu-hero" class="mu-hero-investment" style="background-image: url({{url('img/ImagenInversión01.jpg')}});">
          <div class="container" >
              <div class="row">
                  <div class="col-md-6 col-sm-6">
                      <div class="mu-hero-left" style="float: none;">
                          <hr class="hr_investment" style="">
                          <p class="fonth1_investment" style="" > INVIERTE DESDE </p>
                          <p class="fonth2_investment"> $4.000.000 </p>
                          <p class="fonth3_investment"> EN ALMA STORAGE </p>
                          <p class="fonth4_investment"> y gana dinero de los alquileres de tu almabox</p>
              <!-- <p align="right"><?php echo $t->_("SectionText1") ?></p>
                          <div class="row" style="margin-top: 37px;">
                              <div class="col-md-8 col-sm-8 col-md-offset-4 col-sm-offset-4">
                                  <a onclick="mostrarcapa('555');" href="#" class="pull-right mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton1") ?></a>
                              </div>
                          </div>-->
                      </div>                    
                  </div>

                  <div id="div_form" class="col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2" style="background-color: #D8D8D8; border-radius: 15px;">
                      <form class="forminvestmentuno" action="{{ url('cellar/listCellar') }}" method="post">
                          <center>
                              <h3 style="">
                                  Más información
                              </h3>
                          </center>
                          
                          <div class="col-md-12">
                              <p style="">
                                  Nombre
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="text" placeholder="Escribe tu nombre">
                          </div>
                          <div class="col-md-12">
                              <p style="">
                                  Correo
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="text" placeholder="correo@ejemplo.com">
                          </div>
                          <div class="col-md-12">
                              <p style="">
                                  Telefono
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="number" placeholder="000 000 0000">
                          </div>
                          
                          <div class="col-md-12">
                              <center>
                                  <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                                  <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex buttonboxinvestment" value="Solicitar información" style="margin: 20px 0px; width: 100%" />
                              </center>
                          </div>
                      </form>                      
                  </div>
                  <center>
                    <a href="https://api.whatsapp.com/send?phone=573176609849&text=Me%20interesa%20el%20modelo%20de%20negocio%20&source=&data=" target="_blank">
                      <div class="col-md-3 col-md-offset-5 col-xs-12 whatsapp_investment" style="">
                        <div class="pull-left">
                          <img style="width: 65%; margin-top: 5px; margin-left: 24px;" src="{{url('img/whatsapp-logo.png')}}">
                        </div>
                        <div>
                          ¿Tienes dudas?
                        </div>
                        <div style="font-weight: bold;">
                          Chatea con nosotros
                        </div>
                      </div>
                    </a>
                  </center>
                </div>
              </div>
      </section>


      <section class="clearfix" id="mu-book-overview">
        <div class="row">
          <div class="col-md-12">
            <div class="mu-book-overview-area">
              <div class="mu-heading-area">
                  <hr class="hr_investment2" style="">
                  <h2 class="mu-heading-title h2-cobertura" style="">
                    INVIERTE EN DIFERENTES
                  </h2>
                  <p>
                    espacios de almacenamiento y aumenta tu rentabilidad
                  </p>
                  <br><br>
              </div>

              <div class="row">
                <a>
                  <div id="1" class="col-xs-1 col-sm-3 col-md-3 col-md-offset-1 text-center div_cobertura">
                        
                        <img id="img1" src="{{url('img/almacenamiento01.jpg')}}" style="border-radius: 15px; height: 250px; width: 100%;">
                    
                  </div>
                </a>
                
                <a>
                  <div id="2" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                    
                        <img id="img2" src="{{url('img/Almacenamiento02.jpg')}}" style="border-radius: 15px; height: 250px; width: 100%;">
                    
                  </div>
                </a>
                
              
                <a>
                  <div id="3" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                    
                        <img id="img3" src="{{url('img/Almacenamiento03.jpg')}}" style="border-radius: 15px; height: 250px; width: 100%;">
                    
                  </div>
                </a>
                <a>
                  <div id="4" class="col-xs-1 col-sm-3 col-md-3 text-center div_cobertura">
                    
                        <img id="img4" src="{{url('img/almacenamiento01.jpg')}}" style="border-radius: 15px; height: 250px; width: 100%;">
                    
                  </div>
                </a>                
                
              </div>
            </div>
          </div>
        </div>
    </section>    

    <section id="mu-hero" class="mu-hero-investment-section3" style="background-image: url({{url('img/ImagenInversión02.jpg')}});">
      <div class="container container_investment" style="">
        <div class="row">

            <div class="col-md-6 col-sm-6 col-md-offset-6 col-sm-offset-6">
              <hr class="hr_investment3" style="">
                <div class="mu-hero-right" style="float: none;">
                  <h1 class="h1_investment" style="">CONTAMOS CON</h1>
                  <p align="right" style="margin: 0px;">diferentes tipos de almabox de almacenamiento</p>
                  <p align="right">en los cuales podrás invertir:</p>
                </div>
                <div class="col-md-3 col-md-offset-6 col-xs-12 listcontamos listconta" style="">
                  <ul>
                    <li style="">Almabox 2m3</li>
                    <li style="">Almabox 5m3</li>
                    <li style="">Almabox 10m3</li>
                  </ul>
                </div>  
                <div class="col-md-3 col-xs-12 listcontamos" style="">
                  <ul>
                    <li style="">Almabox 20m3</li>
                    <li style="">Almabox 50m3</li>
                    <li style="">Almabox 100m3</li>
                  </ul>
                </div>
            </div>

        </div>        
      </div>
    </section>


    <section class="mu-hero-section1 section_investment" id="mu-hero" style="background-image: url({{url('img/ImagenInversión03.jpg')}});">
        <div class="row">
          <div class="col-md-12">
            <div class="mu-book-overview-area">
              <div class="mu-heading-area">
                  <hr class="hr_investment2" style="">
                  <h2 class="mu-heading-title h2-cobertura" style="">
                    INVIERTE EN ALMASTORAGE
                  </h2>
                  <p>
                    y gana con los servicios de almacenamiento para
                  </p>
                  <br><br>
              </div>

              <div class="col-md-6 col-md-offset-3 div_investment" style="">
                
                <div class="col-md-4 div_investment2" style="">                  
                  <center>
                    <img src="{{url('img/Assets_home.png')}}">
                  </center>
                  <center class="letterinvesment">
                      Hogares
                  </center>
                </div>
                <div class="col-md-4">
                  <center>
                    <img src="{{url('img/Assets_business.png')}}">  
                  </center>
                  <center class="letterinvesment">
                      Negocios
                  </center>
                </div>
                <div class="col-md-4 div_investment3" style="">
                  <center>
                    <img src="{{url('img/Assets_company.png')}}"> 
                  </center>
                  <center class="letterinvesment">
                      Empresas
                  </center>
                </div>          
                
              </div>
            </div>
          </div>
        </div>
    </section>    


    <section class="clearfix" id="mu-book-overview">
        <div class="row">
          <div class="col-md-12">
            <div class="mu-book-overview-area">
              <div class="mu-heading-area">
                  <hr class="hr_investment2" style="">
                  <h2 class="mu-heading-title h2-cobertura" style="">
                    PODRÁS INVERTIR
                  </h2>
                  <p>
                    en almabox en las siguientes ciudades del país donde contamos con presencia.
                  </p>
                  <br><br>
              </div>

              <div class="row">
                <a>
                  <div id="1" class="col-xs-12 col-sm-1 col-md-1 col-md-offset-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Bogotá
                            </span>
                        </div>
                    
                        <img id="img1" class="img_investment" src="{{url('img/Bogota373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>
                
                <a>
                  <div id="2" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Cali
                            </span>
                        </div>
                    
                        <img id="img2" class="img_investment" src="{{url('img/Cali373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>
                
              
                <a>
                  <div id="3" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Medellin
                            </span>
                        </div>
                    
                        <img id="img3" class="img_investment" src="{{url('img/Medellin373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>
                <a>
                  <div id="4" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Pereira
                            </span>
                        </div>
                    
                        <img id="img4" class="img_investment" src="{{url('img/DosQuebradas373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>

                <a>
                  <div id="5" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Barranquilla
                            </span>
                        </div>
                    
                        <img id="img5" class="img_investment" src="{{url('img/Barranquilla373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>

                <a>
                  <div id="6" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Cargatena
                            </span>
                        </div>
                    
                        <img id="img6" class="img_investment" src="{{url('img/Cartagena373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>

                <a>
                  <div id="7" class="col-xs-12 col-sm-1 col-md-1 text-center div_cobertura_1">
                        <div class="div_box_cobertura_1">
                            <span class="">
                              Santa Marta
                            </span>
                        </div>
                    
                        <img id="img7" class="img_investment" src="{{url('img/SantaMarta373x250.jpg')}}" style="border-radius: 15px;">
                    
                  </div>
                </a>
                
              </div>
            </div>
          </div>
        </div>
    </section>

    <section id="mu-hero" class="mu-hero-section1endstorage" style="background-image: url({{url('img/ImagenInversión04.jpg')}});">
          <div class="container" >
              <div class="row">
                  <div class="col-md-6 col-sm-6">
                      <div class="mu-hero-left" style="float: none;">
                          <hr class="hr_investment" style="">
                          <p class="fonthuno_investment" style="" >ESCRÍBENOS</p>
                          <p class="fonthdos_investment">Y TE ENVIAREMOS</p>
                          <p class="fonthtres_investment">MÁS INFORMACIÓN</p>
                          <p class="fonthcuatro_investment">DE LAS OPORTUNIDADES ALMASTORAGE</p>
                      </div>                    
                  </div>

                  <div id="div_form" class="col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2" style="background-color: #D8D8D8; border-radius: 15px;">
                      <form class="forminvestmentdos" action="{{ url('cellar/listCellar') }}" method="post">
                          <center>
                              <h3 style="">
                                  Más información
                              </h3>
                          </center>
                          
                          <div class="col-md-12">
                              <p style="">
                                  Nombre
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="text" placeholder="Escribe tu nombre">
                          </div>
                          <div class="col-md-12">
                              <p style="">
                                  Correo
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="text" placeholder="correo@ejemplo.com">
                          </div>
                          <div class="col-md-12">
                              <p style="">
                                  Telefono
                              </p>
                              <input style="background: white; color: black; text-align: center;" type="number" placeholder="000 000 0000">
                          </div>
                          
                          <div class="col-md-12">
                              <center>
                                  <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                                  <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex buttonboxinvestment" value="Solicitar información" style="margin: 20px 0px; width: 100%" />
                              </center>
                          </div>
                      </form>                      
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



