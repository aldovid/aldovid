  <!DOCTYPE html>
 <%@ page session="true" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
 %>
 
    
<a>FECHA DE TRANSFERENCIA</a>
       <input id="calendario_informe"   class="datepicker" type="text"   width="276"    />
        <br>
 <a>SELECCIONAR TIPO DE TRANSFERENCIA</a>
       
<select class="form-control" name="estado" id="estado"  >
             
            <OPTION VALUE="A">PARA ALMACENAMIENTO</OPTION> 
            <OPTION VALUE="P">PARA PROCESAR</OPTION> 
            <OPTION VALUE="SC">SIN CLASIFICAR</OPTION> 
            </select>             
       <br>
       <input type="button" value="BUSCAR" onclick="ir_grilla_transferencia($('#calendario_informe').val(),$('#estado').val())" class="form-control btn-primary">
    
       <br>
       
        <div id="div_cargar" class="text-center" style="display: none">
  <div class="spinner-border" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>
    <div id="div_grilla_tipo_transferencia"> </div>
           
