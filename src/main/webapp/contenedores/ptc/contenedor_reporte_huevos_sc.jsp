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
    <center><b>REPORTE DE HUEVOS SIN CLASIFICAR</b></center>
</div>
   </div>  <br>    
   
   
  <form action="cruds/ptc/control_reporte.jsp" target="_blank">  
<b>FECHA DE PUESTA</b>
       <input id="fecha" name="fecha"   class="datepicker" type="text"   width="276"    />
              <input  id="archivo" name="archivo"  type="hidden"   value="huevos_SC"   />

        <br>
        
             
       <br>
       <input type="submit"  value="GENERAR REPORTE"   class="form-control bg-navy">
    
        
   </form>    
   
   
           
