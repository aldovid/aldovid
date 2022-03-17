/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var ruta_consultas_prin = "./consultas/";
var ruta_contenedores_prin = "./contenedores/";
var ruta_cruds_prin = "./cruds/";
$(document).ready(function () {
    gen_menu();
    no_volver_atras();
    login_exito();
    cargar_load();
    cerrar_load();
    
});


   function ir_permisos_roles()
    {
        $.ajax({
        type: "POST",
        url: ruta_contenedores_prin+"vista_permisos.jsp",
        beforeSend: function (xhr) {
            cargar_load("Cargando...");
        },
        success: function (data) 
        {      
            $("#contenedor_principal").html("");
            $("#contenedor_principal").html(data);
               
            cargar_permisos_roles();
            cerrar_load();
            
        }
      }); 
       
    }
    
    
  function cargar_permisos_roles()
    {
        $.ajax({
        type: "POST",
        url: ruta_consultas_prin+'consulta_permisos_roles.jsp',
        beforeSend: function (xhr) {
            
        },
        success: function (data) 
        {      
            $("#permisos").html("");
            $("#permisos").html(data.select);
            formato_multiselect();
             $('.dropdown-header').addClass('bg-navy');
           $('#form_add_permisos').on('submit', function (event)
            {
                event.preventDefault();
                registrar_agregar_permisos();
                event.stopPropagation();

            });
            
          
        
        }
        
      }); 
       
    }
    
    function obtener_permisos_habilitados_roles()
    {
        $.ajax({
        type: "POST",
        url: ruta_consultas_prin+'consulta_permisos_seleccionados.jsp',
        data:{id_rol: $('#roles').val()},
        beforeSend: function (xhr) {
            
        },
        success: function (data) 
        {      
            $('#permisos').selectpicker('val', '');
            $('#permisos').selectpicker('refresh');
            $('#permisos').val(data.selected.split(','));
            $('#permisos').selectpicker('refresh');
            $('.dropdown-header').addClass('bg-navy');
           /* $('#permisos').on('changed.bs.select', function(e) {
             categoryvalue = $(".getCategory option:selected").text();
             alert(categoryvalue);
           });*/
        }
      }); 
       
    }
    
    
function registrar_agregar_permisos(){
 Swal.fire({
        title: 'CONFIRMACION',
        text: "DESEA CREAR  NUEVO PERMISO?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#001F3F',
        cancelButtonColor: '#001F3F',
        confirmButtonText: 'SI, CREAR!',
        cancelButtonText: 'NO, CANCELAR!'}).then((result) =>
    {
         if (result.value)
        {
     $.ajax({
        type: "POST",
         url: ruta_cruds_prin+"crud_agregar_permisos.jsp",
        data: $("#form_add_permisos").serialize(),
        beforeSend: function (xhr) {
            cargar_load("Consultando...");
        },
        success: function (result)
        {
               cerrar_load();
            if (result.tipo_mensaje == "2") {
                        swal.fire({
                            type: 'success',
                            text: result.mensaje,
                            confirmButtonText: "CERRAR"
                        });

                          
                        
                       
                    }     if (result.tipo_mensaje == "1") {
                        swal.fire({
                            type: 'success',
                            text: result.mensaje,
                            confirmButtonText: "CERRAR"
                        });

                          
                        
                       
                    }  
          }
          
        });
       }
      });
      }

      

    
    
function aviso_error(mensaje) {
    swal.fire
            ({
                type: 'error',
                title: mensaje,
                confirmButtonText: "CERRAR"
            });

}
function aviso_existencia(nro_carro) {
    swal.fire({
        type: 'error',
        title: "CARRO NO EXISTE, " + nro_carro,
        confirmButtonText: "CERRAR"
    });
}

function aviso_duplicado()
{
    swal.fire({
        type: 'error',
        title: "CARRO DUPLICADO",
        confirmButtonText: "CERRAR"
    });
}
function aviso_registro_transfer(tipo, mensaje)
{

    if (tipo == "1")
    {
        swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"

        });
        $("#contenedor_principal").html("");
    } else
    {
        swal.fire
                ({
                    type: 'error',
                    title: mensaje,
                    confirmButtonText: "CERRAR"
                });
    }
}
function login_exito()
{

    var Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 1500
    });


    Toast.fire({
        icon: 'success',
        title: 'Sesi\u00F3n iniciada.'
    })


    /*
     Command: toastr["success"]("Sesion iniciada.")
     
     toastr.options = {
     "closeButton": true,
     "debug": false,
     "newestOnTop": false,
     "progressBar": false,
     "positionClass": "toast-bottom-left",
     "preventDuplicates": false,
     "showDuration": "300",
     "hideDuration": "1000",
     "timeOut": "5000",
     "extendedTimeOut": "1000",
     "showEasing": "swing",
     "hideEasing": "linear",
     "showMethod": "fadeIn",
     "hideMethod": "fadeOut"
     }*/
}

function gen_menu()
{
    var search=' <div class="input-group" data-widget="sidebar-search">    \n\
                <input class="form-control form-control-sidebar" type="search" placeholder="Buscar" aria-label="Search">  \n\
                <div class="input-group-append"> <button class="btn btn-sidebar">   <i class="fas fa-search fa-fw"></i>   \n\
                </button>   </div>  </div>';
    $.ajax({
        url: ruta_consultas_prin + 'consulta_generar_menu.jsp',
        type: "post",
        success: function (data) {
            $('#ul_menu').html(data.menu);
            notificacion();
            $('#div_buscador').html(search);
                
        }});
}


function li_active_menu(id) {
    $(".nav-link").removeClass("active");
    $("#" + id).addClass("active");
}

function cargar_load(texto) {

    $('body').loadingModal('animation', 'wave');
    $('body').loadingModal('backgroundColor', '#001f3f');
    $('body').loadingModal('opacity', '0.8');

    $('body').loadingModal({text: texto});
    $('body').loadingModal('show');
}
function cerrar_load() {
    $('body').loadingModal("hide");
    $('#body').loadingModal("hide");
}

function cerrar_sidebar() {
    $('#body').removeClass();
    $('#body').addClass("text-sm layout-footer-fixed layout-navbar-fixed sidebar-mini layout-fixed sidebar-closed sidebar-collapse");
}

function aviso_generico(tipo, mensaje) {

    if (tipo == 1) {
        Swal.fire({
            title: mensaje,
            type: 'success',
            confirmButtonText: "CERRAR"
        });
    } else {
        Swal.fire({
            title: "ERROR",
            html: mensaje,
            type: 'error',
            confirmButtonText: "CERRAR"
        });
    }
}


function formato_multiselect() {
    $('.selectpicker').selectpicker({selectAllText: "Seleccionar todo",
        deselectAllText: "Deseleccionar todo", noneSelectedText: "Nada seleccionado",
        noneResultsText: "No se encontraron resultados"});
}

function cargar_estilo_calendario_insert(format) {

    $('.datepicker').pickadate({
        // Escape any “rule” characters with an exclamation mark (!).
        format: format,
        formatSubmit: format,
        hiddenPrefix: 'prefix__',
        hiddenSuffix: '__suffix',
        cancel: 'Cancelar',
        clear: 'Limpiar',
        done: 'Ok',
        today: 'Hoy',
        close: 'Cerrar',
        max: true,
        monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthsShort: ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
        weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
        weekdaysShort: ['dom', 'lun', 'mar', 'mie', 'jue', 'vie', 'sab'],
    });

}

function elminar_fila() {


    $(document).on('click', '.borrar', function (event) {
        event.preventDefault();
        $(this).closest('tr').remove();
    });

}

function notificacion() {
    $.get('consultas/ptc/consulta_pendientes_retenidos.jsp', function (res) {

        $("#notificacion").append(res.fecha_vieja_retenido + " " + res.fecha_vieja);
        $("#contador_notificacion").html(res.cantidad);


    });
}

function formato_hora_input() {
    $('.inputmask').inputmask(
            "hh:mm", {
                placeholder: "hh:mm",
                insertMode: false,
                showMaskOnHover: false,
                hourFormat: "24"
            }
    );
}



function cargar_datos_modal_version(ribbon,titulo)
{
   $("#ribbon_version").html(ribbon);      
   $("#ribbon_titulo").html(titulo); 
}   