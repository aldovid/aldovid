<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="../../chequearsesion.jsp" %>
 
     <div class="container-fluid">
        
   
         <input   style="display: none"id="text_id_eliminar" name="text_id_eliminar" type="text" >
       
       
     <div class="input-append">  
        <input id="calendario_eliminar" data-format="dd/mm/yyyy"  width="276" />
  </div>  
         <button   class="btn btn-primary " onclick="traer_detalle_eliminar_mis($('#calendario_eliminar').val());">BUSCAR</button> 
    <br>
        <div id="div_eliminar"  >
            
        
        </div>   
    
    
    
        </div>
        
        
        
        
      