  <!DOCTYPE html>
 <%@ page session="true" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
%>
 
    
    
<form id="form_excel">
              <div class="form-group">
            <div class="input-group">
                <a>FECHA DE PUESTA</a>
                <input id="calendario_ptc_excel" type="text" class="datepicker"  width="276"    />
             
                 
            <span class="input-group-addon">-</span>
            <div class="input-append">  
<select class="form-control" name="estado" id="estado"  >
            <OPTION selected value=""  >Estado liberacion</OPTION>
               
        <OPTION VALUE="L">Liberado</OPTION> 
        <OPTION VALUE="R">Retenido</OPTION> 
        <OPTION VALUE="E">Eliminados</OPTION> 
             
           
            </select>             </div>
          
        
            <input type="submit" value="BUSCAR"  class="form-control btn-primary btn_buscar_excel">
            
            </div>
            </div>
      <br>   
   
 
      <div id="ptc_excel"> </div>
   
 
     </form>