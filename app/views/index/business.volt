
<!DOCTYPE html>
<html lang="en">


  <body>
    <!-- Start Featured Slider -->


<section id="mu-hero" class="mu-hero-business-section1" style="background-image: url({{url('img/ImagenCotizador.jpg')}});">
    <form action="{{ url('index/supportIndex') }}" method="post">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="col-md-4">
                    <label style="text-align: center">
                        <?php echo $t->_("boxindex1") ?>
                    </label>
                    <select>
                        <option>Bogota</option>
                        <option>Espinal</option>
                        <option>Villavicencio</option>
                        <option>Aguazul</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label style="text-align: center">
                        <?php echo $t->_("boxindex2") ?>
                    </label>
                    <input type="date" name="">
                </div>

                <div class="col-md-2">
                    <label style="text-align: center">
                        <?php echo $t->_("boxindex3") ?>
                    </label>
                    <input type="date" name="">
                </div>

                <div class="col-md-4">
                    <label style="text-align: center">
                        <?php echo $t->_("boxindex8") ?>
                    </label>
                    <div class="col-md-12">
                        <input type="radio" name="box" value="<?php echo $t->_('boxindex5') ?>" style="width: 30px" checked>
                        <span class="checkmark"></span>
                        <label style="width: min-content; line-height: 20px;">
                            <?php echo $t->_("boxindex5") ?>
                        </label>
                        <div class="col-md-9 pull-right">
                            <div id="etiqueta" class="col-md-1 col-md-offset-9"></div><div class="col-md-1">m3</div>
                            <input id="input" type="range" value="35" min="0" max="100" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <input type="radio" name="box" value="<?php echo $t->_('boxindex6') ?>" style="width: 30px">
                        <span class="checkmark"></span>
                        <label style="width: min-content; line-height: 20px;">
                            <?php echo $t->_("boxindex6") ?>
                        </label>
                        <div class="col-md-9 pull-right">
                            <div id="etiqueta2" class="col-md-1 col-md-offset-9"></div><div class="col-md-1">m2</div>
                            <input id="input2" type="range" value="35" min="0" max="100" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>    


<section id="mu-hero" class="mu-hero-business-section2" style="background-color: #fff"> 
    <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <img src="{{ url('img/ImagenTemporal01.jpg') }}">
                </div>
                <div class="col-md-5">
                    
                </div>
                <div class="col-md-3">
                    
                </div>
                <form action="{{url('cellar/detailCellar')}}" method="POST">
                    <input type="text" name="id">
                    <input type="submit" value="Enviar"></input>
                </form>

                <form action="{{url('cellar/deleteCellar')}}" method="POST">
                    <input class="col-md-3" type="text" name="id">
                    <input class="col-md-3 button-primary" type="submit" value="Enviar"></input>
                </form>
            </div>
            <div class="col-md-12 border-div">
                <div class="col-md-7 textdiv">
                    <input type="hidden" name="address_id" value="{{item.id}}">

                    <div class="control-group">
                    <label class="control-label" for="username" style="color: #005eae;font-size: 25px;">{{item.name_address}}</label>
                    </div>

                    <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Addresss") ?>: {{ item.address }}</label>
                    </div>

                    <!-- <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Locationss") ?>: {{ item.country }}, {{ item.city }}</label>
                    </div> -->

                    <div class="control-group">
                    <label class="control-label" for="email"><?php echo $t->_("Phoness") ?>: {{ item.contact_phone }}</label>
                    </div>
                </div>
                <div class="col-md-5 text-right box_crud" style="margin-top: 8px;">
                <a class="edit button-circle" onclick="detailAddress({{item.id}})"> <div> <img src="{{url('img/lapiz-inclinado.svg')}}" alt=""> </div> <span> <?php echo $t->_("Edit") ?></span> </a>
                
                <a class="address button-circle" href="{{url('address/delete?address=')}}{{ item.id }}"> <div> <img src="{{url('img/cubo-de-basura.svg')}}" alt=""> </div> <span> <?php echo $t->_("Delete") ?></span> </a>
                
                <a class="address button-circle img-calidad addressfavorite" href="{{url('address/favorite?address=')}}{{ item.id }}&{{'id_address='}}{{item.id_client}}"> <div class=div-calidad> <img src="{{url('img/calidad(1).svg')}}" alt=""> </div> <span id="firstadd" class="span-medalla"> <?php echo $t->_("Prime_address") ?> </span> </a>
                
                </div>

            </div>  

    </div>
</section>

<div class="scrollup">
    <a href="#"><i class="fa fa-chevron-up"></i></a>
</div>



  </body>
</html>

<script type="text/javascript">
    var elInput = document.querySelector('#input');
    
    if (elInput) {
      var etiqueta = document.querySelector('#etiqueta');
      if (etiqueta) {
        etiqueta.innerHTML = elInput.value;

        elInput.addEventListener('input', function() {
          etiqueta.innerHTML = elInput.value;
        }, false);
      }
    }

    var elInput2 = document.querySelector('#input2');

    if (elInput2) {
      var etiqueta2 = document.querySelector('#etiqueta2');
      if (etiqueta2) {
        etiqueta2.innerHTML = elInput2.value;

        elInput2.addEventListener('input', function() {
          etiqueta2.innerHTML = elInput2.value;
        }, false);
      }
    }
</script>


