<!DOCTYPE html>
<html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<style type="text/css">
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
                        <h1 class="h1_titidos" style="" class="cit">Origen: {{item.name_city}}</h1>
                        <h1 class="h1_titidos" style="" class="cit">Destino: {{item.name_city2}}</h1>
                        <hr class="hr_titi" style="">
                    </div>
                    <!-- <div class="col-md-6 titi2">
                        <h5 style="color: #8A0808;">Almacenamiento</h5>
                        <h1 style="">${{item.storage_cost}}</h1>
                        <p style="">por metro cuadrado <br> o cubico por semana</p>
                    </div>
                    <div class="col-md-5 titi2">
                        <h5 style="color: #8A0808; ">Manejo</h5>
                        <h1 style="">${{item.handling_cost}}</h1>
                        <p style="">por movimiento <br> interno o externo</p>
                    </div> -->
                </div>
            </div>
    </section>
            <div class="row">
                <div id="box_fixed_truck" class="col-md-4 col-md-offset-1 formu" style="">
                    <form action="{{ url('quotation/quotationTruck') }}" method="post">
                        <input type="hidden" name="id_truck" value="{{item.id}} ">
                        <input value="{{item.id_city}}" type="hidden" name="id_city">
                        <input value="{{item.id_city2}}" type="hidden" name="id_city2">
                        <input value="{{item.name_city}}" type="hidden" name="name_city">
                        <input value="{{item.name_city2}}" type="hidden" name="name_city2">
                        <input value="{{item.type_truck}}" type="hidden" name="type_truck">
                        <center>
                            <p style="">Tu reserva</p>
                        </center>

                        <div class="col-md-6">
                            <p style="text-align: center;">
                                <?php echo $t->_("boxindex2") ?>
                            </p>
                            <input type="date" id="datepicker_truck" required min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{item.initial_date}}" required  name="initial_date">
                        </div>
                        <div class="col-md-6">
                            <p style="text-align: center;">
                                  Hora
                            </p>
                            <input style="background: white; color: black;" required type="time" value="{{item.hour}}" max="23:59:00" min="00:00:00" id="datepicker_truck" name="hour">
                        </div>
                        <div class="col-md-12">
                            <p style="text-align: center;">
                                Tipo de carga
                            </p>
                            <select class="form-control" id="datepicker_truck" name="type_load" value="{{item.type_load}}" required>
                                <option value="{{item.type_load}}">{{item.type_load}}</option>
                                <option value="General">General</option>
                                <option value="Granel">Granel</option>
                                <option value="Peligrosa">Peligrosa</option>
                                <option value="Perecedera">Perecedera</option>
                                <option value="Frágil">Frágil</option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <p style="text-align: center;">
                                Tipo de transporte
                            </p>
                            <select class="form-control" id="datepicker_truck" name="type_truck" value="{{item.type_truck}}" required>
                                <option value="{{item.type_truck}}">{{item.type_truck}}</option>
                                <option value="Turbo">Turbo</option>
                                <option value="Sencillo">Sencillo</option>
                                <option value="Minimula">Minimula</option>
                                <option value="Tractomula">Tractomula</option>
                            </select>
                        </div>
                        <!-- <p class="espace_req_detailcellar" style="">
                            <?php echo $t->_("boxindex4") ?>
                        </p>
                        <div class="col-md-12">
                            <table>
                                <tr>
                                    <td><input disabled class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" ></td>
                                    <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                                    <td><div id="etiqueta" class="col-md-2 col-md-offset-8" ><span id="temp0">0</span></div>
                                    <div class="col-md-1" >m<sup>3</sup></div>
                                    <input style="" disabled id=""  type="range" value="0" required min="100" max="10000" step="100" autocomplete="off"></td>

                                </tr>

                                <tr>
                                    <td><input class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                                    <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheckm">Area <br>cuadrada</label></td>
                                    <td><div id="etiqueta" class="col-md-2 col-md-offset-8"><span id="temp">0</span></div>
                                    <div class="col-md-1">m<sup>2</sup></div>
                                    <input style="" id="deposit_capacity" name="deposit_capacity" type="range" step="100" value="{{item.space_require}}" min="100" max="{{item.deposit_capacity}}" autocomplete="off"></td>
                                </tr>
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
                        </div> -->
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
                        <h1 style=""><b>1000Kg</b></h1>
                        <p class="p_time_reservation" style=""><b>Reservación minima</b></p>
                    </div>
                    <div class="line_detailcellar" style="border-left: 1px solid silver; height: 100px; position: absolute; left: 50%; margin-top: 25px;"></div>
                    <div class="col-md-6 box_detaildetailcellar">
                        <hr style="width: 30%; border-top: 7px solid #f71e14; border-radius: 20px; margin: 0; margin-top: 15px; -webkit-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); -moz-box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75); box-shadow: 3px 3px 10px 0px rgba(0,0,0,0.75);">
                        <h1 style=""><b>1 Dia</b></h1>
                        <p style="width: 300px; color: #f71e14;"><b>Tiempo minimo</b></p>
                    </div>
                </div>
                <!-- <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
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
                </div> -->
                <div class="col-md-4 col-md-offset-7 supervisor_detailcellar"><br><br>
                    <img style="float:left; " src="{{url('img/Assets_Foto.png')}}" class="img-circle" width="150"  height="150">
                    <p style="color: #f71e14;"><b>Conductor</b></p>
                    <p style="">{{item.conductor}}</p>
                    <p style="color: #f71e14;">Especialista en cargas</p>
                </div>

            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_bodegas_detailcellar" style="">
                    <img src="{{ url('') }}{{ item.image }}" style="padding: 1%;" height="400" width="1000"> 
                </div>
                <div class="col-md-2 col-md-offset-5 imgdos_bodegas_detailcellar" style="">
                    <img src="{{ url('') }}{{ item.image }}" style="padding: 1%;" height="200" width="400"> 
                </div>
                <div class="col-md-2 imgtres_bodegas_detailcellar" style="">
                    <img src="{{ url('') }}{{ item.image }}" style="padding: 1%;" height="200" width="400"> 
                </div>
                <div class="col-md-2 imgcuatro_bodegas_detailcellar" style="">
                    <img src="{{ url('') }}{{ item.image }}" style="padding: 1%;" height="200" width="400"> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
                    <h1 class="" style=" color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_Facilidades.png')}}">CARACTERÍSTICAS DEL VEHICULO
                    </h1>
                </div>
                <div class="col-md-4 col-md-offset-5">
                    <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style="color: #f71e14; margin: 0px;">Estructura</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">Tráiler</p>
                        </div>
                    </div>
                    <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style=" color: #f71e14; margin: 0px;">Tipo <br> de mercancía</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">Camión de lona</li>
                            <li style="">Plataforma abierta</li>
                            <li style="">Cerrado</li><br>
                        </div>
                    </div>
                    <div class="col-md-12 facilidades_detailcellar" style="margin-bottom: 15px;">
                        <div class="col-md-5">
                            <h6 style=" color: #f71e14; margin: 0px;">Peso y categoría</h6>
                        </div>
                        <div class="col-md-7" style="border-left: 1px solid">
                            <li style="">N1</li>
                            <li style="">N2</li>
                            <li style="">N3</li>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 facilidades_detailcellar" style="margin-bottom: 15px; padding-left: 30px; padding-right: 30px;">
                    <div class="col-md-5">
                        <h6 style=" color: #f71e14; margin: 0px;">Seguridad</h6>
                    </div>
                    <div class="col-md-7" style="border-left: 1px solid">
                        <!-- <li style="">107/5000</li> -->
                        <li style="">Acceso 24/7</li>
                        <li style="">Seguridad 24/7</li>
                        <!-- <li style="">Liado</li>
                        <li style="">Patio cercado</li><br> -->
                    </div>
                </div>                
                <hr class="hr_line_detailcellar" style="width: 50%; border-color: #807b7b; margin-left: 44%; margin-top: 23%;">
            </div>
            <div class="row">
                <div class="col-md-7 col-md-offset-5 img_logos_detailcellar">
                    <h1 class="" style=" color: #f71e14; text-align: center;">
                        <img height="" width="" src="{{url('img/Assets_horarios.png')}}">INFORMACIÓN DE RUTA
                    </h1>
                </div>
                <div class="col-md-7 col-md-offset-5">
                    <div class="col-md-12 horario_detailcellar">
                        <div class="col-xs-6 col-md-9">
                            <P>Hora estimada de salida</P>
                            <p>Hora estimada de llegada</p>
                            <p>Distancia de ruta</p>
                            <p>Estado</p>
                        </div>
                        <div class="col-xs-6 col-md-3">
                            <p>6:00 pm</p>
                            <p>9:00 am</p>
                            <p>855 Km</p>
                            <p>En Ruta</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 col-md-offset-5" style="margin-top:2%; margin-bottom: 2%; text-align: center">
                    <img src="{{url('img/tracking2.jpg')}}" style="width: 50%" alt="">
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

            <div class="container-fluid bigbox_listcellar">
                <div class="col-xs-12 col-md-12" style="border: 1px solid #bfc0bf; border-radius: 15px; background-color: #f71e14;">
                    <div class="col-xs-2 col-md-2" style="text-align: center; height: 100px;">
                        <img src="{{url('img/navigation-2049643_640.jpg')}}" alt="" style="height: 90px; border-radius: 50px; margin-top: 2%">
                    </div>
                    <div class="col-xs-5 col-md-5" style="height: 100px; line-height: 100px;">
                        <p style="color: #fff;">
                            Si no encontraste una ruta que te sirva contactanos para crear una ruta a tus necesidades
                        </p>
                    </div>
                    <div class="col-xs-5 col-md-5" style="text-align: center; height: 100px;">
                        <button class="" style="margin-top: 30px; border-radius: 15px; background-color: #fff;">
                            Solicitar ruta nueva
                        </button>
                    </div>
                </div>
            </div>
</body>
    {% endfor %} 
    {% endif %}



</html>
<script>
    addEventListener('load', inicio, false);

    function inicio() {
        document.getElementById('temperatura').addEventListener('change', cambioTemperatura, false);
    }

    function cambioTemperatura() {
        document.getElementById('temp').innerHTML = document.getElementById('temperatura').value;
    }
</script>

<script
    src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous">
                  
</script>

<script type="text/javascript">
    var slider = document.getElementById("deposit_capacity");
    var output = document.getElementById("temp");
    output.innerHTML = slider.value;

    slider.oninput = function() {
        output.innerHTML = this.value;
}

</script>

<script type="text/javascript">
    (function($){
            
        index = 1;
        $btnAdd = $("input[name=servicio]");
        $table = $("#table-content");

        $btnRemove = $(".button-remove");

        $btnAdd.on("click", function(){

        });

        var altura = $('#box_fixed_truck').height();
 
        $(".form-check-input").click(function(){
              $("#box_fixed_truck").animate({scrollTop:altura+"px"});
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
                    $('#box_fixed_truck').css("position", "fixed")
                    $('#box_fixed_truck').css("top", "150px")
                }else{
                    $('#box_fixed_truck').css("position", "absolute")
                    $('#box_fixed_truck').css("top", "665px")
                }

                if ($(window).scrollTop() > 1800){
                     $('#box_fixed_truck').css("position", "absolute")
                     $('#box_fixed_truck').css("top", "1800px")
                }
            });
        }   if(window.matchMedia("(max-width: 1400px)").matches){
                //alert("menos de 1400px");
                $(window).scroll(function(){
                    var posicionNueva = $(window).scrollTop();
                    //console.log(posicionNueva);
                    if ($(window).scrollTop() > 408){
                        $('#box_fixed_truck').css("position", "fixed")
                        $('#box_fixed_truck').css("top", "150px")
                    }else{
                        $('#box_fixed_truck').css("position", "absolute")
                        $('#box_fixed_truck').css("top", "625px")
                    }

                    if ($(window).scrollTop() > 1800){
                         $('#box_fixed_truck').css("position", "absolute")
                         $('#box_fixed_truck').css("top", "1800px")
                    }
                });

            }   if(window.matchMedia("(max-width: 1300px)").matches){
                    //alert("menos de 1300px");
                    $(window).scroll(function(){
                        var posicionNueva = $(window).scrollTop();
                        //console.log(posicionNueva);
                        if ($(window).scrollTop() > 408){
                            $('#box_fixed_truck').css("position", "fixed")
                            $('#box_fixed_truck').css("top", "150px")
                        }else{
                            $('#box_fixed_truck').css("position", "absolute")
                            $('#box_fixed_truck').css("top", "565px")
                        }

                        if ($(window).scrollTop() > 1800){
                             $('#box_fixed_truck').css("position", "absolute")
                             $('#box_fixed_truck').css("top", "1800px")
                        }
                    });

                }   if(window.matchMedia("(max-width: 1200px)").matches){
                        //alert("menos de 1200px");
                        $(window).scroll(function(){
                            var posicionNueva = $(window).scrollTop();
                            //console.log(posicionNueva);
                            if ($(window).scrollTop() > 408){
                                $('#box_fixed_truck').css("position", "fixed")
                                $('#box_fixed_truck').css("top", "150px")
                            }else{
                                $('#box_fixed_truck').css("position", "absolute")
                                $('#box_fixed_truck').css("top", "515px")
                            }

                            if ($(window).scrollTop() > 1800){
                                 $('#box_fixed_truck').css("position", "absolute")
                                 $('#box_fixed_truck').css("top", "1800px")
                            }
                        });

                    }   if(window.matchMedia("(max-width: 1200px)").matches){
                            //alert("menos de 1200px");
                            $(window).scroll(function(){
                                var posicionNueva = $(window).scrollTop();
                                //console.log(posicionNueva);
                                if ($(window).scrollTop() > 408){
                                    $('#box_fixed_truck').css("position", "fixed")
                                    $('#box_fixed_truck').css("top", "150px")
                                }else{
                                    $('#box_fixed_truck').css("position", "absolute")
                                    $('#box_fixed_truck').css("top", "515px")
                                }

                                if ($(window).scrollTop() > 1800){
                                     $('#box_fixed_truck').css("position", "absolute")
                                     $('#box_fixed_truck').css("top", "1800px")
                                }
                            });

                        }   else{
                                //alert("mas de 1300px");
                                $(window).scroll(function(){
                                    var posicionNueva = $(window).scrollTop();
                                    console.log(posicionNueva);
                                    if ($(window).scrollTop() > 408){
                                        $('#box_fixed_truck').css("position", "fixed")
                                        $('#box_fixed_truck').css("top", "150px")
                                    }else{
                                        $('#box_fixed_truck').css("position", "absolute")
                                        $('#box_fixed_truck').css("top", "700px")
                                    }

                                    if ($(window).scrollTop() > 1800){
                                         $('#box_fixed_truck').css("position", "absolute")
                                         $('#box_fixed_truck').css("top", "1800px")
                                    }
                                });
                            }
    }

    var x = window.matchMedia("(max-width: 1300px)");
    myFunction(); // Call listener function at run time
    x.addListener(myFunction); // Attach listener function on state changes
  </script>