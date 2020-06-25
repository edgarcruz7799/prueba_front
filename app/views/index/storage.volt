<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<body>
    
    <section class="box_listcellardos" style="background-image: url({{url('img/ImagenCotizador.jpg')}});">
    <form class="formstorage" action="{{ url('cellar/listCellar') }}" method="post">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="col-md-3">
                    <p style="">
                        <?php echo $t->_("boxindex1") ?>
                    </p>
                    <select class="address form-control" id="ciudad" name="city" required style="width: 100%"> 
                        {% if data is empty %}
                          <!-- No se encontraron direcciones -->
                        {% else %}
                        
                          {% for item in data %}
                            
                            <option value="{{item.id_departament}}">Departamento: {{item.departament}} </option>
                          {% endfor %}
                        {% endif %} 

                        {% if dato2 is empty %}
                          <!-- No se encontraron direcciones -->
                        {% else %}
                        
                          {% for item in dato2 %}
                            
                            <option value="{{item.id_city}}">Departamento: {{item.departament}} Ciudad: {{item.city}} </option>
                          {% endfor %}
                        {% endif %} 

                        {% if dat is empty %}
                          <!-- No se encontraron direcciones -->
                        {% else %}
                        
                          {% for item in dat %}
                            
                            <option value="{{item.id}}">Departamento: {{item.departament}} Ciudad: {{item.city}} Bodega: {{item.name}}</option>
                          {% endfor %}
                        {% endif %}  
                    </select>
                </div>

                <div class="col-md-2">
                    <p style="">
                        <?php echo $t->_("boxindex2") ?>    
                    </p>
                    <input style="background: white;" id="datepicker" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="<?php $hoy=date('Y-m-d'); echo $hoy;?>"  type="date" name="initial_date">
                </div>

                <div class="col-md-2">
                    <p style="">
                        <?php echo $t->_("boxindex3") ?>
                    </p>
                    <input style="background: white;" id="datepicker1" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="<?php $hoy=date('Y-m-d'); echo $hoy;?>"  type="date" name="final_date">
                    
                </div>
                <div class="col-md-3">
                    <p style="">
                        Espacio requerido 
                    </p>
                    <div id="mos" style="" >
                        <p class="text-center" style="">Seleccione una opción</p>
                    </div>

                </div>

                <div class="col-md-2">
                    <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex buttonstorage" value="<?php echo $t->_('boxindex7') ?>" style="" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-sm-10 col-md-offset-1">
                <div class="col-md-4 col-md-offset-7" ">
                    <div class="box_spacereq" style="display: none;">
                        <table class="metros" id="metros" style="display: none;">
                            <tr >
                                <td><input disabled class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" ></td>
                                <td><label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                                <td><div id="etiquetalistcellar" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; "><span id="temp1">0</span></div>
                                <div class="col-md-1" style="color: #f71e14; ">m<sup>3</sup></div>
                                <input style=" margin: 10% 0;" disabled id=""  type="range" step="100" required min="0" value="0" max="10000" autocomplete="off"></td>

                            </tr>

                            <tr>
                                <td><input class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                                <td><label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheckm">Metros <br>cuadrada</label></td>
                                <td><div id="etiquetalistcellardos" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; "><span id="temp">0</span></div>
                                <div class="col-md-1" style="color: #f71e14; ">m<sup>2</sup></div>
                                <input style="margin: 10% 0;" id="deposit_capacity" name="deposit_capacity" type="range" step="100" value="0" min="0" max="10000" autocomplete="off"></td>

                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </section> 



    </body>

<script type="text/javascript">

  jQuery(function() {
    jQuery('#city').change(function() {
        this.form.submit();
    });
});


</script>

<script type="text/javascript">
    $('.address').select2({
        
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
    var slider = document.getElementById("deposit_capacity");
    var output = document.getElementById("temp");
    output.innerHTML = slider.value;

    slider.oninput = function() {
            output.innerHTML = this.value;
        }

</script>

 
</html>