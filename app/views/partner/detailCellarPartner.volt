    
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index">EDITAR <span>BODEGA</span></h4>

</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>

<style type="text/css">
    body {
        font-family: 'Poppins';
    }

</style>

<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-sm-11">

    {% if dato is empty %}
    <br><br><h1>No se encontraron datos en tu busqueda.</h1>
    {% else  %} {% for item in dato %}
    <section id="mu-hero"  style="background-color: #fff">
        <div class="col-md-12">
            
            <form action="{{ url('partner/editCellarPartner') }}" method="post">
                <div class="row">
                    <center><h5>Descripción Bodega</h5></center><br>
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class="text-center">Nombre bodega</p>
                            <input type="hidden" name="id" value="{{item.id}}">
                            <input type="text" name="name" value="{{item.name}}" required>
                        </div>
                        <div class="form-group">
                            <p class="text-center">Tipo bodega</p>
                            <select name="cellar_type" style="background: white;" required>
                                <option value="Depósito píblico autorizado">Depósito píblico autorizado</option>
                                <option value="Patio">Patio</option>
                                <option value="Plata de silos">Planta de silos</option>
                                <option value="Zona franca">Zona franca</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <p class="text-center">Ciudad</p>
                            <select class="address" name="id_city" style="background: white;" id="id_city" >
                                {% if data is empty %}
                                <!-- No se encontraron direcciones -->
                                {% else %} {% for items in data %}
                                <option value="{{items.id_city}}">{{items.city}}</option>
                                {% endfor %} 
                                {% endif %}
                            </select>
                            <input type="hidden" name="id_departament" id="id_departament">
                        </div>
                        <div class="form-group">
                            <p class="text-center">Dirección</p>
                            <input type="text" name="address" value="{{item.address}}" required>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <p class="text-center">Descripción</p>
                            <textarea class="form-control" style="height: 285px;">
                                
                            </textarea>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                   <center><h5>Área y precios</h5></center><br>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Tipo de área</p>
                            <select name="type_area" style="background: white;" required>
                                <option value="Metros cuadrados">Metros cuadrados</option>
                                <option value="Metros cúbicos">Metros cúbicos</option>
                            </select>
                        </div>
                   </div>
                   <div class="col-md-2">
                       <div class="form-group">
                            <p class="text-center">Capacidad</p>
                            <input type="number" name="deposit_capacity" value="{{item.deposit_capacity}}" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Prioridad de cobro</p>
                            <select name="collection_frequency" style="background: white;" required>
                                <option>Semanal</option>
                                <option>Quincenal</option>
                                <option>Mensual</option>
                                <option>Anual</option>
                            </select>
                        </div>
                   </div>
                   <div class="col-md-2">
                       <div class="form-group">
                            <p class="text-center">Precio unitario</p>
                            <input type="number" name="storage_cost" value="{{item.storage_cost}}" required>
                        </div>
                   </div>
                   <div class="col-md-2">
                        <div class="form-group">
                            <p class="text-center"><br></p>
                            <input type="button" name="storage_cost" value="Eliminar" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E;">
                        </div>
                   </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <div class="col-md-4">
                       <div class="form-group">
                            <p class="text-center">Tiempo mínimo de reserva</p>
                            <input type=text" name="minimum_time" value="{{item.minimum_time}}" required>
                        </div>
                   </div>
                    <div class="col-md-4  pull-right">
                        <p class="text-center"><br></p>
                        <div style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar categoría</div>
                    </div>
                </div>
                <br><br><br>
                <div class="row">
                   <center><h5>Contacto supervisor</h5></center><br>
                   <div class="col-md-1">
                       <div class="form-group">
                            <img src="{{url('img/Assets_camara.png')}}" class="img-circle" style="border: 1px solid silver;">
                        </div>
                   </div>
                   <div class="col-md-2">
                        <div class="form-group">
                            <p class="text-center"><br></p>
                            <div style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar foto</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Nombre contacto</p>
                            <input type="text" name="name_contact" value="{{item.name_contact}}" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Teléfono contacto</p>
                            <input type="number" name="phone_contact" value="{{item.phone_contact}}" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Correo contacto</p>
                            <input type="email" name="email_contact" value="{{item.email_contact}}" required>
                        </div>
                   </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                   <center><h5>Horario de atención</h5></center><br>
                   <div class="col-md-2">
                        <p>Entre semana</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="weekday_opening" value="{{item.weekday_opening}}" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="weekday_closing" value="{{item.weekday_closing}}" required>
                   </div>
                   <div class="col-md-2">
                        <p>Domingos</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="sunday_opening" value="{{item.sunday_opening}}" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="sunday_closing" value="{{item.sunday_closing}}" required>
                   </div>
                </div>
                <div class="row">
                   <br>
                   <div class="col-md-2">
                        <p>Sábados</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="saturday_opening" value="{{item.saturday_opening}}" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="saturday_closing" value="{{item.saturday_closing}}" required>
                   </div>
                   <div class="col-md-2">
                        <p>Festivos</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="festive_opening" value="{{item.festive_opening}}" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="festive_closing" value="{{item.festive_closing}}" required>
                   </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                   <center><h5>Fotos</h5></center><br>
                   <div class="col-md-6">
                        <div type="text" name="" style="background-image: url('{{url('img/Assets_camara.png')}}'); border: 1px solid silver; cursor: pointer; background-repeat: no-repeat; background-size: 100% 100%; height:250px;"> </div>
                   </div>
                   <div class="col-md-3">
                        <div type="text" name="" style="background-image: url('{{url('img/Assets_camara.png')}}'); border: 1px solid silver; cursor: pointer; background-repeat: no-repeat; background-size: 100% 100%; height:120px;"> </div>
                   </div>
                   <div class="col-md-3">
                        <div type="text" name="" style="background-image: url('{{url('img/Assets_camara.png')}}'); border: 1px solid silver; cursor: pointer; background-repeat: no-repeat; background-size: 100% 100%; height:120px;"> </div>
                   </div>
                   <div class="col-md-3">
                        <div type="text" name="" style="background-image: url('{{url('img/Assets_camara.png')}}'); border: 1px solid silver; cursor: pointer; background-repeat: no-repeat; background-size: 100% 100%; margin-top: 4%; height:120px;"> </div>
                   </div>
                   <div class="col-md-3">
                        <div type="text" name="" style="background-image: url('{{url('img/Assets_camara.png')}}'); border: 1px solid silver; cursor: pointer; background-repeat: no-repeat; background-size: 100% 100%; margin-top: 4%; height:120px;"> </div>
                   </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-md-offset-3">
                        <p class="text-center"><br></p>
                        <div style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar foto</div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <p class="text-center"><br></p>
                            <input type="button" name="storage_cost" value="Eliminar foto" style="padding: 7px; color: white; background: #6E6E6E;">
                        </div>
                   </div>
                </div>
                <div class="row">
                   <center><h5>Video</h5></center><br>
                    <div class="col-md-6 col-md-offset-3">
                        <p class="text-center">Agrega la URL de un video</p>
                        <input type="text" name="video">
                    </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <center><h5>Servicios</h5></center><br>
                    <div class="col-md-3">
                        <p class="text-center">Servicio</p>
                        <select name="id_service" style="background: white;">
                           
                        </select>
                    </div>
                    <div class="col-md-2">
                        <p class="text-center">Valor unitario</p>
                       <input type="number" name="cost_service">
                    </div>
                    <div class="col-md-5">
                        <p class="text-center">Descripción</p>
                        <input type="text" name="description_service">
                    </div>
                    <div class="col-md-2">
                        <p><br></p>
                        <input type="button" name="storage_cost" value="Eliminar" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E;">
                    </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <div class="col-md-4  pull-right">
                        <p class="text-center"><br></p>
                        <div style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar servicio</div>
                    </div>
                </div><br>
                <div class="row">
                    <center><h5>Facilidades de depósito</h5></center><br>
                    <div class="col-md-5">
                        <p class="text-center">Tipo</p>
                        <select style="background: white;">
                            
                        </select>
                    </div>
                    <div class="col-md-5">
                        <p class="text-center">Facilidad</p>
                        <select style="background: white;">
                            
                        </select>
                    </div>
                    <div class="col-md-2">
                        <p><br></p>
                        <input type="button" name="storage_cost" value="Eliminar" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E;">
                    </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <center><h5>Distancias</h5></center><br>
                    <div class="col-md-3">
                        <p class="text-center">Agrega un punto o ubicación clave</p>
                        <input type="text" name="point_location">
                    </div>
                    <div class="col-md-4">
                        <p class="text-center">Agrega una distancia de tu bodega a ese punto</p>
                        <input type="text" name="point_location">
                    </div>
                    <div class="col-md-3">
                        <p class="text-center">Agrega un tiempo promerio de recorrido</p>
                        <input type="text" name="point_location">
                    </div>
                    <div class="col-md-2">
                        <p><br></p>
                        <input type="button" name="storage_cost" value="Eliminar" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E;">
                    </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <div class="col-md-4  pull-right">
                        <p class="text-center"><br></p>
                        <div style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar distancia</div>
                    </div>
                </div>
                <div class="row">
                    <hr style="height: 2px; background: #6E6E6E;">
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" style="background: #f71e14; width: 400px; text-align: center; padding: 7px; color: white; border-radius: 10px;"class="center-block">Actualizar bodega</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    {% endfor %}
    {% endif %} 

     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: -50%;">
       <canvas id="chart-area4"></canvas>
     </div>
         
</div>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
    $('.address').select2({
        
        });
    $('#id_city').val('{{item.id_city}}').trigger('change.select2');

</script>