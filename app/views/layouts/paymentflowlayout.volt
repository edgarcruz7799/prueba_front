<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../../../../favicon.ico"> -->

    <title>PaymentGateway Mockup</title>

    <!-- Bootstrap core CSS -->
   


    <!-- Custom styles for this template -->
    
    <link href="narrow-jumbotron.css" rel="stylesheet">
  </head>

  <body >


      
      <div class="row gatewayheader">
        <div class="col-lg-6 logos">
        <img src="{{ url('img/linio.png') }}" >
        <?$this->        
          
          <span class="verticalline"></span>
        <img src="{{ url('img/brinks.png') }}" >
        <?$this->             

        </div>
        <div class="col-lg-6 contact">
          <p>Línea e-pago Nacional: 18000 -256363</br>¿Necesitas ayuda?</p>
        </div>
      </div>


    {{ flash.output() }}
    {{ content() }}

      <div class="trustedlogos">
        <img src="{{ url('img/google.png') }}" width="125" height="125" >
        <?$this->
        <img src="{{ url('img/norton.png') }}" width="90" height="50" >
        <?$this->
        <img src="{{ url('img/mcafee.png') }}" width="90" height="50" >
        <?$this->
        <img src="{{ url('img/bbb.png') }}" width="90" height="50" >
        <?$this->
        <img src="{{ url('img/truste.png') }}" width="90" height="50" >
        <?$this->

      </div>

      

    
    
    <footer class="footer">
      <p> Brinks. Todos los derechos reservados &copy;. 2017</p>
    </footer>
</body>
</html>