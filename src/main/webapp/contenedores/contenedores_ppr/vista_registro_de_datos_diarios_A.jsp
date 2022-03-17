<%-- 
    Document   : vista_registro_de_datos_diarios_A
    Created on : 21/02/2022, 13:51:26
    Author     : csanchez
--%>

<style>

    .textcolor   {
        color: #ffffff;
    }


</style>     
<head>   
<label  ><b></b></label> 
<div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xx"
     onclick="cargar_datos_modal_version('0017-REP-01032022-A','VERSION: 0017-REP-01032022-A')">
    <label neme="label_contenido" id="label_contenido">0017-REP-01032022-A</label>  
</div>
</head>
<script>
    var today = new Date();
            var dd = today.getDate(1);
            var mm = today.getMonth(1) + 1;
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("idfechad").setAttribute("max", today);

            function setInputDate(_id) {
                var _dat = document.querySelector(_id);
                var hoy = new Date(),
                        d = hoy.getDate(),
                        m = hoy.getMonth() + 1,
                        y = hoy.getFullYear(),
                        data;

                if (d < 10) {
                    d = "0" + d;
                }
                ;
                if (m < 10) {
                    m = "0" + m;
                }
                ;

                data = y + "-" + m + "-" + d;
                console.log(data);
                _dat.value = data;
            }
            ;

            setInputDate("#idfechad");

</script>
<div class="col-lg-20 ">
<div class="position-relative p-3 bg-navy"  >
<div class="ribbon-wrapper">
<div class="ribbon bg-warning">
PPR
</div>
</div>
    <center><b>REGISTRO DE DATOS DIARIOS</b></center>
</div>
   </div>  <br>
<div class="card m-4">
    
    <section class="content" id="contenido">
        <div class="text-center">
            <table id="tabla" name="tabla" class=" tablagrilla compact-cs">
                <th class="tablagrilla">
                <center>
                    <label class="tablagrilla">Fecha</label>
                </center>
                <center>
                    <input onchange="carga_grilla_registro_datos_diarios_A_ppr()" type="date" id="idfechad" step="1 name="idfechad" min="2014-10-01" class="tablagrilla form-control text-center cargar_u_r_datosdiariosA" required="">
                </center>
                </th>

            </table>
            
            <div id="tabla_datos_diarios" class=" tablagrilla input-group-append ocultar"></div>
            <div id="tabla_datos_diariosb" class=" tablagrilla input-group-append ocultar"></div>
            <div id="inputavi" class=" tablagrilla input-group-append ocultar"></div>
        </div>
        </center>
    </section>
    <!-- /.content -->
</div>
