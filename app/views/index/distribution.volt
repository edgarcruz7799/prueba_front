<script type="text/javascript">localStorage.clear();</script>
<!DOCTYPE html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>



  

    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="">
    <div id="mostrar" class="alert alert-danger" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      
    </div>

    
    
      <section id="mu-hero" class="mu-hero-logistics" style="background-image: url({{url('img/ImagenInternas06.jpg')}});">
          <div class="row div_transparent_distribution" style="">
              <div class="col-md-8 col-md-offset-2 div_distributionone">
                  <center>
                  <hr>
                  <img src="{{url('img/Assets_Distribución_rojo.png')}}">                  
                  <span>
                    <strong>DISTRIBUCIÓN</strong>
                  </span>
                  </center>
                  <p>
                    Despachamos su mercancía a cualquier territorio a nivel nacional a través de nuestro equipo tecnológico y humano garantizando la entrega oportuna y el seguimiento del proceso.
                  </p>
              </div>
          </div>
      </section>


      <section class="clearfix" id="mu-book-overview" style="background-color: #e5e5e5">
        
        <div class="row">
          <div class="col-md-6 col-md-offset-3 border_distribution">
              
            <ul>
              <li>Distribución urbana efectiva para la entrega final.</li>
              <li>Planeación oportuna de las rutas y otimización de los despachos para la entrega de mercancías.</li>
              <li>Flota exclusiva de vehículos de 2,4,5 y 10 toneladas para pedidos especiales.</li>
              <li>Seguimiento en las entregas y seguridad de la carga durante su trayecto.</li>
              <li>Operación monitoreada en tiempo real a través de nuestro software ALMALOGIX.</li>
              <li>Información en línea de entregas y novedades.</li>
              <li>Seguros con cobertura total a través de sus pólizas.</li>
              <li>Personal capacitado en el manejo y/o tratamiento seguro de la carga.</li>
            </ul>

          </div>
        </div>
        
    </section>

    <section id="mu-book-overview" class="mu-book-overview-support-section1" style="background-image: url({{url('img/ImagenPQRS.jpg')}});">
        <div class="container-fluid">

            <div class="center">
                <div class="mu-hero-left" style="float: none;" >
                    <center><h1 style="">CONTÁCTENOS</h1></center>
                </div>
            </div>

            <form action="{{ url('index/supportIndex') }}" method="post">
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
                    <center>
                      <textarea placeholder="<?php echo $t->_('FormArea') ?>" class="form-control textarea-support" name ="text" rows=8 cols=10></textarea>
                    </center>
                </section><br>


                <div align="center">
                    <input style="height: 40px; border-radius: 15px; background-color: #f71e14; border-color: #f71e14;" type="submit" name="" class="btn btn-primary btn-lg" value="<?php echo $t->_('SectionButton17') ?>"/>
                </div>
            </form>
            </div>
        </div>
    </section>

    
