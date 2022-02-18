<!DOCTYPE html>
<%@include  file="chequearsesion.jsp" %>

<html lang="en">
    <head>
        <%     String usuario = (String) sesionOk.getAttribute("nombre_usuario");

        %> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>YemSys</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">

        <link href="plugins/selectPicker/bootstrap-select.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
        <link href="css/colores.css" rel="stylesheet" type="text/css"/><!-- css para colocar el color azul a la celda editable al momento de ingresar en el -->


        <link href="plugins/lib/themes/default.css" rel="stylesheet" id="theme_base" />
        <link href="plugins/lib/themes/default.date.css" rel="stylesheet" id="theme_date" />
        <link href="css/estilos_pedidos.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables-bs4/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables-responsive/css/responsive.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/jquery.loadingModal.css" rel="stylesheet" type="text/css"/>
        <link href="css/ppr/aldo.css" rel="stylesheet" type="text/css"/>
        <link href="css/ppr/claudio.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/toastr/toastr.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <body class="sidebar-mini layout-fixed control-sidebar-slide-closed text-sm" id="body"  >
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="img/yemita7.png" alt="AdminLTELogo" height="60" width="60">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <div class="pull-left main-header-temp-info" id="div_temp">

                        </div>


                    </li>

                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->


                    <!-- Messages Dropdown Menu -->

                    <!-- Notifications Dropdown Menu -->

                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
                            <i class="fas fa-th-large"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar elevation-4 sidebar-light-navy">
                <!-- Brand Logo -->

                <a href="javascript:home();" class="brand-link">
                    <img src="img/yemita7.png" alt="SGP" class="brand-image img-circle elevation-2">
                    <span class="brand-text">YemSys</span>
                </a>
                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">


                        </div>

                        <div class="info">
                            <a href="#" class="d-block"><%=usuario%></a>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Buscar" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>


                    <nav class="mt-2">
                        <ul id="ul_menu" class="nav nav-pills nav-sidebar flex-column nav-compact nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- AQUI VA EL MENU GENERADO -->

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
            </aside> 

            <div class="content-wrapper" style="min-height: 845px;">
                <section class="content">
                    <div class="container-fluid">

                        <div    id="contenido_row" class="row">

                        </div>
                        <div id="contenedor_principal" class="global">
              
  
                            
                            
                            
                            
                            
    <li class="nav-item">
      <a href="javascript:ir_pendientes_recogidas();li_active_menu('sub_inf_ptc_pendienteReco');"    
         class="nav-link"id="sub_inf_ptc_pendienteReco"   >
    <i class="fas fa-plus nav-icon text-navy "></i>
    <p>Huevos pendientes recogidas</p>
    </a>
        </li>



    <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
            <li class="nav-item">
      <a href="javascript:ir_reporte_generico('contenedor_reporte_huevos_sc');li_active_menu('sub_inf_ptc_rep_SC');"    
         class="nav-link"id="sub_inf_ptc_rep_SC"   >
    <i class="fas fa-file nav-icon text-navy "></i>
    <p>Huevos sin clasificar</p>
    </a>
        </li>

        
        












          </div>



                    </div>
            </div>

        </section>

        <footer class="main-footer" >
            <strong>Copyright © 2022 - Grupo Maehara.</strong>
            Todos los derechos reservados.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 14022022A
            </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-light" style="top: 46.5938px;">
            <!-- Control sidebar content goes here -->
            <div class="row">
                <div class="pt-5 pl-2 pr-2 col-12">

                </div>
                <div class="pl-2 pr-2 col-12">
                    <div class="form-group">
                        <button class="mx-auto btn bg-dark" style="width:100%;" onclick="document.location = 'cruds/control_cerrar_sesion.jsp';"><i class="fa fa-fw fa-power-off"></i> Salir</button>
                    </div>
                </div>


            </div>
        </aside>

        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/sparklines/sparkline.js"></script>
    <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>

    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
    <script src="plugins/selectPicker/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="plugins/jquery.loadingModal.js" type="text/javascript"></script>

    <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>

    <script src="js/embarque.js" type="text/javascript"></script>
    <script src="js/embarque_funciones.js" type="text/javascript"></script>
    <script src="js/principal.js" type="text/javascript"></script>
    <script src="plugins/lib/picker.js"></script>
    <script src="plugins/lib/picker.date.js"></script>
    <script src="plugins/lib/picker.time.js"></script>
    <script src="plugins/lib/legacy.js"></script>
    <script src="plugins/lib/main.js"></script>
    <script src="plugins/lib/rainbow.js"></script>
    <script src="js/logistica.js" type="text/javascript"></script>
    <script src="js/logistica_funciones.js" type="text/javascript"></script>
    <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
    <script src="js/ppr/control_claudio.js" type="text/javascript"></script>
    <script src="js/ppr/llamadas_aldo.js" type="text/javascript"></script>
    <script src="js/ppr/llamadas_claudio.js?v=1.0" type="text/javascript"></script>
    <script src="plugins/toastr/toastr.min.js" type="text/javascript"></script>
</body>
</html>

