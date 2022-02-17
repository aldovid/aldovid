 
 <div class="form-control bg-navy text-center " style='color: #fff; background: white; font-weight: bold; '>Reportes de pedidos generados</div>
<br>
<a style='color: #000; background: white; font-weight: bold; '> Tipo de reporte</a>
<select id="cbox_tipo" class="bg-navy" style='color: #fff; background: white; font-weight: bold; ' onchange="filtro_reporte($('#cbox_tipo').val())">
    <option value="7">GENERADOS</option>
    <option value="1">PENDIENTES FACTURACION</option>
    <option value="2">PENDIENTES A EMBARCAR</option>
    <option value="5">EMBARCADOS</option>
    
</select>

<br><br>
<div id="contenedor_fechas">
<a style='color: #000; background: white; font-weight: bold; ' >Fecha desde</a>
<input type="text" class="datepicker" style='color: #000; background: white; font-weight: bold; ' id="desde" >
<br><br>
<a style='color: #000; background: white; font-weight: bold; ' >Fecha hasta</a>
<input type="text"  class="datepicker"  style='color: #000; background: white; font-weight: bold; '  id="hasta" ><!-- comment -->
</div>
<br><br><br><br>
<input type="button" class="bg-navy form-control"  style='color: #ffffff; background: white; font-weight: bold; ' value="BUSCAR" onclick="buscar_reporte()">


<div id="div_grilla">
    
    
</div>