<%-- 
    Document   : control_ot
    Created on : 07/04/2021, 08:53:01 AM
    Author     : hvelazquez
--%>
<%@page import="logistica.datos_pedidos_modificar"%>
<%@page import="com.microsoft.sqlserver.jdbc.SQLServerDataTable"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
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
    String json        = request.getParameter("json");
    String id_pedido        = request.getParameter("id_pedido");
    String id_usuario       = (String) sesionOk.getAttribute("id_usuario");
    String mensaje="";
    int tipo_respuesta=0;    
    try 
    {
    
    ObjectMapper mapper = new ObjectMapper();
    datos_pedidos_modificar[] pp1 = mapper.readValue(json, datos_pedidos_modificar[].class);

    SQLServerDataTable DataTableGrilla = new SQLServerDataTable();
    DataTableGrilla.addColumnMetadata("fecha_puesta" ,  java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("area" ,          java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("tipo" ,          java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("tipo_huevo" ,    java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("cantidad" ,      java.sql.Types.INTEGER);
    DataTableGrilla.addColumnMetadata("categoria" ,     java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("cod_carrito" ,   java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("u_medida" ,      java.sql.Types.VARCHAR);
    DataTableGrilla.addColumnMetadata("id_pedido" ,     java.sql.Types.INTEGER);
    DataTableGrilla.addColumnMetadata("id_camion" ,     java.sql.Types.INTEGER);
    

    for (datos_pedidos_modificar lotes : pp1) 
    {
        DataTableGrilla.addRow
        (
            lotes.fecha_puesta, 
            lotes.area, 
            lotes.tipo, 
            lotes.tipo_huevo, 
            lotes.cantidad, 
            lotes.categoria, 
            lotes.cod_carrito, 
            lotes.u_medida, 
            lotes.id_pedido, 
            lotes.id_camion 
        );
    }
        
        clases.controles.connect.setAutoCommit(false);
        CallableStatement  callableStatement=null;   
        callableStatement = clases.controles.connect.prepareCall("{call [mae_log_ptc_pedidos_modificar_cyo](?,?,?,?,?)}");
        callableStatement .setObject(1, DataTableGrilla );
        callableStatement .setInt(2,    Integer.parseInt(id_pedido) );
        callableStatement .setInt(3,    Integer.parseInt(id_usuario) );
        
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
           //  clases.controles.connect.rollback(); 
            clases.controles.connect.commit();
        }
    } 
    catch (Exception e) 
    {           
        mensaje=e.toString();
        tipo_respuesta=0;
    }
    finally
    {
        ob.put("mensaje", mensaje);
        ob.put("tipo_respuesta", tipo_respuesta);
         out.print(ob); 
         clases.controles.DesconnectarBD();
    }
   %>