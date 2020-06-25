
{{ content() }}


    <div class="col-md-12">
        <h4 class="section-title"> <?php echo $t->_("TransactionssInProgress") ?> </h4>
    </div>
    <!-- <div id="divleg">
        <legend id="" class="legendd"><b><img src="{{url('img/admin_menu-1.png')}}"> <?php echo $t->_("TransactionssInProgress") ?></b></legend>
        <br><br><br>
    </div> -->
    <div id="divsup" class="row">
        <!-- <div id="noval" class="col-sm-3 col-xs-6 col-sm-offset-1"></div> -->
        <div id="notrans" class="col-sm-3 col-xs-6 col-sm-offset-4">
            <p id="p3"><b id="b2"><?php echo $t->_("NOfTransactions") ?></b></p> 
            <h2 id="notransaccionh"><img src="{{url('img/repetir-90.png')}}"> <b>{{ dato.count_transaction}}</b></h2>
        </div>
        <!-- <div id="cli" class="col-sm-3 col-xs-6"></div> -->
    </div>

    {{ form('transaction/consultTransactionProgressClient', "name":"form", "id":"form", "method":"post", "class":"form-inline", "style":"width:100%;") }}
        <input type="hidden" name="validar" value="buscar">
        <div id="listobuscar" class="row">
            <div id="fechaini" class="col-sm-3"><br>
                <center><h5 id="fechainih"><?php echo $t->_("Start_date") ?></h5></center>
                <input id="fechatextini" type="date" id="username" name="startdate" placeholder="" class="input-xlarge" required>           
            </div>
            <div id="fechafin" class="col-sm-3"><br>
                <center><h5 id="fechafinh"><?php echo $t->_("End_date") ?></h5></center>
                <input id="fechatextfin" type="date" id="username" name="enddate" placeholder="" class="input-xlarge" required> 
            </div>
            <div style="margin-top: 37px;" id="divsearch" class="col-sm-3 pull-right"><br><br>
                <div id="divsearch2" class="input-group stylish-input-group">
                    <input id="search" placeholder="Search" type="text" class="form-control searchh" aria-describedby="basic-addon2">
                    <span style="border-color: #B5B5B5; border-radius: 0 10px 10px 0; color: #005eae;" class="input-group-addon" id="basic-addon2"><button style="margin-top: -6px; margin-bottom: -5px; background: white;" class="glyphicon glyphicon-search"></button></span>    
                </div>    
            </div>
        </div>
    {{ end_form() }}

    <div class="col-md-12">
    <div id="divtable" class="table-responsive">
        
        <table class="table table-striped" id="table">
            <thead id="theadid">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col"><?php echo $t->_("Description") ?></th>
                    <th scope="col"><?php echo $t->_("First_namet") ?></th>
                    <th scope="col"><?php echo $t->_("Payment_type") ?></th>
                    <th scope="col"><?php echo $t->_("Payment_date") ?></th>
                    <th scope="col"><?php echo $t->_("Value") ?></th>
                    <th scope="col"><?php echo $t->_("STATEE") ?></th>                                                
                </tr>
            </thead>

            <tbody id="tbodyid">
                {% if dato is empty %}
                    vacio...
                {% else %}
                    {% for item in dato.transactions %}
                        <tr>
                            <th scope="row">
                                <a href="{{url('transaction/detailtransaction?pin=')}}{{ item.pin }}" style="color: #005eae;"># {{ item.pin }}</a>
                            </th>
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
        
    </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <script>
     $(document).ready(function(){
     $("#search").keyup(function(){
     _this = this;
     
     $.each($("#table tbody tr"), function() {
     if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
     $(this).hide();
     else
     $(this).show();
     });
     });
     });
    </script>
    