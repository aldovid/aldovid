<%-- 
    Document   : reporte_datos_mortandad
    Created on : 07/01/2022, 08:10:10
    Author     : csanchez
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
  <% 
        String aviario= request.getParameter("aviario") ;
        String fecha= request.getParameter("fecha") ;

    clases.controles.VerificarConexion();
    fuente.setConexion(clases.controles.connectSesion);
    JSONObject obje = new JSONObject();
    obje = new JSONObject();
    PreparedStatement pt=clases.controles.connectSesion.prepareStatement("select mor_fila, mor_cant from ppr_mortandad where mor_fecha='"+fecha+"' "
            + "and mor_aviario='"+aviario+"'");
     //PreparedStatement pt=con.prepareStatement("select idusuario,nombreusuario from tab_mae_ppr_log");
    ResultSet rs=pt.executeQuery();
 
    ArrayList Fila_M = new ArrayList();
    //ArrayList Cant = new ArrayList();
            while(rs.next()) {

                Map<String, String> fila_m = new HashMap<String, String>();
                Map<String, String> cant_c = new HashMap<String, String>();
              
                fila_m.put("id", "#celda"+rs.getString("mor_fila"));
                fila_m.put("cantidad", rs.getString("mor_cant"));

                Fila_M.add(fila_m);
               // Cant.add(cant_c);
               
              }
            clases.controles.connectSesion.close();
    obje.put("filas",Fila_M);
   // obje.put("cant",Cant );
    out.print(obje); 
 %>