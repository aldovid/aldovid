/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var ruta_consultas_prin = "./consultas/";

$(document).ready(function () {
    gen_menu();
    no_volver_atras();
    login_exito();
    cargar_load();
    cerrar_load();
});
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
    $.ajax({
        url: ruta_consultas_prin + 'consulta_generar_menu.jsp',
        type: "post",
        success: function (data) {
            $('#ul_menu').html(data.menu);
            notificacion();

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