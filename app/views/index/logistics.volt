<script type="text/javascript">localStorage.clear();</script>
<!DOCTYPE html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


  <center>
    <a href="https://api.whatsapp.com/send?phone=573176609849&text=Estoy%20interesado%20en%20sus%20servicios%20&source=&data=" target="_blank">
      <div class="col-md-3 col-md-offset-10 col-xs-12 whatsapp_investment" style="">
        <div class="pull-left">
          <img style="width: 65%; margin-top: 5px; margin-left: 24px;" src="{{url('img/whatsapp-logo.png')}}">
        </div>
        <div>
          <p style="margin-top: 3%;">
            Contacto Comercial
          </p>
        </div>
      </div>
    </a>
  </center>

    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="">
    <div id="mostrar" class="alert alert-danger" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      
    </div>

    
    
      <section id="mu-hero" class="mu-hero-logistics" style="background-image: url({{url('img/ImagenInternas01.jpg')}});">
          <div class="row div_transparent_logistics" style="">
              <div class="col-md-8 col-md-offset-2 div_logisticsone">
                  <center>
                  <hr>
                  <img src="{{url('img/Assets_Agro_rojo.png')}}">                  
                  <span>
                    <strong>LOGÍSTICA</strong> AGROINDUSTRIAL
                  </span>
                  </center>
                  <p>
                    Operamos con plantas de almacenamiento y tratamiento de granos en centros de acopio a nivel nacional, ofreciendo servicios de limpieza, secamiento y fumigación de producto.
                  </p>
              </div>
          </div>
      </section>


      <section class="clearfix" id="mu-book-overview" style="background-color: #e5e5e5">
        <!-- <div class="row">
          <div class="col-md-8 col-md-offset-2 div_logistics">
              
                <div class="col-md-3 border_logistics">
                  <center>
                    <img src="{{url('img/Assets_Ubicaciones.png')}}" style="width: 15%">
                    Montería
                  </center>
                </div>
                <div class="col-md-3 border_logistics">
                  <center>
                    <img src="{{url('img/Assets_Ubicaciones.png')}}" style="width: 15%">
                    Espinal
                  </center>
                </div>
                <div class="col-md-3 border_logistics">
                  <center>
                    <img src="{{url('img/Assets_Ubicaciones.png')}}" style="width: 15%">
                    Aguazul
                  </center>
                </div>
                <div class="col-md-3">
                  <center>
                    <img src="{{url('img/Assets_Ubicaciones.png')}}" style="width: 15%">
                    Bucaramanga
                  </center>
                </div>
          </div>
        </div> -->

        
        <div class="row">
          <div class="col-md-8 col-md-offset-2 border_logistics2">

            <center>
              <h3 style="color: red;">Laboratorio físico para el análisis de cereales.</h3>
            </center>

            <p>
              Almagrario ofrece el servicio de análisis físicos para cereales, el cual incluye ensayos de determinación de humedad, masa por hectolitro “Densidad de Masa”, nivel de infestación (NTC 745), factores de graduación, tificación e impurezas de granos. Adicionalmente, se ofrecen análisis químicos y microbiológicos exigidos para algunos tipos de cereales según la norma NTC.
            </p>
            
            <p>  
              Lo anterior, basado en las normas técnicas colombianas para distintos tipos de productos como maíz (NTC 366), cebada (NTC 442), soya (NTC 484), arroz con cascara-paddy (NTC 519), ajonjolí (NTC 536), sorgo (NTC602), trigo (NTC 604), arroz blanco (NTC 671), arveja (NTC 791), frijol (NTC871), garbanzo (NTC 923), lenteja (NTC 937), arroz descascarado-integral (NTC 1475), arroz partido (NTC 1719) y arroz precocido(NTC 1643). 
            </p>
            
            <h3 style="color: red;">Ventajas:</h3>

            <ul>
              <li>Equipos y laboratorios especializados.</li>
              <li>Participación en las cosechas de los productos agrícolas, mediante los mandatos de compra que recibe de los industriales y comerciantes.</li>
              <li>Sistemas de control de peso de productos agrícolas nacionales.</li>
            </ul>

            <h3 style="color: red;">Ubicación:</h3>

            <ul>
              <li>Aguazul.</li>
              <li>Bucaramanga.</li>
              <li>Buenaventura.</li>
              <li>Espinal.</li>
              <li>Montería.</li>
              <li>Santa Marta.</li>
            </ul>
          </div>
        </div>
        
    </section>


    <section id="mu-book-overview" class="mu-book-overview-support-section1" style="background-image: url({{url('img/ImagenPQRS.jpg')}});">
        <div class="container-fluid">

            <div class="center">
                <div class="mu-hero-left" style="float: none;" >
                    <hr>
                    <center><h1 style="">CONTÁCTANOS</h1></center>
                </div>
            </div>

            <form action="{{ url('index/withUs') }}" method="post" class="formEmail">
                <section class="form-group">
                    <div class="row form_pqrs">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control input-name-support" type="text" name="name_contact" title="Full Name" id="name_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormName17') ?>">
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">                            
                            <input class="form-control input-email-support" type="email" name="email_contact" title="Email" id="email_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormEmail17') ?>">                           
                        </div>

                        <!-- <div class="col-md-4 col-sm-4 col-xs-12">
                            <select  class="form-control select-support">
                              <option class="uno" value=""><?php echo $t->_("FormTypes17") ?></option>
                              <option class="dos" value="">Soporte</option>
                              <option class="uno" value="">Tecnico</option>
                              <option class="uno" value="">Pedidos</option>
                              <option class="uno" value="">Quejas</option>
                              <option class="uno" value="">Reclamos</option>
                              <option class="uno" value="">Solicitud</option>
                            </select>
                        </div> -->
                    </div>
                </section>
                <input type="hidden" value={{token}} name="CSRFtoken">
                <section class="form-group">
                    <center>
                      <textarea placeholder="<?php echo $t->_('FormArea') ?>" class="form-control textarea-support" name ="text" rows=8 cols=10></textarea>
                    </center>
                </section><br>


                <div align="center">
                    <input style="height: 40px; border-radius: 15px; background-color: #f71e14; border-color: #f71e14; color: #fff;" type="submit" name="" class="btn btn-primary btn-lg" value="<?php echo $t->_('SectionButton17') ?>"/>
                </div>
            </form>

            <div id="alertcontactanos" class="text-center" style="display:none;">
                <img src="{{ url('img/Logo_LogoAlmagrario.png') }}" alt="" class="logoform" style="margin-left: -2%">
                <h6 style="color: #000; font-weight: bold; font-size: 20px; margin: 0px;">
                    ¡MUCHAS GRACIAS POR CONTACTARNOS!
                </h6>
                <h6 class="txt" style="color: #000;">
                    En breve uno de nuestros asesores se contactará contigo
                </h6>
                <button id="closealert" type="button" class="btn btn-default botonform buttonclosealert" style="">Aceptar</button>
            </div>

            </div>
        </div>
    </section>

    <script>
        $('.formEmail').submit(function (event) {
          event.preventDefault();
          var that = $(this);
          var url = $('.formEmail').attr('action');
          $.ajax({
              method: "POST",
              url: url,
              data: new FormData(this),
              contentType: false,
              processData: false,
              success: function (response) {
                if (response) {
                  //$('#alertcontactanos').find('.txt').html(response);
                }
              }
          });
          $('#alertcontactanos').css('display','block');
        });
    
        $('#closealert').click(function () {          
          $('#alertcontactanos').css('display','none');
        });
    </script>

    
