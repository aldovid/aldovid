
 <%@page import="clases.variables"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="../../chequearsesion.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%
       String fecha_puesta    = request.getParameter("fecha_puesta");
       String area = (String) sesionOk.getAttribute("clasificadora");
       String area_cch = (String) sesionOk.getAttribute("area_cch");
      
  
       
String consulta ="exec [mae_ptc_select_lotes] @area='"+area+"',@area_cch='"+area_cch+"',@fecha_puesta='"+fecha_puesta+"' ";
        
        
   %>
   
   <table id="example" class="table table-striped table-bordered" style="width:100%">
                     <thead>
                    <tr>
                       
                        <th>Carro nro</th>
                        <th>Tipo</th>
                        <th>Cantidad</th>
                        <th>Fecha puesta </th>
                        
                        <th>ACCION</th>      
                    </tr>
                    </thead>
        <%
            clases.controles.connectarBD();   
            Connection cn = clases.controles.connect; 
            fuente.setConexion(cn);
             ResultSet rs= fuente.obtenerDato(consulta);
            while(rs.next()){
        %>
                        <tr>  
                             <td><b><%=rs.getString("cod_carrito")%>    </b></td>
                            <td><b><%=rs.getString("tipo_huevo")%>    </b></td>
                            <td><b><%=rs.getString("cantidad")%>    </b></td>
                            <td><b><%=rs.getString("fecha_puesta")%>    </b></td>
                             <td><input type="button" value="Cambiar" class="btn btn-primary"  onclick="registro_transformacion_ptc('<%=rs.getString("cod_interno")%>','<%=rs.getString("cod_carrito")%>','<%=rs.getString("tipo")%>','<%=rs.getString("cantidad")%>','<%=rs.getString("fecha_puesta")%>','<%=rs.getString("itemcode")%>','<%=area_cch%>')"></td>
                        </tr>
                            <% } 
                            cn.close();
                            clases.controles.DesconnectarBD();
                            %>
     
       
         
        <tbody id="tbody_id"> 
             
                 </tbody>
   
     </table>

   