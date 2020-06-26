swiper_carrusel_ofertas = new Swiper('.carrusel_principal', { //Carrusel promos
    slidesPerView: '1',
    loop: true, 
    clickable: true,
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
    navigation: {
        nextEl: '.arrow_next_redeservi',
        prevEl: '.arrow_prev_redeservi',
        
    },
    pagination: {
        el: '.swiper-pagination-redservi',
        clickable: true,
    },
});

$('.mainregistate').click(function(){
    $('.mainlogin').removeClass('active');
    $(this).addClass('active');
    $('.content_login').slideUp(function(){
        $('.content_registrate').slideDown();
    });
});
$('.mainlogin').click(function(){
    $('.mainregistate').removeClass('active');
    $(this).addClass('active');
    $('.content_registrate').slideUp(function(){
        $('.content_login').slideDown();
    });
});
$('.header_register_login>.cierre,.content_nuevo_caso>div.cierre').click(function(){
    $('.background-header-principal,.container_register,.container_nuevo_caso').fadeOut();
    $('html').removeAttr('style');
});
$('.container_login_registrate').click(function(){
    if($("#container_login_registrate").hasClass("logueado")){
        alert('perrito ya se loguearon');
    }else{
        menu_login();
    }
});
$('.carrusel_principal>div>.swiper-slide>button,section.radicar_pqrs>button,header.header>label.ask').click(function(){
    if($("#container_login_registrate").hasClass("logueado")){
        $('.background-header-principal').fadeIn(700);
        $('html').css('overflow-y','hidden');
        $('.container_nuevo_caso').fadeIn(function(){
            $('.container_nuevo_caso').css('display','flex');
        });
    }else{
        menu_login();
    }
});

$('.add_question').click(function(){
    var nombre_caso = $('input[name="nombre_caso"]').val();
    var pregunta = $('#pregunta').val();
    alert(nombre_caso);
    alert(pregunta);
});
function menu_login(){
    $('.background-header-principal').fadeIn(700);
    $('.container_register').fadeIn(function(){
        $('.container_register').css('display','flex');
        $('html').css('overflow-y','hidden');
    });
}