<%-- 
    Document   : CERRARSESION
    Created on : 26/01/2016, 08:08:09 PM
    Author     : HERNAN VELAZQUEZ
--%>

<%@ page session="true" %>
<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
request.getSession().invalidate();
clases.controles.connectSesion.close();
%>
<meta http-equiv="Refresh" content="1;url=../index.jsp">