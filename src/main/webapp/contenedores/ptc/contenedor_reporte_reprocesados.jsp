  <!DOCTYPE html>
 <%@ page session="true" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
 %>
 

<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
PTC
</div>
</div>
    <center><b>REPORTE DE CARROS REPROCESADOS</b></center>
</div>
   </div>  <br>    
   
    <form action="cruds/ptc/control_reporte.jsp" target="_blank" method="post">  
<b>FECHA DE REGISTRO</b>
       <input id="fecha" name="fecha"   class="datepicker" type="text"   width="276"    />
       <input  id="archivo" name="archivo"  type="hidden"   value="reporte_reprocesados"   />
        <br>
        
             
       <br>
       <input type="submit" style="font-weight: bold;color:black;"value="GENERAR REPORTE"   class="form-control bg-navy">
    
        
   </form>    
   
   
           
