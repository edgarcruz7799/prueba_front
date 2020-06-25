
<div class="col-sm-12">
    <div class="col-md-12">
        <h4 class="section-title"> <?php echo $t->_("Details_of_transaction") ?> </h4>
    </div>

    <div id="blockone" class="col-md-8">
        <div class="row" id="divlegtwo">
            <div class="col-sm-6 col-xs-12">
                <h5><b><?php echo $t->_("Transactionn") ?></b></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <h5 id="datosretiro" style="color: black; font-weight: lighter;">#{{ dato.id_transaction }}</h5>
            </div>
        </div>

        <div class="row" id="divlegtwo">
            <div class="col-sm-6 col-xs-12">
                <h5><b><?php echo $t->_("DateExpiration") ?></b></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <h5 id="datosfechaexpiration" style="color: black; font-weight: lighter;">{{ dato.expiration_date }}</h5>
            </div>
        </div>

        <hr style="height: 1px;background: #b4adad;width: 100%;">

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 class="valors"><a class="valors"><?php echo $t->_("BaseValue") ?></a></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <h5><a class="valors valorsss" style="color: black; font-weight: lighter;"><?php echo '$ '. number_format($dato->base_amount->base, 0, '.', '.') ?></a></h5>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 class="valors"><a class="valors"><?php echo $t->_("ValueCommission") ?></a></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <h5><a class="valors valorssss" style="color: black; font-weight: lighter;"><?php echo '$ '. number_format($dato->iva->iva, 0, '.', '.') ?></a></h5>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 id="info"><b class="valtot"><?php echo $t->_("TotalValue") ?></b></h5>
            </div>  
            <div class="col-sm-6 col-xs-12 dermarg">
                <h5><b id="valormarc" style="color: black; font-weight: 700;"><?php echo '$ '. number_format($dato->total, 0, '.', '.') ?></b></h5>
            </div>
        </div>

        <hr style="height: 1px;background: #b4adad;width: 100%;">
        
        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 id="datretiro"><?php echo $t->_("NetworkName") ?></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <label class="alignnrr" id="retval" style="color: black; font-weight: lighter;">
                <!-- <img src="{{url('img/Adm_img5.png')}}"> --> {{dato.collection}}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 id="datretiro"><?php echo $t->_("TransactionType") ?></h5>
            </div>
            <div class="col-sm-6 col-xs-12 dermarg">
                <label class="alignnrr" id="retval" style="color: black; font-weight: lighter;">
                <!-- <img src="{{url('img/Adm_img6.png')}}"> --><?php echo $t->_("PhysicalPoint") ?></label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 id="datretiro"><?php echo $t->_("EntragedBy") ?></h5>
            </div>  
            <div class="col-sm-6 col-xs-12 dermarg">
                <label class="alignnrr" id="retval" style="color: black; font-weight: lighter;">{{dato.collection_network}}</label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <h5 id="datretiro"><?php echo $t->_("commercee") ?></h5>
            </div>  
            <div class="col-sm-6 col-xs-12 dermarg">
                <label class="alignnrr" id="retval" style="color: black; font-weight: lighter;">{{dato.commerce_name}}</label>
            </div>
        </div>
    </div>
    
    <div class="col-md-4 col-xs-12">
        <div class="col-sm-12 col-xs-12">
            <div id="assetid" class="row">
                <img src="{{url('img/Assets_UsuarioVerde.png')}}" alt="" style="width: 100px;">
            </div>
            <div id="divaid" class="row">
                <a style="color: #005eae;" class="valors">ID:</a>
                <a style="color: black; font-weight: lighter;" class="valors valorssss alignid"> #{{ dato.pin }}</a>
            </div>
        </div> 
        <hr style="height: 1px;background: #b4adad;width: 96%;">
        
        <div class="col-sm-12 col-xs-12">
            <div id="assetid" class="row">
                <img src="{{url('img/Assets_CalendarioVerde.png')}}" alt="" style="width: 100px;">
            </div>
            <div id="divaid" class="row">
                <a style="color: #005eae;" class="valors"><?php echo $t->_("Date") ?></a>
                <a style="color: black; font-weight: lighter; text-transform: capitalize" class="valors valorsss alignfech">{{dato.datemade}}</a>
            </div>
        </div>
        <hr style="height: 1px;background: #b4adad;width: 96%;">
        
        <div class="col-sm-12 col-xs-12">
            <div id="assetid" class="row">
                <img src="{{url('img/Assets_CheckVerde.png')}}" alt="" style="width: 100px;">
            </div>
            <div id="divaid" class="row">
                <a style="color: #005eae;" class="valors estado"><?php echo $t->_("Status") ?></a>
                <a><b id="valormarc" class="fontpag" style="color: black; font-weight: lighter; text-transform: capitalize">{{dato.state}}</b></a>
            </div>
        </div>        
    </div>
</div>

<div class="col-md-12">
    <div id="listproducts" class="col-md-12">
        <b style="color: #00db00; font-size: 20px;"><?php echo $t->_("Descriptionnn") ?></b>
    </div>

    <div class="col-md-12">
        <div id="divtable" class="table-responsive">
            <table class="table table-striped">
                <thead id="theadid" class="tableproducts">
                    <tr>
                        <th scope="col"><?php echo $t->_("Product") ?></th>
                        <th scope="col"><?php echo $t->_("Descriptionnn") ?></th>
                        <!-- <th scope="col"><?php echo $t->_("Cantidad") ?></th> -->
                        <!-- <th scope="col"><?php echo $t->_("Valor U") ?></th> -->
                        <th scope="col"><?php echo $t->_("Valuee") ?></th>
                    </tr>
                </thead>
                <tbody id="tbodyid" class="tableproducts">
                    {% for item in dato.products %}
                    <tr>
                        <td class="imgg"><img width="50" height="30" border="8" src="{{ item.image }}"></td>
                        <td class="detproduct"><b>{{ item.product }}</b></td>
                        <!-- <td class="detproduct">{{ item.price }}</td> -->
                        <!-- <td class="detproduct">{{ item.price }}</td> -->
                        <td class="detproduct">{{ item.price }}</td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
</div>

{% for item in dato.location %}
    <input id="latitud" type="hidden" name="latitud" value="{{item.latitud}}">
    <input id="longitud" type="hidden" name="longitud" value="{{item.longitud}}">  
{% endfor %}

<div id="maptransaction" class="col-md-12">
    <!--INICIO MAPA-->
    <div class="col-md-12">
        <h5 class="titlemap" style="color: #00db00; font-weight: 700;"><?php echo $t->_("DeliveryDomicile") ?></h5>
    </div>
    <div id="mapdivv" class="col-sm-12"><br>
        <div class="form-control" id="map" style="width:100%; height:480px;"></div><br>
    </div>
    <!--FIN MAPA-->
</div>

<!--SCRIPT para mapa-->
<script>
    function initMap() {
        
        var latitude = parseFloat(document.getElementById('latitud').value);
        var longitude = parseFloat(document.getElementById('longitud').value);
    
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
                geocoder.geocode({ 'latLng': yourLocation },function(results, status) {});
        });
    } 
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA70fslcm8mwK6ZSGPOc_S0SNaAn74G_6Y&callback=initMap&libraries=places"></script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>