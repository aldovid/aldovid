<%-- 
    Document   : informe_factura
    Created on : 05/03/2020, 11:04:47 AM
    Author     : hvelazquez
--%>
 <%@page import="java.sql.*"%>
 <%@include  file="../../chequearsesion.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
 <body>
    <%    
        try {
        
    String area =(String) sesionOk.getAttribute("area");
    String fecha =request.getParameter("fecha");
    String tipo =request.getParameter("tipo");
    
    clases.controles.connectarBD();  
    Connection cn = clases.controles.connect;
    
    fuente.setConexion(cn); 
    ResultSet rs ;
                
       rs = fuente.obtenerDato ("select * "
               + "from lotes_transferencia "
               + "where convert(varchar,fecha,103)='"+fecha+"'"
               + " and area='"+area+"' and tipo_transferencia='"+tipo+"'");
   
     
            while (rs.next())
            { 
            String nro_transferencia=rs.getString("id");
            %>
              
            <form action="controles/control_reporte_transferencia.jsp" method="get" target="_black" > 
                
                <input type="hidden" value="<%=nro_transferencia%>" name="nro_transferencia">
                <input type="hidden" value="<%=rs.getString("tipo_transferencia")%>" name="tipo_transferencia">
                <input type="submit" value="IR A TRANSFERENCIA NRO.  <%=nro_transferencia%> CHOFER:<%=rs.getString("nombre_chofer")%> "    class="form-control btn-danger">
          
          </form>
          <br>
 
        <%} 
             rs.close();
         cn.close();
       
        } 
    catch (Exception e) 
                {

                }
         clases.controles.DesconnectarBD();        
        %>
         
 </body>