<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />
<title>Crear</title>
<div align="right">
   {{ link_to("carrierbag/index", "Volver", "class": "btn btn-success") }}
</div>
<div align="left">
   <h1>Agregar tulas</h1>
</div>
{{ form("carrierbag/addcarrierbag", "method":"post", 'enctype': 'multipart/form-data',"onkeypress":"return pulsar(event)", 'onsubmit': 'return validar(this)') }}
<div>
  <div class="row">
    <div class="col-md-3">
      <b>Seleccione punto de cargue: </b>
      <select class="form-control" name="companies_1" id="companies_1" onchange="changeCompany_(this)">
        <option value="0">Seleccione..</option>
        {% for company in companies %}
        <option value="{{ company.id_company}}">{{ company.business_name}}</option>
        {% endfor %}
      </select>
    </div>
    <div class="col-md-3">
      <b>Punto Caja</b>
      <select class="form-control" id="punto_1" name="punto_1" required></select>
    </div>
  </div>
  <br><br>
</div>

<div  class="row tablerow">
   <div class="col-md-3">
      <p class="headertable">Empresa</p>
   </div>
   <div class="col-md-3">
      <p class="headertable">Punto Fisico</p>
   </div>
   <div class="col-md-2">
      <p class="headertable">Tipo Tula</p>
   </div>
   <div class="col-md-2">
      <p class="headertable">Precinto de seguridad</p>
   </div>
</div>
<div id="rows">
  <div id="row1" class="row tablerow">
     <div class="col-md-3">
        <select class="form-control css_mio" name="companies1" id="companies1" onchange="changeCompany(this)">
           <option value="0">Seleccione..</option>
           {% for company in companies %}
              <option value="{{ company.id_company}}">{{ company.business_name}}</option>
           {% endfor %}
        </select>
     </div>
     <div class="col-md-3">
        <select class="form-control"  id="punto1" name="punto1" onchange="changePunto(this);"></select>
     </div>
     <div class="col-md-2">
        <select class="form-control" id="type1" name="type1">
           <option value="1">Correspondencia</option>
           <option value="2">Canje</option>
        </select>
     </div>
     <div class="col-md-2">
         <input class="form-control" type="text" id="precint1" name="precint1" class="precint" onkeypress="additem(event,this)">
     </div>
     <div class="col-md-1">
          <span  id="deleterow1" class="btn btn-default pull-right" onclick="deleterow(this);"  aria-label="Left Align">
                  <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
          </span>
     </div>
  </div>
</div>
<table class="table table-stripped">
   <tbody>
      <tr>
         <th colspan="10" style="text-align:center">
            <input name="enviar" id="submitroute" type="submit" class="btn btn-success"  value="Agregar tulas">
         </th>
      </tr>
   </tbody>
</table>
<input type="hidden"  id="countCarrier" name="countCarrier" value="1">
{{ end_form() }}
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>
<script type="text/javascript">
  $(document).ready(function()
    {
        $('#punto1').select2({ width: '300' });
        $("#loader").hide();

    });
  function pulsar(e) {
      tecla = (document.all) ? e.keyCode : e.which;
      return (tecla != 13);
   }

   var cache = {};
   var countCarrier = 1;
   var poinstcount = 1;
   var codigooficina = new Array();
   var clasification = new Array();
   var clasificationtype = new Array();
   {% for position,itemclasification  in clasificationtypes %}
       clasificationtype[{{position}}] = "{{itemclasification}}";
   {% endfor %}

   poinstcount = 1;

   var dont_add_json = {};
    {% if dont_add %}
      dont_add_json = JSON.parse('{{ dont_add }}');
    {% endif %}

   function additem(e,a){

       tecla = (document.all) ? e.keyCode : e.which;
        if( tecla == 13){

           var id = a.id;
           var count =  parseInt(id.substr(7));
            // obtiene los elementos del row actual

            var companiesSelect = $("#companies"+count).val();
            var puntoSelect =  $("#punto"+count).val();
            var typeSelect =  $("#type"+count).val();
            var precintSelect = $("#precint"+ count).val();
            var countCa =  $("#countCarrier");

            var elementos = $('.precint');
            var size = elementos.size();
            var arrayID = [];

            $.each( elementos, function(i, val){
                arrayID.push( $(val).val() );
            });

            var unique = arrayID.filter( onlyUnique );

            if(unique.length !=  arrayID.length){
                  alert("Esta tula ya se encuentra agregada");
                  return false;
            }


             if(companiesSelect != 0 && puntoSelect != 0 && precintSelect != ""){

                 divhtml = $( "#row"+count).clone();
                 divhtml.find(".select2-selection").remove();
                 divhtml.attr("id","row"+count);
                 divhtml.attr("style","height: 55px;");
                 divhtml.children().css( "height", "35px" )
                 divhtml.find("#schedulerouteid"+count).val("");
                 divhtml.appendTo('#rows');

                 var add = divhtml.find("#additem"+count);
                 var punto = divhtml.find("#punto"+count);
                 var select = divhtml.find("#companies"+count);
                 var selectactype = divhtml.find("#type"+ count);
                 var precint = divhtml.find("#precint"+ count);

                 var selectval =  $("#companies"+count).val();
                 var puntoval = $("#punto"+count).val();
                 var typeval = $("#type"+ count).val();


                 $("#deleterow"+count).hide();

                 count++;
                 countCarrier++;

                 // cambia atributos del nuevo row y componentes
                 divhtml.attr('id','row'+count);
                 add.attr('id','additem'+count);
                 punto.attr('id','punto'+count);
                 select.attr('id','companies'+count);
                 selectactype.attr('id','type'+count);
                 precint.attr('id','precint'+count);

                 add.attr('name','additem'+count);
                 punto.attr('name','punto'+count);
                 select.attr('name','companies'+count);
                 selectactype.attr('name','type'+count);
                 precint.attr('name','precint'+count);

                 divhtml.find("#companies"+count).val(selectval);
                 divhtml.find("#punto"+count).val(puntoval);
                 divhtml.find("#type"+count).val(typeval);
                 divhtml.find("#precint"+count).val("");


                $('#punto'+count).select2({ width: '300' }).focus(function () { $(this).select2('open'); });
                $('#punto'+count).select2('open');
              /*  $('#select2-punto'+count+'-container').trigger('change');*/

                 countCa.val(countCarrier);

             }else{

                alert("Ingrese los datos requeridos.");

             }

         }

   }

   function onlyUnique(value, index, self) {
      return self.indexOf(value) === index;
   }

   function changeCompany_(a, eaten){
    //al cambiar el select
    var codigooficina = new Array();
    var clasification = new Array();
    var clasificationtype = new Array();

    id = !eaten ? a.parentNode.parentNode.id : eaten;
    var count =  parseInt(id.substr(3));
    $("#loader").show();
        $(".hide-fields").hide();
        $('#punto_1'+count).find('option').remove().end();

        var deparmentSelected = "";

        if(!eaten)
          deparmentSelected = $( "#"+a.id+" option:selected").attr("value");
        else {
          deparmentSelected = eaten;
        }

        if(deparmentSelected == 0){
        $("#loader").hide();
        $('#clasification'+count).text("");
            return false;
        }
        //var sucursal =  $( "#subsidiary_select option:selected" ).val();


        //hacemos la petición via get
        $.get("<?php echo $this->url->get('carrierbag/getAjaxPuntos') ?>", {"company_id":deparmentSelected}, function(data)
        {
            //parseamos el json y recorremos
            var ciudades = '';
            var ciudad = data;
            if(ciudad.puntos.length > 0){
                for(i=0; i<ciudad.puntos.length; i++)
                {
                        ciudades += '<option value="'+ciudad.puntos[i].id_sub+'">'+
                        ciudad.puntos[i].subsidiary_name+ " - " + ciudad.puntos[i].office_code +'</option>';

                }

            $('select#punto_1').html(ciudades);
            }
        }).done(function() {
        $("#punto_1").focus();
            $("#loader").hide();
            $(".hide-fields").show();
        }).always(function() {
            $("#loader").hide();
            $(".hide-fields").show();
    });

}

   function changeCompany(a, eaten, row, point){
       //al cambiar el select
       var codigooficina = new Array();
       var clasification = new Array();
       var clasificationtype = new Array();
       {% for position,itemclasification  in clasificationtypes %}
           clasificationtype[{{position}}] = "{{itemclasification}}";
       {% endfor %}


        var id = !eaten ? a.parentNode.parentNode.id : eaten;
        var count =  !row ? parseInt(id.substr(3)): row;

       $("#loader").show();
           $(".hide-fields").hide();
           $('#punto'+count).find('option').remove().end();

           var deparmentSelected = "";

           if(!eaten)
              deparmentSelected = $( "#"+a.id+" option:selected").attr("value");
            else {
              deparmentSelected = eaten;
            }

           if(deparmentSelected == 0){
              $("#loader").hide();
              $('#clasification'+count).text("");
               return false;
           }
 
           var subsidiaries = '{{ subsidiaries }}';
           //var sucursal =  $( "#subsidiary_select option:selected" ).val();

           //hacemos la petición via get
           if(cache[deparmentSelected]) {
              var ciudades = '';
               var ciudad = cache[deparmentSelected];
               if(ciudad.puntos.length > 0){
                   for(i=0; i<ciudad.puntos.length; i++)
                   {
                        if(parseInt(point) === ciudad.puntos[i].id_sub) {
                          ciudades += '<option value="'+ciudad.puntos[i].id_sub+'" selected>'+
                           ciudad.puntos[i].subsidiary_name+ " - " + ciudad.puntos[i].office_code +'</option>';
                         } else {
                          ciudades += '<option value="'+ciudad.puntos[i].id_sub+'">'+
                           ciudad.puntos[i].subsidiary_name+ " - " + ciudad.puntos[i].office_code +'</option>';
                         }

                           codigooficina[ciudad.puntos[i].id_sub] = ciudad.puntos[i].office_code;
                           clasification[ciudad.puntos[i].id_sub] = ciudad.puntos[i].classification;

                       
                   }
                   $('select#punto'+count).html(ciudades);
                   var deparmentSelected1 = $( "#punto"+ count +" option:selected").attr("value");
                   $('#clasification'+count).text(clasificationtype[clasification[deparmentSelected1]]);
                   $('#punto'+count).select2({ width: '300' }).focus(function () { $(this).select2('open'); });
                   $('#punto'+count).select2('open');
               }
           } else {
             $.get("<?php echo $this->url->get('route/getAjaxPuntos') ?>", {"company_id":deparmentSelected,"subsidiaries":subsidiaries}, function(data)
               {
                   //parseamos el json y recorremos
                   var ciudades = '';
                   var ciudad = data;
                   cache[deparmentSelected] = data;
                   if(ciudad.puntos.length > 0){
                       for(i=0; i<ciudad.puntos.length; i++)
                       {
                            if(parseInt(point) === ciudad.puntos[i].id_sub) {
                              ciudades += '<option value="'+ciudad.puntos[i].id_sub+'" selected>'+
                               ciudad.puntos[i].subsidiary_name+ " - " + ciudad.puntos[i].office_code +'</option>';
                             } else {
                              ciudades += '<option value="'+ciudad.puntos[i].id_sub+'">'+
                               ciudad.puntos[i].subsidiary_name+ " - " + ciudad.puntos[i].office_code +'</option>';
                             }

                               codigooficina[ciudad.puntos[i].id_sub] = ciudad.puntos[i].office_code;
                               clasification[ciudad.puntos[i].id_sub] = ciudad.puntos[i].classification;

                           
                       }

                       $('select#punto'+count).html(ciudades);
                       var deparmentSelected1 = $( "#punto"+ count +" option:selected").attr("value");
                       $('#clasification'+count).text(clasificationtype[clasification[deparmentSelected1]]);
                       $('#punto'+count).select2({ width: '300' }).focus(function () { $(this).select2('open'); });
                       $('#punto'+count).select2('open');
                   }
               }).done(function() {
                   $("#loader").hide();
                   $(".hide-fields").show();
                 }).always(function() {
                   $("#loader").hide();
                   $(".hide-fields").show();
               });
           }
   }

   function changePunto(a){
       var codigooficina = new Array();
       var clasification = new Array();
       var clasificationtype = new Array();
       {% for position,itemclasification  in clasificationtypes %}
           clasificationtype[{{position}}] = "{{itemclasification}}";
       {% endfor %}

       var id = a.parentNode.parentNode.id;
       var count =  parseInt(id.substr(3));
       var input = $("#percint" + count);
       var deparmentSelected = $('#companies'+count).val();
       var subsidiaries = '{{ subsidiaries }}';

       var p = new Promise(function (resolve, reject) {
          var data = cache[deparmentSelected];
          if(data) {
            if(data.puntos.length > 0) {
               for(i=0; i<data.puntos.length; i++)
               {
                  codigooficina[data.puntos[i].id_sub] = data.puntos[i].office_code;
                  clasification[data.puntos[i].id_sub] = data.puntos[i].classification;
               }
               var deparmentSelected1 = $( "#punto"+ count+" option:selected").attr("value");
               $('#clasification'+count).text(clasificationtype[clasification[deparmentSelected1]]);
            }
            resolve()
          } else {
            reject();
          }
       })
       p.then(function(data) {
          $("#precint" + count).focus()
       })
       p.catch(function() {         
          $.get("<?php echo $this->url->get('route/getAjaxPuntos') ?>", {"company_id":deparmentSelected}, function(data)
           {
               //parseamos el json y recorremos
               var ciudades = '';
               var ciudad = data;
               cache[deparmentSelected] = data;
               if(ciudad.puntos.length > 0) {
                   for(i=0; i<ciudad.puntos.length; i++)
                   {
                      codigooficina[ciudad.puntos[i].id_sub] = ciudad.puntos[i].office_code;
                      clasification[ciudad.puntos[i].id_sub] = ciudad.puntos[i].classification;
                   }
                   var deparmentSelected1 = $( "#punto"+ count+" option:selected").attr("value");
                   $('#clasification'+count).text(clasificationtype[clasification[deparmentSelected1]]);
               }

           })
            .done(function() {
              $("#precint" + count).focus()
               $("#loader").hide();
               $(".hide-fields").show();
            })
            .always(function() {
               $("#loader").hide();
               $(".hide-fields").show();
            });
       })

       /*$.get("<?php echo $this->url->get('route/getAjaxPuntos') ?>", {"company_id":deparmentSelected}, function(data)
         {
             //parseamos el json y recorremos
             
             if(ciudad.puntos.length > 0) {
                 for(i=0; i<ciudad.puntos.length; i++)
                 {
                    codigooficina[ciudad.puntos[i].id_sub] = ciudad.puntos[i].office_code;
                    clasification[ciudad.puntos[i].id_sub] = ciudad.puntos[i].classification;
                 }
                 var deparmentSelected1 = $( "#punto"+ count+" option:selected").attr("value");
                 $('#clasification'+count).text(clasificationtype[clasification[deparmentSelected1]]);
             }

         })
          .done(function() {
            $("#precint" + count).focus()
             $("#loader").hide();
             $(".hide-fields").show();
          })
          .always(function() {
             $("#loader").hide();
             $(".hide-fields").show();
          });*/
    }

   function deleterow(a){

       id = a.parentNode.parentNode.id;
       var count =  parseInt(id.substr(3));

       poinstcount = count - 1;
       $("#deleterow"+poinstcount).show();
       $("#row"+count).remove();

       $("#numberpoints").val(poinstcount);
   }

   function response_to_dont_add() {
    var count = dont_add_json.count; delete dont_add_json.count;
    var index = 1;

    $.each(dont_add_json, function(i, value){
      if (index === 1) {
        var divhtml = $( "#row1");
        //var flash = $(".alert alert-warning");
        divhtml.find(".select2-selection").remove();

        var select_form = $("#companies_1");
        var punto_form = $("#punto_1");

        var select = divhtml.find("#companies1");
        var punto = divhtml.find("#punto1");
        var selectactype = divhtml.find("#type1");
        var precint = divhtml.find("#precint1");

        select_form.val(value['companies_' + value['id']]);
        changeCompany_("", value['companies_' + value['id']]);
        punto_form.val(value['punto_' + value['id']])

        changeCompany("", value['companies' + value['id']], index, value['punto' + value['id']]);
        select.val(value['companies' + value['id']]);
        punto.val(value['punto' + value['id']]);
        selectactype.val(value['type' + value['id']]);
        precint.val(value['precint' + value['id']]);

        $('#punto1').select2({ width: '300' });

      } else {
        var last = index - 1;
        var divhtml = $("#row"+last).clone();

        divhtml.attr("id","row"+last);
        divhtml.find(".select2-selection").remove();
        divhtml.find("#schedulerouteid"+last).val("");
        divhtml.insertAfter("#row"+last);


        var select = divhtml.find("#companies" + last);
        var punto = divhtml.find("#punto" + last);
        var selectactype = divhtml.find("#type" + last);
        var precint = divhtml.find("#precint" + last);

        divhtml.attr('id','row'+index);

        punto.attr('id','punto'+index);
        select.attr('id','companies'+index);
        selectactype.attr('id','type'+index);
        precint.attr('id','precint'+index);

        punto.attr('name','punto'+index);
        select.attr('name','companies'+index);
        selectactype.attr('name','type'+index);
        precint.attr('name','precint'+index);

        changeCompany("", value['companies' + value['id']], index, value['punto' + value['id']]);
        select.val(value['companies' + value['id']]);
        punto.val(value['punto' + value['id']]);
        selectactype.val(value['type' + value['id']]);
        precint.val(value['precint' + value['id']]);

        $('#punto'+index).select2({ width: '300'});
        $("#deleterow"+last).hide();
      }

      index++;
    });
   }

</script>
