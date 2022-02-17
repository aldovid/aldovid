<%-- 
    Document   : control_ot
    Created on : 07/04/2021, 08:53:01 AM
    Author     : hvelazquez
--%>
 <%@page import="com.microsoft.sqlserver.jdbc.SQLServerDataTable"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
    String id_usuario       = (String) sesionOk.getAttribute("id_usuario");
    String id_camion        = request.getParameter("id_camion");
    String cantidad_total   = request.getParameter("cantidad_total");
    String array_pedido     = request.getParameter("contenido");
    String obs     = request.getParameter("obs");
    String id_chofer     = request.getParameter("id_chofer");
    String contenido_mixto_INSERT     = request.getParameter("contenido_mixto_INSERT");
    String carros_excedentes="";
    String mensaje="";
    int tipo_respuesta=0;    
    try 
    {
      /*  List<String> myList = new ArrayList<String>(Arrays.asList(array_pedido.split("&")));
 
        System.out.println(myList);*/
        String contenedor=array_pedido.trim();
        clases.controles.connect.setAutoCommit(false);
        CallableStatement  callableStatement=null;   
        callableStatement = clases.controles.connect.prepareCall("{call [mae_log_ptc_pedidos_insert](?,?,?,?,?,?,?,?,?)}");
        callableStatement .setInt(1,        Integer.parseInt(cantidad_total) );
        callableStatement .setString(2,        id_camion  );
        callableStatement .setInt(3,        Integer.parseInt(id_usuario) );
        callableStatement .setString(4,     contenedor);
        callableStatement .setString(5,     id_chofer );
        callableStatement .setString(6,     obs );
 
        callableStatement.registerOutParameter("estado_registro", java.sql.Types.INTEGER);
        callableStatement.registerOutParameter("mensaje", java.sql.Types.VARCHAR);
        callableStatement.registerOutParameter("carros_excedentes", java.sql.Types.VARCHAR);
        callableStatement.execute(); 
        tipo_respuesta = callableStatement.getInt("estado_registro");
        mensaje= callableStatement.getString("mensaje");
        carros_excedentes= callableStatement.getString("carros_excedentes");
        if (tipo_respuesta==0)
        {
            clases.controles.connect.rollback(); 
        }   
        else  
        {
           //  clases.controles.connect.rollback(); 

           clases.controles.connect.commit();
        }
            clases.controles.DesconnectarBD();
           /* ob.put("mensaje", mensaje);
            ob.put("tipo_respuesta", tipo_respuesta);
            ob.put("carros_excedentes", carros_excedentes);*/
    } 
    catch (Exception e) 
    {           
        mensaje=e.toString();
        tipo_respuesta=0;
        carros_excedentes="";

    }
    finally
    {
        ob.put("mensaje", mensaje);
        ob.put("tipo_respuesta", tipo_respuesta);
        ob.put("carros_excedentes", carros_excedentes);
        out.print(ob); 
    }
   %>