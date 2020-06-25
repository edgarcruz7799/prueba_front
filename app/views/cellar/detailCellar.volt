<!DOCTYPE html>
<html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<style type="text/css">
    /*body {
        font-family: : poppins;
    }
    .servicios{
    border: 1px;
    display: inline-block;
    width: auto;
    margin: 0 20px;
    text-align: justify;
}
@media (max-width: 1210px){
    .titi{
        margin-top: -4%;
    }
    .titi2{
        margin-top: -4%;
    }
    .cit {
        margin-top: -1%;
    }
    .formu {
        margin-top: -12%;
    }
    .detail {
        margin-top: -6.5%;
    }
}*/

</style>



    {% if dato is empty %}
    <!-- No se encontraron direcciones -->
    {% else %} {% for item in dato %}
    <body >
    <section id="mu-hero" class="mu-hero-maps" style="background-image: url('{{url('')}}{{item.image_map}}'); ">
        <div class="container">
            <div class="row">
                <div class="col-md-6 titi">
                    <div class="col-md-12">
                        <h1 class="h1_titidos" style="visibility: hidden" class="cit">{{item.name}}</h1>
                        <h1 class="h1_titi" style="">{{item.name}}</h1>
                        <h1 class="h1_titidos" style="" class="cit">{{item.city}}</h1>
                        <hr class="hr_titi" style="">
                    </div>
                    <div class="col-md-6 titi2" style="visibility: hidden;">
                        <h5 style="color: #8A0808;">Almacenamiento</h5>
                        <h1 style="">${{item.storage_cost}}</h1>
                        <p style="">por metro cuadrado <br> o cubico por semana</p>
                    </div>
                    <div class="col-md-5 titi2" style="visibility: hidden;">
                        <h5 style="color: #8A0808; ">Manejo</h5>
                        <h1 style="">${{item.handling_cost}}</h1>
                        <p style="">por movimiento <br> interno o externo</p>
                    </div>
                </div>
            </div>
    </section>
            <div class="row">
                <div id="box_fixed" class="col-md-4 col-md-offset-1 formu" style="">
                    <form action="{{ url('quotation/quotationCellar') }}" method="post">
                        <input type="hidden" name="id" value="{{item.id}} ">
                        <center>
                            <p style="">Tu reserva</p>
                        </center>

                        <div class="col-md-6">
                            <p style="text-align: center;">
                                <?php echo $t->_("boxindex2") ?>
                            </p>
                            <input type="date" id="datepicker_1" required min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{item.initial_date}}" required  name="initial_date">
                        </div>
                        <div class="col-md-6">
                            <p style="text-align: center;">
                                <?php echo $t->_("boxindex3") ?>
                            </p>
                            <input type="date" id="datepicker_2" required min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{item.final_date}}"  required name="final_date">
                        </div>
                        <p class="espace_req_detailcellar" style="">
                            <?php echo $t->_("boxindex4") ?>
                        </p>
                        <div class="col-md-12">
                            <table>
                                {% if item.type_area is 'Metros cubicos' %}
                                    <tr>
                                        <td><input class="inputradiouno" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" style="width: 30px" checked></td>
                                        <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                                        <td><div id="etiqueta1" class="col-md-2 col-md-offset-2" style="color: #f71e14;"><span id="temp1">0</span></div>
                                        <div class="col-md-1" style="color: #f71e14;">m<sup>3</sup></div>
                                        <input class="inputrange" style="" id="input1" name="deposit_capacity" type="hidden" step="0.01" value="{{item.space_require}}" min="0.96" max="{{item.deposit_capacity}}" autocomplete="off"></td>
    
                                    </tr>
                                {% elseif item.type_area is 'Metros cuadrados' %}
                                    <tr>
                                        <td><input class="inputradiodos" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                                        <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheckm">Area <br>cuadrada</label></td>
                                        <td><div id="etiqueta2" class="col-md-2 col-md-offset-8" style="color: #f71e14;"><span id="temp2">0</span></div>
                                        <div class="col-md-1" style="color: #f71e14;">m<sup>2</sup></div>
                                        <input class="inputrange" style="" id="input2" name="deposit_capacity" type="range" step="1" value="{{item.space_require}}" min="10" max="{{item.deposit_capacity}}" autocomplete="off"></td>
                                    </tr>
                                {% else %}
                                    <tr>
                                        <td><input class="inputradiotres" type="radio" name="box" value="<?php echo $t->_('boxindex10') ?>" id="defaultChecke" style="width: 30px" checked> </td>
                                        <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultChecke">Posición <br>estiba</label></td>
                                        <td><div id="etiqueta3" class="col-md-2 col-md-offset-8" style="color: #f71e14;"><span id="temp3">0</span></div>
                                        <div class="col-md-1" style="color: #f71e14;"></div>
                                        <input class="inputrange" style="" id="input3" name="deposit_capacity" type="range" step="1" value="{{item.space_require}}" min="1" max="{{item.deposit_capacity}}" autocomplete="off"></td>
                                    </tr>
                                {% endif %}
                       
                            </table>
                            <div class="col-md-12" >
                                <p class="p_detailCellar" style="">Servicios adicionales</p>
                                <p class="p_detailCellar1" id="no" style="">No has seleccionado ningun servicio</p>
                            </div>

                            <table class="table" style="display: none;">
                                <tr>
                                    <td> # </td>
                                    <td>Servicio</td>
                                </tr>

                                <tbody id="table-content">

                                                                                         
                                </tbody>
                            </table>        
                        </div>
                        <div class="col-md-12">
                            <center>
                                <hr style="width: 100%; margin-top: 20px;" />
                                <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                                <input id="button_boxfloat" type="submit" name="" class="btn btn-primary btn-lg buttonboxindex" value="<?php echo $t->_('boxindex10') ?>" style="" />
                            </center>
                        </div>
                    </form>
                </div>

                <div class="col-md-5 col-md-offset-6 detail" style="">
                    <div class="col-md-6 box_detaildetailcellar" style="text-align: right;">
                        <hr style="width: 30%; margin-left: 70%; border-top: 7px solid #f71e14; border-radius: 20px;  margin-top: 15px; -webkit-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); -moz-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75);">
                        <h1 style="">
                            <b>
                                {{ item.minimum_area }}

                                {% if item.type_area == 'Metros cubicos' %}
                                    m<sup>3</sup>
                                {% elseif item.type_area == 'Metros cuadrados' %}
                                    m<sup>2</sup>
                                {% else %}
                                {% endif %}
                            </b>
                        </h1>
                        <p class="p_time_reservation" style=""><b>Reservación minima</b></p>
                    </div>
                    <div class="line_detailcellar" style="border-left: 1px solid silver; height: 100px; position: absolute; left: 50%; margin-top: 25px;"></div>
                    <div class="col-md-6 box_detaildetailcellar">
                        <hr style="width: 30%; border-top: 7px solid #f71e14; border-radius: 20px; margin: 0; margin-top: 15px; -webkit-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); -moz-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75);">
                        <h1 style=""><b>{{ item.minimum_time }}</b></h1>
                        <p style="width: 300px; color: #f71e14;"><b>Tiempo minimo</b></p>
                    </div>
                </div>
                <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
                    <h1 class="" style="color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_Servicios.png')}}">Servicios
                    </h1>
                    <p class="" style="">Haz clic para agregar los servicios que desees a tu reserva</p><br><br>
                </div>

                <div class="col-md-2 col-md-offset-5 services_detailcellar" style="">
                    
                        <p style="">Rotación de Existencias</p>
                        <div>
                            <input class="form-check-input" type="checkbox" value="1" name="servicio" id="defaultCheck1" style="">                        
                            <label style="" class="form-check-label">Diario</label>
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="2"  name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Cada dos días</label>     
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="3" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Cada tres días</label>      
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="4" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Semanal</label>     
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="5" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Personalizado</label>  
                        </div>
                                        
                </div>

                <div class="col-md-2 services_detailcellar" style="">
                    
                            <p style="">Perseveración de productos</p>
                        <div>
                            <input class="form-check-input" type="checkbox" value="6" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Alimentos perecederos</label>
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="7" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Refrigeración</label>      
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="8" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Congelación</label>      
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="9" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Al aire libre</label>      
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="10" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Espacio cerrado</label>     
                        </div>            
                </div>

                <div class="col-md-2 services_detailcellar" style="">
                    
                            <p style="">Tratamiento especial</p>
                        <div>
                            <input class="form-check-input" type="checkbox" value="11" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Productos químicos</label>
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="12" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Liquidos inflamables</label>     
                        </div>
                        <div>
                            <input class="form-check-input" type="checkbox" value="13" name="servicio" id="defaultCheck1" style="">
                            <label style="" class="form-check-label" >Carga delicada</label>     
                        </div>                  
                </div>
                <div class="col-md-4 col-md-offset-6 supervisor_detailcellar"><br><br>
                    <!-- <img style="float:left; " src="{{url('img/Assets_Foto.png')}}" class="img-circle" width="150"  height="150"> -->
                    <!-- <p style="color: #f71e14;"><b>Supervisor</b></p> -->
                    <p style="color: #f71e14;">Gerente Sucursal</p>
                    <p style="">{{item.name_contact}}</p>
                    <p style="">{{item.email_contact}}</p>
                    <p style="">{{item.phone_contact}}</p>                    
                </div>

            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_bodegas_detailcellar" style="">
                    <img src="{{ item.image }}" style="padding: 1%;" height="400" width="1000">
                </div>
                <div class="col-md-2 col-md-offset-5 imgdos_bodegas_detailcellar" style="">
                    <img src="{{ item.imagedos }}" style="padding: 1%;" height="200" width="400">
                </div>
                <div class="col-md-2 imgtres_bodegas_detailcellar" style="">
                    <img src="{{ item.imagetres }}" style="padding: 1%;" height="200" width="400">
                </div>
                <div class="col-md-2 imgcuatro_bodegas_detailcellar" style="">
                    <img src="{{ item.imagecuatro }}" style="padding: 1%;" height="200" width="400">
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
                    <h1 class="" style=" color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_Facilidades.png')}}">FACILIDADES DEPÓSITO
                    </h1>
                </div>
                <div class="col-md-4 col-md-offset-5">
                    <!-- <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style="color: #f71e14; margin: 0px;">Acreditaciones <br>y menbresías</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">Federación de alimentos <br> organicos</p>
                        </div>
                    </div> -->
                    <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style=" color: #f71e14; margin: 0px;">Capacidades de <br>almacenamiento</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">Liquido a granel</li>
                            <li style="">Polvos a granel</li>
                            <li style="">Al aire libre</li><br>
                        </div>
                    </div>
                    <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style=" color: #f71e14; margin: 0px;">Equipos</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">Contrapeso</li>
                            <li style="">Grúa</li>
                            <li style="">Remolque</li>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 facilidades_detailcellar" style="margin-bottom: 15px;padding-left: 0px;padding-right: 0px;margin-left: -6vw;">
                    <div class="col-md-5">
                        <h6 style=" color: #f71e14; margin: 0px;">Seguridad</h6>
                    </div>
                    <div class="col-md-7" style="border-left: 1px solid">
                        <li style="">Controles de seguridad de acuerdo a los estándares BASC V5-2017</li>
                        <li style="">Politicas OEA</li>
                        <li style="">Disponibilidad de herramientas tecnológicas en seguridad</li>
                        <li style="">Instalaciones con barreras perimetrales seguras</li>
                        <li style="">24/7</li><br>
                    </div>
                </div>                
                <hr class="hr_line_detailcellar" style="width: 50%; border-color: #807b7b; margin-left: 44%; margin-top: 23%;">
            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
                    <h1 class="" style=" color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_horarios.png')}}">HORARIO DE RECEPCIÓN DE MERCANCIA
                    </h1>
                </div>
                <div class="col-md-7 col-md-offset-5">
                    <div class="col-md-12 horario_detailcellar">
                        <div class="col-xs-6 col-md-9">
                            <P>Entre semana</P>
                            <p>Sábado</p>
                            <p>Domingo</p>
                            <p>Festivos</p>
                        </div>
                        <div class="col-xs-6 col-md-3">
                            <p>{{item.weekday_opening}} - {{item.weekday_closing}}</p>
                            <p>{{item.saturday_opening}} - {{item.saturday_closing}}</p>
                            <p>{{item.sunday_opening}}</p>
                            <p>{{item.festive_opening}}</p>
                        </div>
                    </div>
                </div>
                <hr class="hr_line_detailcellar" style="width: 50%; border-color: #807b7b; margin-left: 44%; margin-top: 16%;">
            </div>

            {% if distance is empty %}
            <!-- No se encontraron direcciones -->
            {% else %} 
            <div class="row">
                <div class="col-md-7 col-md-offset-5">
                    <h1 class="" style=" color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_Ubicaciones.png')}}">UBICACIONES CERCANAS
                    </h1>
                </div>
                <div class="col-md-7 col-md-offset-5">
                    <div class="col-md-12" style="margin-bottom: 50px;">
                        <div class="col-md-4">
                            
                            <p style=" color: #f71e14;">Ubicación</p>
                            {% for dis in distance %}
                            <p>{{dis.point_location}}</p>
                            {% endfor %} 
                            {% endif %}
                        </div>
                        <div class="col-md-4">
                            {% if distance is empty %}
                            <!-- No se encontraron direcciones -->
                            {% else %}
                            <P style="color: #f71e14;">Distancia</P>
                            {% for dis in distance %}
                            <p>{{dis.distance_point}}</p>
                            {% endfor %} 
                            {% endif %}                 
                        </div>
                        <div class="col-md-4">
                            {% if distance is empty %}
                            <!-- No se encontraron direcciones -->
                            {% else %}
                            <p style=" color: #f71e14;">Tiempo trayecto</p>
                            {% for dis in distance %}
                            <p>{{dis.time_travel}}</p>
                            {% endfor %} 
                            {% endif %}                
                        </div>
                    </div>
                </div>
            </div>

        </div>
</body>
    {% endfor %} 
    {% endif %}



</html>
<!-- <script>
    addEventListener('load', inicio, false);

    function inicio() {
        document.getElementById('temperatura').addEventListener('change', cambioTemperatura, false);
    }

    function cambioTemperatura() {
        document.getElementById('temp').innerHTML = document.getElementById('temperatura').value;
    }
</script> -->

<script
    src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous">
                  
</script>

<!-- <script type="text/javascript">
    var slider = document.getElementById("deposit_capacity");
    var output = document.getElementById("temp");
    output.innerHTML = slider.value;

    slider.oninput = function() {
        output.innerHTML = this.value;
} -->

</script>

<script type="text/javascript">
    (function($){
            
        index = 1;
        $btnAdd = $("input[name=servicio]");
        $table = $("#table-content");

        $btnRemove = $(".button-remove");

        $btnAdd.on("click", function(){

        });

        var altura = $('#box_fixed').height();
 
        $(".form-check-input").click(function(){
              $("#box_fixed").animate({scrollTop:altura+"px"});
        });

        $(".form-check-input").on( 'change', function() {
            if( $(this).is(':checked') ) {
                //alert("El checkbox con valor " + $(this).val() + " ha sido seleccionado");
                var servicio = $(this).val();
                if (servicio == 1)
                {
                    var servicioname = "Diario";
                } if (servicio == 2)
                {
                    var servicioname = "Cada dos días";
                } if (servicio == 3)
                {
                    var servicioname = "Cada tres días";
                } if (servicio == 4)
                {
                    var servicioname = "Semanal";
                } if (servicio == 5)
                {
                    var servicioname = "Personalizado";
                } if (servicio == 6)
                {
                    var servicioname = "Alimentos perecederos";
                } if (servicio == 7)
                {
                    var servicioname = "Refrigeración";
                } if (servicio == 8)
                {
                    var servicioname = "Congelación";
                } if (servicio == 9)
                {
                    var servicioname = "Al aire libre";
                } if (servicio == 10)
                {
                    var servicioname = "Espacio cerrado";
                } if (servicio == 11)
                {
                    var servicioname = "Productos químicos";
                } if (servicio == 12)
                {
                    var servicioname = "Liquidos inflamables";
                } if (servicio == 13)
                {
                    var servicioname = "Carga delicada";
                }                

                var tpl =   '<tr id="index'+servicio+'"><td><p style="margin-right: 20px; ">'+index+'</p></td>'+
                            '<td>'+
                                '<p style="margin-right: 20px;">'+servicioname+'</p><input readonly  type="hidden" class="form-control" name="service[]" id="service" value="'+servicio+'">'+
                            '</td>'+
                             '<td>'+                                
                            '</td></tr>';
                $table.append(tpl);

                $(".table").show();
                $("#no").hide();
                index++;
            } else {
                //alert("El checkbox con valor " + $(this).val() + " ha sido deseleccionado");
                var servicio = $(this).val();
                var prueba = "#index"+servicio;
                console.log(prueba);
                $(prueba).remove();
                index--;
            }
            
        });

        $('body').on("click", '.button-remove' , function(){
            $(this).parents('tr').remove();

        });


    })(jQuery);
</script>

<!-- <script>
    $(window).scroll(function(){
        var posicionNueva = $(window).scrollTop();
        //console.log(posicionNueva);
        if ($(window).scrollTop() > 408){
            $('#box_fixed').css("position", "fixed")
            $('#box_fixed').css("top", "150px")
            $('#button_boxfloat').css("position", "fixed")
            $('#button_boxfloat').css("top", "80%")
            $('#button_boxfloat').css("left", "16%")
        }else{
            $('#box_fixed').css("position", "absolute")
            $('#box_fixed').css("top", "700px")
            $('#button_boxfloat').css("position", "absolute")
            $('#button_boxfloat').css("top", "")
            $('#button_boxfloat').css("left", "")
        }

        if ($(window).scrollTop() > 2750){
             $('#box_fixed').css("position", "absolute")
             $('#box_fixed').css("top", "2900px")
             $('#button_boxfloat').css("position", "absolute")
             $('#button_boxfloat').css("left", "35%")
        }
    });
</script> -->

<script>
    function myFunction() {        

        if(window.matchMedia("(max-width: 1500px)").matches){
            //alert("menos de 1500px");
            $(window).scroll(function(){
                var posicionNueva = $(window).scrollTop();
                //console.log(posicionNueva);
                if ($(window).scrollTop() > 408){
                    $('#box_fixed').css("position", "fixed")
                    $('#box_fixed').css("top", "150px")
                }else{
                    $('#box_fixed').css("position", "absolute")
                    $('#box_fixed').css("top", "665px")
                }

                if ($(window).scrollTop() > 2100){
                     $('#box_fixed').css("position", "absolute")
                     $('#box_fixed').css("top", "2200px")
                }
            });
        }   if(window.matchMedia("(max-width: 1400px)").matches){
                //alert("menos de 1400px");
                $(window).scroll(function(){
                    var posicionNueva = $(window).scrollTop();
                    //console.log(posicionNueva);
                    if ($(window).scrollTop() > 408){
                        $('#box_fixed').css("position", "fixed")
                        $('#box_fixed').css("top", "150px")
                    }else{
                        $('#box_fixed').css("position", "absolute")
                        $('#box_fixed').css("top", "625px")
                    }

                    if ($(window).scrollTop() > 2100){
                         $('#box_fixed').css("position", "absolute")
                         $('#box_fixed').css("top", "2200px")
                    }
                });

            }   if(window.matchMedia("(max-width: 1300px)").matches){
                    //alert("menos de 1300px");
                    $(window).scroll(function(){
                        var posicionNueva = $(window).scrollTop();
                        //console.log(posicionNueva);
                        if ($(window).scrollTop() > 408){
                            $('#box_fixed').css("position", "fixed")
                            $('#box_fixed').css("top", "150px")
                        }else{
                            $('#box_fixed').css("position", "absolute")
                            $('#box_fixed').css("top", "565px")
                        }

                        if ($(window).scrollTop() > 2100){
                             $('#box_fixed').css("position", "absolute")
                             $('#box_fixed').css("top", "2200px")
                        }
                    });

                }   if(window.matchMedia("(max-width: 1200px)").matches){
                        //alert("menos de 1200px");
                        $(window).scroll(function(){
                            var posicionNueva = $(window).scrollTop();
                            //console.log(posicionNueva);
                            if ($(window).scrollTop() > 408){
                                $('#box_fixed').css("position", "fixed")
                                $('#box_fixed').css("top", "150px")
                            }else{
                                $('#box_fixed').css("position", "absolute")
                                $('#box_fixed').css("top", "515px")
                            }

                            if ($(window).scrollTop() > 2100){
                                 $('#box_fixed').css("position", "absolute")
                                 $('#box_fixed').css("top", "2200px")
                            }
                        });

                    }   if(window.matchMedia("(max-width: 1200px)").matches){
                            //alert("menos de 1200px");
                            $(window).scroll(function(){
                                var posicionNueva = $(window).scrollTop();
                                //console.log(posicionNueva);
                                if ($(window).scrollTop() > 408){
                                    $('#box_fixed').css("position", "fixed")
                                    $('#box_fixed').css("top", "150px")
                                }else{
                                    $('#box_fixed').css("position", "absolute")
                                    $('#box_fixed').css("top", "515px")
                                }

                                if ($(window).scrollTop() > 2100){
                                     $('#box_fixed').css("position", "absolute")
                                     $('#box_fixed').css("top", "2200px")
                                }
                            });

                        }   else{
                                //alert("mas de 1300px");
                                $(window).scroll(function(){
                                    var posicionNueva = $(window).scrollTop();
                                    
                                    if ($(window).scrollTop() > 408){
                                        $('#box_fixed').css("position", "fixed")
                                        $('#box_fixed').css("top", "150px")
                                    }else{
                                        $('#box_fixed').css("position", "absolute")
                                        $('#box_fixed').css("top", "700px")
                                    }

                                    if ($(window).scrollTop() > 2100){
                                         $('#box_fixed').css("position", "absolute")
                                         $('#box_fixed').css("top", "2200px")
                                    }
                                });
                            }
    }

    var x = window.matchMedia("(max-width: 1300px)");
    myFunction(); // Call listener function at run time
    x.addListener(myFunction); // Attach listener function on state changes
  </script>

<script type="text/javascript">
    var elInput1 = document.querySelector('#input1');
    
    if (elInput1) {
      var etiqueta1 = document.querySelector('#etiqueta1');
      if (etiqueta1) {
        etiqueta1.innerHTML = elInput1.value;

        elInput1.addEventListener('input', function() {
          etiqueta1.innerHTML = elInput1.value;
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
</script>