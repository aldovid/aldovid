  <!DOCTYPE html>
 <%@ page session="true" %>
 <%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
%>

    <form action="cruds/ptc/control_reporte.jsp" target="_blank">
    
        <a>Busqueda por fecha puesta</a>
        <input type="text" id="fecha_puesta" name="fecha_puesta" placeholder="Ingrese fecha de puesta" class="form-control  datepicker" onchange="consulta_huevos_recibidos($('#fecha_puesta').val());">
        <br>
        <input type="button" class="btn invisible" id="backButton" value="< Atras"> 
        <br>
        <br> 
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <input type="submit" id="btn_buscar" class="form-control btn-success"  style="font-weight: bold;color:black; display: none"  value="Descargar resumen"  >
        <input type="button"   class="form-control btn-warning"  style="font-weight: bold;color:black;"   value="Reportes varios"    data-toggle="modal" data-target="#modal_reporte_varios"    >
        <input type="hidden"   name="tipo" value="FP">
        <input  type="hidden" name="archivo" value="huevos_recibidos_dia">
    </form>









<div class="modal fade" id="modal_reporte_varios" tabindex="-1" role="dialog"   aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header" > 
            <a style="font-weight: bold;color:black;  "  > OPCIONES DE REPORTES </a> 
        </div>
        <div class="modal-body">
                 
                    
                        <div class="accordion-container">

                               
                            <form action="cruds/ptc/control_reporte.jsp" target="_blank" >
                                <a style=" color:white;"  class="accordion-titulo">CON DETALLES<span class="toggle-icon"></span></a>
                                <div class="accordion-content">
                                    <a>INGRESE FECHAS DE PUESTAS</a>
                                    <input  type="hidden" name="archivo" value="huevos_recibidos_detallado">
                                    <input type="text" class="datepicker" name="fecha_desde" placeholder="FECHA INICIAL">
                                    <input type="text" class="datepicker" name="fecha_hasta" placeholder="FECHA FINAL">
                                    <input type="hidden" name="tipo" value="D">
                                    <input type="submit" class="form-control bg-gradient-primary"  style="font-weight: bold;color:black;" value="Generar reporte">
                                </div>
                            </form>
                        </div>
	
                        <div class="accordion-container">
                            <form action="cruds/ptc/control_reporte.jsp" target="_blank" >
                                <a  style=" color:white;"  class="accordion-titulo">SIN DETALLES<span class="toggle-icon"></span></a>
                                <div class="accordion-content">
                                    <input  type="hidden" name="archivo" value="huevos_recibidos">
                                 <a>INGRESE FECHAS DE PUESTAS</a>
                                    <input type="hidden"  name="tipo" value="SD">
                                    <input type="text" class="datepicker" name="fecha_desde" placeholder="FECHA INICIAL">
                                    <input type="text" class="datepicker" name="fecha_hasta" placeholder="FECHA FINAL">
                                    <input type="submit" class="form-control bg-gradient-primary"  style="font-weight: bold;color:black;" value="Generar reporte">
                                </div>
                           </form>  
                        </div>
              <div class="accordion-container">
                            <form action="cruds/ptc/control_reporte.jsp" target="_blank" >
                                <a  style=" color:white;"  class="accordion-titulo">REPOSICION DE HUEVOS ALIMENTADOS<span class="toggle-icon"></span></a>
                                <div class="accordion-content">
                                    <input  type="hidden" name="archivo" value="reposicion_alimentados">
                                 <a>INGRESE FECHAS DE PUESTAS</a>
                                     <input type="text" class="datepicker" name="fecha_desde" placeholder="FECHA INICIAL">
                                    <input type="text" class="datepicker" name="fecha_hasta" placeholder="FECHA FINAL">
                                    <input type="submit" class="form-control bg-gradient-primary"  style="font-weight: bold;color:black;" value="Generar reporte">
                                </div>
                           </form>  
                        </div>

               
        </div>
        <div class="modal-footer">

        </div>
    </div>
    </div>
  </div>        

<style>
    body{
	background: #ecf0f1;
}

#container-main{
	margin:40px auto;
	width:95%;
	min-width:320px;
	max-width:960px;
}

#container-main h1{
	font-size: 40px;
	text-shadow:4px 4px 5px #16a085;
}

.accordion-container {
	width: 100%;
	margin: 0 0 20px;
	clear:both;
}

.accordion-titulo {
	position: relative;
	display: block;
	padding: 20px;
	font-size: 24px;
	font-weight: 300;
	background: #2c3e50;
	color: #fff;
	text-decoration: none;
}
.accordion-titulo.open {
	background: #16a085;
	color: #fff;
}
.accordion-titulo:hover {
	background: #1abc9c;
}

.accordion-titulo span.toggle-icon:before {
	content:"+";
}

.accordion-titulo.open span.toggle-icon:before {
	content:"-";
}

.accordion-titulo span.toggle-icon {
	position: absolute;
	top: 10px;
	right: 20px;
	font-size: 38px;
	font-weight:bold;
}

.accordion-content {
	display: none;
	padding: 20px;
	overflow: auto;
}

.accordion-content p{
	margin:0;
}

.accordion-content img {
	display: block;
	float: left;
	margin: 0 15px 10px 0;
	width: 50%;
	height: auto;
}


@media (max-width: 767px) {
	.accordion-content {
		padding: 10px 0;
	}
}

    
</style>

 