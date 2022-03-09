
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
PTC
</div>
</div>
    <center><b>REPORTE DE HUEVOS CLASIFICADOS</b></center>
</div>
   </div>  <br>           

   <form id="formulario_reporte_clasificados" name="formulario_reporte_clasificados" action="cruds/ptc/control_reporte_clasificados.jsp" target="_blank">
      <br>
    <div class="input-append">  
        <b>FECHA DE CLASIFICACION</b>
        <input id="calendario_reporte_clasificados" name="calendario_reporte_clasificados"  class="datepicker" type="text"  width="276" required="true"  />
    </div> 

    <br> 
    <input  class="btn form-control bg-navy" type="submit" onclick="verificar();"  value="Generar reporte"> 


</form> 

