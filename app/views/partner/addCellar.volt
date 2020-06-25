    
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index">CREAR <span>BODEGA</span></h4>

</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>

<style type="text/css">
    body {
        font-family: 'Poppins';
    }

</style>

<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-sm-11">


    <section id="mu-hero"  style="background-color: #fff">
        <div class="col-md-12">
            
            <form action="{{ url('partner/addCellar') }}" method="post">
                <div class="row">
                    <center><h5>Descripción Bodega</h5></center><br>
                    <div class="col-md-4">
                        <div class="form-group">
                            <p class="text-center">Nombre bodega</p>
                            <input type="text" name="name"  required>
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
                            <select class="address" name="id_city" style="background: white;" id="id_city" required>
                                {% if data is empty %}
                                <!-- No se encontraron direcciones -->
                                {% else %} {% for item in data %}
                                <option value="{{item.id_city}}">{{item.city}}</option>
                                {% endfor %} 
                                {% endif %}
                            </select>
                            <input type="hidden" name="id_departament" id="id_departament">
                        </div>
                        <div class="form-group">
                            <p class="text-center">Dirección</p>
                            <input type="text" name="address"  required>
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
                            <select id="type_area" name="type_area" style="background: white;" required>
                                <option value="Metros cuadrados">Metros cuadrados</option>
                                <option value="Metros cúbicos">Metros cúbicos</option>
                            </select>
                        </div>
                   </div>
                   <div class="col-md-2">
                       <div class="form-group">
                            <p class="text-center">Capacidad</p>
                            <input id="deposit_capacity" name="deposit_capacity" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Prioridad de cobro</p>
                            <select id="collection_frequency" name="collection_frequency" style="background: white;" required>
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
                            <input id="storage_cost" name="storage_cost" type="number" required>
                        </div>
                   </div>
                   <div class="col-md-2">
                        <div class="form-group">
                            <p class="text-center"><br></p>
                            <input type="button" value="Eliminar" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E;">
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
                            <input id="minimum_time" name="minimum_time" type=text" required>
                        </div>
                   </div>
                    <div class="col-md-4  pull-right">
                        <p class="text-center"><br></p>
                        <div id="button-add2" style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar categoría</div>
                    </div>
                </div>
                <div class="row">
                  <table id="table-content" class="table">

                  </table>
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
                            <input type="text" name="name_contact" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Teléfono contacto</p>
                            <input type="number" name="phone_contact" required>
                        </div>
                   </div>
                   <div class="col-md-3">
                       <div class="form-group">
                            <p class="text-center">Correo contacto</p>
                            <input type="email" name="email_contact" required>
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
                        <input type="time" name="weekday_opening" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="weekday_closing" required>
                   </div>
                   <div class="col-md-2">
                        <p>Domingos</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="sunday_opening" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="sunday_closing" required>
                   </div>
                </div>
                <div class="row">
                   <br>
                   <div class="col-md-2">
                        <p>Sábados</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="saturday_opening" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="saturday_closing" required>
                   </div>
                   <div class="col-md-2">
                        <p>Festivos</p>
                   </div>
                    <div class="col-md-2">
                        <input type="time" name="festive_opening" required>
                   </div>
                   <div class="col-md-2">
                        <input type="time" name="festive_closing" required>
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
                        <select id="id_service" style="background: white;">
                           <option value="1">Diario</option>
                           <option value="2">Semanal</option>
                           <option value="3">Quincenal</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <p class="text-center">Valor unitario</p>
                       <input id="cost_service" type="number">
                    </div>
                    <div class="col-md-5">
                        <p class="text-center">Descripción</p>
                        <input id="description_service" type="text">
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
                        <div id="button-service" style="background: #f71e14; text-align: center; padding: 7px; color: white; border-radius: 10px; cursor: pointer;">Agregar servicio</div>
                    </div>
                </div><br>
                <div class="row">
                  <table id="table-service" class="table">

                  </table>
                </div>
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
                        <button type="submit" style="background: #f71e14; width: 400px; text-align: center; padding: 7px; color: white; border-radius: 10px;"class="center-block">Crear bodega</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
 

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
    $(".address").select2({
    placeholder: "Select a state",
    allowClear: true
}); 

</script>

<script type="text/javascript">
    $('#id_city').change(function(){
        $('#id_departament').val('{{item.id_departament}}');
    });
</script>

<!--<script type="text/javascript">
  (function($){
  var index = 1;
  $btnAdd = $("#button-add2");
  $table_category = $("#table-content");

  $btnRemove = $(".button-remove");

  $btnAdd.on("click", function(){

      var type_area = $("#type_area option:selected").val();
      var deposit_capacity = $("#deposit_capacity").val();
      var collection_frequency = $("#collection_frequency option:selected").val();
      var storage_cost = $("#storage_cost").val();
      var minimum_time = $("#minimum_time").val();

      var tpl =   '<tr>'+
                  '<td class="col-md-2 text-center">Tipo Area'+
                      '<input readonly  type="number" name="type_area[]" id="type_area" value="'+type_area+'">'+
                  '</td>'+
                  '<td class="col-md-2 text-center">Capacidad'+
                      '<input readonly  type="number" name="deposit_capacity[]" id="deposit_capacity" value="'+deposit_capacity+'">'+
                  '</td>'+
                  '<td class="col-md-2 text-center">Cobro'+
                      '<input readonly  type="number" name="collection_frequency[]" id="collection_frequency" value="'+collection_frequency+'">'+
                  '</td>'+
                  '<td class="col-md-2 text-center">Precio unitario'+
                      '<input readonly  type="number" name="storage_cost[]" id="storage_cost" value="'+storage_cost+'">'+
                  '</td>'+
                  '<td class="col-md-2 text-center">Tiempo mínimo'+
                      '<input readonly  type="number" name="minimum_time[]" id="minimum_time" value="'+minimum_time+'">'+
                  '</td>'+
                  '<td class="col-md-2 text-center"><br>'+
                      '<button type="button" class="button-remove" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E; data-index="'+index+'">Eliminar</button>'+
                  '</td></tr>';
      $table_category.append(tpl);
      index++;
  });

  $('body').on("click", '.button-remove' , function(){
      var index = $(this).data('index');
      $(this).parents('tr').remove();
  });


  })(jQuery);
</script>-->

<script type="text/javascript">
  (function($){
      var index = 1;
      $btnservice = $("#button-service");
      $table = $("#table-service");

      $btnRemove = $(".button-remove");

      $btnservice.on("click", function(){

          var id_service = $("#id_service option:selected").val();
          var service = $("#id_service option:selected").text();
          var cost_service = $("#cost_service ").val();
          var description_service = $("#description_service").val();

          var tpl =   '<tr>'+
                      '<td class="col-md-3">'+
                          '<input readonly  type="text" value="'+service+'"><input readonly  type="hidden" name="id_service[]" id="id_service" value="'+id_service+'">'+
                      '</td>'+
                      '<td class="col-md-2">'+
                          '<input readonly  type="number" name="cost_service[]" id="cost_service" value="'+cost_service+'">'+
                      '</td>'+
                      '<td class="col-md-5">'+
                          '<input readonly  type="number" name="description_service[]" id="description_service" value="'+description_service+'">'+
                      '</td>'+
                      '<td class="col-md-2">'+
                          '<button type="button" class="button-remove" style="border-radius: 10px 10px 10px 10px; -moz-border-radius: 10px 10px 10px 10px; -webkit-border-radius: 10px 10px 10px 10px; border: 3px double #f7f2f7; color: white; background: #6E6E6E; data-index="'+index+'">Eliminar</button>'+
                      '</td></tr>';
          $table.append(tpl);
          index++;
      });

      $('body').on("click", '.button-remove' , function(){
          var index = $(this).data('index');
          $(this).parents('tr').remove();
      });


  })(jQuery);
</script>
