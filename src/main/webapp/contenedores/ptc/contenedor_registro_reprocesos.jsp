<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : contenedor_registro_reprocesos
    Created on : 15-dic-2021, 9:51:44
    Author     : hvelazquez
--%>
 <%@include  file="../../chequearsesion.jsp" %>
<%
     String titulo_reproceso    = (String) sesionOk.getAttribute("titulo_reproceso");

%> 
 <div class="form-control bg-primary" style="font-weight: bold;color:white;" > <center><%=titulo_reproceso%></center></div>

 <div id="contenedor_boton"> </div>
 
 <br><!-- comment -->
 
       
 
   <div class="form-group">
       
       
            <div class="input-group">
                <input type="number" placeholder="LOTE" name="txt_lote" id="txt_lote" class="form-control" onkeypress="cargar_datos_key_reproceso_alimentacion();"/>
                 
            
            <span class="input-group-addon">-</span>
            <input type="button" value="INGRESAR" name="btn_ingresar" id="btn_ingresar" onclick="consulta_lotes_reproceso_alimentacion($('#txt_lote').val());" class="form-control btn btn-dark"/>

 
                
               
          </div>
          </div>
     
     <a id="id_cantidad">Cantidad</a>
 <table id="grilla_transfer" data-row-style="rowStyle" data-toggle="table"  class="table table-striped table-bordered" data-click-to-select="true">
    <thead>
      <tr>
     
    <th>ID</th>
    <th>CARRO</th>
    <th>CANTIDAD</th>
    <th>PLANCHAS</th>
    <th>UNIDADES</th>
    <th>FECHAPUESTA</th>
     <th>TIPO</th>
     <th>ACCION</th>
       </tr>
     </thead>
     <tbody>
         
     </tbody>
  </table>      
 
 
 
 