
    <div class="col-md-12">
        <h4 class="section-title"> <?php echo $t->_("Manage_Account") ?> </h4>
        <h5 class="title"><?php echo $t->_("Profile") ?></h5>
        <p><?php echo $t->_("Text1") ?></p><br><br>
    </div>

    <!-- <div style="" class="">
        <legend class="legendd"><b><img src="{{url('img/admin_menu-9.png')}}"> <?php echo $t->_("Manage_Account") ?></b></legend><br>
    </div> -->

    <div class="form">
      <div class="col-md-6 col-sm-6 divform">
        <div class="row">
          <div class="div-table">
              <div class="control-group">
                <!-- <legend style="" class="legend"><?php echo $t->_("First_name") ?></legend> -->
                <label id="formulariolabel" class="label-dates" ><?php echo $t->_("First_name") ?></label>
                <img class="img-circle" src="http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png">
                <input class="input-dates" id="formularioinput" type="text" id="name" name="name" class="input-xlarge" value="{{ data.name }}">
                <input class="input-pencils" type="image" src="{{url('img/lapiz-inclinado(1).svg')}}">
              </div>
          </div>
        </div>
        <div class="row">
            <div class="div-table">
                <div class="control-group">
                  <!-- <legend class="legend"><?php echo $t->_("Email") ?></legend> -->
                  <img style="float:right; width: 15px;" src="{{url('img/anadir-cancion.svg')}}" alt="">
                  <label id="formulariolabel" style="" class="label-dates" for="email"><?php echo $t->_("Email") ?></label>
                  <input class="input-dates" id="formularioinput" type="text" id="email" name="email" class="input-xlarge" value="{{ data.email }}" disabled>
                  <input class="input-pencils" type="image" src="{{url('img/lapiz-inclinado(1).svg')}}">                  
                </div>
            </div>
        </div>
        <div class="row">
            <div class="div-table">
                <div class="control-group">
                  <!-- <legend class="legend"><?php echo $t->_("Number_Account") ?></legend> -->
                  <img style="float:right; width: 15px;" src="{{url('img/anadir-cancion.svg')}}" alt="">
                  <label id="formulariolabel" style="" class="label-dates" for="phone"> <?php echo $t->_("Number_Account") ?> </label>
                  <input type="text" class="input-dates" value="Bancolombia Cta N° 110055">
                  <input class="input-pencils" type="image" src="{{url('img/lapiz-inclinado(1).svg')}}">                  
                </div>
            </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="row">
          <div class="div-table">
              <div class="control-group">
                <!-- <legend class="legend"><?php echo $t->_("Password") ?></legend> -->                  
                <label id="formulariolabel" style="" class="label-dates" for="pass"><?php echo $t->_("Passwords") ?></label>
                <input class="input-dates" id="formularioinput" type="password" id="pass" name="pass" placeholder="" class="input-xlarge" value="contraseña" disabled>
                <input class="input-pencils" type="image" src="{{url('img/lapiz-inclinado(1).svg')}}">
              </div>
              <div class="control-group">
                <legend class="legend"><?php echo $t->_("Entity_account") ?></legend><br>
                <h5 class="secondtitle"><?php echo $t->_("Add") ?></h5>
              </div>
              <button class="btn" type="submit" name="button"><?php echo $t->_("save") ?></button>
          </div>
        </div>
      </div>
    </div>

