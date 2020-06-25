<!DOCTYPE html>
<html>

<head>
  {{ stylesheet_link('css/quotation.css') }}
  <style type="text/css">
    #content-payment {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      height: 95%;
    }

    .disabled {
      height: 100% !important;
    }
  </style>
  <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
  <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
</head>

<body>
  <!-- <input type="hidden" name="defaultAddress" id="defaultAddress" value="{{address}}">
  <input type="hidden" name="data" id="data" value="{{data}}">
  <input type="hidden" name="defaultDetails" id="defaultDetails" value="{{details}}">
  <input type="hidden" name="commerce_latitude" id="commerce_latitude" value="{{session.commerce_latitude}}">
  <input type="hidden" name="commerce_longitude" id="commerce_longitude" value="{{session.commerce_longitude}}">
  <input type="hidden" name="amount-hidd" id="amount-hidd" value="{{session.amount}}"> -->
 
<section id="head_responsive_billingcellar" style="">
  <div>
    <img src="{{ url ('img/Logo_LogoAlmagrario.png') }}">
  </div>
{{ content() }}

</section>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
  
  $('#confirm-pay').click(function(){
    payment = 'box1';
    if(payment != null){
        $('#type_pay').css({'display':'block'});
        $("#location").css("display", "none");
      }else{
      $("#modal_check_confirm").modal("show");
    }

  });

  $('#btn-confirm-address').click(function(){
    payment = 'box2';
    if(payment != null){
        $('#location').css({'display': 'block'});
        $("#resumen").css("display", "none");
      }else{
      $("#modal_check_confirm").modal("show");
    }

  });

</script>

{{ javascript_include('js/script.js') }}

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA70fslcm8mwK6ZSGPOc_S0SNaAn74G_6Y&callback=iniciarMapa&libraries=places"></script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script>
  $("#btn-save").click(
    function () {
      var detail = $("#detail-map-search").val();
      $("input[name='detail']").val(detail);
      $(".alert").css("display", "block");
      setTimeout(function () { $(".alert").css("display", "none"); }, 3000);
    }
  );
  
</script>

</html>