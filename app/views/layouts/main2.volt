<meta name="google-signin-client_id" content="523008452518-dldhhf487227uubhnrp3qkk8mv5rgij9.apps.googleusercontent.com">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>

<header id="mu-header" class="mu-fixed-nav" role="banner">
    <div class="container-fluid">
        <div class="topnav" id="myTopnav"> 
            <!-- <div class="col-md-2 col-sm-2 col-xs-2"> -->
            <a style="margin-top: -5px;" class="navbar-brand" href="{{ url('index/index') }}"><img id="logopage" src="<?php echo $t->_("logo") ?>" alt="Logo"></a>
            <!-- </div> -->
            <!-- <div class="col-md-10 col-sm-10 col-xs-10 topnav" id="myTopnav"> -->
            
            <a onMouseover="mostrarcapa('1');" class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/business')}}">
                <?php echo $t->_("Business") ?>
                <i class="" aria-hidden="true"></i>
            </a>
            <a onMouseover="mostrarcapa('2');" class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/buyers')}}">
                <?php echo $t->_("Buyers") ?>
                <i class="" aria-hidden="true"></i>
            </a>
            <a onMouseover="mostrarcapa('3');" class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/developers')}}">
                <?php echo $t->_("Developers") ?>
                <i class="fa fa-angle-down i-developers" aria-hidden="true"></i>
            </a>
            <a onMouseover="mostrarcapa('4');" class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/support')}}">
                <?php echo $t->_("Supportt") ?>
                <i class="" aria-hidden="true"></i>
            </a>
            
    
            <a onclick="mostrarcapa('222'); myFunction()" id="Login" class="btn btn-primary btn-lg <?php echo $t->_("loginbtnstyle") ?>" style="padding: 8px 15px 8px; border-color: rgb(8, 50, 148); color: rgb(8, 50, 148);">
                <?php echo $t->_("Login") ?>
            </a>
            <a onclick="mostrarcapa('555'); myFunction()" id="register" class="btn btn-primary btn-lg <?php echo $t->_("regbtnstyle") ?>" style="border-color: rgb(8, 50, 148); background-color: rgb(8, 50, 148);">
                <?php echo $t->_("SingUp") ?>
            </a>
            <a class="color-fuente">
                <i id="countryval" onClick="changeCountry()" class="" aria-hidden="true"></i>
                <img id="Country" src="<?php echo $t->_("logocountry") ?>">
            </a>            
            <a id="languageval" onClick="changeLanguaje()" id="language" class="color-fuente">
                <?php echo $t->_("ln") ?>
                <i class="fa fa-angle-down" aria-hidden="true"></i>
            </a>           
    
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
            
            <!-- </div> -->

        <!-- <nav class="navbar navbar-default mu-navbar ">
            <div class="container-fluid">
                <div class="navbar-header mu-menu">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a style="margin-top: -5px;" class="navbar-brand" href="{{ url('index/index') }}"><img id="logopage" src="<?php echo $t->_("logo") ?>" alt="Logo"></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    
                        
                            <ul class="nav navbar-nav mu-menu center-menu" >
                                <li onMouseover="mostrarcapa('1');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/business')}}"><?php echo $t->_("Business") ?><i class="" aria-hidden="true"></i></a></li>
                                <li onMouseover="mostrarcapa('2');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/buyers')}}"><?php echo $t->_("Buyers") ?><i class="" aria-hidden="true"></i></a></li>
                                <li onMouseover="mostrarcapa('3');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/developers')}}"><?php echo $t->_("Developers") ?><i class="fa fa-angle-down" aria-hidden="true"></i></a></li>
                                <li onMouseover="mostrarcapa('4');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/support')}}"><?php echo $t->_("Supportt") ?><i class="" aria-hidden="true"></i></a></li>
                            </ul>
                        
                        
                        <ul id="nav" class="nav navbar-nav navbar-right" style="margin-top:10px;">
                            <li onclick="mostrarcapa('222');"><a style="padding: 8px 15px 8px;" id="Login" class="btn btn-primary btn-lg <?php echo $t->_("loginbtnstyle") ?>" ><?php echo $t->_("Login") ?> </a></li>
                            <li onclick="mostrarcapa('555');"><a id="register" class="btn btn-primary btn-lg <?php echo $t->_("regbtnstyle") ?>"><?php echo $t->_("SingUp") ?></a></li>
                            
                            <li id="countryval" onClick="changeCountry()" ><a class="color-fuente"><i class="" aria-hidden="true"></i><img id="Country" src="<?php echo $t->_("logocountry") ?>"></a>
                            </li>
                            <li id="languageval" onClick="changeLanguaje()" ><a id="language" class="color-fuente"><?php echo $t->_("ln") ?><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav> -->



        <!-- <nav class="navbar navbar-default mu-navbar ">
            <div class="container-fluid">
                <div class="navbar-header mu-menu">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a style="margin-top: -5px;" class="navbar-brand" href="{{ url('index/index') }}"><img id="logopage" src="<?php echo $t->_("logo") ?>" alt="Logo"></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul id="nav" class="nav navbar-nav navbar-right">
                        <li onclick="mostrarcapa('222');"><a style="padding: 8px 15px 8px;" id="Login" class="btn btn-primary btn-lg <?php echo $t->_("loginbtnstyle") ?>" ><?php echo $t->_("Login") ?> </a></li>
                        <li onclick="mostrarcapa('555');"><a id="register" class="btn btn-primary btn-lg <?php echo $t->_("regbtnstyle") ?>"><?php echo $t->_("SingUp") ?></a></li>
                        <li id="countryval" value="ss" onClick="mostrarcapa('665');" ondblclick="ocultarcapa('665');"><a class="color-fuente"><i class="" aria-hidden="true"></i><img id="Country" src="<?php echo $t->_("logocountry") ?>"></a>
                        </li>
                        <li id="languageval" value="" onClick="mostrarcapa('666');" ondblclick="ocultarcapa('666');"><a id="language" class="color-fuente"><?php echo $t->_("ln") ?><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                        </li>
                    </ul>
                    <div id="menuprincipal">
                        <ul style="display: flex;width: 87%;justify-content: center;margin-left: -54px;" class="nav navbar-nav mu-menu  " >
                            <li onMouseover="mostrarcapa('1');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/business')}}"><?php echo $t->_("Business") ?><i class="" aria-hidden="true"></i></a></li>
                            <li onMouseover="mostrarcapa('2');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/buyers')}}"><?php echo $t->_("Buyers") ?><i class="" aria-hidden="true"></i></a></li>
                            <li onMouseover="mostrarcapa('3');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/developers')}}"><?php echo $t->_("Developers") ?><i class="fa fa-angle-down" aria-hidden="true"></i></a></li>
                            <li onMouseover="mostrarcapa('4');"><a class="<?php echo $t->_("textmenustyle") ?>" href="{{url('index/support')}}"><?php echo $t->_("Supportt") ?><i class="" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav> -->


        <ul aria-hidden="true" class="nav pull-right" style="display: none; margin-right: 86px;" id="665">
            <li><a href="<?php
                if ( $t->_("ln") == 'Es') {
                    echo $this->url->get("index/setLanguage/es");
                } else {
                    echo $this->url->get("index/setLanguage/en");
                }

                ?>" class="color-fuente">Col <img id="col" src="{{url('img/colombia.png')}}"></a>
            </li>
            <li style='padding-top: 5px;'><a href="<?php
                if ($t->_("ln") == 'Es') {
                    echo $this->url->get("index/setLanguage/esBol");
                } else {
                    echo $this->url->get("index/setLanguage/enBol");
                }

                ?>" style="" class = "color-fuente" >Bol <img id="usa" src="{{url('img/bolivia.png')}}"></a>
            </li>
        </ul>


        <ul aria-hidden="true" class="nav pull-right" style="display: none; margin-right: 14px;" id="666">
            <li style='padding-right: 5px;'><a id="prueba" class="color-fuente" href="<?php
                if ($t->_("logocountry") == '/brinkscashcommerce/img/bolivia.png') {
                    echo $this->url->get("index/setLanguage/esBol");
                } else {
                    echo $this->url->get("index/setLanguage/es");
                }

                ?>">Es <img id="col" src="{{url('img/espana.png')}}"></a>
            </li>
            <li style='padding-top: 5px;'><a class="color-fuente" href="<?php
                if ($t->_("logocountry") == '/brinkscashcommerce/img/bolivia.png') {
                    echo $this->url->get("index/setLanguage/enBol");
                } else { 
                    echo $this->url->get("index/setLanguage/en");
                }
                
                ?>">En <img id="usa" src="{{url('img/usa.png')}}"></a>
            </li>
        </ul>
    </div>





<!--*************************************-->
<!--SECCION DE MENU HOVER PARA DEVELOPERS-->
<!--*************************************-->

<div id="3" style="margin-left: -15px; margin-top: 12px; min-height: 100vh; display: none; background-color: rgba(0,0,0,0.85); position: fixed; width:100%;">

<section style="background-color: white;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                background-attachment: fixed;
                margin-right: 135px;
                width: 100%;
                overflow: hidden;">
    <div class="col-md-6 desc col-sm-6 desc" style="background-color:white; padding-bottom: 35px;"> <br><br><br>
        <div class="col-md-3 col-sm-3" >
            <img src="{{ url('img/desarro-1.png') }}">
        </div>
        <div class="col-md-9 col-sm-9" style="margin-top: -4%;">
            <h3 style="color: rgb(111, 191, 255)"><?php echo $t->_("WhatIsCashCommerce") ?></h3>
            <br>
            <p style="color: #9f9f9f; margin-top: -4%;"><?php echo $t->_("TextWhatIs") ?></p>
        </div>
        <div class="col-md-8 col-sm-8" style="margin-top: 16%;margin-left: 27%;     margin-bottom: 23.2%">
            <a href="{{url('index/developers')}}" class="mu-primary-btn btndevs">More Information</a>
        </div>
    </div>


    <div style="background-color: rgb(246, 249, 252); padding-left: 6%; padding-bottom: 35px;" class="col-md-6 col-sm-6"><br>
        <img src="{{ url('img/cerrar.png') }}" class="col-md-offset-12" onclick="ocultarcapa('3');" style="margin-left: 96%;">
        <div class="row">
            <div class="col-md-3 col-sm-3" style="margin-top: 9%;">
                <img src="{{ url('img/desarro-2.png') }}" width="97px">
            </div>

            <div class="col-md-9 col-sm-9">
                <h3 style="color: rgb(38, 227, 160)"><?php echo $t->_("HowToIntegrate") ?></h3><br>
                <div class="menu-item col-md-12 col-sm-12 developersitem">
                    <ul style="margin-top: -4%;">
                        <li onclick="rdrprueba('#')"><?php echo $t->_("Tutorials") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("Examples") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("Integration") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("Sandbox") ?></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-3" style="margin-top: 9%;">
                <img src="{{ url('img/desarro-3.png') }}" width="97px">
            </div>
            <div class="col-md-9 col-sm-9" >
                <h3 style="color: rgb(37, 215, 249)"><?php echo $t->_("IntegrationOptions") ?></h3><br>
                <div class="menu-item col-md-12 col-sm-12 developersitem">
                    <ul style="margin-top: -4%;">
                        <li onclick="rdrprueba('#')"><?php echo $t->_("Plugins") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("PaymentLink") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("PaymentButton") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("TechnicalSupport") ?></li>
                        <li onclick="rdrprueba('#')"><?php echo $t->_("ApiIntegration") ?></li>
                        <li onclick="rdrprueba('request/checkout')"><?php echo $t->_("WebCeckout") ?></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</div> 



<!--*************************-->
<!--SECCION HOVER DE REGISTRO-->
<!--*************************-->

<div id="555" style="margin-left: -15px; margin-top: 12px; min-height: 100vh; display: none; background-color: rgba(0,0,0,0.85); position: fixed; width:100%;">

<section style='background-color: white; 
                background-repeat: no-repeat; 
                background-position: center center; 
                background-size: cover; 
                background-attachment: fixed; 
                padding: 10px;
                max-height: calc(100vh - 76px); 
                overflow-y: auto;'>

    <img src="{{ url('img/cerrar.png') }}" class="col-md-offset-12" onclick="ocultarcapa('{{555}}');" style="position: fixed; right: 2%; z-index: 100;">

    <div style="" class="container-fluid">
        <div class="col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2">
        <div class="row insdeform">
            <section class="row group-body">
                <article class="col-lg-6 col-md-6 col-sm-6" >

                {{ form('session/registerClient', 'role':'form', 'class':'col-md-12 col-sm-6') }}
                    <section class="col-md-12 col-sm-12" style="margin-top: 8px;">
                        <div class="logoslogin">
                            <label style="text-align: center;"><?php echo $t->_("Personal") ?></label>
                        </div><br>  
                        <div class="logoslogin">
                            <img style="" src="{{ url('img/img1_personal.jpg') }}" >
                        </div><br>            
                        <input class="form-control" type="text" name="name" title="Name" id="name_client" style="margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("FullName") ?>">
                        <input class="form-control" type="email" name="email" title="Email" id="mail"style="margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("LogEmail") ?>">
                        <input class="form-control" type="password" name="password" title="Password" id="pass" style="margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("LogPass") ?>">
                    </section>
                    
                    <section class="col-md-12 col-sm-12">
                        <div class="confirm" style="border-bottom: 2px solid #3333332e; margin-bottom: 5%">
                            <input type="submit" name="crearCuenta" value="<?php echo $t->_("SingUp") ?>" class="btn btn-default signupbutton" />
                        </div>
                    </section>
                {{ end_form() }}    

                        <!--Botones de registro con redes sociales-->
                        <div id="form-fb" class= "col-md-12 col-sm-6 col-md-offset-3 col-sm-offset-6" style = "border-right: 2px solid #3333332e; margin-left: 32%;"></div>
                        <div id="form-g" class= "col-md-12 col-sm-6 col-md-offset-3 col-sm-offset-6" style = "border-right: 2px solid #3333332e; margin-left: 32%;"></div>
                    <br>
                </article>

                <article class="col-lg-6 col-md-6 col-sm-6">
                {{ form('session/registerCommerce', 'role': 'form', 'class': 'col-md-12 col-sm-6') }}

                    <section class="col-md-12 col-sm-12" style="margin-top: 8px;">
                        <div class="logoslogin">
                            <label style="text-align: center;"><?php echo $t->_("Business") ?></label>
                        </div><br>
                        <div class="logoslogin">
                            <img style="margin-bottom: 5%" src="{{ url('img/img2_negocio.jpg') }}" >
                        </div>              
                        <input class="form-control" type="text" name="commerce_name" id="commerce_name" autocomplete="on" style=" margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("CompanyName") ?>">
                        <input class="form-control" type="text" name="nit" id="nit" autocomplete="on" style=" margin-bottom: 1%;" required="required" placeholder="Nit">
                        <input class="form-control" type="text" name="name" id="name" autocomplete="on" style=" margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("FullName") ?>">
                        <input class="form-control" type="email" name="email" id="email" autocomplete="on" style="margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("LogEmailUser") ?>">
                        <input class="form-control" type="password" name="password" id="password" autocomplete="on" style="margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("LogPass") ?>">
                    </section>

                    <section class="col-sm-12 col-md-12">
                        <div class="confirm" style="margin-bottom: 5%">
                            <input type="submit" name="crearCuenta" value="<?php echo $t->_("SingUp") ?>" class="btn btn-default signupbutton"/>
                        </div>
                    </section><br>
                {{ end_form() }}
                </article>
            </section>
        </div>
    </div>
    </div>
</section>
</div>


<!--**********************-->
<!--SECCION HOVER DE LOGIN-->
<!--**********************-->

<div id="222" style="margin-left: -15px; display: none; margin-top: 12px; min-height: 100vh; display: none; background-color: rgba(0,0,0,0.85); position: fixed; width:100%; max-height: calc(100vh - 76px); overflow-y: auto;">
<div style='background-color: trasparent; 
            background-repeat: no-repeat; 
            background-position: center center; 
            background-size: cover; 
            background-attachment: fixed; 
            width: 100% height:100%;'>

<div style='background-color: white; 
            background-repeat: no-repeat; 
            background-position: center center; 
            background-size: cover; 
            background-attachment: fixed;
            padding: 10px;'>


<img src="{{ url('img/cerrar.png') }}" class="col-md-offset-12" onclick="ocultarcapa('{{222}}');" style="position: fixed; right: 2%; z-index: 100;">

<div style="" class="container-fluid">
<div class="col-md-8 col-md-offset-2">
    <div class="row insdeform margin: 25px 30px;">
        <div class="row group-body">    
            <article style="margin-bottom: 31px;" class="col-md-8 col-sm-6 col-md-offset-2 col-sm-offset-3" >
                <div class="col-md-8 col-sm-8 logoslogin">
                    <label style="font-size: 21px;"><?php echo $t->_("LogIndex") ?></label>
                </div><br>
                <div class="col-md-12 col-sm-12 logoslogin">
                    <h6><?php echo $t->_("LogText") ?></h6>
                </div>

                {{ form('session/loginClient', 'role': 'form') }}
                    <div class="col-md-12 col-sm-12" style="margin-top: 10px;">
                        <input class="form-control" type="email" name="login-email" title="Email" id="tx-login-email" style=" margin-bottom: 1%;" required="required" placeholder="<?php echo $t->_("LogEmail") ?>">
                        <input class="form-control" type="password" name="password" title="Password" id="password" style="  margin-bottom: 10%;" required="required" placeholder="<?php echo $t->_("LogPass") ?>">
                    </div>
                    <div class="col-md-12 col-sm-12 text-right">
                        <a href="{{url('session/forgotPasswordClient')}}" id="lnk-register" style="color: #106c7c;">Recordar contraseña</a>
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <div style="border-bottom: 2px solid #3333332e; margin-bottom: 10%">
                            <input type="submit" name="crearCuenta" value="<?php echo $t->_("LogIngr") ?>" class="btn btn-default signupbutton"/>
                        </div>                        
                    </div>                    
                {{ end_form() }}

                <!-- {{ form('index/restpass', 'role': 'form' , 'name':'resetea','id':'resetea', 'style':'position: relative; top: -110px; ') }}
                <section class="col-md-12 col-sm-12">
                  <div class="">
                <p class="pull-right"><a href="{{url('session/forgotPasswordClient')}}"  id="lnk-register" style="color: #106c7c;">Recordar contraseña</a></p><input type="hidden" id="tx-login-email-reset" name="tx-login-email-reset" value="" />                  
                  </div> 
                </section>  
                {{ end_form() }} -->

                {{ form("session/facebook", 'enctype': 'multipart/form-data', "method": "post", 'id': 'login-fb', 'class': 'form-add-1') }}
                    <div class="col-sm-12 col-md-12 col-xs-12" style="margin-top: -33px;">
                        <div>
                            <input type="hidden" name="fb_id" id="fb_id" value="">
                            <input type="hidden" name="token_fb" id="token_fb" value="">
                            <input type="hidden" name="mail_fb" id="mail_fb" value="">
                            <input type="hidden" name="name_fbb" id="name_fbb" value="">
                            <input type="hidden" name="status" id="status" value="">
                            <a onclick="login()">
                                <div name="crearCuenta" value="" class="btn btn-default signupfacebutton col-sm-12 col-md-12 col-xs-12"><?php echo $t->_("LogFace") ?></div>
                            </a>
                        </div>
                    </div>
                {{ end_form() }}
                
                {{ form("session/google", 'enctype': 'multipart/form-data', "method": "post", 'id': 'log-go', 'class': 'form-add-2') }}  
                    <input type="hidden" name="id_goo" id="id_goo" value="">
                    <input type="hidden" name="name_goo" id="name_goo" value="">
                    <input type="hidden" name="imageurl_goo" id="imageurl_goo" value="">
                    <input type="hidden" name="email_goo" id="email_goo" value="">
                    <input type="hidden" name="token_goo" id="token_goo" value="">
                    <input type="hidden" name="action" id="action" value="LogIn">                                                        
                    <div class="col-sm-12 col-md-12 col-xs-12">
                        <div id="my-signin2" class="customGPlusSignIn my-signin2 signupgoobutton" data-onsuccess="onSignIn" data-theme="dark">
                            <div name="crearCuenta" value="" class="btn btn-default signupgoobutton col-sm-12 col-md-12 col-xs-12"><?php echo $t->_("LogGoo") ?></div>
                        </div>
                    </div><br>
                    <?$this-> 
                {{ end_form() }} 
            </article>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</header>  



<!--Footer-->


<div class="container-fluid" style=" padding-right: initial; padding-left: initial;">
<!--     {{ flash.output() }}
 -->    {{ content() }}
    <hr>
  <section id="footer-menu" class="sections footer-menu">
            <div class="container-fluid">
                <div class="row">
                    <div class="footer-menu-wrapper">

                        <div align="left" class="col-md-12 col-sm-12 col-xs-12 col-md-offset-1">
                            <div class="col-md-2 col-sm-12 col-xs-12">
                                <div class="menu-item menu-item1">
                                    <h5><?php echo $t->_("Brinks") ?></h5>
                                    <ul>
                                        <li onclick="mostrarcapa('222');"><?php echo $t->_("Login") ?></li>
                                        <li onclick="mostrarcapa('555');"><?php echo $t->_("Create_account") ?></li>
                                        <li><?php echo $t->_("About_Brinks") ?></li>
                                        <li><?php echo $t->_("Privacy_Policy") ?></li>
                                        <li><?php echo $t->_("Legal") ?></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-12 col-xs-12">
                                <div class="menu-item menu-item2">
                                    <h5><?php echo $t->_("Business") ?></h5>
                                    <ul>
                                        <li><?php echo $t->_("How_do_we_do_it") ?></li>
                                        <li><?php echo $t->_("Security") ?></li>
                                        <li><?php echo $t->_("Rates") ?></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-12 col-xs-12">
                                <div class="menu-item menu-item3">
                                    <h5><?php echo $t->_("Buyers") ?></h5>
                                    <ul>
                                        <li><?php echo $t->_("Buy_in_cash") ?></li>
                                        <li><?php echo $t->_("Tracking_transaction") ?></li>
                                        <li><?php echo $t->_("Create_account") ?></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-12 col-xs-12">
                                <div class="menu-item menu-item4">
                                    <h5><?php echo $t->_("Developers") ?></h5>
                                    <ul>
                                        <li><?php echo $t->_("Api_integration") ?></li>
                                        <li><?php echo $t->_("Web_checkout") ?></li>
                                        <li><?php echo $t->_("Integration_examples") ?></li>
                                        <li><?php echo $t->_("Tutorials") ?></li>
                                        <li><?php echo $t->_("Sandbox") ?></li>
                                        <li><?php echo $t->_("Plugins") ?></li>
                                        <li><?php echo $t->_("Payment_link") ?></li>
                                        <li><?php echo $t->_("Payment_button") ?></li>
                                        <li><?php echo $t->_("Technical_support") ?></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-12 col-xs-12">
                                <div class="menu-item menu-item5">
                                    <h5><?php echo $t->_("Support") ?></h5>
                                    <ul>
                                        <li><?php echo $t->_("Contact") ?></li>
                                        <li><?php echo $t->_("Chat") ?></li>
                                        <li><?php echo $t->_("Create_ticket") ?></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--Footer-->
        <footer id="footer" class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="footer-wrapper">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="copyright">
                                <p><?php echo $t->_("Copyright") ?></p>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </footer>
</div>

<script type="text/javascript">
    
    function changeCountry(){
        if( $('#665').is(":visible") ){
            $('#665').hide();
        }else{
            $('#665').show();
        }
    }

    function changeLanguaje(){
        if( $('#666').is(":visible") ){
            $('#666').hide();
        }else{
            $('#666').show();
        }
    }
    function mostrarcapa(capilla) {
        //Cerrando otras secciones
        obj1 = document.getElementById('1');
        obj2 = document.getElementById('2');
        obj3 = document.getElementById('3');
        obj4 = document.getElementById('4');
        obj555 = document.getElementById('555'); //registro
        obj222 = document.getElementById('222'); //registro

      //cerrando..
        if (obj1) {
            obj1.style.display = "none";
        }
        if (obj2) {
            obj2.style.display = "none";
        }
        if (obj3) {
            obj3.style.display = "none";
        }
        if (obj4) {
            obj4.style.display = "none";
        }
        if (obj555) {
            obj555.style.display = "none";
        }
        if (obj222) {
            obj222.style.display = "none";
        }

        //mostrando seccion señalada
        obj = document.getElementById(capilla);
        obj.style.display = "block";
    }

    function ocultarcapa(capilla)
    {
        //Ocultar seccion
        obj = document.getElementById(capilla);
        obj.style.display = "none";

    }

    function cambialanguage(element) {
        if (element == 'col') {
            document.getElementById("Country").src="{{url('img/colombia.png')}}";
            document.getElementById("countryval").value=true;
            document.getElementById("languageval").value=true;
            location.href="<?php echo $this->url->get("index/setLanguage/es") ?>";
        }

        if (element == 'bol') {
            document.getElementById("countryval").value=false;
            document.getElementById("languageval").value=false;
            location.href="<?php echo $this->url->get("index/setLanguage/enBol") ?>";
            document.getElementById("Country").src="{{url('img/bolivia.png')}}";
        }
    }

    function rdrprueba(url){
        window.location = "http://"+window.location.hostname+"/brinkscashcommerce/"+url;
    }
</script>


<script src="https://code.jquery.com/jquery-latest.js"></script>  
<!--<script src="http://code.jquery.com/jquery-latest.js"></script>  -->
<script type="text/javascript">

    $(document).ready(function () {//tomando value de otro form

        $("#tx-login-email").keyup(function () {
            console.log($(this).val());
            var value = $(this).val();
            $("#tx-login-email-reset").val(value);
        });
    });

</script>
<script src="https://apis.google.com/js/platform.js?onload=startApp" async defer></script>
{{ javascript_include('js/loginSocial.js')}}

<script>
console.log("holaaaa");
startApp();
</script>

<script>
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }
</script>

