
 <%@page import="org.json.JSONObject"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@include  file="../../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<% 
        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
 
        clases.controles.VerificarConexion();
        Connection cn = clases.controles.connectSesion; 

        fuente.setConexion(cn);

        
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        String contador="";
        String fecha_vieja_retenido="";
        String fecha_vieja="";
         ResultSet rs = fuente.obtenerDato(" exec mae_ptc_select_fpVieja2022 @clasificadora='"+clasificadora+"'");
        while(rs.next()){
              contador= rs.getString(1);
              fecha_vieja_retenido = rs.getString(2);
              fecha_vieja  = rs.getString(3);
                        }
        ob.put("cantidad","<b>"+contador+"</b>");
        ob.put("fecha_vieja_retenido",fecha_vieja_retenido);
        ob.put("fecha_vieja",fecha_vieja);
        clases.controles.DesconnectarBDsession();
        cn.close();
        out.print(ob); 
       %>