<%@page import="clases.controles"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json; charset=utf-8" %>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../../chequearsesion.jsp" %>
 <%       
      
    try {
               
            clases.controles.VerificarConexion();
            
            fuente.setConexion(clases.controles.connectSesion);
            
            String area             =   (String) sesionOk.getAttribute("area");
            String carro            =   request.getParameter("id");
            String factura          =   request.getParameter("factura");  
            String verificador_SAP  =   "0";
            JSONObject ob           =   new JSONObject();
            JSONArray jarray        =   new JSONArray();
               
            ResultSet rs_lote = fuente.obtenerDato(" exec [mae_cch_select_lotes_disponibles_embarque_test]  @area_cch='"+area+"',@cod_carrito='"+carro+"',@nro_factura='"+factura+"'");
        
            while(rs_lote.next()) 
            {
                ob=new JSONObject();
                verificador_SAP= rs_lote.getString("tipo_huevo"); 
                ob.put("item_codigo",  rs_lote.getString("tipo_huevo"));
                ob.put("tipo", rs_lote.getString("nombre_tipo"));
                ob.put("nro_carrito",rs_lote.getString("cod_carrito"));
                ob.put("cod_lote", rs_lote.getString("cod_lote"));
                ob.put("cantidad", rs_lote.getString("cantidad"));
                ob.put("fecha_puesta", rs_lote.getString("fecha_puesta"));
                ob.put("estado", rs_lote.getString("estado"));
                ob.put("estado_liberacion", rs_lote.getString("estado_liberacion"));
                ob.put("identificador_lote", rs_lote.getString("cod_interno"));
                ob.put("mensaje", "1");
                ob.put("tipo_mensaje", "1");
                jarray.put(ob); 
            } 
       
            if(verificador_SAP.equals("0"))
            { 
                ob.put("item_codigo",  "0");
                ob.put("tipo", "0");
                ob.put("nro_carrito","0");
                ob.put("cod_lote", "0");
                ob.put("cantidad", "0");
                ob.put("fecha_puesta", "0");
                ob.put("estado","0");
                ob.put("estado_liberacion","0");
                ob.put("identificador_lote","0");
                ob.put("tipo_mensaje", "0"); 
                ob.put("cod_interno","0");
                ob.put("mensaje", "1");
            }
           // controles.DesconnectarBD();
            out.print(jarray); 
               } 
           catch (Exception e) 
        {
            JSONObject ob = new JSONObject();
            JSONArray jarray = new JSONArray();
            ob=new JSONObject();
            ob.put("tipo_mensaje", "0");
            ob.put("item_codigo", "0");
            ob.put("tipo", "0");
            ob.put("nro_carrito", "0");
            ob.put("cod_lote", "0");
            ob.put("cantidad", "0");
            ob.put("fecha_puesta", "0");
            ob.put("estado", "0");
            ob.put("estado_liberacion","0");
            ob.put("identificador_lote", "0");
            ob.put("mensaje","0");
            ob.put("tipo_mensaje","0");
            out.print(jarray); 
        }   %>