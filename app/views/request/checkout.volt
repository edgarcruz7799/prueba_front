{{ content() }}


<LINK REL=StyleSheet HREF="{{url('css/checkout.css')}}" TYPE="text/css" MEDIA=screen>

<div class="container-fluid general">
<!--   <div class="row content"> -->
    <div id="navizq" class="col-sm-2 col-md-2 sidenav hidden-xs"><!--Barra izquierda-->
      <ul class="nav nav-pills nav-stacked verticl" style="">
        <li><a href="#"><?php echo $t->_("ApiIntegration") ?></a></li>
        <li><a  class="default" style="" href="#">Web Checkout</a></li>
        <li><a href="#"><?php echo $t->_("IntegrationExamples") ?></a></li>
        <li><a href="#"><?php echo $t->_("Tutorials") ?></a></li>
        <li><a href="#"><?php echo $t->_("Sandbox") ?></a></li>
        <li><a href="#"><?php echo $t->_("Plugins") ?></a></li>
        <li><a href="#"><?php echo $t->_("PaymentLink") ?></a></li>
        <li><a href="#"><?php echo $t->_("PaymentButton") ?></a></li>
        <li><a href="#"><?php echo $t->_("TechnicalSupport") ?></a></li>                                        
      </ul><br>
    </div><!--Fin de la barra izquierda-->
    <br>
    
    <div id="contenido" style="" class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2"><!--Parte derecha de la pagina-->
    <div id="limitt">
      <div class="container-fluid">
         <h1><?php echo $t->_("CheckTitle") ?></h1>

          <p>
             <?php echo $t->_("CheckText1") ?>
          </p>  
          <p>
            <?php echo $t->_("CheckText2") ?>
          </p>  
          <div style="padding-left: 3em;">
          <ul>
           <li><?php echo $t->_("CheckText11") ?></li>
           <li><?php echo $t->_("CheckText12") ?></li>
           <li><?php echo $t->_("CheckText13") ?></li>
           <li><?php echo $t->_("CheckText14") ?></li>
           <li><?php echo $t->_("CheckText15") ?></li>
           <li><?php echo $t->_("CheckText16") ?></li>
           </ul>
          </div>
          <br><br>
          <p>
            <?php echo $t->_("CheckText3") ?>
          </p>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no1.png') }}"></center> 
          </div>
          <div class="row">
            <p>
             <?php echo $t->_("first_step") ?>
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im1.jpg') }}"></center>

        </div>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im2.jpg') }}"></center>

        </div>      
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no2.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("second_step") ?>
            </p> 
          </div>          
        </div>
      </div> 
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no3.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("third_step") ?>
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im3.jpg') }}"></center>

        </div>        
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im4.jpg') }}"></center> 

        </div>      
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no4.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("fourth_step") ?>
            </p> 
          </div>          
        </div>
      </div>
      <br><br><br><br>
      <div class="container-fluid">
        <div class="col-sm-6 col-md-6">
          <div class="row">
            <center><img src="{{ url('img/no5.png') }}"></center> 
          </div>
          <div class="row">
            <p>
              <?php echo $t->_("fifth_step") ?> 
            </p> 
          </div>          
        </div>
        <div class="col-sm-6 col-md-6">

            <center><img src="{{ url('img/im5.jpg') }}"></center>

        </div>        
      </div>
      </div><!--Borrarrrrrrrrrr-->
      <br><br><br><br>                    
      <div class="container-fluid divcomp">

      <div style="padding-left: 60px;
padding-right: 10px;"><!--Inicio de borrarrrrrrrrrrrrrrrrrrrrrrrrrrrrr-->

        <div class="col-sm-5 col-md-5">
          <br><br><br>
          <p>
            <b class="components comp-title"><?php echo $t->_("CompTitle") ?></b>
            <br><br>
          </p>

            <p>
               <b class="components"><?php echo $t->_("CompSubTitle1") ?></b>
            </p>
            <p>
              <?php echo $t->_("CompText1") ?>
            </p>

            <p>
               <b class="components"><?php echo $t->_("CompSubTitle2") ?></b>
            </p>
            <p>
              <?php echo $t->_("CompText2") ?>
            </p>

            <p>
               <b class="components"><?php echo $t->_("CompSubTitle3") ?></b>
            </p>
            <p>
               <?php echo $t->_("CompText3") ?>
            </p> 
            <p>
              <?php echo $t->_("CompText33") ?>
            </p>           

        </div>
        <div class="col-sm-5 col-md-5">

           <img class="img-responsive" src="{{ url('img/laptop.png') }}">

        </div>

        </div><!--borarrrrrrrrrrrrrr-->

        </div>

        <div class="container-fluid down">

                <br><br><br><br><br>

           <div class="col-sm-offset-2 col-md-offset-2">
            <h1 class="mercpag"><?php echo $t->_("MercPagTitle") ?></h1>
            

            <br>
            <p>
               <?php echo $t->_("MercPagText1") ?>
            </p

            <p>
               <b class="mercpag"><?php echo $t->_("MercPagSubTitle1") ?></b>
            </p>
            <br>
            <p>
              <?php echo $t->_("MercPagText2") ?>
            </p>

            <p>
               <b class="mercpag"><?php echo $t->_("MercPagSubTitle2") ?></b>
            </p>
            <br>
            <p>
               <b class="mercpag"><?php echo $t->_("MercPagSubTitle3") ?></b>
            </p> 
            <p>
              <?php echo $t->_("MercPagSubText1") ?>
            </p>  
            <p>
              <?php echo $t->_("MercPagSubText2") ?> <pre><code class="language-html" data-lang="html">composer require "mercadopago/dx-php:dev-master"</code></pre> <?php echo $t->_("MercPagSubText22") ?>             
            </p>
            <p>
              <?php echo $t->_("MercPagSubText3") ?><br>
              <img style="margin-top: 53px;" src="{{ url('img/dir.png') }}">              
            </p>

          <div class="col-sm-8 col-md-8 container-fluid lengs">
          <!--Nav de Lenguajes-->
            <ul class="horizontal gray">
              <li onclick="mostrar('php');"><a>Php</a></li>
              <li onclick="mostrar('java');"><a>Java</a></li>
              <li onclick="mostrar('ruby');"><a>Ruby</a></li>
              <li onclick="mostrar('paython');"><a>Python</a></li>
            </ul> <br>
            <!--Fin del nav-->  
            <!--Campo invisible PHP-->
            <div id="php" style="display: block;"> 
                        <p>
                          <?php echo $t->_("PhpText1") ?>           
                        </p>   
                        <p style="color: rgb(12, 42, 89);">
                          <?php echo $t->_("PhpText2") ?>
                        </p>  
                        <p>
                          <?php echo $t->_("PhpText3") ?>
                        </p> 
                              <div class="highlight">
                              <button class="btncopy" onclick="ejecutar('p4')">Copiar</button>
                                <pre id="p4" class="black"><code style="color: rgb(34, 174, 192) " data-lang="html">requiere</code> <code style="color: rgb(28, 169, 238)">--DIR-- .</code><code style="color: rgb(29, 188, 68)"> '/vendor/autoload.php'</code><code style="color: white">;</code></pre>
                              </div>      
                        <p>
                          <?php echo $t->_("PhpText4") ?>
                        </p>  
                        <p>
                          <?php echo $t->_("PhpText5") ?>
                        </p> 
                        <p>
                          <ul class="">
                            <li><?php echo $t->_("PhpText6") ?></li>
                            <!--Codigo2-->
                              <div class="highlight">
                               <button class="btncopy" onclick="ejecutar('p3')">Copiar</button>
                                <pre id="p3" class="black"><code style="color: white"  data-lang="html">MercadoPago\SDK::</code><code style="color: rgb(201, 188, 96)">setAccessToken</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"ENV_ACCESS_TOKEN"</code><code style="color: white">);</code> //On Production<code style="color: white"  data-lang="html">                                MercadoPago\SDK::</code><code style="color: rgb(201, 188, 96)">setAccessToken</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"ENV_TEST_ACCESS_TOKEN"</code><code style="color: white">);</code> //On Sandbox</pre>
                              </div>


                            <!--fin codigo1-->
                            <li><?php echo $t->_("PhpText7") ?></li>
                            <!--Codigo3-->
                              <div class="highlight">
                              <button class="btncopy" onclick="ejecutar('p2')">Copiar</button>
                                <pre id="p2" class="black"><code style="color: white"  data-lang="html">MercadoPago\SDK::</code><code style="color: rgb(201, 188, 96)">setClientId</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"ENV_CLIENT_ID"</code><code style="color: white">);</code><code style="color: white"  data-lang="html">MercadoPago\SDK::</code><code style="color: rgb(201, 188, 96)">setClientSecret</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"ENV_CLIENT_SECRET"</code><code style="color: white">);</code></pre>
                              </div>                
                          </ul>              
                        </p> 
                        <p>
                          <?php echo $t->_("PhpText8") ?>
                        </p> 
                        <p>
                          <?php echo $t->_("PhpText9") ?>
                        </p>  
                        <p>
                          <img style="margin-top: 53px;" src="{{ url('img/diagram.png') }}">
                        </p>  
                        <p>
                          <b>
                            <?php echo $t->_("PhpText10") ?>
                          </b>  
                            <!--Codigo-->

                              <div class="highlight">
                              <button class="btncopy" onclick="ejecutar('p1')">Copiar</button>
                                <pre id="p1" class="black"><code style="color: rgb(231, 136, 0)">&lt;?php</code>
          <code style="color: rgb(34, 174, 192) " data-lang="html">requiere_once</code><code style="color: rgb(29, 188, 68)"> '/vendor/autoload.php'</code><code style="color: white">;</code>
          <code style="color: white">MercadoPago\SDK::</code><code style="color: rgb(201, 188, 96)">setAccessToken</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"ENV_ACCESS_TOKEN"</code><code style="color: white">);</code>

          <code style="color: white">$payment =</code> <code style="color: rgb(29, 179, 197)">new </code> <code style="color: white"> MercadoPago\payment();</code>

          <code style="color: white">$payment-></code><code style="color: rgb(25, 158, 222)"> transaction_amount</code><code style="color: white"> =</code><code style="color: rgb(164, 121, 223)"> 141</code><code>;</code>
          <code style="color: white">$payment-></code><code style="color: rgb(25, 158, 222)"> token</code><code style="color: white"> =</code><code style="color: rgb(29, 188, 68"> "YOUR_CARD_TOKEN"</code><code style="color: white">;</code>
          <code style="color: white">$payment-> </code><code style="color: rgb(25, 158, 222)">description</code><code style="color: white"> =</code><code style="color: rgb(29, 188, 68"> "Ergonomic Silk Shirt"</code><code style="color: white">;</code>
          <code style="color: white">$payment-> </code><code style="color: rgb(25, 158, 222)">installments</code><code style="color: white"> =</code><code style="color: rgb(164, 121, 223)"> 1</code><code style="color: white">;</code>
          <code style="color: white">$payment-> </code><code style="color: rgb(25, 158, 222)">payment_method_id</code><code style="color: white"> =</code><code style="color: rgb(29, 188, 68"> "visa"</code><code>;</code>
          <code style="color: white">$payment-> </code><code style="color: rgb(25, 158, 222)">payer</code><code style="color: white"> =</code><code style="color: rgb(29, 179, 197)"> array</code><code style="color: white">(</code><code style="color: rgb(29, 188, 68">"email"</code><code style="color: white"> =></code><code style="color: rgb(29, 188, 68"> "laure.nienow@hotmail.com"
            <code style="color: white">);</code>

          <code style="color: white">$payment-> </code><code style="color: rgb(201, 188, 96)">save</code><code style="color: white">();</code>

          <code style="color: rgb(29, 179, 197)">echo</code> <code style="color: white">$payment-> </code><code style="color: rgb(25, 158, 222)">status</code><code style="color: white">;</code>
<code style="color: rgb(231, 136, 0)">?&gt;</code>
            </code></pre>
                              </div>                 
                          
                        </p>  
            </div> <!--Fin del campo invisible PHP--> 


            <!--Campo invisible JAVA-->
            <div id="java"> 
              <p>
                JAVA!          
              </p>   
 
            </div> <!--Fin del campo invisible JAVA--> 

            <!--Campo invisible RUBY-->
            <div id="ruby"> 
              <p>
                RUBY!          
              </p>   
 
            </div> <!--Fin del campo invisible RUBY--> 

            <!--Campo invisible PAYTHON-->
            <div id="paython"> 
              <p>
                PAYTHON!          
              </p>   
            </div> <!--Fin del campo invisible PAYTHON--> 
          </div>

      </div> 
      </div> 
 
    </div><!--Fin de la parte derecha-->
<!--   </div> -->
</div>

<script type="text/javascript">
function mostrar(capilla)
{
  //Cerrando otras secciones
    obj1 = document.getElementById('php');
    obj2 = document.getElementById('java');
    obj3 = document.getElementById('ruby');
    obj4 = document.getElementById('paython');  

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
//mostrando seccion señalada
    obj = document.getElementById(capilla);
    obj.style.display = "block";

}  

</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript">
// EVENTO CUANDO SE MUEVE EL SCROLL, EL MISMO APLICA TAMBIEN CUANDO SE RESIZA
var change= false;
$(window).scroll(function(){
window_y = $(window).scrollTop(); // VALOR QUE SE HA MOVIDO DEL SCROLL
scroll_critical = parseInt($("#limitt").height()); // VALOR DE TU DIV
if (window_y < scroll_critical) { // SI EL SCROLL HA SUPERADO EL ALTO DE TU DIV
// ACA MUESTRAS EL OTRO DIV Y EL OCULTAS EL DIV QUE QUIERES
$('#navizq').show(); // VER
} else {
// ACA HACES TODO LO CONTRARIO
$('#navizq').hide(); // OCULTAR
}
});

function copiarAlPortapapeles(id_elemento) {
  var aux = document.createElement("input");
  aux.setAttribute("value", document.getElementById(id_elemento).innerHTML);
  document.body.appendChild(aux);
  aux.select();
  document.execCommand("copy");
  document.body.removeChild(aux);

}


function ejecutar(idelemento){
  var aux = document.createElement("div");
  aux.setAttribute("contentEditable", true);
  aux.innerHTML = document.getElementById(idelemento).innerHTML;
  aux.setAttribute("onfocus", "document.execCommand('selectAll',false,null)"); 
  document.body.appendChild(aux);
  aux.focus();
  document.execCommand("copy");
  document.body.removeChild(aux);
}  


</script>