<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="../../chequearsesion.jsp" %>
 
<head>   
<label  ><b></b></label> 
<div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xx"
     onclick="cargar_datos_modal_version('0021-REP-01032022-A','VERSION: 0021-REP-01032022-A')">
    <label ></label>0021-PAN-01032022-A  
</div>
</head>
<div class="container-fluid">
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
MIS
</div>
</div>
    <center><b>ELIMINACIÓN DE REGISTROS</b></center>
</div>
   </div>  <br>         
         <input   style="display: none"id="text_id_eliminar" name="text_id_eliminar" type="text" >
       
       
     <div class="input-append">  
         <a>Fecha de clasificación</a>
         <input id="calendario_eliminar"  class="datepicker"  width="276" />
  </div>  
         <button   class="btn bg-navy "  onclick="traer_detalle_eliminar_mis($('#calendario_eliminar').val());">BUSCAR</button> 
    <br>
        <div id="div_eliminar"  >
            
        
        </div>   
    
    
    
        </div>
        
        
        
        
      