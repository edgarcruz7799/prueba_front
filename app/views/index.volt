<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--estilos-->
{{ get_title() }}
<link rel="shortcut icon" href="{{ url('/img/favicon.png') }}" />
{{ stylesheet_link('/css/front.css') }}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Your invoices">
<meta name="author" content="Phalcon Team">
</head>
    <body>        
        {{ content() }}
            {{ javascript_include('/js/jquery-3.2.1.min.js') }}
    </body>
</html>