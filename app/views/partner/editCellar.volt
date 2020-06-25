
{{ content() }}

<div class="col-md-6" style="">
    <h4 class="section-title h4_index">Editar <span>bodega</span> </h4>
</div>
      

<LINK REL=StyleSheet HREF="{{url('css/reports.css')}}" TYPE="text/css" MEDIA=screen>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="{{url('js/Chart.js')}}"></script>

<style type="text/css" media="screen">
    @media (max-width: 2560px) {
        .handling{
            margin-top: -14%!important;
            margin-left: 50%!important;
        }
        .movimiento {
            margin-top: -2%; 
            margin-left: 50%;
        }
    @media (max-width: 1210px) {
        .handling{
            margin-top: -25%!important;
        }
    }
</style>

<div id="nt" style="display: block;" class="trans col-sm-11">

    <div class="col-sm-12" style="border-bottom: 1px solid; height: 30px;">
        <div class="row col-sm-12 pull-right">
            
        </div>
    </div>
    {% if data is empty %}
    <br><br><h1>No se encontraron datos en tu busqueda.</h1>
    {% else  %} {% for item in data %}
    <section   style="background-color: #fff">
        <div class="col-md-12" style=" border: 1px solid silver; margin-top: 30px; border-radius: 35px;">
            
            <div class="col-md-3">
                <img style="margin-left: -31px; border-radius: 35px 0 0 35px; width: 280px; height: 250px;"  src="{{url('')}}{{item.image}}">
            </div>

            <form action="{{ url('partner/detailCellarPartner') }}" method="post">
                <input type="hidden" name="id_cellar" id="id" value="{{item.id}}">
                <input type="hidden" name="id_client" value="{{item.id_client}}">
                <div class="col-md-5">
                    <h3 style="color: black;">{{item.name}}</h3>
                    <p><strong style="color: #f71e14;">{{item.city}}</strong> {{item.address}}</p>
                    <h6 style="color: #f71e14; margin-top: 8%;">Almacenamiento</h6>
                    <h3 style="color: black; margin-top: -2%;">$ {{item.storage_cost}}</h3>
                    <h6 style="color: #f71e14; margin-top: -2%;">m<sup>3</sup>/sem</h6>

                    <h6 style="color: #f71e14; margin-top: -25%; margin-left: 65%;" class="handling">Manejo</h6>
                    <h3 style="color: black;" class="movimiento">$ {{item.handling_cost}}</h3>
                    <h6 style=" " class="movimiento">Por movimiento interno o externo</h6>
                </div>

                <div class="col-md-4 text-right">
                    <h6 style="color: #f71e14; ">Reservación mínima <strong style="color: black;">10m<sup>2</sup></strong></h6>
                    <h6 style="color: #f71e14; margin-top: 5%; ">Tiempo mínimo <strong style="color: black;">{{item.minimum_time}}</strong></h6>
                    <button type="submit" class="col-md-10 pull-right" id="enviar" style="color: white; border-radius: 10px; padding: 5px; background: #f71e14;">
                    Editar bodega       
                    </button></form>
                    <form action="{{ url('partner/deleteCellar') }}" method="post">
                    <input type="hidden" name="id_delete" value="{{item.id}}">
                    <button type="submit"  class="col-md-10 pull-right text-center btn-delete" id="enviar" style="color: white; margin-top: 4%; border-radius: 10px; padding: 5px; background: #6E6E6E; cursor: pointer;">
                    Eliminar bodega        
                    </button>
                    </form>
                </div>
        </div>
    </section>
    {% endfor %}
    {% endif %} 
     <div class="row distmap col-sm-12" id="canvas-holder" style="margin-top: 2%;">
       <canvas id="chart-area4"></canvas>
     </div>      
</div>
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


<script>
    $('.btn-delete').click(function(){
        var url = "{{ url('cellar/deleteCellar') }}";
        var id = $("input:hidden#id").val();
        var params = {
            "id" : id,
        };
        $.ajax({
           type: "POST",
           url: url,
           data: params,
           success: function(data)
           {
             $('#resp').html(data);
           }
       });
    });
</script>