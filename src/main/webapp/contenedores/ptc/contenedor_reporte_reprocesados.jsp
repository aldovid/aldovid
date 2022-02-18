  <!DOCTYPE html>
 <%@ page session="true" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
 %>
 
 <form action="cruds/ptc/control_reporte.jsp" target="_blank" method="post">  
<a>FECHA DE REGISTRO</a>
       <input id="fecha" name="fecha"   class="datepicker" type="text"   width="276"    />
       <input  id="archivo" name="archivo"  type="hidden"   value="reporte_reprocesados"   />
        <br>
        
             
       <br>
       <input type="submit" style="font-weight: bold;color:black;"value="GENERAR REPORTE"   class="form-control btn-primary">
    
        
   </form>    
   
   
           
