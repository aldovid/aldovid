 <div class="form-control bg-navy text-center " style='color: #fff; background: white; font-weight: bold; '>Reportes de embarques generados</div>
 

<br><br>
<a>INGRESAR FECHA DE EMBARQUE</a>
 <input  style=" font-weight: bold"class="datepicker"   type="text" id="calendario_embarque" name="calendario_embarque">              
 <br> 
 <br> 

 <input  style=" font-weight: bold"class="form-control bg-navy"   type="button"  value="BUSCAR" onclick="filtrar_listado_embarque($('#calendario_embarque').val());">              






<br>
<br>

<div id="contenedor_embarque_lista"> </div>