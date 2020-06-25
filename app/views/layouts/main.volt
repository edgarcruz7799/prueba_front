<header class="header">
    <img src="{{ url('/img/icon.svg') }}" alt="Logo Parking" class="logo_parking">
    <label>Reserva de parqueaderos</label>
    <label>Realiza una pregunta</label>
    <div class="container_login_registrate" style="background-image:url({{url('/img/login.jpg')}})"></div>
</header>
<section class="container_body">
    {{ content() }}
</section>
<footer class="footer">
    <section class="radicar_pqrs" style="background-image:url({{url('/img/bannerfooter.jpg')}})">
        <div class="linea_azul"></div>
        <p>¿Quieres radicar un PQRS?</p>
        <button>Haz click aqui</button>
    </section>
    <section class="pie_pagina">
        <div>
            <p class="title">Sobre Nosotros</p>
            <p>Quienes somos</p>
            <p>Certificaciones</p>
            <p>Vision</p>
        </div>
        <div>
            <p class="title">Soporte y Protección</p>
            <p>Vinculación de clientes</p>
            <p>Soporte técnico</p>
            <p>Proteccion de datos</p>
        </div>
        <div>
            <p class="title">Servicio al cliente</p>
            <p>Contáctenos</p>
            <p>Radicación de PQRS</p>
            <p>Preguntas frecuentes</p>
        </div>
        <div class="redes">
            <p class="title">Redes Sociales</p>
            <div><img src="{{url('/img/facebook.png')}}"><p>Facebook</p></div>
            <div><img src="{{url('/img/twitter.png')}}"><p>Twitter</p></div>
        </div>
    </section>
</footer>