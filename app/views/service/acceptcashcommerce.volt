{{ content() }}

<div class="col-md-12">
    <h4 class="section-title"> <?php echo $t->_("e-commmercetext") ?> </h4>
    <!-- <p class="p-title"> <?php echo $t->_("Payorbuytext") ?> </p> -->
</div>

<div class="col-md-12">
    <div class="col-md-12 boxbig">
        <div class="row">
            <div class="col-md-3 col-xs-6 boxsmallcommerce" onclick="openModal();currentSlide(1)">
                <img class="" src="{{ url('img/boximage.jpg') }}">
            </div>

            <div class="col-md-3 col-xs-6 boxsmallcommerce" onclick="openModal();currentSlide(1)">
                <img class="" src="{{ url('img/boximage.jpg') }}">
            </div>        
            
        </div>
    </div>
</div>

<!-- The Modal/Lightbox -->
<div id="myModal" class="modal">
    <div class="col-md-12">
        <div class="modal-content box_light">        
            <span class="close cursor" onclick="closeModal()" style="font-size: 50px; color: #0a5caa; opacity: 10;">&times;</span>        
            <div class="col-md-4 box_image_accept">
                <img src="{{ url('img/Assets_Espera.png') }}" onclick="openModal();currentSlide(1)" class="hover-shadow">
            </div>
            <div class="col-md-6">
                <h5 style="color: #6f6a65; font-size: 35px; margin-bottom: -10px;">Próximamente</h5>
                <p style="margin-left: 2px;">tendremos disponible este servicio</p>
            </div>
            <div class="col-md-12" style="color: blue; text-align: center;">¡Gracias por tu comprensión!

            </div>
        </div>
    </div>
</div>

<script>
    function openModal() {
    document.getElementById('myModal').style.display = "block";
    }

    function closeModal() {
    document.getElementById('myModal').style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
    showSlides(slideIndex += n);
    }

    function currentSlide(n) {
    showSlides(slideIndex = n);
    }

    function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";
    };
</script>