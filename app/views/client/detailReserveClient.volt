    
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index">DETALLE <span>RESERVA</span></h4>

</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>
<!-- <style type="text/css">

    @media (max-width: 1210px) {
        
        .img-contact {
            margin-left: -20%!important;
        }
        .email-contact {

            width: 120%!important;
        }
        .fin {
            width: 120%!important;
            margin-top: -23%!important;
            margin-left: -30%!important;
        }
        .fsal {
            width: 120%!important;
            margin-top: -23%!important;
            margin-left: 0%!important;
        }
        .fdi {
            margin-top: -70%!important;
            margin-left: 30%!important;
        }
        .fme {
            margin-top: -68%!important;
            margin-left: 90%!important;
        }
        .fan {
            margin-top: -70%!important;
            margin-left: 155%!important;
        }
        .fdis {
            margin-top: -70%!important;
            margin-left: 65%!important;
        }

        .fmes {
            margin-top: -68%!important;
            margin-left: 125%!important;
        }
        .fans {
            margin-top: -70%!important;
            margin-left: 190%!important;
        }
        .divr {
            margin-left: 20%!important;
            margin-top: -30%!important;
        }
        .pay {
            width: 120%!important;
        }
        .metros {
            margin-top: 5%!important;
        }
    }
</style> -->

<!--CONTENIDO PARA PESTAÑA N° TRANSACCIONES-->

<div id="nt" style="display: block;" class="trans col-sm-11">

    {% if dato is empty %}
    <!-- No se encontraron direcciones -->
    {% else  %} 
    <section   style="background-color: #fff">
        <div class="col-md-12" >

            <div class="row">
                <div class="col-md-4">
                    <img src="{{ url('') }}{{dato.image}}" style="width: 100%; height: 200px; border-radius: 20px; margin-top: 5%;">
                </div>
                <div class="col-md-8">
                    <h1 style="color: #6E6E6E;">{{dato.name}}</h1>
                    <p ><b style="color: #f71e14;">{{dato.city}}</b> {{dato.address}}</p>
                    <p style="border: 1px solid silver; color: #04B431; border-radius: 10px; width: 150px; text-align: center; padding: 5px;"><b>{{dato.status}}</b></p>
                </div>
                <div class="col-md-4">
                    <h6 style="margin-top: 4%;">Valor de la reserva</h6>
                    <h1><strong>$ {{dato.cost_total}}</strong></h1>
                </div>
                <div class="col-md-4 div_detailReserveClient">
                    <h6 style="margin-top: 4%;">Método de pago</h6>
                    <h5 style="margin-top: 4%;" class="pay"><strong>{{dato.pay}}</strong></h5>
                </div>
                    
            </div>
        </div>

        <div class="col-md-12 div_detailReserveClientuno">
                    
            <div style="width: 15%; float: left; margin-top: 8px;">
                <p style="">Área reservada</p>
            </div>
            
            <div style="width: 10%; float: left;">
                <p style="border: 1px solid silver; font-size: 120%;  color: #f71e14; border-radius: 10px; padding: 5px; width: 80px; text-align: center;"><strong>{{dato.space_require}} m<sup>2</sup></strong></p>
            </div>
            

            <div style="width: 15%; float: left; margin-top: 8px;">
                <p style="">Fecha de ingreso</p>
            </div>

            <div style="width: 20%; float: left; border: 1px solid silver; border-radius: 10px;">
                
                    <div style="width: 20%; float: left; padding: 1%;">
                        <h3 style="color: black; margin:0px;">{{dato.initial_day}}</h3>
                    </div>
                    <div style="width: 50%; float: left; padding: 2%;">
                        <h5 style="margin:0px; border-left: 1px solid silver; border-right: 1px solid silver;">{{dato.initial_month}}</h5>
                    </div>
                    <div style="width: 30%; float: left; padding: 1%;">
                        <h3 style="color: black; margin:0px;">{{dato.initial_year}}</h3>
                    </div>
                
            </div>

            <div style="width: 15%; float: left; margin-top: 8px;">
                <p style="">Fecha salida</p>    
            </div>

            <div style="width: 20%; float: left; border: 1px solid silver; border-radius: 10px;">
                
                    <div style="width: 20%; float: left; padding: 1%;">
                        <h3 style="color: black; margin:0px;">{{dato.final_day}}</h3>
                    </div>
                    <div style="width: 50%; float: left; padding: 2%;">
                        <h5 style="margin:0px; border-left: 1px solid silver; border-right: 1px solid silver;">{{dato.final_month}}</h5>
                    </div>
                    <div style="width: 30%; float: left; padding: 1%;">
                        <h3 style="color: black; margin:0px;">{{dato.final_year}}</h3>
                    </div>
                
            </div>

        </div>

        <hr style="height: 2px; background: silver; width: 100%;">

        <div class="col-md-8">

            
            <h5 style="text-align: center;"><img height="" width="" src="{{url('img/Assets_Servicios.png')}}">Precio reserva</h5>
            

            <div class="col-md-12">
                <div class="col-md-6" style="padding: 0px;">
                    <li>Espacio</li>
                </div>
                <div class="col-md-6 text-right">
                    <h5 style="margin-top: 1%;">$ {{dato.storage_cost}}</h5>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="background: silver; height: 3px; margin-top: -1%;">
            </div>

            
            {% if service is empty %}

            {% else %}
            <div class="col-md-12">
                <h6 style="margin-top: -1%; color: #f71e14;">Serivicios adicionales</h6>
            </div>
                
            {% for item in service %}
            <div class="col-md-12">
                <div class="col-md-6">
                    <li style="padding: 10px; ">{{item.name}}</li>
                </div>
                <div class="col-md-6 text-right">
                    <h5 style="margin-top: 3%;">$ {{item.cost}}</h5>
                </div>
                
            </div>
            <div class="col-md-12">
                <hr style="background: silver; height: 3px; margin-top: -1%;">
            </div>             
            {% endfor %}
            {% endif %}
            <div class="col-md-12">
                <h5 style="margin-top: 1%; color: #f71e14;">Total</h5>

                <div class="col-md-6 col-md-offset-6 text-right">
                    <h5 style="margin-top: -10%;">$ {{dato.cost_total}}</h5>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="background: silver; height: 3px; margin-top: -1%;">
            </div>

        </div>
        <div class="col-md-4" style="text-align: center;">
            
            <h5 class="img-contact"><img height="" width="" src="{{url('img/Assets_Servicios.png')}}">Datos contacto</h5>
            <div class="col-md-12" style="border-left: 2px solid silver;">
                <img src="{{url('img/perfil.png')}}" class="rounded-circle" style="width: 100px">
                <p style="font-size: 20px;"><strong>{{dato.supervisor}}</strong></p>
                <p><strong>CC</strong> {{dato.phone_contact}}</p>
                <p><strong>Celular</strong> {{dato.phone_contact}}</p>
                <p><strong>Correo</strong> {{dato.email_contact}}</p>
            </div>
            
        </div>
    </section>

    {% endif %}  
   
</div>     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
