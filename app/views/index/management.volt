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

    
    
      <section id="mu-hero" class="mu-hero-logistics" style="background-image: url({{url('img/GestionDocumental01.jpg')}});">
          <div class="row div_transparent_management" style="">
              <div class="col-md-8 col-md-offset-2 div_managementone">
                  <center>
                  <hr>
                  <img src="{{url('img/Assets_Documentos_rojo.png')}}">                  
                  <span>
                    <strong>GESTIÓN</strong> DOCUMENTAL
                  </span>
                  </center>
                  <p>
                    Renovacion tecnológica que permite garantizar una mejor operación, obteniendo trazabilidad en los procesos e información en tiempo real. Esta búsqueda de soluciones permite superar las expectativas que nuestros clientes tienen de nuestros servicios.
                    <br><br>
                    ALMAGRARIO a través de sus instalaciones físicas presta el servicio especializado de custodia, mantenimiento, almacenamiento de archivos, administración de inventarios con fácil acceso y disponibilidad. Orientado a suministrar espacios de almacenamiento con eficacia y  seguridad de la información, garantizando la conservación documental.
                    <br><br>
                    Servicio que permite la administración de flujo de documentos de una manera funcional y eficiente con los tres siguientes alcances principales:
                  </p>
                  <h3 style="color: red;">
                    ALCANCE:
                  </h3>
                  <ul class="list_quienessomos">
                    <li>Recogida.</li>
                    <br>
                    <li>Almacenamiento Cajas de Archivo.</li>
                    <br>
                    <li>Indexación.</li>
                    <br>
                    <li>Digitalización.</li>
                  </ul>
                  <h3 style="color: red;">
                    PODRÁS ALMACENAR:
                  </h3>
                  <ul class="list_quienessomos">
                    <li>Archivo inactivo.</li>
                    <br>
                    <li>Órdenes de compra.</li>
                    <br>
                    <li>Oficios.</li>
                    <br>
                    <li>Declaraciones.</li>
                    <br>
                    <li>Doc. de Importaciones y exportaciones.</li>
                    <br>
                    <li>Documentación Fiscal.</li>
                    <br>
                    <li>Papelería en General.</li>
                  </ul>
                  <h3 style="color: red;">
                    SERVICIOS ADICIONALES:
                  </h3>
                  <ul class="list_quienessomos">
                    <li>Inventarios de Archivos.</li>
                    <br>
                    <li>Administración de inventarios.</li>
                    <br>
                    <li>Gestión documental.</li>
                    <br>
                    <li>Consultoría.</li>
                    <br>
                    <li>Servicios de suministro profesional In House Documental.</li>
                    <br>
                    <li>Clasificación y Organización.</li>
                    <br>
                    <li>Digitalización.</li>
                    <br>
                    <li>Recogida y envió de Documentos.</li>
                  </ul>
              </div>
          </div>
      </section>


      <!-- <section class="clearfix" id="mu-book-overview" style="background-color: #e5e5e5">
        <div class="row">
          <div class="col-md-8 col-md-offset-2 div_management">
              
                <div class="col-md-4 border_logistics">
                  <center>
                    <img src="{{url('img/Assets_Documentos02.png')}}" style="">
                  </center>
                  <center>
                    Administración <br>documental
                  </center>
                </div>
                <div class="col-md-4 border_logistics">
                  <center>
                    <img src="{{url('img/Assets_Correspondencia.png')}}" style="">
                  </center>
                  <center>
                    Centros de <br>correspondencia
                  </center>
                </div>
                <div class="col-md-4">
                  <center>
                    <img src="{{url('img/Assets_Gestión.png')}}" style="">
                  </center>
                  <center>
                    Gestión de <br>procesos
                  </center>
                </div>                
              
        </div>
      </div>
        
    </section> -->

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

    
