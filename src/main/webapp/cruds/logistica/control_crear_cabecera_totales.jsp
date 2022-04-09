<%-- 
    Document   : control_ot
    Created on : 07/04/2021, 08:53:01 AM
    Author     : hvelazquez
--%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@include  file="../../chequearsesion.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8" %>

<%    
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();
    String id_camion        = request.getParameter("id_camion");
     String tipo_huevo     = request.getParameter("tipo_huevo");
     String cantidad     = request.getParameter("cantidad");
     String id_pedido     = request.getParameter("id_pedido");
      
     if(id_pedido.equals("")){
         id_pedido="0";
     }
    String mensaje="";
    int tipo_respuesta=0;    
    try 
    { 
        clases.controles.connect.setAutoCommit(false);
        CallableStatement  callableStatement=null;   
        callableStatement = clases.controles.connect.prepareCall("{call [mae_log_insert_cabecera_totales_preembarque](?,?,?,?,?,?)}");
        
        callableStatement .setInt(1,        Integer.parseInt(id_camion) );
          callableStatement .setString(2,     tipo_huevo) ;
        callableStatement .setInt(3,    Integer.parseInt( cantidad) );
        callableStatement .setInt(4,    Integer.parseInt( id_pedido) );
 
        callableStatement.registerOutParameter("estado_registro", java.sql.Types.INTEGER);
        callableStatement.registerOutParameter("mensaje", java.sql.Types.VARCHAR);
       callableStatement.execute(); 
        tipo_respuesta = callableStatement.getInt("estado_registro");
        mensaje= callableStatement.getString("mensaje");
        if (tipo_respuesta==0)
        {
            clases.controles.connect.rollback(); 
        }   
        else  
        {
 
           clases.controles.connect.commit();
        }
    } 
    catch (Exception e) 
    {           
        mensaje=e.toString();
        tipo_respuesta=0;
 
    }
    finally
    {   clases.controles.DesconnectarBD();
        ob.put("mensaje", mensaje);
        ob.put("tipo_respuesta", tipo_respuesta);
         out.print(ob); 
    }
   %>