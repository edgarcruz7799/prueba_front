<!DOCTYPE html>
<html lang="en">
<body>
    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="{{ msg }}">
    <div id="mostrar" class="alert alert-warning" style="display: none; margin-top: 70px; margin-bottom: 0px;">
      <strong>{{ msg }}!</strong> {{ msg2 }}
    </div>
    <section id="mu-book-overview" class="mu-book-overview-support-section1" style="background-image: url({{url('img/T_img10.jpg')}});">
        <div class="container-fluid">
            <div class="row">
            <br><br>
                <div class="">
                    <div class="mu-hero-left" style="float: none;" >
                        <center><h1 style="font-family: inherit;" class="linetext"><?php echo $t->_("SectionTitle17") ?></h1></center>
                    </div>
                </div>
            <br><br>
            
            <div class="form-control" id="map" style="width:100%;height:480px;"></div>

            <div class="center row" style="position: relative; top: -30px; ">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-2 div-scheduleandphonee-mail-support" border=5>
                    <table>
                        <tr><td style="color: white; width: 100%" ><b><?php echo $t->_("HourAtention") ?></b></td></tr>
                        <tr>
                            <td style="color: white;" ><b><?php echo $t->_("Day") ?></b> </td>
                            <img class="pull-right" src="{{ url('img/clock.png') }}">
                        </tr>
                        <tr><td style="color: white;" ><b><?php echo $t->_("Hour") ?></b> </td></tr>
                    </table> 
                </div>  
             
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-2 div-scheduleandphonee-mail-support" border=5>
                    <table >
                        <tr><td style="color: white; width: 100%" ><b><?php echo $t->_("PhoneEmail") ?></b></td></tr>
                        <tr>
                            <td style="color: white;" ><b><?php echo $t->_("Phone") ?>:</b></td>
                            <img class="pull-right" src="{{ url('img/phone.png') }}">
                        </tr>
                        <tr><td style="color: white;" ><b><?php echo $t->_("Email") ?>:</b> </td></tr>
                    </table>  
                </div> 
            </div>  
            <br><br>               


            <div class="center">
                <div class="mu-hero-left" style="float: none;" >
                    <center><h1 style="font-family: inherit;"><?php echo $t->_("SectionForm") ?></h1></center>
                </div>
                <center><h3 style="color: white;"><?php echo $t->_("SectionText17") ?></h3></center>
            </div>

            <form action="{{ url('index/supportIndex') }}" method="post">
                <section class="form-group">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control input-name-support" type="text" name="name_contact" title="Full Name" id="name_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormName17') ?>"><br>
                            <input class="form-control input-phone-support" type="text" name="phone_contact" title="Phone" id="phone_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormPhone17') ?>">                    
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                             <input class="form-control input-email-support" type="email" name="email_contact" title="Email" id="email_contact" autocomplete="on"  placeholder="<?php echo $t->_('FormEmail17') ?>"><br>
                            <select  class="select-support">
                              <option class="uno" value=""><?php echo $t->_("FormTypes17") ?></option>
                              <option class="dos" value="">Soporte</option>
                              <option class="uno" value="">Tecnico</option>
                            </select>                     
                        </div>
                    </div>
                </section>
                <input type="hidden" value={{token}} name="CSRFtoken">
                <section class="form-group">
                    <center><textarea placeholder="<?php echo $t->_('FormArea') ?>" class="form-control textarea-support" name ="text" rows=8 cols=10></textarea></center>
                </section><br>


                <div align="center">
                    <input style="height: 47px; border-radius: 10px; background-color: rgb(8, 50, 148); border-color: rgb(8, 50, 148);" type="submit" name="" class="btn btn-primary btn-lg" value="<?php echo $t->_('SectionButton17') ?>"/>
                </div>
            </form>


            </div>            
        </div><br><br>
    </section>            

    <div class="scrollup">
        <a href="#"><i class="fa fa-chevron-up"></i></a>
    </div>
</body>
</html>

<!-- Send email - Success -->
<div class="modal fade" id="contact_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("contact_email") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("contact_email_success_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- Send email - Failure -->
<div class="modal fade" id="contact_failure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("contact_email") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("contact_email_failure_msg") ?>
            </div>
        </div>
    </div>
</div>


<script>
    
    function initMap() {
          
        var latitude = 4.6663342;
        var longitude = -74.1139979;
        
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: {lat: latitude, lng: longitude  }
        });

        var marker = new google.maps.Marker({
            position: {lat: latitude , lng:  longitude  },
            map: map
        });

        google.maps.event.addListener(map,'click',function(event) {
            marker.setPosition(event.latLng);
            var geocoder = new google.maps.Geocoder();
            var yourLocation = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());
        });
    } 
  
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA70fslcm8mwK6ZSGPOc_S0SNaAn74G_6Y&callback=initMap&libraries=places"></script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        if (document.getElementById("mostrar_modal").value == 'email_contact_success'){
            alert("test");
            $("#contact_success").modal("show");
            document.getElementById("mostrar_modal").value = "";
        }

        if (document.getElementById("mostrar_modal").value == 'email_contact_failure'){
            $("#contact_failure").modal("show");
            document.getElementById("mostrar_modal").value = "";
        }       
    });

</script>

<script type="text/javascript">
    {% if msg is empty %}

    {% else %}
        document.getElementById("mostrar").style.display="block";
    {% endif %}
</script>