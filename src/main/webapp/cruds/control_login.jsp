<%-- 
    Document   : logincontrol
    Created on : 03/03/2020, 08:04:55 AM
    Author     : hvelazquez
--%>
<%@page import="clases.controles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%

    clases.controles.connectarBDsesion();
    fuente.setConexion(clases.controles.connectSesion);

    String usu = request.getParameter("usuario");
    String cla = request.getParameter("pass");
    ResultSet rs = fuente.obtenerDato("select * from usuarios where usuario = '" + usu + "' and password = '" + cla + "' and clasificadora <>'u'");
    String area = "";

    if (rs.isBeforeFirst()) {
        while (rs.next()) {
            //  String id_usuario = "";
            String area_form = "";
            String user_name = rs.getString("usuario");
            String nombre_usu = rs.getString("nombre");
            String clasificadora = rs.getString("clasificadora");
            String cod_usuario = rs.getString("cod_usuario");
            
            HttpSession sesionOk = request.getSession();
            sesionOk.setAttribute("user_name", user_name);
            sesionOk.setAttribute("nombre_usuario", nombre_usu);
            sesionOk.setAttribute("clasificadora", clasificadora);
            sesionOk.setAttribute("area_log", clasificadora);
            sesionOk.setAttribute("id_usuario", cod_usuario);
            area = rs.getString("clasificadora");
            area = rs.getString("clasificadora");
            
            String area_fallas="CCH";
            String categoria="FCO";
           
            if (area.equals("A")) 
            {
                area_form = "CCHA";
            } 
            else if (area.equals("B")) 
            {
                area_form = "CCHB";
            }
            else if (area.equals("H")) 
            {
                area_form = "CCHH";
            } 
            else if (area.equals("C")) 
            {
                area_form = "CYO";
            } 
            else if (area.equals("S")) 
            {
                area_form = "SUBPRODUCTOS";
            } 
            else if (area.equals("O")) 
            {
                area_form = "OVO";
                area_fallas="OVO";
                categoria="LDO";
            } 
                sesionOk.setAttribute("area_cch", area_form);
                sesionOk.setAttribute("area_fallas",area_fallas);
                sesionOk.setAttribute("categoria", categoria);
            
                sesionOk.setAttribute("area_gm", area);
                sesionOk.setAttribute("area", area_form);
                response.sendRedirect("../menu.jsp");
        }
    } else {
        response.sendRedirect("../login_error.jsp");
    }

    //  controles.DesconnectarBD();
%>







