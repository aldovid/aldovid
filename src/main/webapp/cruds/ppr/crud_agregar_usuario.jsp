<%@page import="clases.controles"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="application/json; charset=utf-8"%>
<%@page import="java.sql.Statement"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.SQLException"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
 
<%
    JSONObject obje = new JSONObject();
        obje = new JSONObject();
        
        String nombre;
        String apellido;
        String usuario;
        String pass;
        String email;
        String rol;
        String estado;
        String foto; 
      
  
        nombre= request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        usuario = request.getParameter("usuario");
        pass = request.getParameter("pass");
        email = request.getParameter("correo");
        rol= request.getParameter("select_rol");
        foto= request.getParameter("image");
 
        String fullText ="image";
        byte[] binaryFullText = fullText.getBytes();
        String mensaje="";
        String tipo_registro="";
        controles.VerificarConexion();

    fuente.setConexion(clases.controles.connectSesion);
         
    try{
                clases.controles.connectSesion.setAutoCommit(false);

         CallableStatement call;
       
            call = clases.controles.connectSesion.prepareCall("{call stp_mae_ppr_insert_usuarios(?,?,?,?,?,?,?,?)}");
               
            call.setString           (1, nombre);
            call.setString           (2, apellido);
            call.setString           (3, usuario);
            call.setString           (4, email);
            call.setInt              (5, Integer.parseInt(rol) );
            call.setBytes            (6, binaryFullText);
            
            call.registerOutParameter(7, java.sql.Types.VARCHAR);
            call.registerOutParameter(8, java.sql.Types.VARCHAR);
            call.execute();
            
             mensaje=call.getString(8);
             tipo_registro=call.getString(7);
           if (tipo_registro=="1")
                {
                    clases.controles.connectSesion.rollback();
        
                }   
                else  
                {
                     //clases.controles.connectSesion.rollback(); 
                    clases.controles.connectSesion.commit();
              
                } 
 } catch (Exception ex) {
    
  }
 finally {
     obje.put("mensaje",mensaje );
     obje.put("tipo_registro",tipo_registro );
        out.print(obje);
 }
%>
