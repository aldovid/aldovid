 <!DOCTYPE html>
 <%@ page session="true" %>
<%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
 %>
    <div class="input-append">  
        
           <div class="container-fluid">
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
MIS
</div>
</div>
    <center><b>VISUALIZACIÓN DE INFORMES REGISTRADOS</b></center>
</div>
   </div>  <br>      
   
   
 
        <a>Fecha de clasificación</a>
        <input id="calendario_informe" class="datepicker" width="276"    />
        
        <input type="button" class="form-control bg-navy"value="Buscar" onclick="principal_mis()">
    </div> 
   <br>   
 <div  id="div_grilla"  >
         </div>  
      
       

     