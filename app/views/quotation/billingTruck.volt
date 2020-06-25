<style type="text/css">
	#content-columns{
    height: 650px;
    display:flex;
    justify-content: space-between;
}
</style>
	<div id="content-columns" class="row">
		<div id="first-column" class="col-xs-12 col-md-4 col-lg-4 colum-flex">
			<div id="type_pay" class="disabled hidden-xs"></div>
			<div class="col-md-12" style="background-color: #009200; color: white; padding: 10px;">
				<center>
					Informacion de facturación
				</center>
			</div>

			<div id	="divboxuno" class="col-md-12 box_facturacion">
				<center style="font-weight: bold; margin-bottom: 5%;">
					Diligencia la información a continuación para completar tu reserva.
				</center>
				<div>
					<center style="">
						Nombre completo
					</center>
					<input type="hidden" name="id_client" value="{{dato.id_client}}">
					<input id="nombre" type="text" name="nameclient" value="{{dato.nameclient}}" class="text-center" readonly="readonly">

					<center>
						Tipo y número de documento
					</center>
					<select class="select_quotation" style="">
						<option>CC</option>
					</select>
					<input id="documento" type="number" name="" value="{{dato.document}}" style="" class="input_quotation text-center" min="1">

					<center>
						Celular
					</center>
					<input id="movil" type="number" name="phone" value="{{dato.phone}}" class="text-center" min="1">

					<center>
						Correo electrónico
					</center>
					<input id="correo" type="email" name="email" value="{{dato.email}}" class="text-center" readonly="readonly">
				</div>

				
				<button id="confirm-pay" class="btn btn-block btn-danger btn-quotation" style="margin-top: 15px">Continuar</button>
				
			</div>
			
		</div>
		<div id="seconth-column" class="col-xs-12 col-md-4 col-lg-4 space-xs colum-flex hidden-xs">
			<div id="location" class="disabled block hidden-xs"></div>
			<div class="col-md-12" style="background-color: #009200; color: white; padding: 10px;">
				<center>
					Método de pago
				</center>
			</div>
			<div id	="divboxdos" class="col-md-12 box_facturacion">
				<center style="font-weight: bold; margin-bottom: 5%;">
					Elige un medio de pago. 
				</center>
				<div style="">
					<!-- <div class="col-md-12">
						<input id="tc" class="pagos" type="checkbox" name="pago" style="width: 5%" value="1">
						<label style="width: 80%">Tarjeta de crédito</label>
                    </div>
                    <div class="col-md-12">
						<input id="rs" class="pagos" type="checkbox" name="pago" style="width: 5%" value="2">
						<label style="width: 80%">Red Servi</label>
                    </div> -->
                    <div class="col-md-12" style="margin-bottom: 10%;">
						<input id="toc" class="pagos" type="checkbox" name="pago" style="width: 5%" value="3">
						<label style="width: 80%; font-weight: lighter;">Transferencia o Consignación bancaria</label>						
                    </div>
                    <!-- <div class="col-md-12">
						<input id="pp" class="pagos" type="checkbox" name="pago" style="width: 5%" value="4">
						<label style="width: 80%">Pagos PSE</label>
                    </div> -->
                    <div class="col-md-12" style="margin-bottom: 10%;">
						<input id="bc" class="pagos" type="checkbox" name="pago" style="width: 5%" value="5">
						<img src="{{ url('img/LogoBrinks.png') }}" alt="">
                    </div>
				</div>

				
				<button id="btn-confirm-address" type="submit" class="btn btn-block btn-danger seconth-action-m btn-quotation" style="margin-top: 15px">Continuar</button>
				
			</div>
		</div>
		<div id="thirth-column" class="col-xs-12 col-md-4 col-lg-4 colum-flex hidden-xs">
			<div id="resumen" class="disabled block hidden-xs"></div>
			<div class="col-md-12" style="background-color: #009200; color: white; padding: 10px;">
				<center>
					Confirmación
				</center>
			</div>
			<div id	="divboxtres" class="col-md-12 box_facturacion">
				<center style="font-weight: bold; margin-bottom: 5%;">
					Confirma la información de tu reserva y finaliza el proceso.
				</center>
				<div style="">
					<div class="col-md-12" style="display: flex;">
						<label>
							Nombre
						</label>
						<label style="text-align: right;">
							{{ dato.name }}
						</label>
					</div>
					<div class="col-md-12" style="display: flex;">
						<label>
							Ciudad Origen
						</label>
						<label style="text-align: right;">
							{{ dato.name_city }}
						</label>
						</div>
					<div class="col-md-12" style="display: flex;">
						<label>
							Ciudad Destino
						</label>
						<label style="text-align: right;">
							{{ dato.name_city2 }}
						</label>
					</div>
					<div class="col-md-12" style="display: flex;">
						<label>
							Fecha inicial
						</label>
						<label style="text-align: right;">
							{{ dato.initial_date_truck }}
						</label>
					</div>
					<div class="col-md-12" style="display: flex;">
						<label>
							Hora
						</label>
						<label style="text-align: right;">
							{{ dato.hour }}
						</label>
					</div>
					<div class="col-md-12">
						{% if service is empty %}
                    {% else %}
                    
                    <label style="color: #f71e14;">Servicios:   </label>
                    <p class="text-right" style="margin-top: -2%; font-size: 18px;">{% for item in service %} {{item.name}}, {% endfor %}</p>
                    <hr>
                    
                    {% endif %} 
						
					</div>
					
					<hr style="border-top: 1px solid; width: 94%;">
					
					<div class="col-md-12" style="display: flex;">
						<label>
							Precio base
						</label>
						<label style="text-align: right;">
							$ {{ dato.cost }}
						</label>
					</div>

					<div class="col-md-12" style="display: flex;">
						<label>
							Iva
						</label>
						<label style="text-align: right;">
							$ {{ dato.ivanum }}
						</label>
					</div>

					<div class="col-md-2 col-xs-4">
	                    <label>Total</label>
	                </div>
	                <div class="col-md-10 col-xs-8" style="margin-top: -6%; text-align: right;">
                        <h3 style="font-weight: bold; color: red;">$ {{ dato.amountnum }} COP</h3>
                    </div>
				</div>
				<form id="formpago" action="{{ url('quotation/reservationCellar') }}" method="post" name="formulario_01">
					<input id="phone_cel" type="hidden" name="" value="{{dato.id}}">
					<input id="id" type="hidden" name="" value="{{dato.id}}">
					<input id="storage_cost" type="hidden" name="" value="{{dato.storage_cost}}">
					<input id="space_require" type="hidden" name="" value="{{dato.space_require}}">
					<input type="hidden" name="handling_cost" value="0">
					<input id="initial_date" type="hidden" name="" value="{{dato.initial_date}}">
					<input id="final_date" type="hidden" name="" value="{{dato.final_date}}">
					<input id="deposit_capacity" type="hidden" name="" value="{{dato.deposit_capacity}}">
					<input id="id_client" type="hidden" name="" value="{{dato.id_client}}">
					<input id="tipopago" type="hidden" name="tipopago" value="">
					<input id="service" type="hidden" name="" value="{{dato.service}}">
				</form>

				<form id="formbrinks" action="https://gateway.devel.logisticappweb.com/" method="POST" target="_blank">
					<input type="hidden" name="amount" value="{{ dato.amount }}">
					<input type="hidden" name="commerce_id" value="70">
					<input type="hidden" name="transaction_id" value="{{ dato.transaction_id }}">
					<input type="hidden" name="iva_ammount" value="{{ dato.iva }}">
					<input type="hidden" name="base_ammount" value="{{ dato.base_amount }}">
					<input type="hidden" name="signature" value="{{dato.signature}}">        
					<input type="hidden" name="description" value="260|B00LM0THQK 260|B01GGS93AW">
					<input type="hidden" name="address" value="">
					<input type="hidden" name="products[0][name]" value="{{dato.name}}">
					<input type="hidden" name="products[0][price]" value="{{dato.amount}}">
					<input type="hidden" name="products[0][img]" value="{{dato.image_url}}">
				 </form>

				 <button id="btn-pin" type="submit" class="btn btn-danger btn-send btn-block btn-quotation" style="margin-top: 15px" onclick="openModal(); currentSlide(1)">Confirmar y finalizar</button>

			</div>
		</div>
	</div>

	<!--<div id="modalTip" class="modal fade" role="dialog">
		<div class="modal-dialog" style="margin: 7% auto">

			<div class="modal-content modal-sm" style="margin: auto;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Propina</h4>
				</div>
				{{ form("", "method": "post", 'id': 'addTip' )}}
				<div class="modal-body">
					<input type="number" name="valTip" class="form-control" required placeholder="Ej: 5000">
				</div>
				<div class="modal-footer">
					<button class="btn btn-success" type="submit">Agregar Propina</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				{{ end_form() }}
			</div>
		</div>
	</div>-->


	<!-- Modal for check method pay -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Launch demo modal
    </button> -->

	<!-- Modal -->
	<div class="modal fade" id="modal_check_confirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content dim-modal">
				<div class="modal-header no-border">
					<h5 class="modal-title" id="exampleModalLabel"><b>Rellene todos los campos por favor</b></h5>
				</div>
				
				<div class="modal-footer no-border" style="text-align : center;">
					
					<button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
				</div>
				
			</div>
		</div>
	</div>

	<!-- The Modal/Lightbox -->
<div id="myModal" class="modal">
    <div class="col-md-12">
        <div class="modal-content box_light">        
            
            <center>
	            <div class="col-md-12 box_image_accept" style="margin-top: 2%;">
	                <img src="{{ url('img/Assets_Confirmación.png') }}" onclick="openModal();currentSlide(1)" class="hover-shadow">
	            </div>
            </center>
            <!-- <div class="col-md-6">
                <h5 style="color: #6f6a65; font-size: 35px; margin-bottom: -10px;">Próximamente</h5>
                <p style="margin-left: 2px;">tendremos disponible este servicio</p>
			</div> -->
			<div id="lightboxconfirm" class="col-md-12" style="color: black; text-align: center;">
				Tu reserva se ha realizado satisfactoriamente
            </div>
            <center>
            	<button onclick="closeModal()" type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: #d51e14">Entendido</button>
            </center>
        </div>
    </div>
</div>

<!-- The Modal/Lightbox -->
<div id="boxuno" class="modal">
    <div class="col-md-12">
        <div class="modal-content box_light">
            <!-- <div class="col-md-6">
                <h5 style="color: #6f6a65; font-size: 35px; margin-bottom: -10px;">Próximamente</h5>
                <p style="margin-left: 2px;">tendremos disponible este servicio</p>
            </div> -->
            <div class="col-md-12" style="color: black; text-align: center;">
            	<h1>Rellene todos los campos por favor</h1>
            </div>
            <center>
            	<button onclick="closeBoxuno()" type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: #d51e14">Entendido</button>
            </center>
        </div>
    </div>
</div>

<!-- The Modal/Lightbox -->
<div id="boxdos" class="modal">
    <div class="col-md-12">
        <div class="modal-content box_light">
            <!-- <div class="col-md-6">
                <h5 style="color: #6f6a65; font-size: 35px; margin-bottom: -10px;">Próximamente</h5>
                <p style="margin-left: 2px;">tendremos disponible este servicio</p>
            </div> -->
            <div class="col-md-12" style="color: black; text-align: center;">
            	<h1>Escoja una opcion por favor</h1>
            </div>
            <center>
            	<button onclick="closeBoxdos()" type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: #d51e14">Entendido</button>
            </center>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>
  $("#tc").on("click", function() {
  	$(".pagos").prop("checked", false);
    $("#tc").prop("checked", true);
    $("#tipopago").val(1);
  });
  $("#rs").on("click", function() {
  	$(".pagos").prop("checked", false);
    $("#rs").prop("checked", true);
    $("#tipopago").val(2);
  });
  $("#toc").on("click", function() {
  	$(".pagos").prop("checked", false);
    $("#toc").prop("checked", true);
    $("#tipopago").val(3);
  });
  $("#pp").on("click", function() {
  	$(".pagos").prop("checked", false);
    $("#pp").prop("checked", true);
    $("#tipopago").val(4);
  });
  $("#bc").on("click", function() {
  	$(".pagos").prop("checked", false);
    $("#bc").prop("checked", true);
    $("#tipopago").val(5);
  });
  // 		var url = "{{ url('quotation/reservationCellar') }}";
  // 		var id_cellar = $("input:hidden#id").val();
  // 		var storage_cost = $("input:hidden#space_require").val();
  // 		var handling_cost = 0;
  // 		var cubic_meters = $("input:hidden#space_require").val();
  // 		var initial_date = $("input:hidden#initial_date").val();
  // 		var final_date = $("input:hidden#final_date").val();
  // 		var deposit_capacity = $("input:hidden#deposit_capacity").val();
  // 		var id_client = $("input:hidden#id_client").val();
  		
		// var params = {
		//     "id_cellar" : {{dato.id}},
  //           "storage_cost" : {{dato.storage_cost}},
  //           "handling_cost" : "",
  //           "cubic_meters" : {{dato.space_require}},
  //           "initial_date" : initial_date,
  //           "final_date" : final_date,
  //           "deposit_capacity" : {{dato.space_require}},
  //           "id_client" : {{dato.id_client}},
  //           "type_pay" : tipopago 

		// };
		
		// console.log(params)
		// $('#btn-confirm-address').click(function(){
		// 	var tipopago = $("#tipopago").val();
		// 	console.log(tipopago)
		// });
</script>

<script>
    $('#btn-pin').click(function(){
        var url = "{{ url('quotation/reservationCellar') }}";
        var phone_cel = $("#movil").val();
        var id = $("input:hidden#id").val();
        var storage_cost = $("input:hidden#storage_cost").val();
        var space_require = $("input:hidden#space_require").val();
        var initial_date = $("input:hidden#initial_date").val();
  		var final_date = $("input:hidden#final_date").val();
  		var deposit_capacity = $("input:hidden#deposit_capacity").val();
  		var id_client = $("input:hidden#id_client").val();
  		var tipopago = $("input:hidden#tipopago").val();
  		var service = $("input:hidden#service").val();
        var params = {
        	"phone" : phone_cel,
		    "id_cellar" : id,
            "storage_cost" : storage_cost,
            "handling_cost" : "0",
            "cubic_meters" : space_require,
            "initial_date" : initial_date,
            "final_date" : final_date,
            "deposit_capacity" : deposit_capacity,
            "id_client" : id_client,
            "type_pay" : tipopago,
            "service" : service
		};
		
        $.ajax({
           type: "POST",
           url: url,
           data: params,
           success: function(data)
           {
             $('#resp').html(data);
           }
       });
    });
</script>

<script>
	
	$('#confirm-pay').click(function(){

		var nombre = $('#nombre').val();
		var identificacion = $('#documento').val();
		var celular = $('#movil').val();
		var email = $('#correo').val();

		if (nombre == '' || identificacion == '' || celular == '' || email == ''){
			openBoxuno();
		}else{

    		ancho = $(window).width();
			firstClick(ancho);			

			$("#location").css("display", "none");
		}
	});
	

</script>

<script>
	
	$('#btn-confirm-address').click(function(){
		var tc = $('#tc').prop('checked');
		var rs = $('#rs').prop('checked');
		var toc = $('#toc').prop('checked');
		var pp = $('#pp').prop('checked');
		var bc = $('#bc').prop('checked');

		console.log(tc);

		if (tc == false && rs == false && toc == false && pp == false && bc == false){
			openBoxdos();
		}else{

			ancho = $(window).width();
			seconthClick(ancho);
			
			$("#resumen").css("display", "none");
		}
	});

</script>

<script>
	$(document).ready(function() {
		
		var width = $(window).width();
		if (width < 700){
			
		}else{
			var divuno = document.getElementById("divboxuno");
			var botonuno = document.getElementById("confirm-pay");
			var heightdivuno = divuno.clientHeight;
			var widthbotonuno = botonuno.clientWidth;
			var divdos = document.getElementById("divboxdos");
			var botondos = document.getElementById("btn-confirm-address");
			var heightdivdos = divdos.clientHeight;
			var widthbotondos = botondos.clientWidth;
			var divtres = document.getElementById("divboxtres");
			var botontres = document.getElementById("btn-pin");
			var heightdivtres = divtres.clientHeight;
			var widthbotontres = botontres.clientWidth;

			if (heightdivuno > heightdivdos){		
				if (heightdivuno > heightdivtres){
					console.log("primero");
					divdos.style.height = heightdivuno+"px";
					divtres.style.height = heightdivuno+"px";
					divdos.style.position = "relative";
					botondos.style.position = "absolute";
					botondos.style.width = widthbotontres+"px";
					botondos.style.top = "77%";
					divtres.style.position = "relative";
					botontres.style.position = "absolute";
					botontres.style.width = widthbotontres+"px";
					botontres.style.top = "77%";
				}else{
					console.log("primero dos");
					divuno.style.height = heightdivtres+"px";
					divdos.style.height = heightdivtres+"px";
					divuno.style.position = "relative";
					botonuno.style.position = "absolute";
					botonuno.style.width = widthbotontres+"px";
					botonuno.style.top = "77%";
					divdos.style.position = "relative";
					botondos.style.position = "absolute";
					botondos.style.width = widthbotontres+"px";
					botondos.style.top = "77%";
				}
			}else{
				if (heightdivdos > heightdivtres){
					console.log("primero tres");
					divuno.style.height = heightdivdos+"px";
					divtres.style.height = heightdivdos+"px";
					divuno.style.position = "relative";
					botonuno.style.position = "absolute";
					botonuno.style.width = widthbotontres+"px";
					botonuno.style.top = "77%";
					divtres.style.position = "relative";
					botontres.style.position = "absolute";
					botontres.style.width = widthbotontres+"px";
					botontres.style.top = "77%";
				}else{
					console.log("primero cuatro");
					divuno.style.height = heightdivtres+"px";
					divdos.style.height = heightdivtres+"px";
					divuno.style.position = "relative";
					botonuno.style.position = "absolute";
					botonuno.style.width = widthbotontres+"px";
					botonuno.style.top = "77%";
					divdos.style.position = "relative";
					botondos.style.position = "absolute";
					botondos.style.width = widthbotontres+"px";
					botondos.style.top = "77%";
				}
			}
		}
	});	
	
</script>

<script>
	function cambio() {
		if (flagmodal == 1){
			location.href ="{{ url('index/index') }}";
		}        
    }
    setInterval(cambio, 3000);
</script>
