<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
   
        
            <label for="calendario_correccion"><b>FECHA DE PUESTA</b></label>
            <input id="calendario_correccion"  class="datepicker" type="text" onchange="traer_detalle_fecha_involucrada($('#calendario_correccion').val());filtro_eliminar(); visible_div_eliminar()"   />
      
         <div id="div_id_involucrada"   class="input-append">
        
        </div>      
   
         <form id="formulario_correccion" method="POST" >  
        <div class="modal fade" id="cuadro1" tabindex="1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-footer">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <div class="form-control-range text-center" id="div_titulo">
                        CORRECIONES   
                        </div> 
                        <br> 
                    </div>
                    <div class="modal-footer">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <div class="form-control-range text-center">
                            <label  >FECHA INVOLUCRADA:</label>
                            <input id="txt_fecha_involucradas" name="txt_fecha_involucradas" autocomplete="off"  type="text" placeholder="FECHAS INVOLUCRADAS" required="required"/>
                        </div> 
                    </div>
                    <div class="modal-footer">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <div class="form-control-range text-center">
                            <input type="hidden" id="cantidad_huevos" name="cantidad_huevos"  value="0" > 
                            <input  id="txt_cod_lote" name="txt_cod_lote"  type="hidden" >
                            <input type="hidden" id="cod_interno" name="cod_interno"   > 
                        </div>  
                    </div>  

                    <div class="modal-footer">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <div class="form-control-range text-center">
                            <input type="submit" class="btn btn-primary " id="btn_insertar_correccion"  value="REGISTRAR" name="btn_insertar_correccion"  > 

                        </div>  
                    </div>   
                </div>
            </div> 
        </div>     
    </form>
 
 <div id="mensaje_correccion"> </div>
 