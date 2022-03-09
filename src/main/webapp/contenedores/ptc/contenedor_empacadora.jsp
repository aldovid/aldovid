  <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
 <%@include  file="../../chequearsesion.jsp" %>

<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
PTC
</div>
</div>
    <center><b>APERTURA Y CIERRE DE EMPACADORAS</b></center>
</div>
   </div>  <br>           
    <form method="post"   id="formulario">
      
        <input type="button" name="btn_buscar" id="btn_buscar" value="ACTIVAR EMPACADORA" class="form-control btn-warning" onclick="cuadro_empacadoras()"> 
        
    </form>


<div id="div_tabla">
    
    
</div>
      
            
            
  
 

   
      
    
     
        
        
        
 