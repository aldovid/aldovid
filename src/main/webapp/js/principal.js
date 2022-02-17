/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
var ruta_consultas_prin = "./consultas/";
 
 $(document).ready(function () {
    gen_menu();
    no_volver_atras();
});



 function gen_menu() 
    {
        $.ajax({
            url: ruta_consultas_prin + 'consulta_generar_menu.jsp',
            type: "post",
            success: function (data) {
                $('#ul_menu').html(data.menu);
             }});
    }
    
    
    function li_active_menu(id){
    $(".nav-link").removeClass("active");
    $("#"+id).addClass("active");
}

function cargar_load(texto){
     $('body').loadingModal("show");
    $('body').loadingModal({text: texto});
}
function cerrar_load(){
    $('body').loadingModal("hide");
}



function aviso_generico(tipo,mensaje) {
    
    if(tipo==1){
        Swal.fire({
        title: mensaje,
        type: 'success',
        confirmButtonText: "CERRAR"
    });   
    }
     else {
        Swal.fire({
        title: "ERROR",
        html: mensaje,
        type: 'error',
        confirmButtonText: "CERRAR"
        });     
     }
    }