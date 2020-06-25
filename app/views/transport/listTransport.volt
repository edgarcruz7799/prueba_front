<!DOCTYPE html>
<html lang="en">
<body>
    <br><br><br><br><br>
    
    {% if dato is empty %}
    <!-- No se encontraron direcciones -->
    no se encotraron
    {% else  %}
    <section class="box_listcellar" style="background-image: url({{url('img/ImagenCotizador.jpg')}});">
    <form action="{{ url('transport/listTransport') }}" method="post">
        <div class="row">
            <div class="col-md-12 col-sm-12 box_listtransport">
                <div class="col-md-4">
                    <p style="">
                        <?php echo $t->_("boxindex1") ?>
                    </p>
                    <select class="address form-control" id="ciudad" name="city" style="width: 100%" required>
                        {% if dato2 is empty %}
                          
                        {% else %}
                        
                          {% for item in dato2 %}
                            
                            <option value="{{item.id_city}}">{{item.city}} </option>
                          {% endfor %}
                        {% endif %} 

                    </select>
                </div>

                <div class="col-md-2">
                    <p style="">
                        <?php echo $t->_("boxindex2") ?>    
                    </p>
                    <input style="background: white;" id="datepicker" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{dato.initial_date}}"  type="date" name="initial_date">
                </div>

                <div class="col-md-2">
                    <p style="">
                          Hora
                    </p>
                    <input style="background: white; color: black;" type="time" value="{{dato.hora}}" max="23:59:00" min="00:00:00" id="datepicker1" name="hour">
                </div>

                <div class="col-md-4">
                    <p style="">
                        Tipo de carga
                    </p>
                    <select class="form-control" id="datepicker2" name="type_load" value="{{dato.tipo_carga}}" required>
                        <option value="General">General</option>
                        <option value="Granel">Granel</option>
                        <option value="Peligrosa">Peligrosa</option>
                        <option value="Perecedera">Perecedera</option>
                        <option value="Frágil">Frágil</option>
                    </select>
                </div>
            </div>
        </div>        
    </form>
    </section> 

    {% for item in dato %}
    <section id="mu-hero"  style="background-color: #fff">
        <div class="container-fluid bigbox_listcellar">
            <div class="col-xs-12 col-md-12" style="">
                <div class="col-xs-12 col-md-3 box_img_camiones" style="">
                    <img class="imgcamiones" style="" src="{{ url('') }}{{ item.image }}">
                    <img class="imddiscount" src="{{url('img/Assets_Descuento02.png')}}">
                    <label class="labeldiscount">{{item.discount}}% <br>Descuento</label>
                </div>
                <div class="col-xs-12 col-md-9 boxcamiones" style="">
                    <form action="{{ url('transport/detailTransport') }}" method="post" style="max-width: 100%">
                        <div class="col-xs-12 col-md-8 boxcamionesuno" style="">
                            <div class="col-xs-12 col-md-12">
                                <h2 style="font-weight: bold; margin-top: 15px;">{{item.name}}</h2>
                            </div>
                            <input value="{{item.id_city}}" type="hidden" name="id_city">
                            <input value="{{item.id_city2}}" type="hidden" name="id_city2">
                            <input value="{{item.name_city}}" type="hidden" name="name_city">
                            <input value="{{item.name_city2}}" type="hidden" name="name_city2">
                            <input value="{{item.id}}" type="hidden" name="id_truck">
                            <input value="{{item.initial_date}}" class="initial_date"  type="hidden" id="initial_date" name="initial_date">
                            <input value="{{item.hora}}" class="hour" type="hidden" id="hour" name="hour">
                            <input value="{{item.tipo_carga}}" class="type_load"  type="hidden" id="type_load" name="type_load">
                            <input value="{{item.type_truck}}" class="type_truck"  type="hidden" id="type_truck" name="type_truck">

                            <!-- <div class="col-xs-12 col-md-12">
                                <h5 style="margin: 0px;"><strong style="color: #f71e14;">{{item.initial_date}}</strong></h5>
                            </div> -->

                            <div class="col-xs-12 col-md-12">
                                <div class="mensajebox" style="">
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
                                    <p>Reservado {{item.frequency_reservation}} veces en las ultimas {{item.time_hours_reservation}} horas</p>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-12">                                
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

                            <div class="col-xs-12 col-md-6 boxsinresponsive" style="">  
                                <p style=""><b>Ciudad Origen</b></p>
                                <p style=""><b>Ciudad Destino</b></p>
                                <p style=""><b>Hora:</b></p>
                                <p style=""><b>Tipo de carga:</b></p>
                                <p style=""><b>Tipo de transporte:</b></p>
                                <p style=""><b>Carga disponible:</b></p>
                                <p style=""><b>Reservación Minima:</b></p>
                            </div>

                            <div class="col-xs-12 col-md-6 box_right boxsinresponsive" style="">
                                <p class="" style="">{{item.name_city}}</p>
                                <p class="" style="">{{item.name_city3}}</p>
                                <p class="" style="">{{item.hour}}</p>
                                <p class="" style="">{{item.type_load}}</p>
                                <p class="" style="">{{item.type_truck}}</p>
                                <p class="" style="color: red;">{{item.capacity}}Kg</p>
                                <p class="" style="color: red;">1000Kg</p>
                            </div>

                            <div class="col-xs-12 boxconresponsive">
                                <p style=""><b>Ciudad Origen</b></p>
                                <p class="" style="">{{item.name_city}}</p>
                                <p style=""><b>Ciudad Destino</b></p>
                                <p class="" style="">{{item.name_city2}}</p>
                                <p style=""><b>Hora:</b></p>
                                <p class="" style="">{{item.hour}}</p>
                                <p style=""><b>Tipo de carga:</b></p>
                                <p class="" style="">{{item.type_load}}</p>
                                <p style=""><b>Carga disponible:</b></p>
                                <p class="" style="color: red;">{{item.capacity}}Kg</p>
                                <p style=""><b>Reservación Minima:</b></p>
                                <p class="" style="color: red;">1000Kg</p>
                            </div>

                        </div>
                        <div class="col-xs-12 col-md-4 boxbodegasdos">
                            <div class="col-xs-12 col-md-12 almc" style="text-align: center">
                                <h6 style="color: #8A0808;" class="almace">Precio</h6>
                                <input type="text" class="costotal" id="costotal" name="costotal" readonly value="$ {{item.cost}}" style="text-align: center; font-size: 25px; height: 50px; font-weight: bold;" name="cost">
                            </div>
                            <div class="col-xs-12 col-md-12 text-center">
                                <a href="{{ url('img/TARIFAS Y CONDICIONES  TRANSPORTE PARA WEB ALMAGRARIO (4).xlsx') }}" style="color: #f71e14" target="_blank">
                                    Aplican términos y condiciones
                                </a>
                            </div>
                            <div class="col-xs-12 col-md-12 buttonbox_camiones" style="">
                                <button class="button_box_bodegas" style="">Reservar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
        
    
    {% endfor %}
    {% endif %}  

    <div class="container-fluid bigbox_listcellar">
        <div class="col-xs-12 col-md-12 publi_truck">
            <div class="col-xs-2 col-md-2">
                <img src="{{url('img/navigation-2049643_640.jpg')}}" alt="">
            </div>
            <div class="col-xs-5 col-md-5" >
                <p>
                    Si no encontraste una ruta que te sirva contactanos para crear una ruta a tus necesidades
                </p>
            </div>
            <div class="col-xs-5 col-md-5">
                <button>
                    Solicitar ruta nueva
                </button>
            </div>
        </div>
    </div>

    </body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
    
    $('#ciudad').val('{{item.id_city}}').trigger('change.select2');
    $('.address').change(function(){
            this.form.submit();
        });
      

</script>

<script type="text/javascript">
    // $(document).ready(function(){
    
    //     $("#mos").click(function(){
    //         var esVisible = $("#metros").is(":hidden");
    //         if(esVisible){
    //             $("#metros").show();
    //             $(".box_spacereq").show();
    //             console.log(esVisible);
    //         }else{
    //             $("#metros").css("display", "none");
    //             $(".box_spacereq").css("display", "none");
    //             console.log(noVisible);
    //         }

    //     });    
    
    // });
</script>

<script type="text/javascript">

    document.getElementById('datepicker').value = '{{item.initial_date}}';
    document.getElementById('datepicker1').value = '{{item.hora}}';
    document.getElementById('datepicker2').value = '{{item.tipo_carga}}';
    // document.getElementById('space').innerHTML =  '{{item.space_require}} m <sup>2</sup>';
    

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
    // $(document).ready(function(){
    //     $('#deposit_capacity').change(function(){
    //         this.form.submit();
    //     })
    // });
</script>

<script type="text/javascript">
    // var slider = document.getElementById("deposit_capacity");
    // var output = document.getElementById("temp");
    // output.innerHTML = slider.value;

    // slider.oninput = function() {
    //         output.innerHTML = this.value;
    //     }

    // var slider1 = document.getElementById("deposit_capacity1");
    // var output1 = document.getElementById("temp1");
    // output1.innerHTML = slider1.value;

    // slider1.oninput = function() {
    //         output1.innerHTML = this.value;
    //     }

</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#datepicker').change(function(){
            $('.initial_date').val(datepicker.value);
        });
        $('#datepicker1').change(function(){
            $('.hour').val(datepicker1.value);
        });
        $('#datepicker2').change(function(){
            $('.type_load').val(datepicker2.value);
        });
    });
</script>

<script type="text/javascript">
$(document).ready(function(){

     
});
</script>

<script type="text/javascript">
    // $('#deposit_capacity1').prop( "disabled", true );
    // $('input:radio[name="box"]').change(
    // function(){
    //     if (this.checked) {
    //       var boxID = $(this).attr("class");
    //       console.log(boxID);
    //       $('.inputrange_listcellar').prop( "disabled", true );

    //       if (boxID == "form-check-input inputradiouno"){
    //         $('#deposit_capacity1').prop( "disabled", false );
    //       }
    //       if (boxID == "form-check-input inputradiodos"){
    //         $('#deposit_capacity').prop( "disabled", false );
    //       }
    //     }
    // });
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