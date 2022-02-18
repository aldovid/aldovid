 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    
    String usuario = (String) sesionOk.getAttribute("usuario");
    String clasificadora = (String) sesionOk.getAttribute("clasificadora");
    String user_name = (String) sesionOk.getAttribute("nombre_usuario");

%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
  
      
 
     <div class="container-fluid">
        
         <a>Fecha de puesta</a>
         <input    id="text_id_eliminar" name="text_id_eliminar" type="text" style="display: none" >
       
       
     <div class="input-append">  
         <input id="calendario_eliminar"  class="datepicker" type="text"  />
  </div>     <br>
          <button   class=" form-control btn btn-primary " onclick="traer_detalle_eliminar($('#calendario_eliminar').val());filtro_eliminar(); visible_div_eliminar()">BUSCAR</button> 
    <br>   <br>   
       
        <div   id="id_div">
         
           
         
        </div>  
        </div>      
        </div>
        
        
        
        
      