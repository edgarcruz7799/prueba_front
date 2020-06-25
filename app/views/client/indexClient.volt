    
{{ content() }}

<div class="col-md-8" style="">
    <h4 class="section-title h4_index"><?php echo $t->_("textSalutationCommerce") ?> <span>{{username}}</span>!</h4>
    <p class="section-text p_index"><?php echo $t->_("textWelcomeCommerce_1") ?> <strong>ALMAGRARIO</strong><br><?php echo $t->_("textWelcomeCommerce_2") ?></p>
</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>

<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-md-11 col-xs-12">

    <div class="col-md-12" style="border-bottom: 1px solid;">
        <div class="row col-md-12 pull-right">
            <div class="row">
                <ul class="nav nav-tabs pull-left ul_indexclient">
                    <li id="lint" class="active" onclick="mostrar('nt'); mostrarli('lint')"><a><b><?php echo $t->_("No_Transactions") ?></b></a></li>
                </ul>
                <ul class="nav nav-tabs pull-right">
                    <li style=""><a id="select1" href="{{url('client/indexClient?search=1')}}"><b><?php echo $t->_("Today") ?></b></a></li>
                    <li class="activesegselect" style=""><a id="select2" href="{{url('client/indexClient?search=2')}}"><b><?php echo $t->_("Last_7_days") ?></b></a></li>
                    <li style=""><a id="select3" href="{{url('client/indexClient?search=3')}}"><b><?php echo $t->_("Last_30_days") ?></b></a></li>
                    <li style=""><a id="buscarPersonalizado"href="#"><b><?php echo $t->_("Personalized") ?></b></a></li>
                </ul>
            </div>    
            
            <ul>
            {{ form('client/indexClient', 'role': 'form', 'id': 'search') }}
                <div class="row hidden"  id="grillaFormulario">    
                    <div id="fechaini" class="col-sm-2"><br>
                        <center><h5 id="fechainih"><?php echo $t->_("Start_date") ?></h5></center>
                    </div>
                    <div id="fechaini" class="col-sm-3"><br>    
                        <input style="padding: 0px;" id="fechatextini" type="date" id="" name="startdate" style="min-height:25px;" class="input-xlarge" required>
                    </div>
                    <div id="fechafin" class="col-sm-2"><br>
                        <center><h5 id="fechafinh"><?php echo $t->_("End_date") ?></h5></center>
                    </div>
                    <div id="fechaini" class="col-sm-3"><br>
                        <input style="padding: 0px;" id="fechatextfin" type="date" id="" name="enddate" style="min-height:25px;" class="input-xlarge" required> 
                    </div>
                    <div id="fechaini" class="col-sm-1"><br>
                        <button id="buscaPorFecha" style="margin-top: -6px; margin-bottom: -5px; background: white;" class="glyphicon glyphicon-search"></button>
                    </div>
                    <div id="fechaini" class="col-sm-1"><br>
                        <button id="cerrarPorFecha" style="margin-top: -6px; margin-bottom: -5px; background: white;" >X</button>
                    </div>
                </div>  
            {{ end_form() }}        
            </ul>
        </div>
    </div>
    {% if dato is empty %}
    <!-- No se encontraron direcciones -->
    {% else  %} {% for item in dato %}
    <section id="mu-hero"  style="background-color: #fff">
        <div class="col-md-12 div_indexclient" style="">
            
            <div class="col-md-3">
                <img class="img_indexclient" style=""  src="{{item.image}}">
            </div>

            <form action="{{ url('client/detailReserveClient') }}" method="post">
                <input type="hidden" name="id" value="{{item.id}}">
                <input type="hidden" name="id_client" value="{{item.id_client}}">
                <div class="col-md-5">
                    <h3 style="color: black;">{{item.name}}</h3>
                    <p><b style="color:#f71e14;">{{item.city}}</b> {{item.address}}</p>
                    <p class="status p_indexclient"><b>{{item.status}}</b></p>
                    <p style="margin-top: 7% ; font-size: 16px; " class="valor">Valor de reserva</p>
                        <h2 style=" margin-top: -2%;" class="cost">$ {{item.storage_cost}}</h2>
                </div>

                <div class="col-md-4 col-xs-12" style="border: 1px solid silver; border-radius: 15px; margin-top: 3%; padding: 10px;">
                    <div class="col-md-6 col-xs-6 div_dateclient">
                        <p style="color:#f71e14;">Fecha ingreso</p>
                        <h1 style="; font-size: 350%; color: black; margin-top: -8%;">{{item.initial_day}}</h1>
                        <p style="; color: #f71e14; margin-top: -12%;">{{item.initial_month}}</p>
                    </div>
                    
                    <div style="" class="divr" ></div>

                    <div class="col-md-6 col-xs-6 div_dateclient">
                        <p style="color:#f71e14;">Fecha Salida</p>
                        <h1 style="; font-size: 350%; color: black; margin-top: -8%;">{{item.final_day}}</h1>
                        <p style="; color: #f71e14; margin-top: -12%;">{{item.final_month}}</p>
                    </div>
                    <div class="col-md-12 col-xs-12">
                        <hr style="width: 125%; margin-left: -13%; margin-top: -3%;" class="divm">
                    </div>
                    <div class="col-md-6 col-xs-6 text-center">
                        <h3 style="margin-top: -4%; color: black">{{item.initial_year}}</h3>
                    </div>
                    <div class="col-md-6 col-xs-6 text-center">
                        <h3 style="margin-top: -4%;color: black">{{item.final_year}}</h3>
                    </div>
                </div>
                <button type="submit" class="col-md-3 text-center gestion" id="enviar" style="">
                    Detalle reserva       
                </button>
            </form>
        </div>
    </section>
       {% endfor %}
    {% endif %}
         
</div>
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#buscarPersonalizado").click(function(){
            $("#grillaFormulario").removeClass("hidden");
        });

        $("#cerrarPorFecha").click(function(){
            $("#grillaFormulario").addClass("hidden");
        });
    });
    
</script>
