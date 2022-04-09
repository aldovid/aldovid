<%@page import="clases.controles"%>
<%@page import="clases.fuentedato"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
 <%     
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    ResultSet rs,rs2;
    rs = fuente.obtenerDato("   select "
            + "                     a.id,FORMAT (a.fecha_registro, 'dd/MM/yyyy hh:mm') as fecha_registro,concat(b.code,'-',b.name) as camion,"
            + "                     b.code as cod_camion,id_chofer,c.Name as nombre_chofer  "
            + "                 from "
            + "                     mae_log_ptc_cab_pedidos a  "
            + "                     inner join maehara.dbo.[@CAMIONES] b    on a.id_camion=b.Code collate database_default and estado   in (1,2)   "
            + "                     inner join maehara.dbo.[@CHOFERES] C 	on a.id_chofer collate database_default=c.Code ");  
     String version=clases.versiones.contenedores_logistica_contenedor_pedidos_generados_menu;
     
try {
        
    
 %>      
       
 <head>   
<label  ><b></b></label> 
<div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xx"
     onclick="cargar_datos_modal_version('<%=version%>','VERSION: <%=version%>')">
    <label ><%=version%></label> 
</div>
</head>    
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
LOG
</div>
</div>
    <center><b>MODIFICACION Y ANULACIÓN DE PEDIDOS</b></center>
</div>
   </div>  <br>              <table class="table table-striped">  
                 <thead>
                    <tr> 
                        <th>NRO PEDIDO</th> 
                        <th>FECHA</th> 
                        <th>CAMION</th> 
                        <th>CHOFER</th> 
                        <th>ACCION</th> 
                        <th>ACCION</th> 
                    </tr> 
                 </thead>
                 <tbody>
                     <% while (rs.next()) {  %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("fecha_registro") %></td>
                            <td><%=rs.getString("camion") %></td>
                            <td><%=rs.getString("nombre_chofer") %></td>
                            <td><input type="button" value="IR AL PEDIDO" class="form-control btn-black" onclick="ir_pedido_modificar_logistica(2,<%=rs.getString("id")%>,<%=rs.getString("cod_camion")%>,<%=rs.getString("id_chofer")%>)"></td>
                            <td><input type="button" value="ANULAR" class="form-control btn-danger" onclick="anular_pedido(<%=rs.getString("id")%>)"></td>
                        </tr>                             
                        <% }
                     %>
                     
                     
                 </tbody>
                 
             </table>
                     
                     <%
            } catch (Exception e) {
    }
finally{
        clases.controles.DesconnectarBD();

}
%>