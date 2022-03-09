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
    <center><b>REPORTE DE TRANSFERENCIAS</b></center>
</div>
   </div>  <br>    
   
   
   
 <b>FECHA DE TRANSFERENCIA</b>
       <input id="calendario_informe"   class="datepicker" type="text"   width="276"    />
        <br>
 <b>SELECCIONAR TIPO DE TRANSFERENCIA</b>
       
<select class="form-control" name="estado" id="estado"  >
             
            <OPTION VALUE="A">PARA ALMACENAMIENTO</OPTION> 
            <OPTION VALUE="P">PARA PROCESAR</OPTION> 
            <OPTION VALUE="SC">SIN CLASIFICAR</OPTION> 
            </select>             
       <br>
       <input type="button" value="BUSCAR" onclick="ir_grilla_transferencia($('#calendario_informe').val(),$('#estado').val())" class="form-control bg-navy">
    
       
       <br>
        
    <div id="div_grilla_tipo_transferencia"> </div>
           
