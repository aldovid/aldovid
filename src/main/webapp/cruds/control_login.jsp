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
    try {
            
    if (rs.isBeforeFirst()) {
        while (rs.next()) {
            //  String id_usuario = "";
            String area_form = "";
            String user_name = rs.getString("usuario");
            String nombre_usu = rs.getString("nombre");
            String clasificadora = rs.getString("clasificadora");
            String cod_usuario = rs.getString("cod_usuario");
            String notificacion="  <a class='nav-link  ' data-toggle='dropdown' href='#' aria-expanded='false'>  <i class='far fa-bell '></i>     <span class='badge badge-danger navbar-badge animacion' id='contador_notificacion'>0</span>    </a><div class='dropdown-menu dropdown-menu-lg dropdown-menu-right ' style='left: inherit; right: 0px;' id='notificacion'>   <span class='dropdown-item dropdown-header bg-navy'>Notificaciones</span>   </div>";
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
            String titulo_modulo_reproceso="ALIMENTACION DE REPROCESAR RECLASIFICAR";
            String nav_area="";
            if (area.equals("A")) 
            {
                area_form = "CCHA";
                nav_area="<i class='fas fa-home'>CCHA</i>";
            } 
            else if (area.equals("B")) 
            {
                nav_area="<i class='fas fa-home'>CCHB</i>";
                area_form = "CCHB";
            }
            else if (area.equals("H")) 
            {
                nav_area="<i class='fas fa-home'>CCHH</i>";
                area_form = "CCHH";
            } 
            else if (area.equals("C")) 
            {
                nav_area="<i class='fas fa-home'>CYO</i>";
                area_form = "CYO";
            } 
            else if (area.equals("S")) 
            {
                nav_area="<i class='fas fa-home'>SUBPRODUCTOS</i>";
                area_form = "SUBPRODUCTOS";
            } 
             else if (area.equals("D")) 
            {
                notificacion="";
                nav_area="<i class='fas fa-home'>DIRECTORIO</i>";
                area_form = "SUBPRODUCTOS";
            } 
            else if (area.equals("O")) 
            {
                nav_area="<i class='fas fa-home'>LAVADOS</i>";
                titulo_modulo_reproceso="ALIMENTACION DE REPROCESAR LAVAR";
                area_form = "OVO";
                area_fallas="OVO";
                categoria="LDO";
            } 
            
            
                sesionOk.setAttribute("notificacion",notificacion); 
                sesionOk.setAttribute("titulo_reproceso",titulo_modulo_reproceso); 
                sesionOk.setAttribute("area_cch", area_form);
                sesionOk.setAttribute("area_fallas",area_fallas);
                sesionOk.setAttribute("categoria", categoria);
                sesionOk.setAttribute("nav_area", nav_area);
                sesionOk.setAttribute("area_gm", area);
                sesionOk.setAttribute("area", area_form);
                sesionOk.setAttribute("id_rol", rs.getString("id_rol"));
                response.sendRedirect("../menu.jsp");
        }
    } else {
        response.sendRedirect("../login_error.jsp");
    }
        } catch (Exception e) {
        }
        finally{
      //controles.DesconnectarBDsession();
    }
%>







