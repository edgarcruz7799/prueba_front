<div class="carrusel_principal swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide" style="background-image: url({{url('img/slide1.jpg')}});">
            <p>
                PARQUEA SIN COMPLICACIONES <br class="br-responsive">
                <span>Elige dónde parquear, reserva y llega sin apuros.</span>
            </p>
            <button class="button_pqrs">Solicita información</button>
        </div>
        <div class="swiper-slide" style="background-image: url({{url('img/slide2.jpg')}});">
            <p>
                ¿Tienes alguna duda de nuestro servicio? <br class="br-responsive">
                <span>realiza un pqrs y te respondemos de una!.</span>
            </p>
            <button class="button_pqrs">Redactar</button>
        </div>
        <div class="swiper-slide" style="background-image: url({{url('img/slide3.jpg')}});">
            <p>
                ¿Problemas con el sistema? <br class="br-responsive">
                <span>Nuestro personal altamente capacitado te ayudará con cualquier pregunta.</span>
            </p>
            <button class="button_pqrs">Pregunta!</button>
        </div>
    </div>
        <div class="swiper-button-next arrow_next_redeservi"></div>
      <div class="swiper-button-prev arrow_prev_redeservi"></div>
      <div class="swiper-pagination swiper-pagination-redservi"></div>
</div>
<div class="container_items">
    {# {{dataintegration|json_encode}} #}
    {% for row in dataintegration.data %}
        <div class="item">
            <img onerror="this.src='https://storage.googleapis.com/datia-files/hom/assets/Novus-Seguros.jpg';" src="{{row.imageurl}}" alt="{{row.nombre}}">
            <div><i class="fa fa-user" aria-hidden="true"></i><p>Nombre: <span>{{row.nombre}}</span></p></div>
            <div><i class="fa fa-map-marker" aria-hidden="true"></i><p>Direccion: <span>{{row.direccion}}</span></p></div>
            <div><i class="fa fa-car" aria-hidden="true"></i><p>Tarifa para vehiculo: <span>{% if row.tarifaVehiculo %}{{row.tarifaVehiculo}}{% else %}Por tipo de carro{% endif %}</span></p></div>
            <div><i class="fa fa-motorcycle" aria-hidden="true"></i><p>Tarifa para moto: <span>{% if row.tarifaMoto %}{{row.tarifaMoto}}{% else %}Por tipo de moto{% endif %}</span></p></div>
            <div><i class="fa fa-clock-o" aria-hidden="true"></i><p>Horario: <span>{% if row.horario %}{{row.horario}}{% else %}horarios variantes por Covid19{% endif %}</span></p></div>
            <div><i class="fa fa-ticket" aria-hidden="true"></i><p>Codigo promocional: <span>{% if row.code %}{{row.code}}{% else %}No hay promociones{% endif %}</span></p></div>
            <button>Reservar Parqueadero</button>
        </div>
    {% endfor %}
</div>