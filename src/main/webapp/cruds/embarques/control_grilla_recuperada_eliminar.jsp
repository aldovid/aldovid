<%@page import="clases.controles"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@include  file="../../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
        <% 
        
        clases.controles.VerificarConexion();
       // Connection cn = clases.controles.connect;
        fuente. setConexion(controles.connectSesion);  
        String  numero_factura      = request.getParameter("nro_factura") ;
        String  area                =(String)sesionOk.getAttribute("area_gm");
        int  id                =Integer.parseInt(request.getParameter("id")) ;
        int     mensaje             =0;
              try { 
             
             controles.connectSesion.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
             callableStatement = controles.connectSesion.prepareCall( "{call pa_embarque_pendientes_eliminar(?,?,?,?)}");
            callableStatement .setString(   1,  area );
            callableStatement .setInt(   2,  Integer.parseInt(numero_factura.substring(numero_factura.length() - 7)));
            callableStatement .setInt(      3,  id);
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            mensaje = callableStatement.getInt("mensaje");
            controles.connectSesion.commit();
          
              } catch (Exception e) 
            {
            controles.connectSesion.rollback();
          
            }
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        //cn.close();
        //clases.controles.DesconnectarBD();
        out.print(ob); 
        %>  