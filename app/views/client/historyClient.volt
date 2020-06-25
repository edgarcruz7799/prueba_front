
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index">  <span>HISTORIAL</span> </h4>
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

<div id="nt" style="display: block;" class="trans col-sm-11 col-xs-12">

    <div class="col-sm-12" style="border-bottom: 1px solid;">
        <div class="row col-sm-12 pull-right">
            <div class="row">
                <ul class="nav nav-tabs pull-left ul_indexclient">
                    <li id="lint" class="active" onclick="mostrar('nt'); mostrarli('lint')"><a><b> RESERVAS REALIZADAS </b></a></li>
                </ul>
                <ul class="nav nav-tabs pull-right">
                    <li style=""><a id="select1" href="{{url('transaction/reportsCommerce?search=1')}}"><b> ÚLTIMO MES </b></a></li>
                    <li class="activesegselect" style=""><a id="select2" href="{{url('transaction/reportsCommerce?search=2')}}"><b> ÚLTIMOS 2 MESES </b></a></li>
                    <li style=""><a id="select3" href="{{url('transaction/reportsCommerce?search=3')}}"><b> ÚLTIMOS 3 MESES</b></a></li>
                    <li style=""><a id="buscarPersonalizado"href="#"><b><?php echo $t->_("Personalized") ?></b></a></li>
                </ul>
            </div>    
            
            <!--Buscador personalizado-->
            <ul>
            {{ form('transaction/reports', 'role': 'form', 'id': 'search') }}
                <div class="row hidden"  id="grillaFormulario">    
                    <div id="fechaini" class="col-sm-2"><br>
                        <center><h5 id="fechainih"><?php echo $t->_("Start_date") ?></h5></center>
                    </div>
                    <div id="fechaini" class="col-sm-3"><br>    
                        <input id="fechatextini" type="date" id="username" name="startdate" placeholder="" style="min-height:25px;" class="input-xlarge" required>   
                    </div>
                    <div id="fechafin" class="col-sm-2"><br>
                        <center><h5 id="fechafinh"><?php echo $t->_("End_date") ?></h5></center>
                    </div>
                    <div id="fechaini" class="col-sm-3"><br>
                        <input id="fechatextfin" type="date" id="username" name="enddate" placeholder="" style="min-height:25px;" class="input-xlarge" required> 
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

    <br>

    <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
        <canvas id="chart-area4"></canvas>
    </div>

    <div class="col-md-12 div_historyclient">
        <div class="col-md-4 div_historyclientuno">
            <center style="color: red;">
                N° DE RESERVAS
            </center>
            <center>
                
            </center>
        </div>

        <div class="col-md-4 div_historyclientdos">
            <center style="color: red;">
                TOTAL PAGO EN EL PERIODO
            </center>
            <center>
                <img src="{{url('img/Assets_SignoPesos.png')}}">
            </center>
        </div>

        <div class="col-md-4 div_historyclienttres">
            <center style="color: red;">
                BODEGAS
            </center>
            <center>
                <img src="{{url('img/Assets_Almacenamiento_rojo.png')}}">
            </center>
        </div>
    </div>

</div>
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


<script type="text/javascript">
    $('.address').select2({
        
        });

    $('#ciudad').val('{{item.id_select}}').trigger('change.select2');
     
    $('.address').change(function(){
            this.form.submit();
        });
      

</script>

<script type="text/javascript">
    $(document).ready(function(){
    
        $("#mos").click(function(){
            var esVisible = $("#metros").is(":hidden");
            if(esVisible){
                $("#metros").show();
                console.log(esVisible);
            }else{
                $("#metros").css("display", "none");
                console.log(noVisible);
            }

        });    
    
    });
</script>

<script type="text/javascript">

    document.getElementById('datepicker').value = '{{item.initial_date}}';
    document.getElementById('datepicker1').value = '{{item.final_date}}';
    document.getElementById('deposit_capacity').value = '{{item.space_require}}';
    document.getElementById('space').innerHTML =  '{{item.space_require}} m <sup>2</sup>';
    

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
    $(document).ready(function(){
        $('#deposit_capacity').change(function(){
            this.form.submit();
        })
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
<script type="text/javascript">
    $(document).ready(function(){
        $('#datepicker').change(function(){
            $('.initial_date').val(datepicker.value);
        });
        $('#datepicker1').change(function(){
            $('.final_date').val(datepicker1.value);
        });
        $('#deposit_capacity').change(function(){
            $('.space_require').val(deposit_capacity.value);
        });
    });
</script>

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

<script>


    var array = []
    var month_1 = "<?php echo $t->_("textMonth_1") ?>"
    var month_2 = "<?php echo $t->_("textMonth_2") ?>"
    var month_3 = "<?php echo $t->_("textMonth_3") ?>"
    var month_4 = "<?php echo $t->_("textMonth_4") ?>"
    var month_5 = "<?php echo $t->_("textMonth_5") ?>"
    var month_6 = "<?php echo $t->_("textMonth_6") ?>"
    var month_7 = "<?php echo $t->_("textMonth_7") ?>"
    var month_8 = "<?php echo $t->_("textMonth_8") ?>"
    var month_9 = "<?php echo $t->_("textMonth_9") ?>"
    var month_10 = "<?php echo $t->_("textMonth_10") ?>"
    var month_11 = "<?php echo $t->_("textMonth_11") ?>"
    var month_12 = "<?php echo $t->_("textMonth_12") ?>"
    {% if dato is empty %}

    {% else %}
        {% for item in dato.reports %}
            for (i = 0; i<=11; i++){
                if({{ item.month }} == i+1){
                   // number_transactions = number_transactions+{{item.number_transactions}}+",";
                   if (array[i] == 0 || array[i] == null) {
                        array[i]={{item.number_transactions}};
                   }       
                } else {
                   if (array[i] == 0 || array[i] == null) {
                        array[i]=0;
                   } 
                }
            }
        {% endfor %}
    {% endif %}


    var lineChartData = {
        labels : [month_1,month_2,month_3,month_4,month_5,month_6,month_7,month_8,month_9,month_10,month_11,month_12],
        datasets : [
            {
                label: "Primera serie de datos",
                fillColor : "rgb(25,148,168)", //color de fondo este sin trasparencia
                strokeColor : "rgb(25,148,168)", //color de borde
                pointColor : "rgb(25,148,168)", //color de punto
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "rgba(220,220,220,1)",
                data : array
            },
            {
                label: "",
                fillColor : "rgba(151,187,205,0.3)",
                strokeColor : "transparent",
                pointColor : "transparent",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "transparent",
                data : [40,40,40,40,40,40,40,40,40,40,40,40]
            }
        ]

    }

    var ctx4 = document.getElementById("chart-area4").getContext("2d");
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive:true});
</script>