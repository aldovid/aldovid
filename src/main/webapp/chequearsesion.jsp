<%-- 
    Document   : chequearsesion
    Created on : 20/12/2021, 15:35:10
    Author     : csanchez
--%>

<%@ page session="true" %>
<%
    HttpSession sesionOk = request.getSession();
    sesionOk.setMaxInactiveInterval(300*6);
    if (sesionOk.getAttribute("id_usuario") == null ) 
    {
        clases.controles.connectSesion.close();
        response.sendRedirect("index.jsp");
    }
%>