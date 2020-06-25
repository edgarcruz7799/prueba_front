
<LINK REL=StyleSheet HREF="{{url('css/webadmin.css')}}" TYPE="text/css" MEDIA=screen>


{{ content() }}

<div id="cuerpo" class="col-sm-10 col-md-10">
    <div>
        <div id="legend">
            <legend style="" class=""><b><img src="{{url('img/admin_menu-10.png')}}"> <?php echo $t->_("EditProfile") ?></b></legend><br>
        </div>

        {{ form('commerce/edit', 'role': 'form', 'class': 'form-horizontal') }}

            <div class="control-group">
                <label id="formulariolabel" class="control-label"  for="username"><?php echo $t->_("Company_name") ?></label>
                <input id="formularioinput" type="text" id="company_name" name="commerce_name" placeholder="" class="input-xlarge" value="{{ data[0].commerce_name }}">
            </div>

            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("NIT_company") ?></label>
                <input id="formularioinput"  type="text" id="nit" name="nit" placeholder="" class="input-xlarge" value="{{ data[0].nit }}">
            </div>

            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("Image_logo") ?></label>
                <input type="file" id="files" name="files" placeholder="" class="image"><br />
                <img style="margin-left: 127px; margin-bottom: 18px; max-width: 200px; max-height: 80px;" src="{{ data[0].image }}">
            </div>

            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("Email") ?></label>
                <input id="formularioinput" type="text" id="email" name="email" placeholder="" class="input-xlarge" value="{{ data[0].email }}">
            </div>
           
            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("Phone") ?></label>
                <input id="formularioinput" type="text" id="phone" name="phone" placeholder="" class="input-xlarge" value="{{ data[0].phone }}">
            </div>

            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("AnswerPage") ?></label>
                <input id="formularioinput" type="text" id="answer_page" name="answer_page" placeholder="" class="input-xlarge" value="{{ data[0].answer_page }}">
            </div>

            <div class="control-group">
                <label id="formulariolabel" style="" class="control-label" for="email"><?php echo $t->_("ConfirmPage") ?></label>
                <input id="formularioinput" type="text" id="confirm_page" name="confirm_page" placeholder="" class="input-xlarge" value="{{ data[0].confirm_page }}">
            </div>

            <div class="control-group btns">
                <div class="controls" style="">
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <button style="width: 70%;padding-left: 1px;padding-right: 1px;" id="btnderecho" type="submit" name="button"><?php echo $t->_("Save_changes") ?></button>
                        </div>
                        <div class="col-sm-6">
                            <button style="width: 70%;padding-left: 1px;padding-right: 1px;" type="submit" name="button"><?php echo $t->_("Cancel") ?></button>
                        </div>
                     </div> 
                 </div>
            </div>
        {{ end_form() }}    
    </div>
</div>

<!--Script para la imagen-->
<script>
    function archivo(evt) {
        var files = evt.target.files; // FileList object

        // Obtenemos la imagen del campo "file".
        for (var i = 0, f; f = files[i]; i++) {
            //Solo admitimos imágenes.
            if (!f.type.match('image.*')) {
                continue;
            }

            var reader = new FileReader();
            var imgquemada = "/var/www/html/brinkscashcommerce/public/img/logo_avianca.png"
            reader.onload = (function(theFile) {
                return function(e) {
                  // Insertamos la imagen
                 document.getElementById("list").innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
                };
            })(f);

            reader.readAsDataURL(f);
        }
    }

    document.getElementById('files').addEventListener('change', archivo, false);
</script>
