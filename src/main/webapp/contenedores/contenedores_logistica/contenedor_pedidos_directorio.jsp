<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <% 
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    ResultSet rs;
    String fecha_actual = "";
    try 
    {
        rs = fuente.obtenerDato(" select   GETDATE()  as hora ");
        while(rs.next())
        {    
            fecha_actual = rs.getString("hora");
        }
        rs.close();  
    } 
    catch (Exception e) 
    {
    }
    finally
    {
       clases.controles.DesconnectarBD();
    }
       
%> 

<a class="btn btn-app bg-navy" onclick="ir_stock_directorio_cyo()">
<span class="badge bg-info"><i class="fas fa-bell"></i></span>
<i class="fas fa-envelope"></i> Última Actualización:<%=fecha_actual%>
</a><!-- comment -->

 

  <div id="contenido_grilla"> 
     </div> 

  <div id="contenido_grilla_mixto"> 
     </div> 


