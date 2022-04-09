<%-- 
    Document   : contenedor_clasificadora_dinamica
    Created on : 24/03/2022, 14:28:40
    Author     : csanchez
--%>

<% 
   String version= "";// clases.versiones.contenedores_ptc_informe_kpi_dinamico;
 
 %> 
<head>   
<label  ><b></b></label> 
<div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xx"
     onclick="cargar_datos_modal_version('<%=version%>','VERSION: <%=version%>')">
    <label neme="label_contenido" id="label_contenido"><%=version%></label>  
</div>
</head>
<div  >
    <form    id="form_reporte_dinamicop_clasificadora"  name="form_reporte_dinamicop_clasificadora" method="post" >
      
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
PTC
</div>
</div>
    <center><b>GRAFICO INDICADORES DE PORCENTAJE KPI CYO</b></center>
</div>
   </div>  <br>        <table id="tabla_principall2"  class="table table-bordered table-hover datat">
            <thead>
                <tr>
                    <th>DESDE</th>
                    <th>HASTA</th>
                     <%-- 
                    <th>CLASIFICADORA</th>
                     --%>
                    <th>SERIE(%)</th>
                    <%-- 
                    <th>TIPO RESULTADO</th>
                     --%>
                    <th>TIPO GRAFICO</th>
                    <th class="text-center" colspan="2">ACCIONES</th>
                </tr>
            </thead>   
            <tbody>
                <tr>  
                    <td>  
                        <input type="date" id="fecha_desde_cla" name="fecha_desde_cla">
                    </td>
                    <td>   
                        <input type="date" id="fecha_hasta_cla" name="fecha_hasta_cla">
                    </td>
                    
                    <%--
                    <td><select class="selectpicker" multiple data-live-search="true" id="clasif_cla" name="clasif_cla"  required="true" data-actions-box="true">
                            <option class="text-center" value="A">A  </option>
                            <option class="text-center" value="B">B  </option>
                            <option class="text-center" value="H">H  </option>
                            <option class="text-center" value="O">O  </option>
                            <option class="text-center" value="S">S  </option>
                        </select></td>
                     
    --%>

                    <td><select class="selectpicker" multiple data-live-search="true" id="categorias2_cla" name="categorias2_cla"  required="true" data-actions-box="true">
                            <option class="text-center" value=ptcc>   PTC</option>
                            <option class="text-center" value=rpp> RP</option>
                            <option class="text-center" value=pii>     PI</option>
                        </select>
                    </td>
                     <%-- 
                    <td>
                        <select  id="tipoConsulta_cla" name="tipoConsulta_cla" class="btn btn-sm  bg-navy">
                            <option class="text-center" value="suma">    Suma</option>
                            
                            <option class="text-center" value="promedio">Promedio</option>
                            <option class="text-center" value="minimo">  Minimo</option>
                            <option class="text-center" value="maximo">  Maximo</option>
                           
                        </select>
                    </td>
                      --%>
                    <td><select id="tipo_grafico_cla" name="tipo_grafico_cla" class="btn btn-sm  bg-navy">
                            <option class="text-center" value="line">Lineal</option>
                            <option class="text-center" value="bar">Barra</option>
                        </select>
                    </td>
                    <td>
                        <input type='hidden' value='1' id='ser'>
                        <button type="submit" name="submit" class="btn btn-sm  bg-navy btn-block" ><i class="fa fa-search"></i></button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-sm  bg-navy btn-block" onclick="generar_cuadros_consultas_clasificadora_dinamicos_ptc()"><i class="fa fa-plus"></i> Cuadros</button>
                    </td>              
                </tr>
            </tbody>
        </table>
    </form> 
    
    


<div  id="div_graficop_clasificadora"  ></div>
<div  id="div_graficop_total"  ></div>
<div  id="div_principal_clasificadora"  ></div>