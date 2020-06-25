<!DOCTYPE html>
<html>

<style type="text/css">
    body {
        font-family: poppins;
    }
    .servicios{
    border: 1px;
    display: inline-block;
    width: auto;
    margin: 0 20px;
    text-align: justify;
}
  input[type=range]::-moz-range-thumb {
    background-color: #f71e14;
}

input[type="radio"] {

    -webkit-transform: scale(2); /* Chrome, Safari, Opera */
    border:0px;
    margin-top: 30px;
    background: green;
    cursor: pointer;
    
}
  
</style>

<body>

    
    {% if dato is empty %}
    No se encontraron direcciones
    {% else %} 
    <section id="mu-hero" class="mu-hero-section1" style="background-color: white;">
        <div class="container">

            <div class="row">
                <div class="col-md-4  " style="background-color: white; border-radius: 15px; -webkit-box-shadow: 0px 3px 11px 0px rgba(0,0,0,0.75);-moz-box-shadow: 0px 3px 11px 0px rgba(0,0,0,0.75); box-shadow: 0px 3px 11px 0px rgba(0,0,0,0.75);">
                    <form action="{{ url('quotation/quotationCellar') }}" method="post">
                        <input type="hidden" name="id" value="{{dato.id}} ">
                        <center>
                            <br>
                            <p style="text-align: center; color: #8A0808; font-size: 18px; ">Tu reserva</p>
                            <br>
                            <input type="hidden" name="handling_cost" value="0">

                        </center>

                        <div class="col-md-6">
                            <p style="text-align: center; color: silver;">
                                <?php echo $t->_("boxindex2") ?>
                            </p>
                            <input type="date" value="{{dato.initial_date}}" name="initial_date">
                        </div>
                        <div class="col-md-6">
                            <p style="text-align: center; color: silver;">
                                <?php echo $t->_("boxindex3") ?>
                            </p>
                            <input type="date" value="{{dato.final_date}}" name="final_date">
                        </div>
                        <p style=" margin-left: 10px; margin-top: 100px;">
                            <?php echo $t->_("boxindex4") ?>
                        </p>
                        <div class="col-md-12">
                            <table>
                                <tr>
                                    <td><input disabled class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" ></td>
                                    <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                                    <td><div id="etiqueta" class="col-md-2 col-md-offset-8" ><span id="temp">0</span></div>
                                    <div class="col-md-1" >m<sup>3</sup></div>
                                    <input style=" margin: 10% 0;" disabled id="temperatura"  type="range" value="0" min="0" max="10000" autocomplete="off"></td>

                                </tr>

                                <tr>
                                    <td><input class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                                    <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheckm">Area <br>cuadrada</label></td>
                                    <td><div id="etiqueta" class="col-md-2 col-md-offset-8"><span id="temp">{{dato.deposit_capacity}}</span></div>
                                    <div class="col-md-1">m<sup>2</sup></div>
                                    <input style="margin: 10% 0;" id="input2" name="deposit_capacity" type="range" value="{{dato.deposit_capacity}}"  min="0" max="10000" autocomplete="off"></td>

                                </tr>
                            </table>
                        </div>
                        <div class="col-md-12"> 
                            <p style="text-align: center; color: #8A0808; font-size: 18px; ">Servicios adicionales</p>
                            <p style="text-align: center">* {{dato.service}}</p>
                            <p style=" color: #8A0808; font-size: 18px;  ">Total <b style="color: black;  font-size: 400%; ">${{dato.storage_cost}} <input type="hidden" name="storage_cost" value="{{dato.storage_cost}}"></b></p>
                            <h1 ></h1>
                            <table class="table table-hover" style="display: none;">
                                <tr>
                                    <td> # </td>
                                    <td>Servicio</td>
                                    <td>Eliminar</td>
                                </tr>

                                <tbody id="table-content">

                                                                                     
                                </tbody>
                            </table>
                            <hr/>
                        </div>
                        <div class="col-md-12">
                            <center>
                                <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                                <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex" value="<?php echo $t->_('boxindex10') ?>" style="margin: 20px 0px;" />
                            </center>
                        </div>
                    </form>
                </div>

                <div class="col-md-6 ">
                    <h1 class="col-md-offset-6" style=" color: #f71e14;  "><img src="{{url('img/Assets_Inversión_rojo.png')}}"> Servicios</h1>
                    <p class="col-md-offset-4" style=" font-size: 16px; ">Haz clic para agregar los servicios que desees a tu reserva</p><br><br>
                </div>

                <div class="col-md-2 col-md-offset-1">
                    <table>
                        <tr>
                            <p style=" color: #f71e14; font-size: 16px; ">Rotación de Existencias</p>
                            <td><input class="form-check-input" type="checkbox" value="12" name="servicio" id="defaultCheck1"></td>
                            <td><pp style="font-size: 16px; margin-left: 10px;" class="form-check-label">Diario</pp></td>

                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="23"  name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Cada dos días</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="34" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Cada tres días</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="45" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Semanal</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="56" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Personalizado</p></td>      
                        </tr>
                    </table>                    
                </div>

                <div class="col-md-2 ">
                    <table>
                        <tr>
                            <p style=" color: #f71e14; font-size: 16px; ">Perseveración de productos</p>
                            <td><input class="form-check-input" type="checkbox" value="sdg" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Alimentos perecederos</p></td>

                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="sdgs" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Alimentos perecederos</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="sdg" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Congelación</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="dgs" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Al aire libe</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="sdgs" name="servicio" id="defaultCheck10"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Espacio cerrado</p></td>      
                        </tr>
                    </table>                    
                </div>

                <div class="col-md-2 ">
                    <table>
                        <tr>
                            <p style=" color: #f71e14; font-size: 16px; ">Tratamiento especial</p>
                            <td><input class="form-check-input" type="checkbox" value="sdgd" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Productos químicos</p></td>

                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="dgdsg" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Liquidos inflamables</p></td>      
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="checkbox" value="dfgd" name="servicio" id="defaultCheck1"></td>
                            <td><p style="font-size: 16px; margin-left: 10px;" class="form-check-label" >Carga delicada</p></td>      
                        </tr>
                    </table>                   
                </div>
                <div class="col-md-6 col-md-offset-6">
                    <img style="float:left; margin: -20% 0; border: 1px solid silver;" src="{{url('img/courrier.png')}}" class="img-circle" width="150"  height="150">
                    <p style="color: #f71e14;  font-size: 20px;margin-top: -16%; margin-left: 180px;"><b>Supervisor</b></p>
                    <p style="  font-size: 20px;margin: -1% 0; margin-left: 180px;">{{dato.supervisor}}</p>
                    <p style="color: #f71e14;  font-size: 20px; margin: 2%; margin-left: 180px;">Jefe de depósito</p>
                </div>
                

            </div>

        </div>
    </section>
     {% endif %}

</body>

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
              crossorigin="anonymous"></script>

<script type="text/javascript">
                    (function($){
                        var index = 1;
                        $btnAdd = $("input[name=servicio]");
                        $table = $("#table-content");

                        $btnRemove = $(".button-remove");

                        $btnAdd.on("click", function(){

                            var servicio = $(this).val();


                            var tpl =   '<tr><td>'+ index +'</td>'+
                                        '<td>'+
                                            '<p >'+servicio+'</p><input readonly  type="hidden" class="form-control" name="servicio[]" id="servicio" value="'+servicio+'">'+
                                        '</td>'+
                                         '<td>'+
                                            '<button type="button" class="btn btn-danger button-remove" data-index="'+index+'"> <i class="fa fa-trash-o"></i> </button>'+
                                        '</td></tr>';
                            $table.append(tpl);

                            $(".table-hover").show();
                            $("#no").hide();
                            index++;
                        });

                        $('body').on("click", '.button-remove' , function(){
                            var index = $(this).data('index');
                            $(this).parents('tr').remove();
                        });


                    })(jQuery);
                </script>

