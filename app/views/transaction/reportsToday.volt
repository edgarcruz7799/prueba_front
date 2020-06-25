    
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index"><span>RESERVAS </span>DE HOY </h4>
</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>
<style type="text/css">
    @media (max-width: 2560px) {
        .gestion{
            margin-top: -4%!important;
        }

        .divr{
            margin-top: -3%!important;
            height: 162px!important;
        }
        .divm{
            width: 114.5%!important;
            margin-left: -7%!important;
        }

        
    }

    @media (max-width: 1210px) {
        .gestion{
            margin-top: -5%!important;
        }
        .divr{
            margin-top: -4%!important;
            height: 183px!important;
        }
        .divm{
            width: 125%; 
            margin-left: -13%; 
            margin-top: -3%;;
        }
    }

    .status_cancel {
        color: : silver!important;
    }
 
</style>

<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-sm-11">

    <div class="col-sm-12" style="border-bottom: 1px solid; height: 30px;">
        <div class="row col-sm-12 pull-right">
            <div class="row">
                <ul class="nav nav-tabs pull-left">
                    <li id="lint" class="active" onclick="mostrar('nt'); mostrarli('lint')"><a><b><?php echo $t->_("No_Transactions") ?></b></a></li>
                </ul>
                <ul class="nav nav-tabs pull-right">
                    <li ><a id="select1" style="color:#f71e14" href="{{url('transaction/reportsToday')}}"><b><?php echo $t->_("Today") ?></b></a></li>
                    <li class="activesegselect" style=""><a id="select2" href="{{url('transaction/reportsLastDay')}}"><b><?php echo $t->_("Last_7_days") ?></b></a></li>
                    <li style=""><a id="select3" href="{{url('transaction/reportsLastMonth')}}"><b><?php echo $t->_("Last_30_days") ?></b></a></li>
                    <li style=""><a id="buscarPersonalizado"href="#"><b><?php echo $t->_("Personalized") ?></b></a></li>
                </ul>
            </div>    
            
            <ul>
            {{ form('transaction/reportsCommerce', 'role': 'form', 'id': 'search') }}
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
        <div class="col-md-12" style=" border: 1px solid silver; margin-top: 30px; border-radius: 35px;">
            
            <div class="col-md-3">
                <img style="margin-left: -31px; border-radius: 35px 0 0 35px; width: 280px; height: 260px;"  src="{{url('')}}{{item.image}}">
            </div>

            <form action="{{ url('client/detailReserveClient') }}" method="post">
                <input type="hidden" name="id" value="{{item.id}}">
                <input type="hidden" name="id_client" value="{{item.id_client}}">
                <div class="col-md-5">
                    <h3 style="color: black;">{{item.name}}</h3>
                    <p><b style="color:#f71e14;">{{item.city}}</b> {{item.address}}</p>
                    <p style="border: 2px solid #04B431; border-radius: 35px; padding: 2px; background: #D8D8D8; color: #04B431; width: 150px; text-align: center;" class="status"><b>{{item.status}}</b></p>
                    <p style="margin-top: 7% ; font-size: 16px; " class="valor">Valor de reserva</p>
                        <h2 style=" margin-top: -2%;" class="cost">$ {{item.storage_cost}}</h2>
                </div>

                <div class="col-md-4" style="border: 1px solid silver; border-radius: 15px; margin-top: 3%; padding: 10px;">
                    <div class="col-md-6 text-center">
                        <p style="color:#f71e14;">Fecha ingreso</p>
                        <h1 style="; font-size: 350%; color: black; margin-top: -8%;">{{item.initial_day}}</h1>
                        <p style="; color: #f71e14; margin-top: -12%;">{{item.initial_month}}</p>
                    </div>
                    
                    <div style="border-left: 1px solid silver; height: 183px; position: absolute; left: 50%; margin-top: -4%; " class="divr" ></div>
                    <div class="col-md-6 text-center">
                        <p style="color:#f71e14;">Fecha Salida</p>
                        <h1 style="; font-size: 350%; color: black; margin-top: -8%;">{{item.final_day}}</h1>
                        <p style="; color: #f71e14; margin-top: -12%;">{{item.final_month}}</p>
                    </div>
                    <div class="col-md-12">
                        <hr style="width: 125%; margin-left: -13%; margin-top: -3%;" class="divm">
                    </div>
                    <div class="col-md-6 text-center">
                        <h3 style="margin-top: -4%; color: black">{{item.initial_year}}</h3>
                    </div>
                    <div class="col-md-6 text-center">
                        <h3 style="margin-top: -4%;color: black">{{item.final_year}}</h3>
                    </div>
                </div>
                <button type="submit" class="col-md-3 text-center gestion" id="enviar" style="margin-left: 71.3%; margin-top: -5%; color: white; border-radius: 10px; padding: 5px; background: #f71e14;">
                    Detalle reserva       
                </button>
            </form>
        </div>
    </section>
       {% endfor %}
    {% endif %}  

     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
       <canvas id="chart-area4"></canvas>
     </div>
         
</div>
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<script type="text/javascript">

    
    
</script>