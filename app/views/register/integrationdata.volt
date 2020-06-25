<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>



  <div class="col-md-12">
      <h4 class="section-title"> <?php echo $t->_("INTEGRATION_DATA") ?> </h4>
  </div>
  <!-- <div class="row headhed sup" id="divleg">
    <legend id="" class="legendd"><b><img src="{{url('img/admin_menu-7.png')}}"> <?php echo $t->_("INTEGRATION_DATA") ?></b></legend>
  </div> -->
    
      <div class="col-md-12 col-xs-12">
      <!--Inicio de la tabla-->
          <table class="table table-striped table_integrationdata">
            <tbody id="tbodyid" class="tbody_integrationdata">
              <tr>
                <td>API Key</td>
                {% if key_commerce is not null %}
                <td style="word-wrap: break-word;">{{key_commerce}}</td>
                {% else %}
                <td>En proceso de asignación</td>
                {% endif %}                                          
              </tr>
              <tr>
                <td><?php echo $t->_("Created_the_day") ?></td>
                <td>{{created_at}}</td>                                           
              </tr>
              <tr>
                <td><?php echo $t->_("Created_by") ?></td>
                <td>{{client_name}}</td>                                         
              </tr>          
            </tbody>
          </table> 
        <!--Fin de la tabla-->
      </div>
      <div class="col-md-12 col-xs-12 box_integrationdata">
         <div class="col-md-1 col-xs-12">
          <b>Id Account: </b>
         </div>
         <div class="col-md-2 col-xs-12" style="text-align: right;">
          <input style="color: gray;" type="text" class="data" value="{{client_gateway_id }}" disabled="disabled">
         </div>
         <div class="col-md-1 col-xs-12">
          <b><?php echo $t->_("Password") ?>: </b>
         </div>
         <div class="col-md-2 col-xs-12" style="text-align: right;">
          <input style="color: gray;" type="password" class="data" value="contraseña147147" disabled="disabled">
         </div>
      </div>
    








