<%-- 
    Document   : crud_modificar_usuario
    Created on : 16-dic-2021, 15:46:44
    Author     : aespinola
--%>

<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@include  file="../../chequearsesion.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8" %>

<%    
    clases.controles.VerificarConexion();
    fuente.setConexion(clases.controles.connectSesion);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();

    String id            = request.getParameter("txt_id");
    String nombre        = request.getParameter("txt_nombre");
    String apellido      = request.getParameter("txt_apellido");
    String txt_usuario   = request.getParameter("txt_usuario");
    String txt_email     = request.getParameter("txt_email");
    String select_estado = request.getParameter("select_estado");
    String select_rolm   = request.getParameter("select_rolm");
    
    String mensaje      ="";
    String tipo_respuesta="";    
    try 
    { 
        clases.controles.connectSesion.setAutoCommit(false);
        CallableStatement  call;   
                call = clases.controles.connectSesion.prepareCall("{call [stp_mae_ppr_update_usuario](?,?,?,?,?,?,?,?,?)}");
                call .setInt(1,    Integer.parseInt(id) );
                call .setString(2, nombre);
                call .setString(3, apellido);
                call .setString(4, txt_usuario);
                call .setString(5, txt_email);
                call .setString(6, select_estado);
                call .setString(7, select_rolm);
               
        
                call.registerOutParameter(8, java.sql.Types.VARCHAR);
                call.registerOutParameter(9, java.sql.Types.VARCHAR);
                call.execute(); 
                tipo_respuesta=call.getString(8);
                mensaje=call.getString(9);
               
                 if (tipo_respuesta=="1")
                {
                    clases.controles.connectSesion.rollback();
                   
                }   
                else  
                {
                     //clasess.controles.connectSesion.rollback(); 
                    clases.controles.connectSesion.commit();
                  
                }    
               
           
         } catch (Exception e){
    
  }
     finally{           
                ob.put("mensaje", mensaje);
                ob.put("tipo_respuesta", tipo_respuesta);
                 out.print(ob); 
            }
           %>