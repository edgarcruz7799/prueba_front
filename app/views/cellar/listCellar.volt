<!DOCTYPE html>
<html lang="en">

<style type="text/css">
    
    /*body {
        font-family: poppins;
    }

    .carousel-control.left, .carousel-control.right {
  background: none !important;
  filter: progid: none !important;
  outline: 0;
 }

.carousel-control img {
    width: 100%;
    max-height: 460px;
}
@media (max-width: 1210px){

    .cost{
        margin-top: -10%;
        margin-left: -15%;
    }
    .costi{
        margin-top: -12%;
        margin-left: 12%;
    }
    .almc{
        margin-left: -5%;
    }
    .almace{
        margin-left: 40%!important;
    }
    .time{
        margin-left: -10%!important;
    }
    
}*/


</style>
<body>
    <br><br><br><br><br>
    
    {% if dato is empty %}
    <!-- No se encontraron direcciones -->
    {% else  %}
    <section class="box_listcellar" style="background-image: url({{url('img/ImagenCotizador.jpg')}});">
    <form action="{{ url('cellar/listCellar') }}" method="post">
        <div class="row">
            <div class="col-md-12 col-sm-12 box_boxes">
                <div class="col-md-4">
                    <p style="">
                        <?php echo $t->_("boxindex1") ?>
                    </p>

                    
                    <select class="address form-control" id="ciudad" name="city" style="width: 100%" required> 
                        

                        {% if dato2 is empty %}
                          
                        {% else %}
                        
                          {% for item in dato2 %}
                            
                            <option value="{{item.id_city}}"> {{item.city}} </option>
                          {% endfor %}
                        {% endif %} 

                        
                    </select>
                </div>

                <div class="col-md-2">
                    <p style="">
                        <?php echo $t->_("boxindex2") ?>    
                    </p>
                    <input style="background: white; height: 50px;" id="datepicker" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{dato.initial_date}}"  type="date" name="initial_date">
                </div>

                <div class="col-md-2">
                    <p style="">
                        <?php echo $t->_("boxindex3") ?>
                    </p>
                    <input style="background: white; height: 50px;" id="datepicker1" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{dato.final_date}}"  type="date" name="final_date">
                    
                </div>
                <div class="col-md-4">
                    <p style="">
                        Espacio requerido 
                    </p>
                    <div id="mos" style="background: white; height: 50px; border: 1px solid silver; border-radius: 8px;" >
                        <p class="text-center" id="space" style="margin-top: 12px;">Seleccione una opción</p>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="col-xs-12 col-md-4 col-md-offset-8">
                    <div class="box_spacereq" style="display: none;">
                        <table class="metros" id="metros" style="display: none;">
                            <tr>
                                <td>
                                    <input class="form-check-input inputradiouno" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" style="width: 30px">
                                </td>
                                <td>
                                    <label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label>
                                </td>
                                <td>
                                    <div id="etiquetalistcellar" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; ">
                                        <span id="temp1">0</span>
                                    </div>
                                    <div class="col-md-1" style="color: #f71e14; ">m<sup>3</sup>
                                    </div>
                                    <input class="inputrange_listcellar" style=" margin: 10% 0;" id="input1" name="deposit_capacity" type="range" step="0.01" min="0.96" value="0" max="10000" autocomplete="off">
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <input class="form-check-input inputradiodos" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked>
                                </td>
                                <td>
                                    <label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheckm">Metros <br>cuadrados</label>
                                </td>
                                <td>
                                    <div id="etiquetalistcellardos" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; ">
                                        <span id="temp2">0</span>
                                    </div>
                                    <div class="col-md-1" style="color: #f71e14; ">m<sup>2</sup></div>
                                    <input class="inputrange_listcellar" style="margin: 10% 0;" id="input2" name="deposit_capacity" type="range" step="1" value="0" min="10" max="10000" autocomplete="off">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                  <input class="form-check-input inputradiotres" type="radio" name="box" value="<?php echo $t->_('boxindex10') ?>" id="defaultChecke" style="width: 30px"> 
                                </td>
                                <td>
                                  <label style="font-size: 12px; margin-left: 10px; color: black;" class="form-check-label" for="defaultChecke">Posición <br>estiba</label>
                                </td>
                                <td>
                                  <div id="etiquetalistcellartres" class="col-xs-2 col-xs-offset-7 col-md-2 col-md-offset-7" style="color: #f71e14; ">
                                    <span id="temp3">0</span>
                                  </div>
                                  <div class="col-xs-1 col-md-1" style="color: #f71e14; margin-left: 10px;">
                                  </div>
                                  <input class="inputrange_listcellar" style="" id="input3" name="deposit_capacity" type="range" value="0" step="1" min="1" max="1000" autocomplete="off">
                                </td>
                              </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="measure" value="{{dato[0].measure}}">
        <input type="hidden" name="category" value="{{dato[0].category}}">
        <input type="hidden" name="city" value="{{dato[0].city}}">
    </form>
    </section> 

    {% for item in dato %}
    
    <section id="mu-hero" class="granbox_listcellar" style="background-color: #fff">
        <div class="container-fluid bigbox_listcellar">
            <div class="col-xs-12 col-md-12" style="">
                <div class="col-xs-12 col-md-3 box_img_bodegas" style="">
                    <img class="imgbodegas" style="" src="{{ item.image_url }}">
                    {% if item.discount === 0 %}
                    {% else %}
                    <img class="imddiscount" src="{{url('img/Assets_Descuento02.png')}}">
                    <label class="labeldiscount">{{item.discount}}% <br>Descuento</label>
                    {% endif %}
                </div>
                <div class="col-xs-12 col-md-9 boxbodegas" style="">
                    <form action="{{ url('cellar/detailCellar') }}" method="post" style="max-width: 100%">
                        <div class="col-xs-12 col-md-8 boxbodegasuno" style="">
                            <div class="col-xs-12 col-md-12">
                                <h2 style="font-weight: bold;">{{item.name}}</h2>
                            </div>
                            <input type="hidden" name="id" value="{{item.id}} ">
                            <input value="{{item.initial_date}}" class="initial_date"  type="hidden" id="initial_date" name="initial_date">
                            <input value="{{item.final_date}}" class="final_date"  type="hidden" id="final_date" name="final_date">
                            <input value="{{item.space_require}}" class="space_require"  type="hidden" id="space_require" name="space_require">

                            <div class="col-xs-12 col-md-12">
                                <h5 style="margin: 0px;"><strong style="color: #f71e14;">{{item.city}}</strong> {{item.address}}</h5>
                            </div>

                            <div class="col-xs-12 col-md-12">
                                <div class="mensajeboxsinresponsive">
                                    <div class="mensajebox" style=""">
                                        {% if item.frequency_reservation === 6 %}
                                        <label style="background-color: red; color: white; border-radius: 5px;">¡Alta demanda!</label>
                                        {% elseif item.frequency_reservation === 5 %}
                                        <label style="background-color: red; color: white; border-radius: 5px;">¡Alta demanda!</label>
                                        {% elseif item.frequency_reservation === 4 %}
                                        <label style="background-color: #ff8100; color: white; border-radius: 5px;">¡Reservas frecuentes!</label>
                                        {% elseif item.frequency_reservation === 3 %}
                                        <label style="background-color: #ff8100; color: white; border-radius: 5px;">¡Reservas frecuentes!</label>
                                        {% else %}
                                        {% endif %}
                                    </div>
                                    <div>
                                        {% if item.frequency_reservation === 0 %}
                                        {% else %}
                                        <p>Reservado {{item.frequency_reservation}} veces en las ultimas {{item.time_hours_reservation}} horas</p>
                                        {% endif %}
                                    </div>
                                </div>

                                <div class="mensajeboxconresponsive">
                                    <div class="col-xs-6 mensajeboxresponsive" style="padding: 0px;">
                                        {% if item.frequency_reservation === 6 %}
                                        <label style="background-color: red;">¡Alta <br> demanda!</label>
                                        {% elseif item.frequency_reservation === 5 %}
                                        <label style="background-color: red;">¡Alta <br> demanda!</label>
                                        {% elseif item.frequency_reservation === 4 %}
                                        <label style="background-color: #ff8100;">¡Reservas <br> frecuentes!</label>
                                        {% elseif item.frequency_reservation === 3 %}
                                        <label style="background-color: #ff8100;">¡Reservas <br> frecuentes!</label>
                                        {% else %}
                                        {% endif %}
                                    </div>
                                    <div class="col-xs-6" style="padding: 0px; text-align: right; font-size: 13px;">
                                        {% if item.frequency_reservation === 0 %}
                                        {% else %}
                                        <p>Reservado {{item.frequency_reservation}} veces en las ultimas {{item.time_hours_reservation}} horas</p>
                                        {% endif %}
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-12 score_box">                                
                                <div id="content-stars" class="button-call-tracking" style="">
                                    {% if item.score === 5 %}
                                        <i id="1" class="glyphicon glyphicon-star color-stars" aria-hidden="true"></i>
                                        <i id="2" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="4" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="5" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="6" class="glyphicon glyphicon-star color-stars"></i>
                                    {% elseif item.score === 4 %}
                                        <i id="1" class="glyphicon glyphicon-star color-stars" aria-hidden="true"></i>
                                        <i id="2" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="4" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="5" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="6" class="glyphicon glyphicon-star"></i>
                                    {% elseif item.score === 3 %}
                                        <i id="1" class="glyphicon glyphicon-star color-stars" aria-hidden="true"></i>
                                        <i id="2" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="4" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="5" class="glyphicon glyphicon-star"></i>
                                        <i id="6" class="glyphicon glyphicon-star"></i>
                                    {% elseif item.score === 2 %}
                                        <i id="1" class="glyphicon glyphicon-star color-stars" aria-hidden="true"></i>
                                        <i id="2" class="glyphicon glyphicon-star color-stars"></i>
                                        <i id="4" class="glyphicon glyphicon-star"></i>
                                        <i id="5" class="glyphicon glyphicon-star"></i>
                                        <i id="6" class="glyphicon glyphicon-star"></i>
                                    {% else %}
                                        <i id="1" class="glyphicon glyphicon-star color-stars" aria-hidden="true"></i>
                                        <i id="2" class="glyphicon glyphicon-star"></i>
                                        <i id="4" class="glyphicon glyphicon-star"></i>
                                        <i id="5" class="glyphicon glyphicon-star"></i>
                                        <i id="6" class="glyphicon glyphicon-star"></i>
                                    {% endif %}
                                    
                                </div>
                            </div>

                            <div class="col-xs-6 col-md-8 box_left" style="">  
                                <p style=""><b>Horario de atención:</b></p>
                                <p class="p_line_height" style="">Lunes a Viernes {{ item.weekday_opening }} - {{ item.weekday_closing }} </p>
                                <p class="" style="">Sabados {{ item.saturday_opening }} - {{ item.saturday_closing }} </p>
                                <p style=""><b>Capacidad depósito:</b></p>
                                <p class="p_line_height" style="">
                                    {{item.deposit_capacity}} m
                                    <sup>
                                        {% if item.type_area == 'Metros cubicos' %}
                                            3
                                        {% elseif item.type_area == 'Metros cuadrados' %}
                                            2
                                        {% endif %}
                                    </sup>
                                </p>
                                
                            </div>
                            <div class="col-xs-6 col-md-4 box_right" style="">
                                <p style=""><b>Reservación minima</b></p>
                                <p class="p_line_height" style="color: #f71e14;">{{ item.minimum_area }}
                                    {% if item.type_area == 'Metros cubicos' %}
                                        m<sup>3</sup>
                                    {% elseif item.type_area == 'Metros cuadrados' %}
                                        m<sup>2</sup>
                                    {% else %}
                                    {% endif %}
                                </p>
                                <p class="" style="color: #f71e14;">{{ item.minimum_area }}
                                    {% if item.type_area == 'Metros cubicos' %}
                                        m<sup>3</sup>
                                    {% elseif item.type_area == 'Metros cuadrados' %}
                                        m<sup>2</sup>
                                    {% else %}
                                    {% endif %}
                                </p>
                                <p style=""><b>Tiempo mínimo</b></p>
                                <p class="p_line_height" style="color: #f71e14;" class="time">{{ item.minimum_time }}</p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 boxbodegasdos">
                            <div class="col-xs-12 col-md-12 almc" style="text-align: center">
                                <h6 style="color: red;" class="almace">Tu almacenamiento</h6>
                                <input type="text" class="costotal" id="costotal" name="costotal" readonly value="$ {{item.costotal}}" style="text-align: center; font-size: 25px; height: 50px; font-weight: bold;" name="cost">
                                <p class="p_almc" style="">El precio puede varias dependiendo de los servicios adicionale al alojamiento de la mercancía</p>
                            </div>
                            <div class="col-xs-12 col-md-12 text-center">
                                <a href="{{ url('img/Condiciones comerciales página web.pdf') }}" style="color: #f71e14" target="_blank">
                                    Aplican términos y condiciones
                                </a>
                            </div>
                            <!-- <div class="col-xs-12 col-md-6 cost" style="visibility: hidden">
                                <h6 style="color: red;">Almacenamiento</h6>
                                <h2 style="margin:-3% 0; font-weight: bold;">${{item.storage_cost}}</h2>
                                <p class="p_cost" style="">
                                    
                                    {% if item.type_area == 'Metros cubicos' %}
                                        m<sup>3</sup>
                                    {% elseif item.type_area == 'Metros cuadrados' %}
                                        m<sup>2</sup>
                                    {% else %}
                                    {% endif %}
                                    
                                    /{{ item.collection_frequency }}
                                </p>
                            </div> -->
                            <!-- <div class="col-xs-12 col-md-6 costi" style="visibility: hidden">
                                <h6 style="color: red;">Manejo</h6>
                                <h2 style="margin:-3% 0; font-weight: bold;">${{item.handling_cost}}</h2>
                                <p class="p_costi" style="">por movimiento interno o externo</p>
                            </div> -->
                            <div class="col-xs-12 col-md-12" style="text-align: center">
                                <button class="button_box_bodegas" style="">Ver Detalle</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
        
    
    {% endfor %}
    {% endif %}  



    </body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
    $('.address').select2({
        
        });

    $('#ciudad').val('{{item.id_select}}').trigger('change.select2');
     
    $('.address').change(function(){
            this.form.submit();
        });
      

</script>

<script type="text/javascript">
    $(document).ready(function(){
    
        $("#mos").click(function(){
            var esVisible = $("#metros").is(":hidden");
            if(esVisible){
                $("#metros").show();
                $(".box_spacereq").show();
                console.log(esVisible);
            }else{
                $("#metros").css("display", "none");
                $(".box_spacereq").css("display", "none");
                console.log(noVisible);
            }

        });    
    
    });
</script>

<script type="text/javascript">

    document.getElementById('datepicker').value = '{{item.initial_date}}';
    document.getElementById('datepicker1').value = '{{item.final_date}}';
    document.getElementById('input1').value = '{{item.space_require}}';
    document.getElementById('input2').value = '{{item.space_require}}';
    document.getElementById('input3').value = '{{item.space_require}}';
    document.getElementById('space').innerHTML =  '{{item.space_require}}';
    

</script>

<script type="text/javascript">


       /* var fechaI = new Date('{{item.initial_date}}')
        var fechaF = new Date('{{item.final_date}}')

        var difM = fechaF - fechaI // diferencia en milisegundos
        var difD = difM / (1000 * 60 * 60 * 24) + 1 // diferencia en dias 
        
        var space = $('input:text[name=space_require]').val();

        var storge = $('input:text[name=storage_cost]').val();

        var cost = space * storge * difD ;

        $('input:text[name=costotal]').val(cost);
        console.log(cost); */

    
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#input1').change(function(){
            this.form.submit();
        })
        $('#input2').change(function(){
            this.form.submit();
        })
        $('#input3').change(function(){
            this.form.submit();
        })
        $('#datepicker').change(function(){
            this.form.submit();
        })
        $('#datepicker1').change(function(){
            this.form.submit();
        })
    });
</script>

<script type="text/javascript">
    var slider1 = document.getElementById("input1");
    var output1 = document.getElementById("temp1");
    output1.innerHTML = slider1.value;

    slider1.oninput = function() {
            output1.innerHTML = this.value;
        }

    var slider2 = document.getElementById("input2");
    var output2 = document.getElementById("temp2");
    output2.innerHTML = slider2.value;

    slider2.oninput = function() {
            output2.innerHTML = this.value;
        }

    var slider3 = document.getElementById("input3");
    var output3 = document.getElementById("temp3");
    output3.innerHTML = slider3.value;

    slider3.oninput = function() {
            output3.innerHTML = this.value;
        }

</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#datepicker').change(function(){
            $('.initial_date').val(datepicker.value);
        });
        $('#datepicker1').change(function(){
            $('.final_date').val(datepicker1.value);
        });
        $('#deposit_capacity').change(function(){
            $('.space_require').val(deposit_capacity.value);
        });
    });
</script>

<script type="text/javascript">
    var city = $('input:hidden[name="city"]').val();
    document.getElementById('select2-ciudad-container').innerHTML = city;
</script>

<script type="text/javascript">
    var tipocellar = "{{ typearea }}";

    if (tipocellar == "Metros cubicos"){
        $('.inputradiouno').prop('checked', true);
        $('#input2').parent().parent().css("display","none");
        $('#input2').prop( "disabled", true );
        $('#input3').parent().parent().css("display","none");
        $('#input3').prop( "disabled", true );
    } else if (tipocellar == "Metros cuadrados"){
        $('.inputradiodos').prop('checked', true);
        $('#input1').parent().parent().css("display","none");
        $('#input1').prop( "disabled", true );
        $('#input3').parent().parent().css("display","none");
        $('#input3').prop( "disabled", true );
    } else if (tipocellar == "Posicion de estiba"){
        $('.inputradiotres').prop('checked', true);
        $('#input1').parent().parent().css("display","none");
        $('#input1').prop( "disabled", true );
        $('#input2').parent().parent().css("display","none");
        $('#input2').prop( "disabled", true );
    }
</script>

<!-- <script type="text/javascript">
$(document).ready(function(){
    var mouse = true;
    var starId = 0;
    $('#content-stars i').hover(function(){
        if(mouse) {
            starId = $(this).attr("id");
            $('#content-stars i').each(function(key, element){
                var eachId = $(this).attr('id');
                if(eachId <= starId){
                    $('#'+eachId).addClass('color-stars');   
                }
            });
        }
    });
    $("#content-stars i").mouseout(function(){
        if(mouse) {
            $("#content-stars i").removeClass("color-stars");
        }        
    });

    $("#btn_Finalizar").click(function(){
        if(mouse == false) {
            $('#msg-calification').text("Guardando calificación . . .")  
            $.ajax({
                url:base_url()+'paymentflow/raitingEmploye',
                type:'POST',
                data: {raiting:starId, id: employe_id},
                success:function(response){
                    console.log(response);
                    var respnJson = JSON.parse(response);   
                    $('#msg-calification').text(respnJson.message);                 
                }
            });
        }
        $(location).attr('href',base_url()+'session/end');
    });
    
    $('#content-stars i').click(function(){
        starId = $(this).attr("id");
        $('#content-stars i').each(function(key, element){
            eachId = $(this).attr('id'); 
                $('#'+eachId).removeClass('color-stars'); 
        });
        
        $('#content-stars i').each(function(key, element){
            eachId = $(this).attr('id'); 
            if(eachId <= starId){
                $('#'+eachId).addClass('color-stars'); 
            }
        });
        $('#msg-calification').text("");  
        mouse = false;
    });

});

</script> -->

 
</html>