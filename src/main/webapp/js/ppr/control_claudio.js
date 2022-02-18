var ruta_consultas_ppr = "./consultas/ppr/";
var ruta_vistas_ppr = "./contenedores/contenedores_ppr/";
function grafico_detalles()
{
    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_chart_rango_fecha.jsp',
        data: {
            fechad: $('#idfechadesde').val(),
            fechah: $('#idfechahasta').val(),
            aviario1: $('#avi').val()
        },
        beforeSend: function (xhr) {
            cargar_load("Consultando...");
        },
        success: function (data)
        {
            var c = 0;
            $.each(data.chartsdet, function (i, item)
            {
                var a = '  <div class="card card-navy">   ';
                a += '  <div class="card-header"> ';
                a += '   <h3 class="card-title">Resumen Detalles - ' + data.chartsdet[c].options.plugins.title.text + '</h3> ';
                a += '    <div class="card-tools"> ';
                a += '    <button type="button" class="btn btn-tool" data-card-widget="collapse"> ';
                a += '     <i class="fas fa-minus"></i> ';
                a += '    </button> ';
                a += '   <button type="button" class="btn btn-tool" data-card-widget="remove"> ';
                a += '     <i class="fas fa-times"></i> ';
                a += '  </button> ';
                a += '  </div> ';
                a += '    </div> ';
                a += ' <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div> ';
                a += '   <canvas id="' + data.chartsdet[c].options.plugins.title.text + '"></canvas>';
                a += '  </div> ';

                $("#divR").append(a);

                var resChart = new Chart(document.getElementById(data.chartsdet[c].options.plugins.title.text), data.chartsdet[c]);
                c++;
            });
            cerrar_load();
        }
    });
}
function llamar_grafico_detalles()
{
    $.ajax({
        url: ruta_vistas_ppr + "vista_informe_detalle.jsp",
        type: "post",
        success: function (data) {
            $('#idresumen_det').html("");
            $('#idresumen_huevos').html(data);
            $('#contenido_row').html("");
            grafico_detalles();
        }});
}

function grafico_detalles_fi(name2)
{
    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_chart_fila.jsp',
        data: {
            fechadf: $('#idfechadesde').val(),
            fechahf: $('#idfechahasta').val(),
            aviariof: $('#avi').val(),
            filaf: name2
        },
        beforeSend: function (xhr) {
            cargar_load("Consultando...");
        },
        success: function (data)
        {
            var c = 0;
            $.each(data.chartsdetfila, function (i, item)
            {
                var a = '  <div class="card card-navy">   ';
                a += '  <div class="card-header"> ';
                a += '   <h3 class="card-title">Detalle de Fila: ' + data.chartsdetfila[c].options.plugins.title.text + '</h3> ';
                a += '    <div class="card-tools"> ';
                a += '    <button type="button" class="btn btn-tool" data-card-widget="collapse"> ';
                a += '     <i class="fas fa-minus"></i> ';
                a += '    </button> ';
                a += '   <button type="button" class="btn btn-tool" data-card-widget="remove"> ';
                a += '     <i class="fas fa-times"></i> ';
                a += '  </button> ';
                a += '  </div> ';
                a += '    </div> ';
                a += ' <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class="col-12 col-md-10"></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div> ';
                a += '   <canvas id="' + data.chartsdetfila[c].options.plugins.title.text + '"></canvas>';
                a += '  </div> ';

                $("#divF").append(a);

                var resChart = new Chart(document.getElementById(data.chartsdetfila[c].options.plugins.title.text), data.chartsdetfila[c]);
                c++;
            });

            cerrar_load();
        }
    });
}
function llamar_grafico_detalles_fi(name2)
{
    $.ajax({
        url: ruta_vistas_ppr + 'vista_grafico_fila.jsp',
        type: "post",
        success: function (data) {
            $('#idresumen_huevos').html("");
            $('#idresumen_det').html(data);
            $('#contenido_row').html("");
            grafico_detalles_fi(name2);
        }});
}
function traer_vista_contador_huevo() {

    $.ajax({
        url: "grillas/grilla_registro_de_datos_diarios.jsp",
        type: "post",
        success: function (data) {

            $('#contenedor_principal').html(data);
            $('#contenido_row').html("");

        }});
}
 
 
function llamar_mortandad_lotes()

{
    $.ajax({
        url: ruta_vistas_ppr + 'vista_mortandad_lotes.jsp',
        type: "post",
        success: function (data) {
            $('#contenedor_principal').html(data);
            $('#contenido_row').html("");
            ocultar();
        }});
}

function lote_mortandad() {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_mortandad_lotes.jsp',
        beforeSend: function (xhr) {
            limpiarg(), cargar_load("Consultando...");
        },
        data: {
            meslote: $('#meslote').val(),
            anolote: $('#anolote').val()
        },

        success: function (data) {
            $('#tabla_mortandad_lotes').html(data.grillalote);
            $('#idresumen_det').html("");
            $('#idresumen_huevos').html("");
            $('#contenido_row').html("");
            cerrar_load();
            if (!Object.keys(data.edad_dias).length) {
                $(".ocultar").hide();
                Swal.fire({
                    title: 'ATENCION!',
                    text: "No Existen Registros",
                    type: 'warning',
                    showCancelButton: false,
                    confirmButtonColor: '#001F3F',
                    confirmButtonText: 'Aceptar',
                    timer: 4000});
            } else {
                $(".ocultar").show();
            }
        }
    });

}

function ExportToExcel(htmlExport) {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    //otro navegador no probado en IE 11
    // Si Internet Explorer
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))
    {
        jQuery('body').append(" <iframe id=\"iframeExport\" style=\"display:none\"></iframe>");
        iframeExport.document.open("txt/html", "replace");
        iframeExport.document.write(htmlExport);
        iframeExport.document.close();
        iframeExport.focus();
        sa = iframeExport.document.execCommand("SaveAs", true, 'mortandad_lotes' + '-' + $('#meslote').val() + '-' + $('#anolote').val() + ".xls");
    } else {
        var link = document.createElement('a');

        document.body.appendChild(link); // Firefox requiere que el enlace esté en el cuerpo
        link.download = ("SaveAs", true, 'mortandad_lotes' + '-' + $('#meslote').val() + '-' + $('#anolote').val() + ".xls");
        link.href = 'data:application/vnd.ms-excel,' + escape(htmlExport);
        link.click();
        document.body.removeChild(link);
    }
}
function ExportToExceldatos_con(htmlExport) {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    //otro navegador no probado en IE 11
    // Si Internet Explorer
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))
    {
        jQuery('body').append(" <iframe id=\"iframeExport\" style=\"display:none\"></iframe>");
        iframeExport.document.open("txt/html", "replace");
        iframeExport.document.write(htmlExport);
        iframeExport.document.close();
        iframeExport.focus();
        sa = iframeExport.document.execCommand("SaveAs", true, 'datos_contadores_huevos' + '-' + $('#meslotec').val() + '-' + $('#anolotec').val() + '-' + $('#avic').val() + ".xls");
    } else {
        var link = document.createElement('a');

        document.body.appendChild(link); // Firefox requiere que el enlace esté en el cuerpo
        link.download = ("SaveAs", true, 'datos_contadores_huevos' + '-' + $('#meslotec').val() + '-' + $('#anolotec').val() + '-' + $('#avic').val() + ".xls");
        link.href = 'data:application/vnd.ms-excel,' + escape(htmlExport);
        link.click();
        document.body.removeChild(link);
    }
}

function llamar_datos_contadores()
{
    $.ajax({
        url: ruta_vistas_ppr + 'vista_datos_contadores.jsp',
        type: "post",
        success: function (data) {
            $('#contenedor_principal').html(data);
            $('#contenido_row').html("");
            ocultar();
        }});
}

function datos_contadores() {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_datos_contadores_huevos.jsp',
        beforeSend: function (xhr) {
            limpiarg(), cargar_load("Consultando...");
        },
        data: {
            mescon: $('#meslotec').val(),
            anocon: $('#anolotec').val(),
            avicon: $('#avic').val()
        },

        success: function (data) {
            var number = data.saldo_dias;
            $('#tabla_dato_c').html(data.grilladato);
            $('#idresumen_det').html("");
            $('#idresumen_huevos').html("");
            $('#contenido_row').html("");
            cerrar_load();

            if (!Object.keys(data.edad).length) {
                $(".ocultar").hide();
                Swal.fire({
                    title: 'ATENCION!',
                    text: 'No Existen Registros en:' + ' ' + $('#meslotec').val() + ' / ' + $('#anolotec').val() + ' ' + '; Aviario:' + ' ' + $('#avic').val(),
                    type: 'warning',
                    showCancelButton: false,
                    confirmButtonColor: '#001F3F',
                    confirmButtonText: 'Aceptar',
                    timer: 6000});
            } else {
                $(".ocultar").show();
            }
        }
    });

}
function contador_h(cant)
{
    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_cargar_grilla_aviarios.jsp',
        data: {
            fecha1: $('#idfechadesde').val(),
            fecha2: $('#idfechahasta').val(),
            aviario: $('#avi').val()
        },
        beforeSend: function (xhr) {
            limpiarg(), cargar_load("Consultando...");
        },
        success: function (data) {
            var total_huevos = 0;
            var promedio = 0;
            var canti = 48;
            var cantidad = 0;
            $.each(data.filas, function (i, item)
            {
                //cantidad=$(item.id).html(decimal);
                const decimal = numeral(item.cantidad).format('0,0');
                $(item.id).html(decimal);
                $(item.id).css("background-color", item.color);
                //$(item.id).css("background-color",item.minimo1); 
                //$(item.id).addClass(item.color);
                //document.getElementById(item.id_sin).style.backgroundColor = 'red';  
                total_huevos = parseInt(total_huevos) + parseInt(item.cantidad);
                promedio = total_huevos / canti;
                cantidad = decimal;
            }

            );

            $("#huevos").val(numeral(total_huevos).format('0,0'));
            $("#promedio").val(numeral(Math.round(promedio)).format('0,0'));
            colorestext();
            if (cantidad === 0) {
                $(".ocultar").hide();
                Swal.fire({
                    title: 'ATENCION!',
                    text: "No Existen Registros",
                    type: 'warning',
                    showCancelButton: false,
                    confirmButtonColor: '#001F3F',
                    confirmButtonText: 'Aceptar',
                    timer: 4000})
            } else {
                $(".ocultar").show();
            }
            cerrar_load();
        }

    });
}

function resumen_h(name) {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'generar_grilla_resumen_det_huevos.jsp',
        beforeSend: function (xhr) {
            cargar_load("Consultando...");
        },
        data: {
            fecha1: $('#idfechadesde').val(),
            fecha2: $('#idfechahasta').val(),
            aviario: $('#avi').val(),
            fila1: name
        },

        success: function (data) {

            var grilla;
            grilla = (data.grillas);

            $('#idresumen_huevos').html(grilla);
            $('#contenido_row').html("");
            cerrar_load();
        }
    });
}

function limpiarg()
{

    $(".cero").html("0");
    $(".cero").css("background-color", "#828282");
    $("#promedio").css("background-color", "#828282");
    $("#maximo").css("background-color", "#828282");
    $("#minimo2").css("background-color", "#828282");
    $("#huevos").css("background-color", "#828282");
}
function limpiarm()
{

    $(".cerom").html("");
}
function colorestext()
{

    $("#promedio").css("background-color", "#007d3c");
    $("#promedio").css("color", "#ffffff");
    $("#maximo").css("background-color", "#007dff");
    $("#maximo").css("color", "#ffffff");
    $("#minimo2").css("background-color", "#ff0000");
    $("#minimo2").css("color", "#ffffff");
    $("#huevos").css("background-color", "#001f3f");
    $("#huevos").css("color", "#ffffff");
}

function max_min(cant) {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_max.jsp',
        data: {
            fecha1: $('#idfechadesde').val(),
            fecha2: $('#idfechahasta').val(),
            aviario: $('#avi').val()
        },
        success: function (data) {

            var max = 0;
            var min = 0;
            $.each(data.filas13, function (i, item)
            {

                max = item.maximo;
                min = item.minimo;

            }
            );

            $("#maximo").val(numeral(max).format('0,0'));
            $("#minimo2").val(numeral(min).format('0,0'));
        }

    });
}
function max_min_inicio(cant) {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_max_min.jsp',

        success: function (data) {

            var max = 0;
            var min = 0;
            $.each(data.filas14, function (i, item)
            {

                max = item.maximo;
                min = item.minimo;

            }
            );

            $("#maximo").val(numeral(max).format('0,0'));
            $("#minimo2").val(numeral(min).format('0,0'));
        }

    });
}

function confirmacion()
{

    $(".cero").html("0");
    $(".cero").css("background-color", "#828282");
    $("#promedio").css("background-color", "#828282");
    $("#maximo").css("background-color", "#828282");
    $("#minimo2").css("background-color", "#828282");
    $("#huevos").css("background-color", "#828282");
}
function contador_u_registro(cant) {

    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr+"consulta_carga_grilla_aviarios_ultimo_registro.jsp",
        beforeSend: function (xhr) {
            limpiarg();
        },
        success: function (data) {

            $.each(data.filass, function (i, item)
            {
                const decimal = numeral(item.cantidad).format('0,0');
                $(item.id).html(decimal);
                //$(item.id).css("background-color",item.color); 
                $("#idfechadesde").val(item.fecha);
                $("#idfechahasta").val(item.fecha);
                $("#avi").val(item.aviario);
            }
            );
            llamar_ultimo_registro();
        }
    });
}
function ocultar()
{
    $(".ocultar").hide();
}
function mostrar()
{
    $(".ocultar").show();
}

function llamar_ultimo_registro() {
    $(document).ready(function () {
        $(".cargar").click();
    });
}
function contador_m() {
    $.ajax({
        type: "POST",
        url: ruta_consultas_ppr + 'consulta_datos_mortandad.jsp',
        data: {
            fecha: $('#idfecha_m').val(),
            aviario: $('#avi_m').val()
        },
        success: function (data) {
            $.each(data.filas, function (i, item)
            {
                $(item.id).html(item.cantidad);
            }
            );

        }

    });
}
function limpiar(data) {
    $.each(data.filas, function (i, item)
    {
        $(item.id).html("");
    }
    );
}