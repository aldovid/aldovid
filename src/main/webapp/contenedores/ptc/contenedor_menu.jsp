<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%
    String permiso    = (String) sesionOk.getAttribute("permiso");
    String titulo_reproceso    = (String) sesionOk.getAttribute("titulo_reproceso");
    if(permiso.equals("PTC")){
        
   
%> 
   
 <div class="form-control bg-warning" id="texto_global"><font color="black"><b>TIENE PENDIENTES DE LIBERACION</b></font></div>
<br>
<br>
<br>
<input type="text" style="display: none"  id="contador_text" >
     <div class="col-xl-3 col-md-6 mb-4 "   id="div_principal_pendiente"  onclick="traer_pendiente_liberacion()">
              <div class=" " id="div_pendiente">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b></b></font></div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="texto"><font color="black"><b>TIENE PENDIENTES DE LIBERACION</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-arrow-alt-circle-down  fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
<div class="col-xl-3 col-md-6 mb-4" onclick="traer_registro()">
              <div class="card border-left-primary shadow h-100 " >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><font color="green">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-primary"><font color="green">CARROS LIBERADOS</font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-plus fa-2x text-verde"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
<div class="col-xl-3 col-md-6 mb-4" onclick="ir_registro_carros_alimentados()">
              <div class="card border-left-primary shadow h-100 " >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><font color="green">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-primary"><font color="green">CARROS ALIMENTADOS</font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-cart-plus fa-2x text-verde"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>



            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" onclick="traer_registro_retenido()"  >
              <div class="card border-left-primary   shadow h-100 py-2" >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold   text-uppercase mb-1"><font color="red">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-black"><font color="red">CARROS RETENIDOS</font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-plus fa-2x text-rojo"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
       <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" onclick="traer_registro_SC()"  >
              <div class="card border-left-primary   shadow h-100 py-2" >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold   text-uppercase mb-1"><font color="red">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-black"><font color="red">CARROS SIN CLASIFICAR</font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-plus fa-2x text-rojo"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
              <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" onclick="ir_pendientes_recogidas()"  >
              <div class="card border-left-primary   shadow h-100 py-2" >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold   text-uppercase mb-1"><font color="red">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-black"><font color="red">HUEVOS PENDIENTES DE RECOGIDAS</font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-plus fa-2x text-rojo"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
       
       
 <div class="col-xl-3 col-md-6 mb-4" onclick="ir_transformacion_pallet_carro()" > <!--grilla_retenidos_panel.jsp    -->
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>TRANSFORMACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>PALLETS A CARROS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-retweet fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" onclick="ir_movimiento()">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><font color="black"><b>REGISTRO DE MOVIMIENTOS</b></font></div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><font color="black"><b>LIBERADOS Y RETENIDOS</b></font></div>
                        </div>
                        <div class="col">
                         
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-adjust fa-2x text-celeste"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

           
    <div class="col-xl-3 col-md-6 mb-4  " onclick="traer_grilla_retenido() "  >
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><font color="black"><b>REGISTRO</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>CAMBIO DE DISPOSICION Y </b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>LIBERACION DE REPROCESAR</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar  fa-2x text-celeste"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
                      
  <div class="col-xl-3 col-md-6 mb-4" onclick="traer_fecha_involucrada()" >
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><font color="black"><b>REGISTRO</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>FECHAS INVOLUCRADAS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-celeste"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           
         <div class="col-xl-3 col-md-6 mb-4" onclick="traer_contendor_cambiar_pass_jsp()" >
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><font color="black"><b>USUARIO</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>CAMBIO DE CONTRASEÑA</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-user fa-2x text-amarillo"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            
           <div class="col-xl-3 col-md-6 mb-4" onclick="traer_eliminar()" >
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><font color="black"><b>ACTUALIZACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>ELIMINACION DE REGISTROS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-trash fa-2x text-amarillo"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           <div class="col-xl-3 col-md-6 mb-4" onclick="traer_informe()" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>INFORME</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>VISUALIZACION DE REGISTROS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-eye fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>


               <div class="col-xl-3 col-md-6 mb-4" onclick="ir_reportes_varios()" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES VARIOS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                  
            <div class="col-xl-3 col-md-6 mb-4" onclick="ir_transferencia_menu()"  >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>TRANSFERENCIAS</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>CARROS PTC</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-cart-plus fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                  

                                               
            <div class="col-xl-3 col-md-6 mb-4" onclick="ir_panel()" id="div_panel">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>PERFIL ADMINISTRADOR</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>PANEL DE CONTROL</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-key fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 
            
                                                
            <div class="col-xl-3 col-md-6 mb-4" onclick="ir_agregar_motivo_retencion()" id="div_panel" > <!--grilla_motivo_retencion -->
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>REGISTRO</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>AGREGAR MOTIVO DE RETENCION</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-key fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 
            
             
 <div class="col-xl-3 col-md-6 mb-4" onclick="ir_configuracion_empacadora()" > <!--grilla_retenidos_panel.jsp    -->
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>CONFIGURACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>APERTURA Y CIERRE DE EMPACADORAS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-registered fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
<%
 }
else {
 

%>
                     
                    
     <div class="col-xl-3 col-md-6 mb-4" onclick="ir_registro_reprocesos()">
              <div class="card border-left-danger shadow h-100 " >
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><font color="green">REGISTRO</font></div>
                      <div class="h5 mb-0 font-weight-bold text-primary"><font color="black"><%=titulo_reproceso%></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-cart-plus fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                    

<div class="col-xl-3 col-md-6 mb-4"   onclick="ir_reporte_generico('contenedor_reporte_reprocesados')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES DE HUEVOS REPROCESADOS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
      

<% } %>             