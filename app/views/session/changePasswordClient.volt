<!DOCTYPE html>
<html lang="en">

<body>
    <div class="row" style="margin-top: 140px;">
        <div class="col-md-4 col-md-offset-4">
            <div class="col-md-8 col-sm-8 logoslogin">
                <label style="font-size: 21px;"><?php echo $t->_("PasswordChange") ?></label>
            </div><br>
            <div class="col-md-12 col-sm-12 logoslogin">
                <h6><?php echo $t->_("PasswordChangeText") ?></h6>
            </div>

            {{ form('session/changePasswordClient', 'role': 'form') }}
            <div class="col-md-12 col-sm-12">
                <input class="form-control" type="password" name="password" title="Password" id="password" required="required" placeholder="<?php echo $t->_("LogPass") ?>">
            </div>
            <input type="hidden" name="token" value="{{ token }}">
            <div class="col-sm-12 col-md-12">
                <div  style="border-bottom: 2px solid #3333332e; margin-bottom: 5%">
                    <br><input type="submit" name="crearCuenta" value="<?php echo $t->_("Send") ?>" class="btn btn-default signupbutton"/>
                </div>
            </div>
            {{ end_form() }}
        </div>
    </div>
    <div class="scrollup">
        <a href="#"><i class="fa fa-chevron-up"></i></a>
    </div>
</body>
</html>


