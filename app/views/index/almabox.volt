<script type="text/javascript">localStorage.clear();</script>
<!DOCTYPE html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>



  

    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="">
    <div id="mostrar" class="alert alert-danger" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      
    </div>

    <section id="mu-hero" class="" style="background-image: url({{url('img/FotoContainer.jpg')}}); padding-top: 12% !important; padding-bottom: 100px;">
      <div class="container" >
          <div class="row" style="margin-top: -5px;">
              <div class="col-md-6 col-sm-6">
                  <div class="mu-hero-left" style="float: none;">
                      <hr class="hrstyle" style="">
                      <img src="{{url('img/Almabox.png')}}" alt="" style="max-width: 100%; width: 50%; margin: 0%;">
                      <p class="fonth3 fonth3_banner_almabox" style="">TU ALMACENAMIENTO PERSONALIZADO</p>
                  </div>                    
              </div>

              <div id="div_form" class="col-xs-12 col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2" style="">
                  <form id="formuno" action="{{ url('cellar/listCellar') }}" method="post" style="margin-top: -15px;">
                      <center>
                          <h3 style="">
                              <?php echo $t->_("boxindex") ?>
                          </h3>
                      </center>
                      <div class="col-md-12" style="">
                          <!-- <p style="">
                              <?php echo $t->_("boxindex1") ?>
                          </p> -->


                              
                        <div>
                          <select id="selectslider1" class="address form-control"  name="city" required>
                            {% if data is empty %}
                              <!-- No se encontraron direcciones -->
                            {% else %}
                            
                              {% for item in data %}
                                {% if item.departament is 'BOGOTÁ' %}
                                  <option value="{{item.id_departament}}"> {{item.departament}} </option>
                                {% endif %}
                              {% endfor %}
                            {% endif %}                             

                            {% if dat is empty %}
                              <!-- No se encontraron direcciones -->
                            {% else %}
                            
                              {% for item in dat %}
                                {% if item.departament is 'BOGOTÁ' %}
                                  {% if item.cellar_type is 'Almacenamiento Personalizado' %}
                                    <option value="{{item.id}}">{{item.departament}} {{item.name}}</option>
                                  {% endif %}
                                {% endif %}
                              {% endfor %}
                            {% endif %}  
                          </select>
                          </div>
                      </div>
                      <div class="col-md-6">
                          <p style="">
                              <?php echo $t->_("boxindex2") ?>
                          </p>
                          <input style="background: white; color: black;" type="date" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="<?php $hoy=date('Y-m-d'); echo $hoy;?>" id="datepicker" name="initial_date">
                      </div>
                      <div class="col-md-6">
                          <p style="">
                              <?php echo $t->_("boxindex3") ?>
                          </p>
                          <input style="background: white; color: black;" type="date" value="<?php $hoy=date('Y-m-d'); echo $hoy;?>" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" id="datepicker1" name="final_date">
                      </div>
                      <p class="alert" style="color:red; margin-left:20px;"></p>
                      <!-- <p style="">
                          <?php echo $t->_("boxindex4") ?>
                      </p> -->
                      <div class="col-md-12">
                          <table style="margin-top: 15px;">
                              <tr>
                                  <td>
                                    <input class="form-check-input inputradiouno" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" style="width: 30px" checked>
                                  </td>
                                  <td>
                                    <label style="font-size: 12px; margin-left: 10px; color: black;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label>
                                  </td>
                                  <td>
                                    <div class="col-md-12 div_flex">
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="0.96" style="width: 20px; margin: 0;" checked>0.96m<sup>3</sup>
                                      </div>
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="4.8" style="width: 20px; margin: 0;">4.8m<sup>3</sup>
                                      </div>
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="19" style="width: 20px; margin: 0;">19m<sup>3</sup>
                                      </div>
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="38.1" style="width: 20px; margin: 0;">38.1m<sup>3</sup>
                                      </div>
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="76.7" style="width: 20px; margin: 0;">76.7m<sup>3</sup>
                                      </div>
                                      <div class="col-md-2" style="color: red; display: flex; align-items: center;">
                                        <input type="radio" name="deposit_capacity" value="153" style="width: 20px; margin: 0;">153m<sup>3</sup>
                                      </div>
                                    </div>
                                    <!-- <div id="etiquetaalmabox1" class="col-xs-2 col-xs-offset-7 col-md-2 col-md-offset-7" style="color: #f71e14; ">
                                      <span id="temp1">0</span>
                                    </div>
                                    <div class="col-xs-1 col-md-1" style="color: #f71e14; margin-left: 10px;">m<sup>3</sup></div>
                                    <input class="inputrange" style="" id="inputalmabox1" name="deposit_capacity"  type="range" min="0.96" step="0.01" value="0" max="153.4"  autocomplete="off" > -->
                                  </td>

                              </tr>                              
                          </table>

                          <input type="hidden" name="measure" value="cubico">
                          <input type="hidden" name="category" value="almabox">

                      </div>
                      <div class="col-md-12">
                          <center style="">
                              <input type="submit" name="" id="enviar" readonly class="btn btn-primary btn-lg buttonboxindex" value="<?php echo $t->_('boxindex7') ?>" style="" />
                          </center>
                      </div>
                  </form>
              </div>
            </div>


            <div class='row'>
              <div class='col-md-10 boxpublicidad' style="">                      
                <div class="carousel slide media-carousel banner_almabox" id="media" style="">
                  <div class="row">
                    <div class="image-text_pallets">
                      <p>
                        ¡Aprovecha y solicita el servicio ya!. Los 3 primeros meses tienen el 10% de descuento
                        <br class="br_repso">
                        <span>
                          *Oferta válida para los servicios de mínimo 12 meses de almacenamiento
                        </span>
                      </p>
                      <img src="{{url('img/Assets_Pallets.png')}}">
                    </div>
                    <div class="button_decubre_mas">
                        <a href="#" class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton1") ?></a>
                    </div>     
                  </div>
                </div>
              </div>
            </div>

      </div>
  </section>
  
    <section id="mu-hero" class="mu-hero-almabox" style="background-image: url({{url('img/FOTOALMABOXiniciodepaginaabajo.jpeg')}});">
        <div class="col-md-6">
          <hr>
          <h1 class="h1_almabox">
            OBTÉN TU UNIDAD
          </h1>
          <h1 class="h1dos_almabox">
            DE ALMACENAMIENTO
          </h1>
          <h2 class="h2_almabox">
            por el tiempo que necesites
          </h2>
          <!-- <p>
            Reserva un espacio por días, semanas, meses o el tiempo que quieras. Almabox es una unidad de almacenamiento personalizada donde podrá guardar desde un pallet estándar, totalmente independiente en espacios flexibles.
          </p>
          
          <p>
            Disfruta de un servicio dirigido especialmente para microempresas, pymes, distribuidoras, comerciantes y emprendedores.
          </p> -->

          <p>
            Ahora en Almagrario puedes obtener y reservar  tu unidad de Almacenamiento (Almabox) por días, semanas, meses o el tiempo que necesites. <br> ALMABOX, es una unidad de almacenamiento personalizada a su medida, donde se podra almacenar desde un pallet standard, totalmente independientes en espacios flexibles.
          </p>
            
          <p>
            Es un servicio dirigido a microempresas, pymes, distribuidoras, comerciantes y emprendedores. Servicios Adicionales bajo demanda.
          </p>

          <!-- <p>
            Contacto. <br> Correo: <span style="color: blue"> almabox@almagrario.com</span>  <br> Número de Contacto:<span style="color: blue"> 3202963656</span>
          </p> -->

        </div>
    </section>


    <section class="clearfix section_almabox" id="mu-book-overview" style="background-color: #fff">
      <center>
        <hr>
        <h1 class="h1tres_almabox">
          ESPACIOS
        </h1>
        <p>
          Contamos con contenedores de 20 y 40 pies disponibles con amplias capacidades de almacenamiento.
        </p>
        <h6 style="font-weight: bold;">
          VENTAJAS
        </h6>
      </center>
      <div class="col-md-12 box_almabox box_almabox_uno">
        <div class="col-xs-12 col-md-3 col-md-offset-1">
          <center>
            <div>
              <img src="{{url('img/Assets_Reloj.png')}}">
            </div>
            <div class="div_almabox_text">
              Flexibilidad en el tiempo <br>de contratación.
            </div>
          </center>
        </div>

        <div class="col-xs-12 col-md-3 box_medio">
          <center>
            <div>
              <img src="{{url('img/Assets_Sello.png')}}">
            </div>
            <div class="div_almabox_text">
              Único administrador o contacto <br>de cadena de suministro
            </div>
          </center>
        </div>

        <div class="col-xs-12 col-md-3">
          <center>
            <div>
              <img src="{{url('img/Assets_Llaves.png')}}">
            </div>
            <div class="div_almabox_text">
              Manejo de tus llaves <br>o precinto de apertura
            </div>
          </center>
        </div>
      </div>

      <div class="col-md-12 box_almabox">
        <div class="col-md-3 col-md-offset-1 col-xs-12">
          <center>
            <div class="div_almabox_img">
              <img src="{{url('img/Assets_Certificaciòn.png')}}">
            </div>
            Trazabilidad total de la cadena <br>bajo un operador experimentado
          </center>
        </div>

        <div class="col-xs-12 col-md-3 box_medio">
          <center>
            <div class="div_almabox_img">
              <img src="{{url('img/Assets_Documentoç.png')}}">
            </div>
            Servicios de demanda como picking, <br>packing y cross docking
          </center>
        </div>

        <div class="col-xs-12 col-md-3">
          <center>
            <div class="div_almabox_img">
              <img src="{{url('img/Assets_Validaciòn.png')}}">
            </div>
            Seguro todo riesgo.<br>
          </center>
        </div>
      </div>
    </section>

    <section id="mu-hero" class="mu-hero-almabox_dos" style="">
        <div class="col-md-5">
          <hr>
          <h1 class="h1tres_almabox">
            NUESTRAS UNIDADES ALMABOX
          </h1>
          <h1 class="h1cuatro_almabox">
            DE ALMACENAMIENTO
          </h1>
          <h2 class="h2dos_almabox">
            permiten una gran versatilidad de espacios
          </h2>          
        </div>

        <div class="col-md-3 div_almabox">
          <ul>
            <li>
              Mini bodegas personales
            </li>
            <li>
              Menajes
            </li>
            <li>
              E-fulfillment
            </li>
            <li>
              E-commerce
            </li>
            <li>
              Almacen de archivo inactivo
            </li>
          </ul>
        </div>

        <div class="col-md-4 div_almabox">
          <ul>
            <li>
              Control web de candado aperturas y cierres
            </li>
            <li>
              Transporte de carga recogida y despachos
            </li>
            <li>
              Inventarios y clasificación
            </li>
            <li>
              Sistema de información en línea y tiempo real
            </li>
            <li>
              Material POP
            </li>
          </ul>
        </div>

        <div class="col-md-12" style="border-top: 1px solid; text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            
          </div>
          <div class="col-md-2">
            
          </div>
          <div class="col-md-2" style="color: red;">
            20 pies
          </div>
          <div class="col-md-2" style="color: red;">
            40 pies
          </div>
          <div class="col-md-2" style="color: red;">
            40 pies HC
          </div>
        </div>

        <div class="col-md-12" style="background-color: #f9f9f9; text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Largo
          </div>
          <div class="col-md-2" style="color: red;">
            Interior <br>Exterior
          </div>
          <div class="col-md-2">
            5,9 m <br>6,0 m
          </div>
          <div class="col-md-2">
            12 m <br>12,2 m
          </div>
          <div class="col-md-2">
            12 m <br>12,2 m
          </div>
        </div>

        <div class="col-md-12" style="text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Ancho
          </div>
          <div class="col-md-2" style="color: red;">
            Interior <br>Exterior
          </div>
          <div class="col-md-2">
            2,34 m <br>2,40m
          </div>
          <div class="col-md-2">
            2,34 m <br>2,40m
          </div>
          <div class="col-md-2">
            2,34 m <br>2,40m
          </div>
        </div>

        <div class="col-md-12" style="background-color: #f9f9f9; text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Altura
          </div>
          <div class="col-md-2" style="color: red;">
            Interior <br>Exterior
          </div>
          <div class="col-md-2">
            2,4m <br>2,5m
          </div>
          <div class="col-md-2">
            2,4m <br>2,5m
          </div>
          <div class="col-md-2">
            2,71m <br>2,89m
          </div>
        </div>

        <div class="col-md-12" style="text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Tara
          </div>
          <div class="col-md-2">
            
          </div>
          <div class="col-md-2">
            2300 kg
          </div>
          <div class="col-md-2">
            3500 kg
          </div>
          <div class="col-md-2">
            3500 kg
          </div>
        </div>

        <div class="col-md-12" style="background-color: #f9f9f9; text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Carga almacenaje
          </div>
          <div class="col-md-2">
            
          </div>
          <div class="col-md-2">
            26.000kg
          </div>
          <div class="col-md-2">
            34.000kg
          </div>
          <div class="col-md-2">
            36.000kg
          </div>
        </div>

        <div class="col-md-12" style="text-align: center;">
          <div class="col-md-2 col-md-offset-1">
            Capacidad
          </div>
          <div class="col-md-2">
            
          </div>
          <div class="col-md-2">
            33,3 m3
          </div>
          <div class="col-md-2">
            36,77 m3
          </div>
          <div class="col-md-2">
            37,65 m3
          </div>
        </div>

        <div class="col-md-12" style="text-align: center;">
          <img src="{{url('img/almaboximg1.png')}}">
        </div>

        <div class="col-md-12" style="text-align: center;">
          <img src="{{url('img/almaboximg2.png')}}">
        </div>

        <div class="col-md-12" style="text-align: center;">
          <img src="{{url('img/almaboximg3.png')}}">
        </div>

    </section>

    <section id="mu-hero" class="mu-hero-almabox_tres" style="">
        <center>
          <hr>
          <h1>
            TAMAÑOS UNIDADES ALMACENAMIENTO
          </h1>
        </center>
        
        <div class="col-md-12" style="background-color: #f9f9f9">
          <div class="col-md-2 col-md-offset-2" style="text-align: center">
            <img src="{{url('img/Assets_Tamaño01.png')}}">
          </div>
          <div class="col-md-3" style="text-align: center; font-weight: bold; padding: 20px 0px;">
            ALMABOX <br>MINI
          </div>
          <div class="col-md-3" style="padding: 20px 0px;">
            Almacenamiento desde un pallet 1,5 m3 hasta 15 m3 espacios totalmente cerrados.
          </div>
        </div>

        <div class="col-md-12">
          <div class="col-md-2 col-md-offset-2" style="text-align: center">
            <img src="{{url('img/Assets_Tamaño02.png')}}">
          </div>
          <div class="col-md-3" style="text-align: center; font-weight: bold; padding: 20px 0px;">
            ALMABOX <br>MEDIO
          </div>
          <div class="col-md-3" style="padding: 20px 0px;">
            Almacenamiento desde un pallet 15,5 m3 hasta 45 m3 espacios totalmente cerrados.
          </div>
        </div>

        <div class="col-md-12" style="background-color: #f9f9f9">
          <div class="col-md-2 col-md-offset-2" style="text-align: center">
            <img src="{{url('img/Assets_Tamaño03.png')}}">
          </div>
          <div class="col-md-3" style="text-align: center; font-weight: bold; padding: 20px 0px;">
            ALMABOX <br>GRANDE
          </div>
          <div class="col-md-3" style="padding: 20px 0px;">
            Almacenamiento desde un pallet 50 m3 hasta 150 m3 espacios totalmente cerrados.
          </div>
        </div>
    </section>

    <section id="mu-hero" class="mu-hero-almabox_cuatro" style="">
      <div class="col-md-12 div_section_almabox_cuatro">
            
        <h3 style="color: red;">Versatilidad de espacios:</h3>
        
        <ul>
          <li>Almacén de Archivo Inactivo.</li>
          <li>Inventarios y clasificación.</li>
          <li>Menajes.</li>
          <li>Mini Bodegas Personales.</li>
        </ul>

        <h3 style="color: red;">Ventajas:</h3>
        
        <ul>
          <li>Control Web de Candado aperturas y cierres.</li>
          <li>E-fullfilment.</li>
          <li>E-commerce.</li>
          <li>Flexibilidad en el tiempo de contratación.</li>
          <li>Manejo de tus llaves o precinto  de apertura.</li>
          <li>Seguro todo riesgo.</li>
          <li>Servicios por Demanda, como Gestión de Inventario, Picking, Packing, Cross Docking.</li>
          <li>Sistema de Información en Línea y Tiempo Real. </li>
          <li>Transporte de carga recogida y despachos.</li>
          <li>Trazabilidad total de la cadena bajo un operador experimentado.</li>
          <li>Único administrador o contacto de cadena de suministro.</li>
        </ul>

      </div>      

      <!-- <p>
        Contacto. <br> Correo: <span style="color: blue"> almabox@almagrario.com</span>  <br> Número de Contacto:<span style="color: blue"> 3202963656</span>
      </p> -->

      <p>
        <a href="{{url('img/CONDICIONES COMERIALES ALMABOX.pdf')}}" target="_blank" style="color: blue;">
          Condiciones comerciales.pdf
        </a>
      </p>
    </section>

    <section id="mu-book-overview" class="mu-book-overview-support-section1" style="background-image: url({{url('img/ImagenPQRS.jpg')}});">
        <div class="container-fluid">

            <div class="center">
                <div class="mu-hero-left" style="float: none;" >
                    <hr>
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
                    <center>
                      <textarea placeholder="<?php echo $t->_('FormArea') ?>" class="form-control textarea-support" name ="text" rows=8 cols=10></textarea>
                    </center>
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

    <script type="text/javascript">
  
      $('#enviar').click(function(){
        var fecha = document.getElementById('datepicker').value;
        var fecha_final = document.getElementById('datepicker1').value
        if(fecha_final < fecha){
          $('b').remove();
          $('.alert').append('<b>Fecha final debe ser mayor o igual a fecha inicial</b>');
          $("#formuno").submit(function() {
            return false;
          });
        }else{
          this.form.submit();
        } 
      });
    
      $('#enviardos').click(function(){
        var fecha = document.getElementById('datepickerdos').value;
        var fecha_final = document.getElementById('datepicker1dos').value
        if(fecha_final < fecha){
          $('b').remove();
          $('.alertdos').append('<b>Fecha final debe ser mayor o igual a fecha inicial</b>');
          $("#formdos").submit(function() {
            return false;
          });
        }else{
          this.form.submit();
        } 
      });
    
      $('#enviartres').click(function(){
        var fecha = document.getElementById('datepickertres').value;
        var fecha_final = document.getElementById('datepicker1tres').value
        if(fecha_final < fecha){
          $('b').remove();
          $('.alerttres').append('<b>Fecha final debe ser mayor o igual a fecha inicial</b>');
          $("#formtres").submit(function() {
            return false;
          });
        }else{
          this.form.submit();
        } 
      });
       
    
    </script>    
    
    <script type="text/javascript">
        {% if msg is empty %}
    
        {% else %}
            document.getElementById("mostrar").style.display="block";
        {% endif %}
    </script>
    
    <script type="text/javascript">
        var elInput1 = document.querySelector('#inputalmabox1');
        
        if (elInput1) {
          var etiqueta1 = document.querySelector('#etiquetaalmabox1');
          if (etiqueta1) {
            etiqueta1.innerHTML = elInput1.value;
    
            elInput1.addEventListener('input', function() {
              etiqueta1.innerHTML = elInput1.value;
            }, false);
          }
        }
    </script>

<script type="text/javascript">
  
  function min(id){
    var mini = new Array();
    if (id == 2){
      mini ['min_bodega'] = 0.96;
      mini ['max_bodega'] = 153.4;
    }
    if (id == 56){
      mini ['min_bodega'] = 0.96;
      mini ['max_bodega'] = 4.8;
    }
    if (id == 60){
      mini ['min_bodega'] = 76.7;
      mini ['max_bodega'] = 153.4;
    }
    if (id == 55){
      mini ['min_bodega'] = 0.96;
      mini ['max_bodega'] = 0.96;
    }
    if (id == 57){
      mini ['min_bodega'] = 4.8;
      mini ['max_bodega'] = 19;
    }
    if (id == 59){
      mini ['min_bodega'] = 38.1;
      mini ['max_bodega'] = 76.7;
    }
    if (id == 58){
      mini ['min_bodega'] = 19;
      mini ['max_bodega'] = 38.1;
    }
    

    return (mini)
  };

  function contador1(){
    var select1 = $('select[id=selectslider1]').val();
    var medidas1 = min(select1);
    $('#inputalmabox1').attr('min', medidas1['min_bodega']);
    $('#inputalmabox1').attr('max', medidas1['max_bodega']);
  };  
  
  setInterval('contador1()',1000);

</script>

    
