<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{ url('css/dashboard.css') }}">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web:300,400,600,700" rel="stylesheet">
    <!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
</head>

<body>
    <div class="container-fluid">
        <div id="header">
            <div class="row">
                <div>
                    <button id="open-sidebar" class="btn-custom"><i class="fa fa-bars"></i></button>
                </div>
                <div>
                    <a id="logo_brinks" href="{{ url('index/index') }}"><img  src="{{url('img/Logo_LogoAlmagrario.png')}}"></a>
                </div>
                <ul>
                    <li class="hour" id='hour'>
                        <!--<b>04:35</b>PM-->
                    </li>
                    <li class="date"  id='date'>
                        <!-- <b>26</b> JUNIO 2018 -->
                    </li>

                    <!-- ¡¡ IDIOMA ESPAÑOL INGLES !!-->

                    <!-- <li class="languaje-layouts-adminlayout" id="languageval" value="" onClick="changeLanguaje()">
                        <b><a id="language" ><?php echo $t->_("ln") ?><i class="fa fa-angle-down" aria-auto="true"></i></a></b>
                        <ul aria-hidden="true" class="nav pull-right" id="666">
                            <li><a id="prueba" href="<?php
                                if ($t->_("logocountry") == '/brinkscashcommerce/img/bolivia.png') {
                                    echo $this->url->get("index/setLanguage/esBol");
                                } else {
                                    echo $this->url->get("index/setLanguage/es"); 
                                }

                               ?>"><b>Es </b><img id="col" src="{{url('img/espana.png')}}"></a>                                   
                            </li>
                            <li><a href="<?php
                                if ($t->_("logocountry") == '/brinkscashcommerce/img/bolivia.png') {
                                    echo $this->url->get("index/setLanguage/enBol");
                                }else{
                                    echo $this->url->get("index/setLanguage/en"); 
                                }

                                ?>"><b>En </b><img id="usa" src="{{url('img/usa.png')}}"></a>                                   
                            </li>                            
                        </ul>                   
                    </li> -->

                    <!-- ¡¡ FIN IDIOMAS !! -->

                    <li class="sessionend-layouts-adminlayout" >
                        <a href="{{url('session/end')}}"><img src="{{url('img/AssetsSmartCash_Salida01.png')}}"></a>  
                    </li>
                </ul>
            </div>
            <div class='row div_userrow'>
                {% if access_type == 1 %}
                    <div>
                        <img id="img_user" class="img-circle" src="<?php echo $this->session->get("client_image"); ?>">
                    </div>
                    <div class="div_user">
                        <p>{{username}}</p>
                        <p><?php echo $t->_("account_user") ?></p>
                    </div>
                {% else %}
                    <div>
                        <img id="img_user" class="img-circle" src="<?php echo $this->session->get("imagen_comercio"); ?>">
                    </div>
                    <div class="div_user">
                        <p>{{username}}</p>
                        <p><?php echo $t->_("account_commerce") ?></p>
                    </div>                
                {% endif %}
            </div>
        </div>
        
        <!-- Menu -->
        <div class="col-md-2 col-sm-2 sidebar">
            <!-- Transacciones -->
            <div class="text-right button-x">
                <button id="close-sidebar" class="btn-custom alt"><i class="fa fa-times"></i></button>
            </div>
            <div id="profile" class="text-center">
                <p>{% if access_type == 1 %}        
                        <img id="img_user" class="css_Imagen_Usuario_Comercio" src="<?php 
                            echo $this->session->get("client_image"); 
                        ?>">
                    {% else %}
                        <img id="img_user" class="css_Imagen_Usuario_Comercio" src="<?php 
                            echo $this->session->get("imagen_comercio"); 
                        ?>">
                    {% endif %}</p>
                <p>{{username}}</p>
                <p><?php echo $t->_("account_user") ?></p>
                <p class="hour"></p>
                <p class="date"></p>   
            </div>
            <div class="parent" data-target="#trans"><b><?php echo $t->_("Transactions") ?></b></div>
            <ul class="submenu" id="trans">
                {% if access_type == 1 %}
                    <li class="submenu_parent" id='t3' ><a style="display: block;" href="{{url('client/checkReservationsClient')}}"><?php echo $t->_("ConsultTransactionss") ?></a></li>  
                    <li class="submenu_parent" id='t1'><a style="display: block;" href="{{url('client/reservationsProgressClient')}}"><?php echo $t->_("TransactionsInProgress") ?></a></li>
                    <li class="submenu_parent" id='t2' class="active"><a style="display: block;" href="{{url('client/historyClient')}}">Historial</a></li>
                {% else %}
                    <li class="submenu_parent" id='t3'  ><a style="display: block;" href="{{url('transaction/consulttransaction')}}"><?php echo $t->_("ConsultTransactionss") ?></a></li>
                    <li class="submenu_parent" id='t1'><a style="display: block;" href="{{url('transaction/consultTransactionProgress')}}"><?php echo $t->_("TransactionsInProgress") ?></a></li>
                    <li class="submenu_parent" id='t2' class="active"><a style="display: block;" href="{{url('transaction/reportsCommerce')}}"><?php echo $t->_("Reports") ?></a></li>
                {% endif %}
            </ul>
            <!-- Servicios -->
            
                {% if access_type == 1 %}
                <div class="parent" data-target="#services"><b> SOCIO ALMACENAMIENTO </b></div>
                    <ul class="submenu" id="services">
                        <li class="submenu_parent" id='sv1'><a style="display: block;" href="{{url('client/mySpacesClient')}}">Mis espacios</a></li>
                        <li class="submenu_parent" id='sv2'><a style="display: block;" href="{{url('client/reportsClient')}}">Reportes</a></li>
                    </ul>
                {% else %}
                <!-- <div class="parent" data-target="#services"><b><?php echo $t->_("Serv") ?></b></div>
                <ul class="submenu" id="services"> -->
                  <!-- <li class="submenu_parent" id='sv3'><a style="display: block;" href="{{url('service/payorbuy')}}"><?php echo $t->_("PayServ") ?></a></li> -->
                <!-- </ul> -->
                
                {% endif %}
            
            <!-- Retiros -->
            {% if access_type == 2 %}
                <!-- <div class="parent" data-target="#withdrawal"><b><?php echo $t->_("Withdrawals") ?></b></div>
                <ul class="submenu" id="withdrawal">
                    <li class="submenu_parent" id='w1'><a style="display: block;" href="{{url('register/requestwithdrawal')}}"><?php echo $t->_("RequestAWithdrawal") ?></a></li>
                    <li class="submenu_parent" id='w2'><a style="display: block;" href="{{url('register/checkwithdrawal')}}"><?php echo $t->_("ConsultWithdrawal") ?></a></li>
                </ul> -->
            {% endif %}  
            <!-- Configuración -->
            <div class="parent" data-target="#config"><b><?php echo $t->_("Configuration") ?></b></div>
            <ul class="submenu" id="config">
                {% if access_type == 2 %}
                    <li class="submenu_parent" id='c1'>
                        <a style="display: block;" href="{{url('register/integrationdata')}}"><?php echo $t->_("IntegrationData") ?></a>
                    </li>
                    <li class="submenu_parent" id='c2'>
                        <a style="display: block;" href="{{url('register/integrationoptions')}}"><?php echo $t->_("IntegrationOptions") ?></a>
                    </li>                        
                    <li class="submenu_parent" id='c3'>
                        <a style="display: block;" href="{{url('session/editClient')}}"><?php echo $t->_("ManageAccount") ?></a>
                    </li>
                {% else %}
                    <li class="submenu_parent" id='c4'>
                      <a style="display: block;" href="{{url('client/editClient')}}"><?php echo $t->_("EditProfilee") ?></a>
                    </li>                        
                {% endif %}
                <!-- <li class="submenu_parent" id='c8'><a style="display: block;" href="{{url('address/index')}}"><?php echo $t->_("Address") ?></a></li> -->
                <li class="submenu_parent" id='c6'><a style="display: block;" href="{{url('register/support')}}"><?php echo $t->_("Support") ?></a></li>
                <li class="submenu_parent" id='c7'><a style="display: block;" href="{{url('session/end')}}"><?php echo $t->_("Log_out") ?></a></li>
            </ul>
        </div>
        <div id="contenido" class="col-md-9 col-sm-9">
            {{ content() }}
        </div>
    </div>
    
</body>


<script>

    function hora(){
        var fecha= new Date();
        var horas= fecha.getHours() < 10 ? '0' + fecha.getHours() : fecha.getHours();
        var minutos = fecha.getMinutes() < 10 ? '0' + fecha.getMinutes() : fecha.getMinutes();
        var segundos = fecha.getSeconds();
        var meses = new Array ("<?php echo $t->_("textMonth_1") ?>","<?php echo $t->_("textMonth_2") ?>","<?php echo $t->_("textMonth_3") ?>","<?php echo $t->_("textMonth_4") ?>","<?php echo $t->_("textMonth_5") ?>","<?php echo $t->_("textMonth_6") ?>","<?php echo $t->_("textMonth_7") ?>","<?php echo $t->_("textMonth_8") ?>","<?php echo $t->_("textMonth_9") ?>","<?php echo $t->_("textMonth_10") ?>","<?php echo $t->_("textMonth_11") ?>","<?php echo $t->_("textMonth_12") ?>");
        $('.hour').html('<b>'+horas+':'+minutos+'</b>');
        $('.date').html('<b>'+fecha.getDate() +"</b> "+ meses[fecha.getMonth()] +" "+ fecha.getFullYear());
        setTimeout('hora()',1000);
    }

    function changeLanguaje(){
        if( $('#666').is(':visible') ){
            $('#666').hide();
        }else {
            $('#666').show();
        }
    }

    var xresponsive = window.matchMedia("(max-width: 901px)")
    var yresponsive = window.matchMedia("(min-width: 902px)")

    $(window).resize(function(){
        if (!xresponsive.matches){
            $('.sidebar').show();
        }
    });
    
    $('.sidebar .parent').append('<span><i class="fa fa-chevron-down"></i></span>');
    $('.sidebar .parent').click(function(event) {
        if (!xresponsive.matches){
            return false
        }
        if ($(this).is('[toggle]')) {
            $($(this).data('target')).hide();
            $(this).find('i').removeClass('fa-rotate-180');
            $(this).removeAttr('toggle');       
        } else {
            $($(this).data('target')).show();  
            $(this).find('i').addClass('fa-rotate-180');          
            $(this).attr('toggle', true);
        }
    });
    $('#open-sidebar').click(function(event) {
        if (!xresponsive.matches){
            return false
        }
        $('.sidebar').show();
        $('body').css('overflow-y', 'hidden');
    });
    $('#close-sidebar').click(function(event) {
        if (!xresponsive.matches){
            return false
        }
        $('.sidebar').hide();
        $('body').css('overflow-y', 'auto');
    });
    

    

    var menus = $(".submenu li");

    $(document).ready(function () {

        //* Seleccionar submenu*//
        $( "#t1" ).click(function() {
          localStorage.select = "t1";
        });

        $( "#t2" ).click(function() {
          localStorage.select = "t2";
        });

        $( "#t3" ).click(function() {
          localStorage.select = "t3";
        });

        $( "#w1" ).click(function() {
          localStorage.select = "w1";
        });

        $( "#w2" ).click(function() {
          localStorage.select = "w2";
        });

        $( "#c1" ).click(function() {
          localStorage.select = "c1";
        });

        $( "#c2" ).click(function() {
          localStorage.select = "c2";
        });

        $( "#c3" ).click(function() {
          localStorage.select = "c3";
        });

        $( "#c4" ).click(function() {
          localStorage.select = "c4";
        });   

        $( "#c5" ).click(function() {
          localStorage.select = "c5";
        });  

        $( "#c6" ).click(function() {
          localStorage.select = "c6";
        });  

        $( "#c7" ).click(function() {
          localStorage.select = "c7";
        });   

        $( "#c8" ).click(function() {
          localStorage.select = "c8";
        });  

        $( "#sv1" ).click(function() {
          localStorage.select = "sv1";
        });  

        $( "#sv2" ).click(function() {
          localStorage.select = "sv2";
        }); 

        $( "#sv3" ).click(function() {
          localStorage.select = "sv3";
        }); 

        if (localStorage.select == undefined){
          menus.removeClass("active");
          $('#t1').addClass("active");
        } else {
          menus.removeClass("active");
          $('#'+localStorage.select).addClass("active");
        }
    });  

</script>
<body onload="javascript:hora()">


