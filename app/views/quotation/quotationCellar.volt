<!DOCTYPE html>
<html>

  <body>

    {% if dato is empty %}
    No se encontraron direcciones
    {% else %}  
    <section id="mu-hero" class="mu-hero-quotationcellar" style="background-color: white;">
        <div id="divboxquotationcellar" class="col-md-4 col-sm-4 col-md-offset-1 col-sm-offset-1 box_quotationcellar" style="">
            <form id="formquatationcellar" action="{{ url('quotation/billingCellar') }}" method="post">
                <input type="hidden" name="id" value="{{dato.id_cellar}}">
                <center>
                    <h3 class="h3_quotationcellar" style="">
                        Tu reserva
                    </h3>
                </center>
                <div class="col-md-6">
                    <p class="p_quotation_cellar" style="">
                        <?php echo $t->_("boxindex2") ?>
                    </p>
                    <input style="background: white;" type="date" disabled min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{dato.initial_date}}" id="datepicker" name="initial_date">
                </div>
                <div class="col-md-6">
                    <p class="p_quotation_cellar" style="">
                        <?php echo $t->_("boxindex3") ?>
                    </p>
                    <input style="background: white;" type="date" disabled value="{{dato.final_date}}" min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" id="datepicker2" name="final_date">
                </div>
                <div class="col-md-12" style="margin-top: 15px;">
                    <p class="pdos_quotation_cellar" style="">
                        <?php echo $t->_("boxindex4") ?>
                    </p>
                </div>
                <div class="col-md-12">
                    <table>
                        {% if dato.type_area is 'Metros cubicos' %}
                            <tr>
                                <td><input class="form-check-input inputradiouno" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" style="width: 30px" checked></td>
                                <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                                <td><div id="etiqueta1" class="col-md-2 col-md-offset-2" style="color: #f71e14;"><span id="temp1">{{dato.space_require}}</span></div>
                                <div class="col-md-1" style="color: #f71e14;">m<sup>3</sup></div>
                                <input class="inputrange" style="" id="input1" name="deposit_capacity" type="hidden" step="0.96" value="{{dato.space_require}}" min="0.96" max="{{dato.deposit_capacity}}" autocomplete="off" disabled></td>
                            </tr>
                        {% elseif dato.type_area is 'Metros cuadrados' %}
                            <tr>
                                <td><input class="form-check-input inputradiodos" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                                <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultCheckm">Area <br>cuadrada</label></td>
                                <td><div id="etiqueta2" class="col-md-2 col-md-offset-8" style="color: #f71e14;"><span id="temp2">{{dato.space_require}}</span></div>
                                <div class="col-md-1" style="color: #f71e14;">m<sup>2</sup></div>
                                <input class="inputrange" style="" id="input2" name="deposit_capacity" type="range" step="50" value="{{item.space_require}}" min="50" max="{{item.deposit_capacity}}" autocomplete="off" disabled></td>
                            </tr>
                        {% else %}
                            <tr>
                                <td><input class="form-check-input inputradiotres" type="radio" name="box" value="<?php echo $t->_('boxindex10') ?>" id="defaultChecke" style="width: 30px" checked> </td>
                                <td><label style="font-size: 12px;  margin-left: 10px;" class="form-check-label" for="defaultChecke">Posición <br>estiba</label></td>
                                <td><div id="etiqueta3" class="col-md-2 col-md-offset-8" style="color: #f71e14;"><span id="temp3">{{dato.space_require}}</span></div>
                                <div class="col-md-1" style="color: #f71e14;"></div>
                                <input class="inputrange" style="" id="input3" name="deposit_capacity" type="range" step="1" value="{{item.space_require}}" min="1" max="{{item.deposit_capacity}}" autocomplete="off" disabled></td>
                            </tr>
                        {% endif %}
                    </table>
                    <table class="table table-hover" style="display: none;">
                        <tr>
                            <td> # </td>
                            <td>Servicio</td>
                            <td>Eliminar</td>
                        </tr>

                        <tbody id="table-content">

                                                                             
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12" style="border-top: 1px solid #e3ddd8; margin-top: 5%;">
                    <div class="col-xs-2 col-md-2 total_quotationcellar" style="">
                        Total 
                    </div>
                    <div class="col-xs-10 col-md-10">
                        <h1 style="font-weight: bold; text-align: center;">${{dato.storage_cost}}</h1>
                        <input type="hidden" name="storage_cost" value="{{dato.storage_cost}}">
                        <input type="hidden" name="deposit_capacity" value="{{dato.deposit_capacity}}">
                        <input type="hidden" name="service" value="">
                        
                    </div>
                  
                </div>
                <div class="col-md-12">
                    <center>
                        <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                        <input type="" name="" class="btn btn-primary btn-lg buttonboxindex buttonboxquotationcellar" onclick="mostrarcapa('reservelogin');" value="Reservar" style="width: 100%;" />
                    </center>
                </div>
            </form>
        </div>

        <div class="col-md-5 col-sm-5 col-md-offset-1 col-sm-offset-1">
            <center>
                <h1 class="h1_quotationcellar" style="color: #d82e25;">
                    <img class="img_quotationcellar" src="{{ url('img/Assets_Factura.png') }}">CONFIRMAR DATOS DE RESERVA
                </h1>
                <p>Finaliza tu reserva confirmando estos datos.</p><br><br>
            </center>
            <div class="row">
                <div class="col-md-12 div_quotationcellar">
                    <label style="color: #f71e14;">Nombre: </label>
                    <p class="text-right" style="">{{dato.name}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Ciudad: </label>
                    <p class="text-right" style="">{{dato.city}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Fecha de inicio: </label>
                    <p class="text-right" style="">{{dato.initial_date}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Fecha de salida: </label>
                    <p class="text-right" style="">{{dato.final_date}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Espacio requerido:  </label>
                    <p class="text-right" style="">{{dato.space_require}} {{dato.type_area}}</p>
                    <hr style="margin-top: -1%;">

                    {% if service is empty %}

                    {% else %}
                    
                    <label style="color: #f71e14;">Servicios: {% for item in service %}  </label>
                    <p class="text-right" style="margin-top: -2%; font-size: 18px;">{{item.name}} <br> {% endfor %}</p>
                    <hr>
                    
                    {% endif %}

                    <label style="color: #f71e14;">Total sin IVA:  </label>
                    <p class="text-right" style="">${{dato.storage_cost}}
                </div>
            </div>
            <div id="buttonquotationcellar" class="col-md-12">
                <center>
                    <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                    <input type="" name="" class="btn btn-primary btn-lg buttonboxindex" onclick="mostrarcapa('reservelogin');" value="Reservar" style="width: 100%;" />
                </center>
            </div>
        </div>

    </section>
    {% endif %}

    </body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    

</html>
