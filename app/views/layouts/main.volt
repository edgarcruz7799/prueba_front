<header class="header {% if auth %}log{% endif %}">
    <img src="{{ url('/img/icon.svg') }}" alt="Logo Parking" class="logo_parking">
    <label>Reserva de parqueaderos</label>
    {% if auth.data.access_type == '1' %}
    <label class="ask">Realiza una pregunta</label>
    {% else %}
    <label class="response">Revisa tus respuestas</label>
    {% endif %}
    <div id="container_login_registrate" class="container_login_registrate {% if auth %}logueado{% else %}sin_log{% endif %}"></div>
    {% if auth %}
    <a href="" class="table a_header_log"><img src="{{ url('/img/list.svg') }}"></a>
    <a href="{{ url('/session/end') }}" class="logout a_header_log"><img src="{{ url('/img/end.jpg') }}"></a>
    {% endif %}
    <div class="background-header-principal"></div>
    <div class="container_register">
        <div class="header_register_login">
            <div class="cierre">X</div>
            <div class="main">
                <div class="mainregistate active">¿Primera vez en PARKING? <br> crea tu cuenta</div>
                <div class="mainlogin">¡Ya tengo una cuenta! <br> inicia sesion</div>
            </div>
            <div class="content_registrate">
                {{ form('session/registerClient', 'role':'form') }}
                    <div>
                        <label>Nombres</label>
                        <input type="text" name="nombres" placeholder="Pepito Fernando" required>
                    </div>
                    <div>
                        <label>Apellidos</label>
                        <input type="text" name="apellidos" placeholder="Perez Gomez" required>
                    </div>
                    <div>
                        <label>Tipo de documento</label>
                        <select name="tipoDocumento" id="tipodocumento" required>
                            <option value="CC">CC</option>
                        </select>
                    </div>
                    <div>
                        <label>N° de documento</label>
                        <input type="number" name="numeroIdentificacion" placeholder="213123111" required>
                    </div>
                    <div>
                        <label>Telefono movil</label>
                        <input type="number" name="telefonoMovil" placeholder="32012312111" required>
                    </div>
                    <div>
                        <label>Correo</label>
                        <input type="email" name="correo" placeholder="Pepito@gmail.com" required>
                    </div>
                    <div>
                        <label>Fecha de nacimiento</label>
                        <input type="date" name="fecha_nacimiento" placeholder="07/07/1995" required>
                    </div>
                    <div>
                        <label>Contraseña</label>
                        <input type="password" name="password" placeholder="*******" required>
                    </div>
                    <input type="submit" value="Registrar" class="btn_registrar">
                {{ end_form() }}
            </div>
            <div class="content_login" style="display: none;">
                {{ form('session/loginClient', 'role':'form') }}
                    <div>
                        <label>Correo</label>
                        <input type="email" name="correo" placeholder="Pepito@gmail.com">
                    </div>
                    <div>
                        <label>Contraseña</label>
                        <input type="password" name="password" placeholder="********">
                    </div>
                    <input type="submit" class="btn_login">
                {{ end_form() }}
            </div>
        </div>
    </div>
    <div class="container_nuevo_caso">
        <div class="content_nuevo_caso">
            <div class="cierre">X</div>
            <div class="add_question">+</div>
            <div class="title_caso">
                <p>Nombre del caso:</p>
                <input type="text" name="nombre_caso">
            </div>
            <div class="content_pregunta">
                <p>Pregunta:</p>
                <textarea name="pregunta" id="pregunta"></textarea>
            </div>
        </div>
    </div>
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