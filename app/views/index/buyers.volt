
<!DOCTYPE html>
<html lang="en">


  <body>
    <!-- Start Featured Slider -->


<section id="mu-hero" class="mu-hero-buyers-section1" style="background-image: url({{url('img/C_img1.jpg')}});">
    <div class="container" >
        <div class="row buyersfirst">


            <div class="col-md-7 col-sm-7 col-md-offset-5 col-sm-offset-5">
                <div class="mu-hero-left" style="float: none;">
        <h2 style="color: white" align="right"><?php echo $t->_("SectionTitleBuyers1") ?></h2>
        <br><br>
        <p class="pull-right" align="right"><?php echo $t->_("SectionTextBuyers1") ?></p>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
                            <a class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>" onclick="mostrarcapa('222');"><?php echo $t->_("SectionButton7") ?></a>
                        </div>
                    </div>        
                </div>
            </div>

        </div>
    </div>
</section>    


<section id="mu-hero" class="mu-hero-buyers-section2" style="background-image: url({{url('img/C_img2.jpg')}});">
    <div class="container" >
        <div class="row">


            <div class="col-md-7 col-sm-7">
                <div class="mu-hero-left" style="float: none;">
        <h2 style="color: white" align="left"><?php echo $t->_("SectionTitleBuyers2") ?></h2>
        <br><br>
        <p align="left"><?php echo $t->_("SectionTextBuyers2") ?></p>
                    <div class="row">
                        <div class="col-md-8 col-sm-12 ">
                            <a href="#" class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton7") ?></a>
                        </div>
                    </div>        
                </div>
            </div>

        </div>
    </div>
</section>

    <!-- Start Book Overview -->
<section id="mu-book-overview" class="mu-book-overview-buyers-section3" style="background-image: url({{url('img/C_img3.jpg')}});">
    <div class="container">
    <div class="row">


        <div class="col-md-7 col-sm-7">
            <div class="mu-hero-left" style="float: none;" >
    <h2 style="color: white"><?php echo $t->_("SectionTitleBuyers3") ?></h2><br>
    <img class="imgnum" src="{{url('img/C_1.png')}}"><p class="txtnum"><?php echo $t->_("SectionTextBuyers31") ?></p>
    <img class="imgnum" src="{{url('img/C_2.png')}}"><p class="txtnum"><?php echo $t->_("SectionTextBuyers32") ?></p>   
    <img class="imgnum" src="{{url('img/C_3.png')}}"><p class="txtnum"><?php echo $t->_("SectionTextBuyers33") ?></p>
    <img class="imgnum" src="{{url('img/Numero4.png')}}"><p class="txtnum"><?php echo $t->_("SectionTextBuyers34") ?></p>
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <a href="#" class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton7") ?></a>
                        </div>
                    </div>

            </div>
        </div>

    </div>            
    </div>
</section>

 <section id="mu-hero" class="mu-hero-buyers-section4" style="background-image: url({{url('img/C_img4.jpg')}});">
    <div class="container" >
        <div class="row">


            <div class="col-md-7 col-sm-7 col-md-offset-5 col-sm-offset-5">
                <div class="mu-hero-left" style="float: none;">
        <h2 style="color: white" align="right"><?php echo $t->_("SectionTitleBuyers4") ?></h2>
        <br><br>
        <p class="pull-right" style="text-align: right;"><?php echo $t->_("SectionTextBuyers4") ?></p>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
                            <a href="#" class="mu-primary-btn btnprim <?php echo $t->_('btnstyle') ?>"><?php echo $t->_("SectionButton7") ?></a>
                        </div>
                    </div>         
                </div>
            </div>

        </div>
    </div>
</section>      
    <!-- End Book Overview -->




    <!-- End main content -->


<div class="scrollup">
    <a href="#"><i class="fa fa-chevron-up"></i></a>
</div>



  </body>
</html>


<script type="text/javascript">

        function mostrarcapa(capilla) {
            //Cerrando otras secciones
            obj1 = document.getElementById('1');
            obj2 = document.getElementById('2');
            obj3 = document.getElementById('3');
            obj4 = document.getElementById('4');
            obj555 = document.getElementById('555'); //registro
            obj222 = document.getElementById('222'); //registro
            menu = document.getElementById('menu-brinks');

            //cerrando..
            if (obj1) {
                obj1.style.display = "none";
            }
            if (obj2) {
                obj2.style.display = "none";
            }
            if (obj3) {
                obj3.style.display = "none";
            }
            if (obj4) {
                obj4.style.display = "none";
            }
            if (obj555) {
                obj555.style.display = "none";
            }
            if (obj222) {
                obj222.style.display = "none";
            }

            //mostrando seccion señalada
            obj = document.getElementById(capilla);
            obj.style.display = "block";
            if (capilla == "222" || capilla == "3" || capilla == "555") {
                menu.classList.remove('in');
            }

        }
        
</script>

