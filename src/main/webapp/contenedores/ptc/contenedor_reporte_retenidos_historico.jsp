 
     
<form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="cruds/ptc/control_reporte_historico_retenido.jsp" target="_blank">
 
    <div class="input-append">  
        <a>FECHA DE PUESTA</a>
        <input id="fecha_puesta" name="fecha_puesta" class="datepicker" type="text"  width="276" required="true"  />
    
    
    </div> 
    
    
  
  
      
      
         <br> 
         
         <a >TIPO DE HUEVO</a> 
           <select class="form-control" name="tipo_huevo" id="tipo_huevo" > 
            <OPTION VALUE="T" selected  >TODOS</OPTION>
            <OPTION   VALUE="A">A</OPTION>
            <OPTION   VALUE="B">B</OPTION>   
            <OPTION   VALUE="C">C</OPTION>
            <OPTION   VALUE="D">D</OPTION>
            <OPTION   VALUE="S">S</OPTION>   
            <OPTION   VALUE="J">J</OPTION>
            <OPTION   VALUE="G">G</OPTION>
             </select> 
      
              
             
             
              <br>  <br> 
             <input   class="btn  btn-success form-control" type="submit"    value="Generar reporte"> 
        
          
      </form> 
   
