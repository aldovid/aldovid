<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@include  file="../../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
    <% 
    
    clases.controles.connectarBD();
    fuente. setConexion(clases.controles.connect);  
    
    String  area        =(String)sesionOk.getAttribute("area_gm");
    String  area_cch    =(String)sesionOk.getAttribute("area");
    int tipo            =0;
    String mensaje="";
         
        try 
        { 
            
            
       /*     CallableStatement  callableStatement2=null;   
            callableStatement2 = clases.controles.connect.prepareCall("{call [mae_cch_embarque_eliminar_lotes_disponibles](?,?,?)}");
            callableStatement2 .setString(   1,  area_cch );
            callableStatement2 .setString(   2,  area);
              
            callableStatement2.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement2.execute();
            tipo = callableStatement2.getInt("mensaje");
            mensaje="LOTES SINCRONIZADOS CON EXITO.";
            
            
            */
            
            
            CallableStatement  callableStatement=null;   
            callableStatement = clases.controles.connect.prepareCall("{call [mae_cch_embarque_insertar_lotes_disponibles](?,?,?)}");
            callableStatement .setString(   1,  area_cch );
            callableStatement .setString(   2,  area);
              
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            tipo = callableStatement.getInt("mensaje");
            mensaje="LOTES SINCRONIZADOS CON EXITO.";
         } 
        catch (Exception e) 
        {
                 mensaje=e.toString();
                tipo=0;
        }
        finally
        {
            JSONObject ob = new JSONObject();
            ob=new JSONObject();
            ob.put("tipo", tipo);  
            ob.put("mensaje", mensaje);
            out.print(ob); 
            clases.controles.DesconnectarBD();
        }

         %>  
   
 
