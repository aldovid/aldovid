 <%@include  file="../../chequearsesion.jsp" %>

<%    String area = (String) sesionOk .getAttribute("clasificadora");
 
%>
      
     
<form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="cruds/ptc/control_reporte_mixto_variable.jsp" target="_blank">
  <select  name="filtro_calendario"    id="filtro_calendario" class="form-control"   >
            <OPTION selected disabled>SELECCIONAR FILTRO POR FECHA DE PUESTA O CLASIFICACION</OPTION>
            <option value="0">FECHA DE PUESTA</option>
            <option value="1">FECHA DE CLASIFICACION</option>
            <option value="2">FECHA INVOLUCRADA</option>
        </select>
  
   
         <div class="input-append">  
            <br><br>
            <a>INGRESAR FECHA DESDE</a>
            <input id="calendario_reporte_carros_mixto"  name="calendario_reporte_carros_mixto" class="datepicker" data-format="dd/mm/yyyy"  width="276" required="required"  />
            <a>INGRESAR FECHA HASTA</a>
            <input id="calendario_reporte_carros_mixto_hasta" name="calendario_reporte_carros_mixto_hasta" class="datepicker" data-format="dd/mm/yyyy"  width="276" required="required"  />
        <br>

        </div> 
        <br> 
        <select class="form-control" name="cbox_estado" id="cbox_estado" required="true"> 
            <OPTION selected disabled>SELECCIONAR ESTADO DE LIBERACION</OPTION>
            <OPTION   VALUE="L">LIBERADO</OPTION>
            <OPTION   VALUE="R">RETENIDO</OPTION>
        </select>  
        <br> 
        <a>TIPO DE HUEVO</a> <br>
            <select class="selectpicker" name="tipo_huevo" id="tipo_huevo" multiple data-live-search="true" required="required"   data-actions-box="true"> 
                <OPTION   VALUE="A">A</OPTION>
                <OPTION   VALUE="B">B</OPTION>   
                <OPTION   VALUE="C">C</OPTION>
                <OPTION   VALUE="D">D</OPTION>
                <OPTION   VALUE="S">S</OPTION>   
                <OPTION   VALUE="J">J</OPTION>
                <OPTION   VALUE="G">G</OPTION>
            </select> 
            <br> <br> 
             <a>FILTRO POR AVIARIO</a> 
            <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="SI"     data-off="NO"   id="check_filtro_aviario"  data-onstyle="warning" data-offstyle="success">
            <br><br>
            <div id="div_aviarios" style="display: none">
            <a>SELECCION DE AVIARIOS POR FILTRAR</a>
            <select class="selectpicker" name="aviarios" id="aviarios" multiple data-live-search="true" > 
                <OPTION   VALUE="<%=area%>1"><%=area%>1</OPTION>
                <OPTION   VALUE="<%=area%>2"><%=area%>2</OPTION>   
                <OPTION   VALUE="<%=area%>3"><%=area%>3</OPTION>
                <OPTION   VALUE="<%=area%>4"><%=area%>4</OPTION>
                <OPTION   VALUE="<%=area%>5"><%=area%>5</OPTION>   
                <OPTION   VALUE="<%=area%>6"><%=area%>6</OPTION>
                <OPTION   VALUE="<%=area%>7"><%=area%>7</OPTION>
                <OPTION   VALUE="<%=area%>8"><%=area%>8</OPTION>
                <OPTION   VALUE="<%=area%>9"><%=area%>9</OPTION>
                <OPTION   VALUE="<%=area%>10"><%=area%>10</OPTION>
                <OPTION   VALUE="<%=area%>11"><%=area%>11</OPTION>
                <OPTION   VALUE="<%=area%>12"><%=area%>12</OPTION>
                
            </select> 
                <input id="filtro_aviario"    name="filtro_aviario"  value="NO"  type="hidden" />                
                </div>
             <br>
             <div id="div_filtro_carro"> 
                <a>FILTRO POR NRO DE CARRO</a> 
                <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="SI"     data-off="NO"   id="check_filtro_carro"  data-onstyle="warning" data-offstyle="success">
               <br> <br>

               <div id="div_carrito" style="display: none">
                   <a>INGRESE NRO DE CARRO</a>
                   <input type="number"  id="cod_carrito" name="cod_carrito" placeholder="INGRESAR NUMERO" value="0" class="form-control" >
               </div>       
            </div>
            <BR>
            
      
       
            <br> 
            <br> 
             <input style="width:260px; height:80px" class="btn btn-success" type="submit"    value="Generar reporte"> 
    </form>  