<!DOCTYPE html>
<html>

  <body>

    {% if dato is empty %}
    No se encontraron direcciones
    {% else %}  {% for item in dato %}
    <section id="mu-hero" class="mu-hero-quotationcellar" style="background-color: white;">
        <div class="col-md-4 col-sm-4 col-md-offset-1 col-sm-offset-1 box_quotationcellar" style="">
            <form action="{{ url('quotation/billingTruck') }}" method="post">
                <input type="hidden" name="id" value="{{item.id}}">
                <center>
                    <h3 class="h3_quotationcellar" style="">
                        Tu reserva
                    </h3>
                </center>
                <div class="col-md-6">
                    <p class="p_quotation_cellar" style="">
                        <?php echo $t->_("boxindex2") ?>
                    </p>
                    <input style="background: white;" type="date" disabled min="<?php $hoy=date('Y-m-d'); echo $hoy;?>" value="{{item.initial_date}}" id="datepicker" name="initial_date">
                </div>
                <div class="col-md-6">
                    <p class="p_quotation_cellar" style="text-align: center;">
                          Hora
                    </p>
                    <input style="background: white; color: black;" disabled type="time" value="{{item.hour}}" max="23:59:00" min="00:00:00" id="datepicker" name="hour">
                </div>
                <div class="col-md-12">
                    <p class="p_quotation_cellar" style="text-align: center;">
                        Tipo de carga
                    </p>
                    <select class="form-control" id="datepicker" name="type_load" value="{{item.type_load}}" disabled>
                        <option value="{{item.type_load}}">{{item.type_load}}</option>
                        <option value="General">General</option>
                        <option value="Granel">Granel</option>
                        <option value="Peligrosa">Peligrosa</option>
                        <option value="Perecedera">Perecedera</option>
                        <option value="Frágil">Frágil</option>
                    </select>
                </div>
                <div class="col-md-12">
                    <p class="p_quotation_cellar" style="text-align: center;">
                        Tipo de transporte
                    </p>
                    <select class="form-control" id="datepicker" name="type_truck" value="{{item.type_truck}}" disabled>
                        <option value="{{item.type_truck}}">{{item.type_truck}}</option>
                        <option value="Turbo">Turbo</option>
                        <option value="Sencillo">Sencillo</option>
                        <option value="Minimula">Minimula</option>
                        <option value="Tractomula">Tractomula</option>
                    </select>
                </div>
                <!-- <div class="col-md-12" style="margin-top: 15px;">
                    <p class="pdos_quotation_cellar" style="">
                        <?php echo $t->_("boxindex4") ?>
                    </p>
                </div>
                <div class="col-md-12">
                    <table>
                        <tr>
                            <td><input disabled class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" id="defaultCheck" ></td>
                            <td><label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheck">Metros <br>cúbicos</label></td>
                            <td><div id="etiqueta" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; "><span id="temp1">0</span></div>
                            <div class="col-xs-1 col-md-1" style="color: #f71e14; ">m<sup>3</sup></div>
                            <input style="" disabled id=""  type="range" required min="0" value="0" max="10000"  step="100" autocomplete="off"></td>

                        </tr>

                        <tr>
                            <td><input class="form-check-input" type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" id="defaultCheckm" style="width: 30px" checked> </td>
                            <td><label style="font-size: 12px; margin-left: 10px;" class="form-check-label" for="defaultCheckm">Area <br>cuadrada</label></td>
                            <td><div id="etiqueta" class="col-xs-1 col-md-2 col-md-offset-8" style="color: #f71e14; "><span id="temp">{{dato.space_require}}</span></div>
                            <div class="col-xs-1 col-md-1" style="color: #f71e14; ">m<sup>2</sup></div>
                            <input style="" id="deposit_capacity" name="deposit_capacity" step="100" disabled type="range" value="{{dato.space_require}}" min="0" max="{{dato.deposit_capacity}}" autocomplete="off"></td>

                        </tr>
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
                </div> -->
                <div class="col-md-12" style="border-top: 1px solid #e3ddd8; margin-top: 5%;">
                    <div class="col-xs-2 col-md-2 total_quotationcellar" style="">
                        Total 
                    </div>
                    <div class="col-xs-10 col-md-10">
                        <h1 style="font-weight: bold; text-align: center;">${{item.cost}}</h1>
                        <input type="hidden" name="storage_cost" value="{{item.cost}}">
                        <!-- <input type="hidden" name="deposit_capacity" value="{{dato.deposit_capacity}}">
                        <input type="hidden" name="service" value=""> -->
                        
                    </div>
                  
                </div>
                <div class="col-md-12">
                    <center>
                        <!-- <input class="buttonboxindex" type="button" name="" value="<?php echo $t->_('boxindex7') ?>"> -->
                        <input type="" name="" class="btn btn-primary btn-lg buttonboxindex" onclick="mostrarcapa('reservelogin');" value="Reservar" style="margin: 20px 0px; padding: 10px; max-width: 100%; width: 100%;" />
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
                    <label style="color: #f71e14;">Ciudad Origen: </label>
                    <p class="text-right" style="">{{item.name_city}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Ciudad Destino: </label>
                    <p class="text-right" style="">{{item.name_city2}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Fecha de inicio: </label>
                    <p class="text-right" style="">{{item.initial_date}}</p>
                    <hr style="margin-top: -1%;">
                    <label style="color: #f71e14;">Hora: </label>
                    <p class="text-right" style="">{{item.hour}}</p>
                    <hr style="margin-top: -1%;">

                    {% if service is empty %}

                    {% else %}
                    
                    <label style="color: #f71e14;">Servicios: {% for item in service %}  </label>
                    <p class="text-right" style="margin-top: -2%; font-size: 18px;">{{item.name}} <br> {% endfor %}</p>
                    <hr>
                    
                    {% endif %}

                    <label style="color: #f71e14;">Total:  </label>
                    <p class="text-right" style="">${{item.cost}}

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
    {% endfor %} 
    {% endif %}

    </body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

</html>
