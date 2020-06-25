{{ content() }}


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

        {% if access_type == 1 %}
        <div id="editp" class="row">
            <div class="col-md-6">
                <h4 class="section-title h4_edit" style=""> <?php echo $t->_("EditOnly") ?> <b> PERFIL </b></h4>
            </div>
        </div>
        {% else %}
        <div id="editp" class="row">
            <div class="col-md-6">
                <h4 class="section-title h4_edit"> <?php echo $t->_("EditOnly") ?> <b> <?php echo $t->_("EditProfile") ?> </b></h4>
            </div>
        </div>

        {% endif %}
        
        {{ form('session/editClient', 'role': 'form', 'class': 'form-horizontal', 'method': 'post', 'enctype': 'multipart/form-data') }}
            <div class="col-md-12 div_edit_all"> <!-- DIV CONTENEDOR -->
                <div class="col-md-6"> <!-- DIV IZQUIERDO -->
                    <div class="row">
                        <div id="div_Image" class="css_Div_Img_Perfil" onclick="openModal()">
                            <img class="css_Imagen_Usuario_Comercio" src="<?php 
                                if ($this->session->get("access_type") == 1){ 
                                    echo $this->session->get("client_image"); 
                                }else{
                                    echo $this->session->get("imagen_comercio"); 
                                }
                            ?>">
                        </div>
                        <div class="col-md-10 col-xs-12 css_Div_Text_FotoPerfil" onclick="openModal()">
                            <label id="formulariolabel" class="label-dates css_Lab_Tex_Perfil_Tl"  for="username" >Editar foto</label>
                        </div>
                    </div>
                    <div class="row div_row_edit">
                        <div class="col-md-4 col-xs-12">                            
                            <label id="labelperson" class="label-person css_Lab_Tex_Perfil">Nombre</label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput" type="text" id="name" name="name" class="input-xlarge" value="{{ data.name }}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" style="" class="label-dates css_Lab_Tex_Perfil" for="email"><?php echo $t->_("E-maill") ?></label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput" type="text" id="email" name="email" class="input-xlarge" value="{{ data.email }}" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" class="label-dates css_Lab_Tex_Perfil" for="phone"><?php echo $t->_("Phone") ?></label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput" type="number" id="phone" name="phone" placeholder="" class="input-xlarge" value="{{ data.phone }}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" class="label-dates css_Lab_Tex_Perfil" for="phone">Ciudad</label>
                        </div>
                        <div class="col-md-8 col-xs-12 div_cityclient">
                            <select class="address input-dates" name="city"> 
                                
                                {% if city is empty %}
                                  <!-- No se encontraron direcciones -->
                                {% else %}
                                
                                  {% for item in city %}
                                    
                                    <option value="{{item.id}}">{{item.city}}</option>
                                  {% endfor %}
                                {% endif %} 

                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" class="label-dates css_Lab_Tex_Perfil" for="phone">Dirección</label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput" type="text" id="phone" name="address" placeholder="" class="input-xlarge" value="{{ data.address }}">
                        </div>
                    </div>
                </div>

                <div class="col-md-6 css_Div_Contenedor_Derecho"> <!-- DIV DERECHO -->
                    <div class="row">
                        <div class="col-md-12 css_Div_Text_Perfil">
                            <label id="formulariolabel" class="label-dates" style="font-weight: 100; margin-left: 0px;"><?php echo $t->_("Options_Account") ?></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" style="" class="label-datess css_Lab_Tex_Perfil" for="document"><?php echo $t->_("Document") ?></label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput"  type="text" id="document" name="document" class="input-xlarge" value="{{ data.document }}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-xs-12">
                            <label id="formulariolabel" style="" class="label-datess css_Lab_Tex_Perfil" for="pass"><?php echo $t->_("Passwordss") ?></label>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <input class="input-dates" id="formularioinput" type="password" id="pass" name="pass" placeholder="" class="input-xlarge" value="contraseña" disabled>
                        </div>{{city.id}}
                    </div>
                </div>                
            </div>
 
            <div class="col-md-12 div_botones_edit">
                <button class="css_Boton_Aceptar" id="btnderecho" type="submit" name="button"><?php echo $t->_("Save_changes") ?></button>
                <button class="css_Boton_Cancelar" type="submit" name="button"><?php echo $t->_("Cancel") ?></button>
            </div>

            <div id="div_ly_Cambiar_Imagen" class="col-md-12">
                <span class="close cursor" onclick="closeModal()" style="font-size: 50px;">&times;</span>
                <div class="row">
                    <div style="margin-top: 50px;">
                        <p class="section-title">
                            Cambiar Imagen
                        </p>
                    </div>
                    <div>
                        <img class="css_Imagen_Perfil" src="<?php 
                            if ($this->session->get("access_type") == 1){  
                                    echo $this->session->get("client_image"); 
                                }else{
                                    echo $this->session->get("imagen_comercio"); 
                                }
                            ?>">
                    </div>
                    <div class="col-md-12">
                        <input type="file" name="foto" id="foto" accept="image/jpeg,image/gif,image/x-png"/></td>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <button class="css_Boton_Aceptar_box" id="btnderecho" type="submit" name="button"><?php echo $t->_("Save_image") ?></button>
                        </div>
                        <div class="col-md-6">
                            <button class="css_Boton_Cancelar_box" type="submit" name="button"><?php echo $t->_("Cancel") ?></button>
                        </div>
                    </div>
                </div>
             </div>
        {{ end_form() }}

    <script>
     function openModal() {
        document.getElementById('div_ly_Cambiar_Imagen').style.display = "block";
      }

     function closeModal() {
        document.getElementById('div_ly_Cambiar_Imagen').style.display = "none";
        }
    </script>

    <script type="text/javascript">
      $('.address').select2({
        
      });

      $('.address').val('{{data.id_city}}').trigger('change.select2');
</script>
