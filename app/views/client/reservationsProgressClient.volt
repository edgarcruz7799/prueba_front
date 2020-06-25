
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index"> RESERVAS <span>EN CURSO</span> </h4>
</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>

<style type="text/css" media="screen">
    #fechainih{
      font-size: 14px;
    }

    #fechafinh{
      font-size: 14px;
    }
    
</style>

<div class="col-md-12" style="margin-bottom: 20px;">
	<form action="{{ url('client/reservationsProgressClient') }}" method="post">
        <div class="row">
            <div class="col-md-12 col-sm-12">                

                <div class="col-md-3">
                    <p style="text-align: center; font-size: 18px;">
                        <?php echo $t->_("boxindex2") ?>    
                    </p>
                    <input style="" id="datepicker" required value="<?php $hoy=date('Y-m-d'); echo $hoy;?>"  type="date" name="initial_date">
                </div>

                <div class="col-md-3">
                    <p style="text-align: center; font-size: 18px;">
                        <?php echo $t->_("boxindex3") ?>
                    </p>
                    <input style="" id="datepicker1" required value="<?php $hoy=date('Y-m-d'); echo $hoy;?>"  type="date" name="final_date">
                    
                </div>
                <div class="col-md-3">
                    <p style="text-align: center; font-size: 18px;">
                        Estado
                    </p>
                    <select name="status">
                    	<option value="Por aceptar">Por aceptar</option>
                    	<option value="Aceptada pagada">Aceptada pagada</option>
                    	<option value="En curso">En curso</option>
                        <option value="Todas">Todas</option>
                    </select>

                </div>

                <div class="col-md-3">
                    <input type="submit" name="" class="btn btn-primary btn-lg buttonboxindex" value="<?php echo $t->_('boxindex7') ?>" style="width: 100%; margin-top: 37px;" />
                </div>
            </div>
        </div>
    </form>
</div>   

<div id="nt" style="display: block;" class="trans col-sm-11 col-xs-12">

    <div class="col-sm-12" style="border-bottom: 1px solid;">
        <div class="row col-md-12 pull-right">
            
        </div>
    </div>
    {% if dato is empty %}
    <br><br><h1>No se encontraron datos en tu busqueda.</h1>
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
                    <p style="" class="status p_indexclient"><b>{{item.status}}</b></p>
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