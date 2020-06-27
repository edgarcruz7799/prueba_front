<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--estilos-->
{{ get_title() }}
<link rel="shortcut icon" href="{{ url('/img/favicon.png') }}" />
{{ stylesheet_link('/css/front.css') }}
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
{{ stylesheet_link('/css/swipe_index.css') }}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Your invoices">
<meta name="author" content="Phalcon Team">
</head>
    <body>        
        {{ content() }}
            {{ javascript_include('/js/jquery-3.2.1.min.js') }}
            {{ javascript_include('/js/swiper.min.js') }}
            {{ javascript_include('/js/pruebagruponovus.js') }}
            
    </body>
</html>