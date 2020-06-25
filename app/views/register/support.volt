<LINK REL=StyleSheet HREF="{{url('css/supportadm.css')}}" TYPE="text/css" MEDIA=screen>


<div class="col-md-12">
  <h4 class="section-title h4_support">
    <?php echo $t->_("Support") ?>
  </h4>
</div>

<!-- <div style="" id="legend">
    <legend class="legend"><b><img src="{{url('img/admin_menu-11.png')}}"> <?php echo $t->_("Support") ?></b></legend>
     <br>
  </div> -->

<div class="col-md-12">
  <div class="col-md-12">
    <p class="parFirst">
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
    </p>

    <br><br>
  </div>
</div>


  <div style="" class="col-md-12 box_support">
    {{ form("register/support", "method": "post") }}
      <fieldset>
        <input type="hidden" value='{{client_gateway_id}}' name="client_gateway_id">
        <!-- Name -->
        <div class="col-md-3">
        
          <div class="control-group">
            <!-- <label class="control-label labell"  for="username"><?php echo $t->_("First_name") ?>:</label> -->
            <input type="text" id="username" name="nombre" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("First_name") ?>" required>

          </div>

          <!-- Card Number -->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Last_name") ?>:</label> -->
            <input type="text" id="lastname" name="apellido" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Last_name") ?>" required>
          </div>

          <!-- Expiry-->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("E-mail") ?>:</label> -->
            <input type="text" id="rs" name="email" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("E-mail") ?>" required>
          </div>


          <!-- Expiry-->
          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Affair") ?>:</label> -->
            <input type="text" id="affair" name="asunto" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Affair") ?>" required>
          </div>

          <div class="control-group">
            <!-- <label class="control-label labell" for="email"><?php echo $t->_("Request") ?>:</label> -->
            <input type="text" id="request" name="requerimiento" class="input-xlarge inputt" value="" placeholder="<?php echo $t->_("Request") ?>" required>
          </div>

          <!-- Expiry-->
          <!--         <div class="control-group">
       -->
          <!-- <label class="control-label labell" for="sel1"><?php echo $t->_("Type_of_request") ?></label> -->
          <!-- <select  class="input-xlarge inputt select" id="sel1" style="border-radius: 0%">
                  <option><?php echo $t->_("Type_of_request") ?></option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                </select>
              </div>
       -->

          <!-- Expiry-->
          <!--       <div class="control-group">
       -->
          <!-- <label class="control-label labell" for="sel1"><?php echo $t->_("Request") ?></label> -->
          <!--  <select  class="input-xlarge inputt select" id="sel1" style="border-radius: 0%">
                <option><?php echo $t->_("Request") ?></option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
              </select>
            </div> -->

          <!-- Expiry-->
        </div>
        <div class="col-md-9">
             <!-- <label class="control-label labell" for="email"><?php echo $t->_('Your_message') ?>:</label> -->
             <textarea  class="form-control control-group txtarea" name="mensaje" style="" placeholder="<?php echo $t->_('Your_message') ?>" required></textarea>
        </div>
        <!-- Submit -->
        <div class="col-md-12 css_Div_Botones_Soporte">
            <button class="css_Boton_Enviar" type="submit" name="button">
              <?php echo $t->_("Submit") ?></button>
        </div>



      </fieldset>
      {{ end_form() }}
  </div>
