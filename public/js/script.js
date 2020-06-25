function base_url(){
	return $('#url').val()+'/';
}

var address; 
var addresses;
var payment = null; /*GLOBAL PAGO*/
var btnDrop = false;
var validation = false;
var flag = [false,false,false];
var ancho; 

function paintOption()
{
	$('#descrip-two').addClass('active');
	$('#descrip-three').removeClass('active');
}

/*Dirección enviada*/

/*Almacenar valores en variables*/
var defAddress = $('#defaultAddress').val();
var defDetails = $('#defaultDetails').val();
var defLatitud;
var defLongitud;

/*Select de las direcciones guardadas por el usuario*/
$('body').on('click','#selectpicker li', function(){
	$('#resumen').css({'display': 'block'});

	
	paintOption();
	if($(this).val() != "seleccionar") 
	{
		validation = true;
		$('#wrap-dir').css({"display": "block"});
		$('#ver').css({"display": "none"});
		$('#addresses').removeClass('glyphicon-chevron-up');
		$('#addresses').addClass('glyphicon-chevron-down');
		$('.padding-sect-two').css({'margin-bottom':'12px'});
		var fullAddress =  $(this).attr("value").split("_");/*objeto con toda la información de las direccion guardada*/
		console.log(fullAddress[5])
		/*Se separan los elementos*/
		var lat = fullAddress[0];
		var lng = fullAddress[1];
		var address = fullAddress[2];
		var details = fullAddress[3];
		var phone = fullAddress[4];
		var id = fullAddress[5];
		var address_name = fullAddress[5];
		initMap(lat, lng);

		$('#mapsearch').val(address);
		$('#detail-map-search').val(details);
		$('#address-relative').text(address);
		$('#add-name').val(address_name);
		//$('#add-phone').val(phone);
		$('#address-absolute').text(details);

		if( $('#address-end').text() != "No existe información aún" ){
			$('#address-end').text(address);
		}

		$('#box-details').removeClass('has-error');


		$('#address-name').text(address_name);
		$('#address_tran').val(address);
		$('#detail_tran').val(details);
		$('#latitud_tran').val(lat);
		$('#longitud_tran').val(lng);
		//$('#phone').val(phone);
		//$('#address_id').val(id);
		$('#btn-drop').css({'display': 'block'});
	}else{

	
		if (defAddress != "") {
			iniciarMapa();
		}

		// if (defAddress == "") {
		// 	$('#address-relative').text('No posee una direccion.');
		// }
		//iniciarMapa();
		$('#btn-drop').css({'display': 'none'});

		limpiarCampos();
	}	
});

function limpiarCampos(){

	$('#mapsearch').val(defAddress);
	$('#address').val(defAddress);
	$('#address-relative').val(defAddress);

	$('#detail-map-search').val(defDetails);
	$('#detail').val(defDetails);
	$('#address-absolute').val(defDetails);

	$('#address-end').text('No existe información aún');
	$('#name_address').val('');
	$('#phone').val('');
	$('#latitud').val(defLatitud);
	$('#longitud').val(defLongitud);
	$('#address_id').val('');
	

	$('#add-name').val('');;
	$('#add-phone').val('');
}

function iniciarMapa()
{
	
	// var address = document.getElementById('defaultAddress').value;
	var address = undefined;
	var details = $('#defaultDetails').val();

	/*Si llega una dirección*/

	if (address != null && address != undefined && address != "" && $('#data').val() != "Array") {

		//1- Asignar texto de la direccion al spam
		$('#address-relative').text(address);

		//2- Asignar direccion al input de busqueda
		$('#mapsearch').val(address);

		if (details != null) {
			//3- Asignar texto del detalle al spam
			$('#address-absolute').text(details);	

			//4- Asignar detalles al input de detalles
			$('#detail-map-search').val(details);
		}

		initMap(null, null, address);			
	}

	if( address == undefined && $('#data').val() != "Array" ) {
		console.log("ACA");
		var com_latitude 	= $('#commerce_latitude').val();
		var com_longitude 	= $('#commerce_longitude').val();

		initMap(com_latitude, com_longitude, null);
	}

	/*Si no me llega una direccion pero tengo almcenadas*/

	if ( (address == null || address == undefined || address == "") && $('#data').val() == "Array")  {
		
		var data = $('#selectpicker li').first().attr('value');
		if (data != undefined && data != null && data != "") {

			addresses = $('#selectpicker li').length;
			
			btnDrop = true;
			validation = true;
			$('#selectpicker').find('option:nth-child(2)').attr("selected", "selected");
			var data 	= data.split("_");
			var lat 	= data[0];
			var lng 	= data[1];
			var address = data[2];
			var details = data[3];
			//var phone 	= data[4];
			var id 		= data[4];
			var name_address = data[5];			

			//0 - Asignar Nombre de la dirección al spam
			
			$('#address-name').text(name_address);

			//1-Asignar texto de la direccion al spam
			$('#address-relative').text(address);

			//1.1-Asignar direccion al input de busqueda
			$('#mapsearch').val(address);

			//1.2-Asignar direccion al form
			$('#address_tran').val(address);

			//2-Asignar titulo al input
			$('#add-name').val(name_address);


			//3-Asignar texto del detalle al spam
			$('#address-absolute').text(details);	

			//3.1-Asignar detalles al input de detalles
			$('#detail-map-search').val(details);

			//3.2-Asignar detalles al form
			$('#detail_tran').val(details);


			//5-Asignar la latitud al form
			$('#latitud_tran').val(lat);

			//6-Asignar la longitud al form
			$('#longitud_tran').val(lng);

			$('#latitude').val(lat);
			$('#longitude').val(lng);

			//7-Asignar address_id al form
			//$('#address_id').val(id);

			//8- test
			$('#test').val(lng);

		}	

		initMap(lat, lng, null);
	}	
}

var marker;
var map;


function initMap(lat = null, lng = null, address = null) 
{
	if (lat == null && lng == null && address == null) {

		lat = 4.710988599999999;
		lng = -74.072092;

		// $('#address-relative').text('No posee una direccion');
	}
	
	
	var latitude = parseFloat(lat);
	var longitude = parseFloat(lng);
	var latlng = new google.maps.LatLng(latitude, longitude);
	//var iconBase = base_url()+'img/Brinks_mark.png'; //Icono a implementar
    map = new google.maps.Map(document.getElementById('map'), {
	    center: latlng,
	    zoom: 16
    });


    if (address != null || address != undefined ) {
    	var geocoder = new google.maps.Geocoder();
		geocodeAddress(geocoder, map, address);	
    }else{
    	marker = new google.maps.Marker({
			position: {
				lat:latitude, 
				lng: longitude
			},
			map: map,
			dragable:true

		  	//icon: iconBase
		});
    	
    	var geocoder = new google.maps.Geocoder();
		// google.maps.event.addListener(marker, 'dragend', function() {
			geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				validation = true;
				var address_res = results[0]['formatted_address'];
				$('address_name').text('');
				$('#address-relative').text(address_res);	
				$('#address-absolute').text("");
				$('#address-end').text(address_res);
				$('#details-end').text("");
				$('#detail-map-search').val("");	
				document.getElementById('address').value 		= address_res;
				document.getElementById('address_tran').value 	= address_res;
			 	document.getElementById('mapsearch').value 		= address_res;		
			}	
			});
		// });
    }
    
	google.maps.event.addListener(map,"click",function(event) {
		/*LimpiarMarcadores();
		marcarPuntos();*/
		$('#resumen').css({'display': 'block'});
		
		marker.setPosition(event.latLng);

		var geocoder = new google.maps.Geocoder();

		var yourLocation = new google.maps.LatLng(event.latLng.lat(), event.latLng.lng());

		geocoder.geocode({ 'latLng': yourLocation },function(results, status) {
			$('#address-relative').text(results[0].formatted_address);
			$('#address-absolute').text("");
			$('#address-end').text(results[0].formatted_address);
			$('#details-end').text("");
			$('#detail-map-search').val("");

 			var index = results[0].address_components.length - 1;
			document.getElementById('address').value 		= results[0].formatted_address;
			document.getElementById('address_tran').value 	= results[0].formatted_address;
		 	document.getElementById('mapsearch').value 		= results[0].formatted_address;
		 	document.getElementById('code_postal').value = results[0].address_components[index].long_name;

		 	paintOption();
		  //document.getElementById('location').value = results[0].formatted_address;
		});

		document.getElementById('latitud').value = event.latLng.lat();
		document.getElementById('longitud').value = event.latLng.lng();
		document.getElementById('latitude').value = event.latLng.lat();
		document.getElementById('longitude').value = event.latLng.lng();
		document.getElementById('latitud_tran').value = event.latLng.lat();
		document.getElementById('longitud_tran').value = event.latLng.lng();
		validation = true;

	});


	autocomplete = new google.maps.places.Autocomplete(
		(document.getElementById('mapsearch')),
		{ types: ['geocode'],
		componentRestrictions:{'country': 'co'} });
     

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		//console.log( JSON.stringify(place) );

		var location = new google.maps.LatLng( place.geometry.location.lat(), place.geometry.location.lng())
		marker.setPosition(location);
		map.panTo(new google.maps.LatLng( place.geometry.location.lat(), place.geometry.location.lng()));


		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({ 'latLng': location },function(results, status) {
			
			$('#address-relative').text(results[0].formatted_address);
			$('#address-absolute').text("");
			$('#address-end').text(results[0].formatted_address);
			$('#details-end').text("");
			$('#detail-map-search').val("");
			//$('#address-end').text(results[0].formatted_address);

			 document.getElementById('address').value = results[0].formatted_address;
			 document.getElementById('address_tran').value = results[0].formatted_address;
		 	//document.getElementById('location').value = results[0].formatted_address;

		});

		document.getElementById('latitud').value = place.geometry.location.lat();
		document.getElementById('longitud').value = place.geometry.location.lng();
		document.getElementById('latitude').value = place.geometry.location.lat();
		document.getElementById('longitude').value = place.geometry.location.lng();

		document.getElementById('latitud_tran').value = place.geometry.location.lat();
		document.getElementById('longitud_tran').value = place.geometry.location.lng();

		$('#resumen').css({'display': 'block'});
		paintOption();

		validation = true;
	});

	latitude = 0;
	longitude = 0;
}


function geocodeAddress(geocoder, resultsMap, address)
{
	

	//var address = document.getElementById('defaultAddress').value;
	geocoder.geocode({'address': address, 'componentRestrictions': {'country': 'CO'}}, function(results, status) {
		var lat;
		var lng;
      	if (status === 'OK') {

	        resultsMap.setCenter(results[0].geometry.location);
	        marker = new google.maps.Marker({
	        map: resultsMap,
	        position: results[0].geometry.location   

        });
			$('#address').val(address);
			$('#address_tran').val(address);
			defLatitud = results[0].geometry.location.lat();
			defLongitud = results[0].geometry.location.lng();
	        $('#latitud').val(results[0].geometry.location.lat());
			$('#longitud').val(results[0].geometry.location.lng());
			$('#latitud_tran').val(results[0].geometry.location.lat());
			$('#longitud_tran').val(results[0].geometry.location.lng());
			$('#testlat').val(results[0].geometry.location.lat());
			$('#testlong').val(results[0].geometry.location.lng());
			validation = true;

      	} else {
	       
	    }   
	});
		
}

$(document).ready(function(){	
	//Paymentflow
	/*Evento click sobre la opcion de pago*/
	//return lat;
	$('body').on('click', '#deleteAddress', function() {
		//console.log($(this).val()); return;
		var id = $(this).parent().attr('id');
		  $.ajax({
			type: 'POST',
			url: base_url()+'paymentflow/deleteAddress',
			data: {id_location:id},

			success: function(data) {				
				limpiarCampos();
				var select = document.getElementById('selectpicker');
				$("#selectpicker").find("li[id='"+id+"']").remove(); 
			}
		  });       
	  return false;
	});

	//$('input[name="pay-option"').click(function(){

	 

	$('.padding-sect').click(function(){                
        if(flag[0] == true){
            flag[1] = false;

            $('#descrip-one').removeClass('active');
            var id = $(this).attr('id');
            var address = document.getElementById('defaultAddress').value;
            $('.padding-sect').removeClass('active');
            $(this).addClass('active');
        
            $('#code_pay').val(id);

            $('.check-active').removeClass('check-active');
            $('.box-shadow').removeClass('box-shadow');
            $(this).find('#check-active'+id).addClass('check-active');
            $(this).addClass('box-shadow');

            if (id == "1") {

                payment = 'Centro de Recaudo';
                var code = $('#'+id+'.code').val();    
                $('#tip').addClass('none');
                $('#payment-service').addClass('none');
                $('#btn-pin').text("Generar PIN de pago");
                $('#valCoverage').removeClass('submit');
				$('#valCoverage').addClass('button');
				
				var amount = parseInt($('#amount').attr('value'));								

				if ($('#amount-hidd').val() < amount) {
					
					let tip = parseInt($('#home-service').attr('value'));
					let new_amount = amount - tip;
					$('#amount').text('$ ' +$.number(new_amount, 0, '.', '.'));
					$('#amount').attr('value', new_amount);
					
				}
				
            } else if (id == "2") {

                payment = 'Domiciliado';
                $('#tip').removeClass('none');
                $('#payment-service').removeClass('none');
                $('#btn-pin').text("Solicitar Recaudo");
                $('#valCoverage').removeClass('button');
				$('#valCoverage').addClass('submit');
			
				var hid_amount = parseInt($('#amount-hidd').attr('value'));
				var home_amount = hid_amount + 3500;
				
				let tip = parseInt($('#home-service').attr('value'));
				let amount = parseInt($('#amount').attr('value'));
					
				let new_amount = tip + amount;

				if(home_amount == new_amount) {

					$('#amount').text('$ ' + $.number(new_amount, 0, '.', '.'));
					$('#amount').attr('value', new_amount);
				}												
            }

            if(btnDrop == true){ $('#btn-drop').css({'display': 'block'}); } 
        }
    });

  //   $('#confirm-pay').click(function(){
		
  //   	if(payment != null){
  //   		dataQuotation();
  //   	}else{
		// 	$("#modal_check_confirm").modal("show");
		// }
        
  //   });

    function dataQuotation() 
	{
		
		$('#location').css({'display': 'none'});
		$('#resumen').css({'display': 'block'});
		$('.wrap-input').removeAttr("disabled");/*se habilitan los input*/
		$('#descrip-two').addClass('active');/*actualizamos el border de la descripcion*/
		$('#descrip-three').removeClass('active');
		$('#address-end').text('No existe información aún');
		$('#type-pay-end').text('No existe información aún');
		$('#payment_method').val(payment); /*asigna el metodo de pago de payment/quotation para enviarlo a la pantalla pago*/
		$('#type_pay').css({'display':'block'});
		$('#location').removeClass('block');
			
	}


	$('#type_pay').click(function(){
		$('.par-descrip').removeClass('active');
		$('#descrip-one').addClass('active');
	});

	$('#location').click(function(){
		
		if(payment != null) {
			$('.par-descrip').removeClass('active');
			$('#descrip-two').addClass('active');
		}

	});
	
    $('#mapsearch').keyup(function(){
    	validation = false;
		$('#text-action').text("ingresa tu ubicación.")
    	$('#resumen').css({'display':'block'});
    });    

    $('#detail-map-search, #add-name, #add-phone').keyup(function(){
		$('#text-action').text("ingresa tu ubicación.")
    	$('#resumen').css({'display':'block'});
    });
	
	$('#detail-map-search').blur(function(){
		$('#address-absolute').text($(this).val());
	});

	$('#btn-pin').click(function(){
		$(this).attr("disabled");
		$(this).css({"cursor":"not-allowed"});

		var value = $('#code_pay').val();

		if (value == 1){
			$(this).text("Generando PIN ...");
		}else{
			$(this).text("Registrando datos ...");
		}
	});


	$('#addNew').click(function(e){
		e.preventDefault();
		$('#addressModal').modal("show");
		if($(this).is(':checked')){
			
		}
	});

	$('#modal').click(function(e){
		e.preventDefault();
		var value = $('#detail-map-search').val();
		$('#detail').val(value);
		$('#addressModal').modal('show');
	});

	/** FUNCTION TO STORED NEW ADDRESS */
	$('#aceptAdd').submit(function(e){
		e.preventDefault();	
		var btnSubmit = $(this).find(".btn-success");
		btnSubmit.prop('disabled', 'disabled');		
		btnSubmit.text('Almacenando...');
		$.ajax({
			url:base_url()+'paymentflow/createAddress',
			type:'POST',
			data:$(this).serialize(),
			success:function(response){
				if (response == 0) { //Valor para validar que la dirección no cumple con la cobertura 
					var mess = document.getElementById("save-msg-address").innerHTML; 
					document.getElementById("save-msg-address").className = "alert alert-danger";
				    var resp = "La dirección ingresada no cumple con el área de cobertura";
				    $("#save-msg-address").text(resp);
				    return;
				} 

				var JsonResponse = JSON.parse(response);
				
				$('#selectpicker').append('<li id="'+ JsonResponse.data.id +'" value="'+JsonResponse.data.latitud+'/'+JsonResponse.data.longitud+'/'+ JsonResponse.data.address+'/'+JsonResponse.data.detail_address+'/'+JsonResponse.data.id+'/'+JsonResponse.data.name_address+'">'+
				'<div> <img src="'+ base_url()+"public/img/Assets_Ubicacion.png"+'"> </div>' +
				'<div class="wrap-info-address"> <p class="name-address"> ' + JsonResponse.data.name_address + '</p>  <p>'+ JsonResponse.data.address+'</p> </div>' +
				'<div> <p>'+ JsonResponse.data.detail_address +'</p> </div>' +
				'</li>');

				// '<button id="deleteAddress" type="button" class="btn btn-danger glyphicon glyphicon-trash" title="Eliminar Dirección" value="'+ JsonResponse.data.id +'"></button></li>');
				// $('.arrow').removeAttr('style');
				
				$('#img-default-address').removeClass('none');
				var count = $('#selectpicker li').length;

				if(count > 1) {
					$('#stored-address').removeClass('none');
				}
				var str = document.getElementById("save-msg-address").innerHTML; 
				document.getElementById("save-msg-address").className = "alert alert-success";
			    var res = JsonResponse['message'];
			    $("#save-msg-address").text(res);
			},error(xhr, status){
				alert("Ocurrió un error al guardar la dirección");				
			},complete(xhr, status){
				btnSubmit.removeAttr('disabled');	
				btnSubmit.text('Aceptar');
				$('#addressModal').modal('hide');
				$('#name_address').val("");
			}
		});
		
		return
	});


	/** VALIDATE COVERAGE */
	$('#valCoverage').submit(function(e){
	e.preventDefault();	

	if($(this).hasClass('button')) {

		flag[1] = true;
		$('#address_tran').val($('#mapsearch').val());
		$('#address-end').text($('#mapsearch').val());
		
		$('#detail_tran').val($('#detail-map-search').val());
		$('#details-end').text($('#detail-map-search').val());

		
    	$('#resumen').css({'display': 'none'});

    	var address_rela = $('.wrap-direction #address-relative').text();
    	var address_abso = $('.wrap-direction #address-absolute').text();

    	address = address_rela + ' ' + address_abso;

    	/* $('#address-end').text(address); */
    	$('#type-pay-end').text(payment);

		$('#descrip-two').removeClass('active');
		
		
		$('#location').css({'display': 'block'});

	} else if ($(this).hasClass('submit')) {
		$.ajax({
			url:base_url()+'paymentflow/validateCoverage',
			type:'POST',
			data:$(this).serialize(),
			success:function(response){				
				if (response == 0) { //Valor para validar que la dirección no cumple con la cobertura 
					var mess = document.getElementById("save-msg-address").innerHTML; 
					document.getElementById("save-msg-address").className = "alert alert-danger";
				    var resp = "La dirección ingresada no cumple con el área de cobertura";
				    $("#save-msg-address").text(resp);
				    var detail = $("#detail-map-search").val();
		            $( "input[name='detail']" ).val(detail);
		            $(".alert").css("display","block");
		            setTimeout(function(){ $(".alert").css("display","none"); }, 3000);
			
				} else {

					flag[1] = true;

			    	if(validation == false){
			    		alert("Seleccione una direccion valida");
			    		return;
			    	}

					// $('#text-action').text("confirma tu pago.");/*actualizamos el texto acción*/

			    	if( $('#mapsearch').val().length <= 0 || $('#mapsearch').val().trim() == ""   ) {
			    		
			    		$('#mapsearch').focus();
			    		$('#wrap-text').addClass('has-error');
			    		return;
			    	}

					$('#address_tran').val($('#mapsearch').val());
					$('#address-end').text($('#mapsearch').val());
					
					$('#detail_tran').val($('#detail-map-search').val());
					$('#details-end').text($('#detail-map-search').val());

					
			    	$('#resumen').css({'display': 'none'});

			    	$('#descrip-three').addClass('active');

			    	var address_rela = $('.wrap-direction #address-relative').text();
			    	var address_abso = $('.wrap-direction #address-absolute').text();

			    	address = address_rela + ' ' + address_abso;

			    	/* $('#address-end').text(address); */
			    	$('#type-pay-end').text(payment);

					$('#descrip-two').removeClass('active');
					
					
					$('#location').css({'display': 'block'});
				}

			},error(xhr, status){
				alert("Ocurrió un error al guardar la dirección");				
			},complete(xhr, status){
				//btnSubmit.removeAttr('disabled');	
			}
		});
	}	


	
		
		return
	});



	/** FUNCTION TO ADD TIP */

	$('#addTip').submit(function(e){
		e.preventDefault();
		var tip = $('input[name=valTip]').val();
		$('#tip').val(tip);	
		
		$('#modalTip').modal('hide');
	});
	
	$('#selectpicker li').click(function(){
		var id = $(this).attr("value");
	});

	// $('#confirm-pay').click(function(){
	// 	var payment = "box1";
	// 	console.log(payment);
	// 	if(payment != null){
 //    		ancho = $(window).width();
	// 		firstClick(ancho);
 //    	}else{
	// 		$("#modal_check_confirm").modal("show");
	// 	}
	// });

	// $('#btn-confirm-address').click(function(){
	// 	ancho = $(window).width();
	// 	seconthClick(ancho);
	// });

	$('.disabled').click(function(){
		if($(this).hasClass('block')) {
			return;
		}
		$('.disabled').css({'display': 'block'});
		$(this).css({'display':'none'});
	});

	setAddress();
});


/* RESPONSIVE  */
function firstClick(ancho) {  	
	
	if(ancho <= 991){

		flag[1] = false;

		$('#first-column').addClass('hidden-xs');
		$('#seconth-column').removeClass('hidden-xs');
	}
}

function seconthClick(ancho) {
	flag[1] = true;
	if(ancho <= 991){
		$('#seconth-column').addClass('hidden-xs');
		$('#thirth-column').removeClass('hidden-xs');
	}
}


function setAddress()
{
	
	// console.log(addresses);

	if ( $('#data').val() == "Array" && addresses == 1) {

		$('#oneAddress').removeClass('none');
		$('#img-default-address').removeClass('none');		
		return;

	} else if ( $('#data').val() == "Array" && addresses > 1 ) {

		$('#stored').removeClass('none');
		$('#img-default-address').removeClass('none');
		$('#stored-address').removeClass('none');
		return;

	} else if ( $('#data').val() != "Array" && $('#defaultAddress').val() != "" ) {
		$('#img-default-address').removeClass('none');
		$('#oneAddress').removeClass('none');
		return;

	} else if ( $('#defaultAddress').val() == "" || $('#data').val() != "Array" ) {		
		$('#noLocation').removeClass('none');		
		return;
	}

	return;
}

$(document).ready(function($) {


    if (window.history && window.history.pushState) {
        
	  window.history.pushState('forward', null, '');
	  array_column = ["type_pay","location","resumen"];

		if($("#type_pay.disabled").length > 0){
			flag[0] = true;
		}
		
		if($("#location.disabled").length > 0){
			flag[1] = true;
		}

		if($("#resumen.disabled").length > 0){
			flag[2] = true;
		}			 


	  
      $(window).on('popstate', function() {
      	
		if(flag[1] == false){
			$("#type_pay").css("display", "none");
			$("#location").css("display", "block");

			if (ancho <= 991) {
				$('#first-column').removeClass('hidden-xs');
				$('#seconth-column').addClass('hidden-xs');
			}
			
		}else{
			$("#resumen").css("display", "block");
			$("#location").css("display", "none");

			if (ancho <= 991) {
				
				$('#seconth-column').removeClass('hidden-xs');
				$('#thirth-column').addClass('hidden-xs');
			}

			flag[1] = false;
		}


		window.history.pushState('forward', null, './quotation/#forward');
      });
    
	}
});
$("#btn-save").click(
	function(){
		var detail = $("#detail-map-search").val();
		$( "input[name='detail']" ).val(detail);
	}
);

// modal checkoutlayout
    function openModal() {
	document.getElementById('myModal').style.display = "block";
	var tipopago = $("input:hidden#tipopago").val();
	if (tipopago == 5){
		document.getElementById("lightboxconfirm").innerHTML = "Te estamos direccionando a Brinks para que realices tu pago";
	}

    }

	var flagmodal = 0;

    function closeModal() {
	document.getElementById('myModal').style.display = "none";
	var tipopago = $("input:hidden#tipopago").val();
	if (tipopago == 5){
		flagmodal = 1;
		document.getElementById("formbrinks").submit();
	}else{
		location.href ="{{ url('index/index') }}";
	}
    
    }

    function openBoxuno() {
    document.getElementById('boxuno').style.display = "block";
    }

    function closeBoxuno() {
    document.getElementById('boxuno').style.display = "none";
    $("#type_pay").css("display", "none");
    $("#location").css("display", "block");
    }

    function openBoxdos() {
    document.getElementById('boxdos').style.display = "block";
    }

    function closeBoxdos() {
    document.getElementById('boxdos').style.display = "none";
    $("#location").css("display", "none");
    $("#resumen").css("display", "block");
    }

    // var slideIndex = 1;
    // showSlides(slideIndex);

    // function plusSlides(n) {
    // showSlides(slideIndex += n);
    // }

    // function currentSlide(n) {
    // showSlides(slideIndex = n);
    // }

    // function showSlides(n) {
    // var i;
    // var slides = document.getElementsByClassName("mySlides");
    // if (n > slides.length) {slideIndex = 1}
    // if (n < 1) {slideIndex = slides.length}
    // for (i = 0; i < slides.length; i++) {
    //     slides[i].style.display = "none";
    // }
    // slides[slideIndex-1].style.display = "block";
    // };


// $(document).ready(function () {
	
// 	if (document.getElementById("mostrar_modal").value == 'login_failure'){
// 		$("#myModal").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'session_close'){
// 		$("#myModal1").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'forgot_password_success'){
// 		$("#myModal2").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'change_password_success'){
// 		$("#myModal3").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'change_password_failure'){
// 		$("#myModal4").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'add_address_success'){
// 		$("#add_success").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'add_address_failure'){
// 		$("#add_failure").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'delete_address_success'){
// 		$("#delete_success").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'delete_address_failure'){
// 		$("#delete_failure").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}	

// 	if (document.getElementById("mostrar_modal").value == 'email_contact_success'){
// 		alert("test");
// 		$("#contact_success").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}

// 	if (document.getElementById("mostrar_modal").value == 'email_contact_failure'){
// 		$("#contact_failure").modal("show");
// 		document.getElementById("mostrar_modal").value = "";
// 	}		
// });

	


