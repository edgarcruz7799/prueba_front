
<LINK REL=StyleSheet HREF="{{url('css/supportadm.css')}}" TYPE="text/css" MEDIA=screen>

<div class="col-sm-12 contenido">
    
    <input type="hidden" id="mostrar_modal" name="mostrar_modal" value="{{ msg }}">
    
    <div class="row">
    <div class="col-md-6">
        <h4 class="section-title"><span><?php echo $t->_("Address") ?></span>!</h4>
    </div>
    <div class="col-md-3 col-xs-12 pull-right">
        
    </div>
    </div>
    <!-- <div style="" id="legend">
		<legend class="legend"><b><img src="{{url('img/admin_menu-11.png')}}"> <?php echo $t->_("Address") ?></b></legend><br>
	</div> -->

	    <!-- <div class="row">
	    	<div class="col-md-3 pull-right">
	        	<button class="btnaddress" type="button" id="add_address"name="button"><?php echo $t->_("Aggregate") ?></button>
	    	</div>
	    </div> -->
		
		<br>
		<div class="row addaddress">
	    	<div class="col-md-6">
	    		{{ form('address/addAddress', 'role':'form', 'name': 'newAddress', 'id': 'newAddress') }}
			        <input type="text" name="direccion" id="direccion" placeholder="<?php echo $t->_("Addresss") ?>" required="required" style="width:100%;">
			       	<input type="text" name="name_address" id="name_address" placeholder="<?php echo $t->_("Namess") ?>" required="required" style="width:100%;"> 
			       	<input type="text" name="phone" id="phone" placeholder="<?php echo $t->_("Phoness") ?>" required="required" style="width:100%;"> 
			        <input type="hidden" name="latitud" id="lat" value="">
			        <input type="hidden" name="longitud" id="lon" value=""> 
			        <input type="hidden" name="id_address" id="id_address" value="">
		        {{ end_form}}
                <button class="btnaddress" type="button" id="add_address"name="button"><?php echo $t->_("Aggregate") ?></button>
		        <input class="edit pull-right input_cancel" style="" type="button" onclick="cancel()" value="<?php echo $t->_("Cancel") ?>">
	    	</div>
	    	<div class="col-md-6">
	    		<div id="map" style="width:100%;height:180px;"></div>
			</div>
	    </div>
		<br>
	


	<div class="row">
	    {% if dato is empty %}
	        <!-- No se encontraron direcciones -->
	    {% else %}
	        {% for item in dato %}
	        <div class="col-md-12 border-div">
                <div class="col-md-7 textdiv">
                    <input type="hidden" name="address_id" value="{{item.id}}">

                    <div class="control-group">
                    <label class="control-label" for="username" style="color: #005eae;font-size: 25px;">{{item.name_address}}</label>
                    </div>

                    <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Addresss") ?>: {{ item.address }}</label>
                    </div>

                    <!-- <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Locationss") ?>: {{ item.country }}, {{ item.city }}</label>
                    </div> -->

                    <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Phoness") ?>: {{ item.contact_phone }}</label>
                    </div>
                </div>
                <div class="col-md-5 text-right box_crud" style="margin-top: 8px;">
                <a class="edit button-circle" onclick="detailAddress({{item.id}})"> <div> <img src="{{url('img/lapiz-inclinado.svg')}}" alt=""> </div> <span> <?php echo $t->_("Edit") ?></span> </a>
                
                <a class="address button-circle" href="{{url('address/delete?address=')}}{{ item.id }}"> <div> <img src="{{url('img/cubo-de-basura.svg')}}" alt=""> </div> <span> <?php echo $t->_("Delete") ?></span> </a>
                
                <a class="address button-circle img-calidad addressfavorite" href="{{url('address/favorite?address=')}}{{ item.id }}&{{'id_address='}}{{item.id_client}}"> <div class=div-calidad> <img src="{{url('img/calidad(1).svg')}}" alt=""> </div> <span id="firstadd" class="span-medalla"> <?php echo $t->_("Prime_address") ?> </span> </a>
                
                </div>

            </div>	
	        {% endfor %}
	  	{% endif %}
  	</div>
</div>

<!-- /*Mensaje de exito agregar dirección*/ -->
<div class="modal fade" id="add_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("add_address_success") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("add_address_success_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- /*Mensaje de error agregar dirección*/ -->
<div class="modal fade" id="add_failure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("add_address_failure") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("add_address_failure_msg") ?>
            </div>
        </div>
    </div>
</div>
<!-- 
/*Mensaje de exito borrar dirección*/ -->
<div class="modal fade" id="delete_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("delete_address_success") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("delete_address_success_msg") ?>
            </div>
        </div>
    </div>
</div>

<!-- /*Mensaje de exito eliminar dirección*/ -->
<div class="modal fade" id="delete_failure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button style="color: white; font-size: 28px" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 style="font-size:10pt" class="modal-title" id="myModalLabel"><b><?php echo $t->_("delete_address_failure") ?></b></h4>
            </div>
            <div class="modal-body">
                <?php echo $t->_("delete_address_failure_msg") ?>
            </div>
        </div>
    </div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places&key=AIzaSyA70fslcm8mwK6ZSGPOc_S0SNaAn74G_6Y"></script>
<script>	
	/*
	* Agregar y editar dirección
	*/
	$("#add_address").click(function() {
	  $("#newAddress").submit();
	});
    
    /* $(".addressfavorite").click(function() {
        //event.preventDefault();
        var params = {
            hola1 : hola2,
            "address" : $(this).data('id'),
            "id_address" : $(this).data('client')
        }
        alert(params);
        $.ajax({
                url: $(this).attr('href'),
                type: 'POST',
                dataType: 'json',
                data: params,
                contentType: false,
                cache: false,
                processData: false
            })
        .done(function(response) {
            if (response.return) {
                alert("La accion se realizo con exito");
            } else {
                alert("La accion no se ha realizado");
            }
        })
        .fail(function() {
            alert("La accion no se ha realizado");
        })
    }); */

	/*
	* Reinicia campos agregar/editar dirección
	*/
	function cancel(){
		document.getElementById('add_address').innerHTML = "<?php echo $t->_("Aggregate") ?>";
		document.getElementById('direccion').value = "";
    	document.getElementById('name_address').value = "";
    	document.getElementById('phone').value = "";
    	document.getElementById('lat').value = "";
    	document.getElementById('lon').value = "";
    	document.getElementById('id_address').value = "";
	}

	/*
	* Trae el detalle de la dirección seleccionada para su edición
	*/
	function detailAddress(id){        
        $.get("<?php echo $this->url->get('address/detail') ?>", {"address" : id}, function(data){
            var addr = data;
            var latit;
            var longit;
            document.getElementById('direccion').value = addr.address.address;
            document.getElementById('name_address').value = addr.address.name;
            document.getElementById('phone').value = addr.address.cellphone;
            document.getElementById('lat').value = addr.address.latitud;
            document.getElementById('lon').value = addr.address.longitud;
            document.getElementById('id_address').value = addr.address.id;
            document.getElementById('add_address').innerHTML = "<?php echo $t->_("Update") ?>";
            window.scrollTo(0,0);
            latit = parseFloat(addr.address.latitud);
            longit = parseFloat(addr.address.longitud);
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: {lat: latit, lng: longit },
            });

            var marker = new google.maps.Marker({
                position: {lat: latit, lng: longit },
                map: map
            });            
        });
    }


	var placeSearch, autocomplete, autocomplete2;

    autocomplete = new google.maps.places.Autocomplete((document.getElementById('direccion')),{ types: ['geocode'] });

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: {lat: 4.6767756, lng: -74.0505375 },
    });

    var marker = new google.maps.Marker({
        position: {lat: 4.6767756, lng: -74.0505375 },
        map: map
    });

    google.maps.event.addListener(map,'click',function(event) {

        marker.setPosition(event.latLng);
        document.getElementById('lat').value = event.latLng.lat();
        document.getElementById('lon').value = event.latLng.lng();

        var geocoder = new google.maps.Geocoder();

        var yourLocation = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());

        geocoder.geocode({ 'latLng': yourLocation },function(results, status) {

        var index = results[0].address_components.length - 1;
            document.getElementById('direccion').value = results[0].formatted_address.split(',')[0] ;
        });

    });

    google.maps.event.addListener(autocomplete, 'place_changed', function() {

        var place = autocomplete.getPlace();

        $("#lat").val(place.geometry.location.lat());
        $("#lon").val(place.geometry.location.lng());

        map.setCenter(new google.maps.LatLng(place.geometry.location.lat(), place.geometry.location.lng()));
        map.setZoom(15);

        var marker = new google.maps.Marker({
            position:new google.maps.LatLng(place.geometry.location.lat(), place.geometry.location.lng()),
            animation:google.maps.Animation.BOUNCE
        });
        marker.setMap(map);

    });

</script> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
{{ javascript_include('js/script.js') }}
