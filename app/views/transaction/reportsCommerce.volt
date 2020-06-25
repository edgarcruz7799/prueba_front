
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

<div class="col-sm-12 container contenido">
    <div class="col-md-12">
        <h4 class="section-title h4_reports"> <?php echo $t->_("Reportsx") ?> </h4>
    </div>
  <!-- <div class="row headhed sup" id="divleg">
    <legend id="" class="legendd"><b><img src="{{url('img/admin_menu-1.png')}}"><?php echo $t->_("Reportsx") ?></b><h5 class="neg"><?php echo $t->_("Business") ?></h5></legend>
  </div> -->
  <div class="sup navv">
      <ul class="nav nav-tabs">
        <li id="lint" class="active" onclick="mostrar('nt'); mostrarli('lint')"><a href="#"><b><?php echo $t->_("No_Transactions") ?></b></a></li>
        <li id="livr" class="" onclick="mostrar('vr'); mostrarli('livr')"><a href="#"><b><?php echo $t->_("Value_Collected") ?></b></a></li>
        <li id="licl" class="" onclick="mostrar('cl'); mostrarli('licl')"><a href="#"><b><?php echo $t->_("customers") ?></b></a></li>
      </ul>
  </div>



<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-sm-11">

    <div id="notrans" class="vall row col-sm-6">
        <div class="col-sm-12">
            <img src="{{url('img/repetir.svg')}}">
            <span id="notransaccionh"><b>{{ dato.count_transaction }}</b><b id="cop">cop</b></span>
            <!-- <p id="p2"><b style="color: red;">12%</b><?php echo $t->_("Since_last_week") ?></p> -->
        </div>
    </div>

    <div class="col-sm-12">
        <div class="row col-sm-12 pull-right">
            <div class="row">
            <ul class="nav nav-tabs pull-right">
            <li style=""><a id="select1" href="{{url('transaction/reportsCommerce?search=1')}}"><b><?php echo $t->_("Today") ?></b></a></li>
            <li class="activesegselect" style=""><a id="select2" href="{{url('transaction/reportsCommerce?search=2')}}"><b><?php echo $t->_("Last_7_days") ?></b></a></li>
            <li style=""><a id="select3" href="{{url('transaction/reportsCommerce?search=3')}}"><b><?php echo $t->_("Last_30_days") ?></b></a></li>
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

     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
       <canvas id="chart-area4"></canvas>
     </div>

      <div id="divtable" class="table-responsive">
      <!--Inicio de la tabla-->
          <table class="table table-striped">
            <thead id="theadid">
              <tr>
                <th scope="col">ID</th>
                <th scope="col"><?php echo $t->_("Description") ?></th>
                <th scope="col"><?php echo $t->_("First_namet") ?></th>
                <th scope="col"><?php echo $t->_("Payment_type") ?></th>
                <th scope="col"><?php echo $t->_("Payment_date") ?></th>
                <th scope="col"><?php echo $t->_("Value") ?></th>
                <th scope="col"><?php echo $t->_("Statee") ?></th>
              </tr>
            </thead>
            <tbody id="tbodyid">
                {% if dato is empty %}
                    <!-- vacio... -->
                {% else %}
                    {% for item in dato.transactions %}
                        <tr>
                            <th scope="row"><a href="{{url('transaction/detailtransaction?pin=')}}{{ item.pin }}"># {{ item.pin }}</a></th>
                            <td>{{ item.description }}</td>
                            <td>{{ item.name_client }}</td>
                            <td>Efectivo</td>
                            <td>{{ item.date}}</td>
                            <td>{{ item.amount}}</td>
                            <td>{{ item.state}} 
                                <a href="{{url('transaction/detailtransaction?pin=')}}{{ item.pin }}"><img src="{{url('img/Admin-5.png')}}"></a> 
                            </td>                                               
                        </tr>
                    {% endfor %}
              {% endif %}
            </tbody>
          </table> 
        <!--Fin de la tabla-->
     </div>         
</div>



<!--CONTENIDO PARA PESTAÑA VALOR RECAUDADO-->

<div id="vr" style="display: block;" class="trans col-sm-11">

    <div id="notrans" class="vall row col-sm-6">
        <div class="col-sm-12">
            <img src="{{url('img/repetir.svg')}}">
            <span id="notransaccionh"><b>{{ dato.total_ammount }}</b><b id="cop">cop</b></span>
            <!-- <p id="p2"><b style="color: red;">12%</b><?php echo $t->_("Since_last_week") ?></p> -->
        </div>
    </div>

    <div class="col-sm-12">
        <div class="row col-sm-12 pull-right">
            <div class="row">
            <ul class="nav nav-tabs pull-right">
            <li style=""><a id="select1" href="{{url('transaction/reportsCommerceValue?search=1')}}"><b><?php echo $t->_("Today") ?></b></a></li>
            <li class="activesegselect" style=""><a id="select2" href="{{url('transaction/reportsCommerceValue?search=2')}}"><b><?php echo $t->_("Last_7_days") ?></b></a></li>
            <li style=""><a id="select3" href="{{url('transaction/reportsCommerceValue?search=3')}}"><b><?php echo $t->_("Last_30_days") ?></b></a></li>
            <li style=""><a id="buscarPersonalizado2"href="#"><b><?php echo $t->_("Personalized") ?></b></a></li>
            </ul>
            </div>    
            
            <ul>
            {{ form('transaction/reportsCommerceValue', 'role': 'form', 'id': 'search') }}
                <div class="row hidden"  id="grillaFormulario2">    
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
                        <button id="cerrarPorFecha2" style="margin-top: -6px; margin-bottom: -5px; background: white;" >X</button>
                    </div>
                </div>  
            {{ end_form() }}        
            </ul>
        </div>
    </div>

     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
       <canvas id="valor-recaudo"></canvas>
     </div>

      <div id="divtable" class="table-responsive">
      <!--Inicio de la tabla-->
          <table class="table table-striped">
            <thead id="theadid">
              <tr>
                <th scope="col">ID</th>
                <th scope="col"><?php echo $t->_("Description") ?></th>
                <th scope="col"><?php echo $t->_("First_namet") ?></th>
                <th scope="col"><?php echo $t->_("Payment_type") ?></th>
                <th scope="col"><?php echo $t->_("Payment_date") ?></th>
                <th scope="col"><?php echo $t->_("Value") ?></th>
                <th scope="col"><?php echo $t->_("Statee") ?></th>
              </tr>
            </thead>
            <tbody id="tbodyid">
                {% if dato is empty %}
                    <!-- vacio... -->
                {% else %}
                    {% for item in dato.transactions %}
                        <tr>
                            <th scope="row"># {{ item.pin }}</th>
                            <td>{{ item.description }}</td>
                            <td>{{ item.name_client }}</td>
                            <td>Efectivo</td>
                            <td>{{ item.date}}</td>
                            <td>{{ item.amount}}</td>
                            <td>{{ item.state}} 
                                <a href="{{url('transaction/detailtransaction?pin=')}}{{ item.pin }}"><img src="{{url('img/Admin-5.png')}}"></a> 
                            </td>                                               
                        </tr>
                    {% endfor %}
              {% endif %}
            </tbody>
          </table> 
        <!--Fin de la tabla-->
     </div>         
</div>



<!--CONTENIDO PARA PESTAÑA CLIENTES-->

<div id="cl" style="display: block;" class="trans col-sm-11">

    <div id="notrans" class="vall row col-sm-6">
        <div class="col-sm-12">
            <img src="{{url('img/repetir.svg')}}">
            <span id="notransaccionh"><b>{{ dato.count_clients }}</b><b id="cop"><?php echo $t->_("Clientes") ?></b></span>
            <!-- <p id="p2"><b style="color: red;">12%</b><?php echo $t->_("Since_last_week") ?></p> -->
        </div>
    </div>

    <div class="col-sm-12">
        <div class="row col-sm-12 pull-right">
            <div class="row">
            <ul class="nav nav-tabs pull-right">
            <li style=""><a id="select1" href="{{url('transaction/reportsCommerceClient?search=1')}}"><b><?php echo $t->_("Today") ?></b></a></li>
            <li class="activesegselect" style=""><a id="select2" href="{{url('transaction/reportsCommerceClient?search=2')}}"><b><?php echo $t->_("Last_7_days") ?></b></a></li>
            <li style=""><a id="select3" href="{{url('transaction/reportsCommerceClient?search=3')}}"><b><?php echo $t->_("Last_30_days") ?></b></a></li>
            <li style=""><a id="buscarPersonalizado3" href="#"><b><?php echo $t->_("Personalized") ?></b></a></li>
            </ul>
            </div>    
            
            <ul>
            {{ form('transaction/reportsCommerceClient', 'role': 'form', 'id': 'search') }}
                <div class="row hidden"  id="grillaFormulario3">    
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
                        <button id="cerrarPorFecha3" style="margin-top: -6px; margin-bottom: -5px; background: white;" >X</button>
                    </div>
                </div>  
            {{ end_form() }}        
            </ul>
        </div>
    </div>

     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
       <canvas id="cliente"></canvas>
     </div>

      <div id="divtable" class="table-responsive">
      <!--Inicio de la tabla-->
          <table class="table table-striped">
            <thead id="theadid">
              <tr>
                <!-- <th scope="col">ID</th>
                <th scope="col"><?php echo $t->_("Description") ?></th> -->
                <th scope="col"><?php echo $t->_("First_namet") ?></th>
                <!-- <th scope="col"><?php echo $t->_("Payment_type") ?></th>
                <th scope="col"><?php echo $t->_("Payment_date") ?></th>
                <th scope="col"><?php echo $t->_("Value") ?></th>
                <th scope="col"><?php echo $t->_("Statee") ?></th> -->
              </tr>
            </thead>
            <tbody id="tbodyid">
                {% if datoss is empty %}
                    <!-- vacio... -->
                {% else %}
                    {% for item in datoss %}
                        <tr>
                            <!-- <th scope="row"># {{ item.pin }}</th>
                            <td>{{ item.description }}</td> -->
                            <td>{{ item }}</td>
                            <!-- <td>Efectivo</td>
                            <td>{{ item.payment_date}}</td>
                            <td>{{ item.amount}}</td>
                            <td>{{ item.state}} 
                                <a href="{{url('transaction/detailtransaction?pin=')}}{{ item.pin }}"><img src="{{url('img/Admin-5.png')}}"></a> 
                            </td> -->
                        </tr>
                    {% endfor %}
              {% endif %}
            </tbody>
          </table> 
        <!--Fin de la tabla-->
     </div>         
</div>

<!--CODIGO PARA CHARTS JS-->
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
                fillColor : "rgba(151,187,205,0.2)",
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
                        array[i]={{item.collected_amount}};
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
                fillColor : "rgba(151,187,205,0.2)",
                strokeColor : "transparent",
                pointColor : "transparent",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "transparent",
                data : [40,40,40,40,40,40,40,40,40,40,40,40]
            }
        ]

    }

    var ctx4 = document.getElementById("valor-recaudo").getContext("2d");
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive:true});
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
                        array[i]={{item.customers}};
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
                fillColor : "rgba(151,187,205,0.2)",
                strokeColor : "transparent",
                pointColor : "transparent",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "transparent",
                data : [40,40,40,40,40,40,40,40,40,40,40,40]
            }
        ]

    }

    var ctx4 = document.getElementById("cliente").getContext("2d");
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive:true});
</script>


<script type="text/javascript">
function mostrar(capilla)
{
    //Cerrando otras secciones
    obj1 = document.getElementById('nt');
    obj2 = document.getElementById('vr');
    obj3 = document.getElementById('cl');

    //cerrando..
    if (obj1) {
        obj1.style.display = "none";
    }
    if (obj2) {
        obj2.style.display = "none";
    }
    if (obj3) {
        obj3.style.display = "none";
    }
    //mostrando seccion señalada
    obj = document.getElementById(capilla);
    obj.style.display = "block";

}  
</script>

<script type="text/javascript">
function mostrarli(capilla)
{
    //Cerrando otras secciones
    li1 = document.getElementById('lint');
    li2 = document.getElementById('livr');
    li3 = document.getElementById('licl');

    //cerrando..
    if (li1) {
        li1.className = "";
    }
    if (li2) {
        li2.className = "";
    }
    if (li3) {
        li3.className = "";
    }
    //mostrando seccion señalada
    li = document.getElementById(capilla);
    li.className = "active";

}  
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#vr').hide();
        $('#cl').hide();
    });
</script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#buscarPersonalizado").click(function(){
            $("#grillaFormulario").removeClass("hidden");
        });
        $("#buscarPersonalizado2").click(function(){
            $("#grillaFormulario2").removeClass("hidden");
        });
        $("#buscarPersonalizado3").click(function(){
            $("#grillaFormulario3").removeClass("hidden");
        });


        $("#cerrarPorFecha").click(function(){
            $("#grillaFormulario").addClass("hidden");
        });
        $("#cerrarPorFecha2").click(function(){
            $("#grillaFormulario2").addClass("hidden");
        });
        $("#cerrarPorFecha3").click(function(){
            $("#grillaFormulario3").addClass("hidden");
        });
    });
    
</script>

