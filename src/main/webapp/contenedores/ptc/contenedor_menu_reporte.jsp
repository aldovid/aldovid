<%-- 
    Document   : contenedor_menu_reporte
    Created on : 29/05/2020, 09:25:47 AM
    Author     : hvelazquez
--%>

     <div class="col-xl-3 col-md-6 mb-4" onclick="traer_reporte_lotes()" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES PTC</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
       

            
           <div class="col-xl-3 col-md-6 mb-4" onclick="traer_reporte_mixtos_historial()" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES MIXTOS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>   
            
  <div class="col-xl-3 col-md-6 mb-4" onclick="ir_reporte_generico('contenedor_reporte_carros_mixtos')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES MIXTOS DISPONIBLES</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 
            
            
                      
  <div class="col-xl-3 col-md-6 mb-4" onclick="ir_reporte_generico('contenedor_reporte_clasificados')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES STOCK DE HUEVOS CLASIFICADOS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 
            
            
                      
  <div class="col-xl-3 col-md-6 mb-4" onclick="traer_reporte_ptc_excel()" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES PTC EN EXCEL</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-table fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            



<div class="col-xl-3 col-md-6 mb-4" data-toggle="modal"  onclick="ir_reporte_generico('contenedor_reporte_transferencia')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES DE TRANSFERENCIAS REALIZADAS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>


 
<div class="col-xl-3 col-md-6 mb-4" data-toggle="modal"  onclick="ir_reporte_generico('contenedor_informe_huevo_recibido')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES DE HUEVOS RECIBIDOS</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>



<div class="col-xl-3 col-md-6 mb-4"   onclick="ir_reporte_generico('contenedor_reporte_huevos_sc')" >
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><font color="black"><b>GENERACION</b></font></div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><font color="black"><b>REPORTES DE HUEVOS SIN CLASIFICAR</b></font></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-black"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>



