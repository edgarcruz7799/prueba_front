{{ content() }}

<div class="col-md-12">
    <h4 class="section-title"> <?php echo $t->_("PayServ") ?> </h4>
    <p class="p-title"> <?php echo $t->_("Payorbuytext") ?> </p>
</div>

<div class="col-md-12 boxbig">
    <div class="row">
        {% if item.service_name == 0 %}        
            {% for item in dato %}
            <div class="col-md-2 col-xs-12 boxsmall1" onclick="openModal();currentSlide(1)">
                <img class="moneyblue1" src="{{ url('img/dineroazul.svg') }}">
                <hr style="height: 1px;background: #b4adad;width: 50%;">
                <!-- <p id="boxp"><?php echo $t->_("boxtext") ?></p> -->
                <p id="boxinput">{{item.service_name}}</p>
            </div>
            {% endfor %}
        {% else %}
        
        {% endif%}
    </div>
</div>

<!-- The Modal/Lightbox -->
<div id="myModal" class="modal">
    <div class="modal-content" style="margin-top: 10%; width: 50% !important; margin-left: 30%; border-radius: 10px;">
      <span class="close cursor" onclick="closeModal()" style="font-size: 50px;">&times;</span>
      <div class="mySlides" style="text-align: center;">
        <img src="{{ url('img/trabajando.jpg') }}" onclick="openModal();currentSlide(1)" class="hover-shadow" style="width: 10%; margin-top: 15px;">
        <p style="color: blue; font-size: 50px">Estamos trabajando para usted</p>
      </div>              
    </div>
</div>

<script>
    $(".boxsmall1").hover(function() {
            $(this).find('img').attr( "src","{{ url('img/dineroblanco.svg') }}");
        },function() {
            $(this).find('img').attr( "src","{{ url('img/dineroazul.svg') }}" );
        } 
    );

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

