<!DOCTYPE html>
<%@include  file="chequearsesion.jsp" %>

<html lang="en">
    <head>
        <%     String usuario = (String) sesionOk.getAttribute("nombre_usuario");
           String area  = (String) sesionOk.getAttribute("clasificadora");

        %> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>YemSys</title>
        <!-- Google Font: Source Sans Pro -->
        <link href="plugins/css_net.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link href="plugins/ionicons.min.css" rel="stylesheet" type="text/css"/>
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
        <link href="plugins/lib/themes/default.css" rel="stylesheet" id="theme_base" />
        <link href="plugins/lib/themes/default.date.css" rel="stylesheet" id="theme_date" />
        <link href="https://cdn.datatables.net/v/dt/dt-1.10.16/sl-1.3.0/datatables.min.css" rel="stylesheet" type="text/css"/>
        <!-- <link href="plugins/datatables-bs4/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/> -->   
        <link href="css/estilos_pedidos.css" rel="stylesheet" type="text/css"/>
        <link href="css/colores.css" rel="stylesheet" type="text/css"/><!-- css para colocar el color azul a la celda editable al momento de ingresar en el -->
        <link href="plugins/datatables-responsive/css/responsive.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/jquery.loadingModal.css" rel="stylesheet" type="text/css"/>
        <link href="css/ppr/aldo.css" rel="stylesheet" type="text/css"/>
        <link href="css/ppr/claudio.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/toastr/toastr.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap4-toggle.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/DateTimePicker.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/jquery.loadingModal.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/jquery-ui.css" rel="stylesheet" type="text/css"/>

        <link href="plugins/jquery-ui.multidatespicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/parpadeo.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/dataTables.checkboxes.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
         
    </head>
      <input type="hidden" id="clasificadora_menu" value="<%=area%>">

      <body class="text-sm layout-footer-fixed layout-navbar-fixed sidebar-mini layout-fixed" id="body"   >


      <div class="wrapper">

            <!-- Preloader 
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="img/yemita7.png" alt="AdminLTELogo" height="60" width="60">
            </div>-->

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light ">
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
<li class="nav-item dropdown ">

    <!-- ESTO VA EN LA TABLA PADRE MODULO -->
    <a class="nav-link  " data-toggle="dropdown" href="#" aria-expanded="false">
<i class="far fa-bell "></i>
<span class="badge badge-danger navbar-badge animacion" id="contador_notificacion">0</span>
</a>
  <!--------------------------------------------------->   
  <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right " style="left: inherit; right: 0px;" id="notificacion">
    
        <span class="dropdown-item dropdown-header bg-navy">Notificaciones</span>
            
             
            
            
           
    
    </div>
    
</li>
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
                            
                        </div>



                        <div class="modal fade bd-example-modal-xl" id="modal_reporte_varios" tabindex="-1" role="dialog"   aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">

                            <div class="modal-dialog modal-xl" role="document">
                                <div class="col-lg-20 ">
                                    <div class="position-relative p-3 bg-navy"  >
                                        <div class="ribbon-wrapper ribbon-xl">
                                            <div class="ribbon bg-warning">
                                                <b>VERSIÓN. 22022022A</b>
                                            </div>
                                        </div>
                                        <center><h1>DESCRIPCI&Oacute;N DEL SISTEMA ACTUALIZADO</h1></center>
                                    </div>
                                </div>
                                <div class="modal-content">



                                    <div class="modal-body bg-navy">


                                        <p><span style="color: #ff0000;"><h1>Versi&oacute;n 22022022A</h1></span></p>
                                        <h2><a name="_Toc95923392"></a>1.1 M&oacute;dulo de transferencias</h2>
                                        <ul>
                                            <li>Transferencias de reprocesos a Lavado.</li>
                                            <li>Transferencias de huevos sin clasificar a Lavado.</li>
                                            <li>Transferencias de huevos tipo subproductos.</li>
                                        </ul>
                                        <h2><a name="_Toc95923393"></a>1.2 M&oacute;dulo de reprocesos, subproductos y rotos.</h2>
                                        <ul>
                                            <li>Aviarios involucrados.</li>
                                            <li>Horas m&aacute;s minutos.</li>
                                        </ul>
                                        <h2><a name="_Toc95923394"></a>1.3 Funcionalidades</h2>
                                        <ul>
                                            <li><strong>M&oacute;dulo de transferencias</strong>
                                                <ul>
                                                    <li style="text-align: justify;">Transferencias de reprocesos a Lavado: la creaci&oacute;n del m&oacute;dulo consiste en que lavados reciba los reprocesos de todas las clasificadoras disponibles, con el fin de realizar la alimentaci&oacute;n de estos.</li>
                                                    <li style="text-align: justify;">Transferencias de huevos sin clasificar a Lavado: la creaci&oacute;n del m&oacute;dulo consiste en que lavados reciba los huevos sin clasificar de todas las clasificadoras disponibles, con el fin de realizar la alimentaci&oacute;n de estos.</li>
                                                    <li style="text-align: justify;">Transferencias de huevos tipo subproductos: La creaci&oacute;n del m&oacute;dulo consiste en que se realicen las transferencias al sector subproductos, sin importar si el carro se encuentre o no costeado. Con el cambio se logra realizar las transferencias en el momento, actualmente el m&oacute;dulo disponible solo permite realizar transferencias de carros costeados, imposibilitando as&iacute; realizarlo en el momento.</li>
                                                </ul>
                                            </li>
                                            <li><strong>Modulo de reprocesos, subproductos y rotos</strong>
                                                <ul>
                                                    <li style="text-align: justify;">Se agregaron los minutos de inicio y finales de clasificaci&oacute;n, con esto se logra obtener los aviarios que involucraron en ese momento a la fecha de clasificaci&oacute;n.</li>
                                                    <li style="text-align: justify;">Se agregaron los Aviarios involucrados, teniendo con finalidad, obtener el origen del huevo clasificado</li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <div class="modal-footer">

                                        </div>
                                    </div>
                                </div>
                            </div>       






                        </div>
                    </div>

                </section>

                <footer class="main-footer" >
                    <strong>Copyright © 2022 - Grupo Maehara.</strong>
                    Todos los derechos reservados.
                    <div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xl">
                        <label  ><b>Version</b></label> 22022022A
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
            <script src="plugins/numeral.min.js" type="text/javascript"></script>
            <script src="plugins/chart.min.js" type="text/javascript"></script>
            <script src="plugins/selectPicker/bootstrap-select.min.js" type="text/javascript"></script>
            <script src="plugins/jquery.loadingModal.js" type="text/javascript"></script>
            <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
            <script src="plugins/lib/picker.js"></script>
            <script src="plugins/lib/picker.date.js"></script>
            <script src="plugins/lib/picker.time.js"></script>
            <script src="plugins/lib/legacy.js"></script>
            <script src="plugins/lib/main.js"></script>
            <script src="plugins/lib/rainbow.js"></script>
            <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="plugins/toastr/toastr.min.js" type="text/javascript"></script>
            <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
            <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
             <script src="plugins/bootstrap4-toggle.js" type="text/javascript"></script>
            <script src="plugins/DateTimePicker.js" type="text/javascript"></script>
            <script src="plugins/jquery-ui.multidatespicker.js" type="text/javascript"></script>
            <script src="plugins/canvasjs.min.js" type="text/javascript"></script>
            <script src="plugins/sum().js" type="text/javascript"></script>
  
            <script src="js/principal.js?v=1.0" type="text/javascript"></script>
            <script src="js/embarque.js" type="text/javascript"></script>
            <script src="js/embarque_funciones.js" type="text/javascript"></script>
            <script src="js/logistica.js" type="text/javascript"></script>
            <script src="js/logistica_funciones.js" type="text/javascript"></script>
            <script src="js/ppr/control_claudio.js" type="text/javascript"></script>
            <script src="js/ppr/llamadas_aldo.js?v=3.0" type="text/javascript"></script>
            <script src="js/ppr/llamadas_claudio.js?v=1.0" type="text/javascript"></script>
            <script src="js/ptc/enviar_datos.js?v=3.0" type="text/javascript"></script>
            <script src="js/ptc/envio_retenido_liberado.js?v=3.0" type="text/javascript"></script>
            <script src="js/ptc/traer_clases.js?v=3.0" type="text/javascript"></script>
            <script src="js/ptc/transferencia.js?v=3.0" type="text/javascript"></script>
            <script src="js/mis/formulas_mis.js?v=3.0" type="text/javascript"></script>
            <script src="js/mis/traer_clases_mis.js?v=3.0" type="text/javascript"></script>
            <script src="js/mis/transferencia_mis.js?v=3.0" type="text/javascript"></script>
            <script src="plugins/dataTables.checkboxes.min.js" type="text/javascript"></script>
            <script src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>

    </body>
</html>

