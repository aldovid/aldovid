  <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
 <%@include  file="../../chequearsesion.jsp" %>
  
    
    <form method="post"   id="formulario">
      
        <input type="button" name="btn_buscar" id="btn_buscar" value="ACTIVAR EMPACADORA" class="form-control btn-warning" onclick="cuadro_empacadoras()"> 
        
    </form>


<div id="div_tabla">
    
    
</div>
      
            
            
  
 

   
      
    
     
        
        
        
 