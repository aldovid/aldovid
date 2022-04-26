<%-- 
    Document   : grilla_registro_diario_aviarios_mecanizados
    Created on : 27/01/2022, 10:15:33
    Author     : csanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
<label  ><b></b></label> 
<div class="float-right d-none d-sm-inline-block" href="#" data-toggle="modal" data-target=".bd-example-modal-xx"
     onclick="cargar_datos_modal_version('0002-REP-01032022-A','VERSION: 0002-REP-01032022-A')">
    <label neme="label_contenido" id="label_contenido">0002-PAN-01032022-A</label>  
</div>

    </head>
    <body>   

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
            document.getElementById("idfecham").setAttribute("max", today);

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

            setInputDate("#idfecham");

        </script>



        <div class="card m-4">
            <input type="hidden" value="2" id="udepartamento" name="udepartamento">
            <section class="content" id="contenido">
                <div class="text-center">

                    <br>
                    <div class="bg-navy">
                        <input type="hidden" id="lote" name="lote">
                        <input type="hidden" id="avi" name="avi">
                        <h5 class="text-center">Registro Diario - Aviarios Mecanizados</h5>
                        <table id="tabla" name="tabla" class=" tablagrilla compact-cs">
                            
                            <th class="tablagrilla">
                            <center>
                                <select onchange="contador_mortandad_ppr()" style="width:117px;" id="avis" name="avi" class=" tablagrilla form-control cargar2">
                                    <option value="A2">A2 - 721+722</option>
                                    <option value="A3">A3 - 729+730</option>
                                    <option value="A4">A4 - 689+690</option>
                                    <option value="A5">A5 - 731+732</option>
                                    <option value="A6">A6 - 707+708</option>
                                    <option value="A7">A7 - 695+696</option>
                                    <option value="A8">A8 - 705+706</option>
                                    <option value="A9">A9 - 693+694</option>
                                    <option value="A10">A10 - 725+726</option>
                                    <option value="A11">A11 - 715+716</option>
                                    <option value="A12">A12 - 727+728</option>
                                    <option value="B2">B2 - 723+724</option>
                                    <option value="B3">B3 - 717+718</option>
                                    <option value="B4">B4 - 713+714</option>
                                    <option value="B5">B5 - 703+704</option>
                                    <option value="B6">B6 - 709+710</option>
                                    <option value="B7">B7 - 691+692</option>
                                    <option value="B8">B8 - 697+698</option>
                                    <option value="B10">B10 - 711+712</option>
                                    <option value="B11">B11 - 719+720</option>
                                    <option value="H3">H3 - 687+688</option>
                                    <option value="H3B">H3B - 691+692</option>
                                    <option value="H1">H1 - 701+702</option>
                                    <option value="H2">H2 - 699+700</option>
                                </select>
                            </center></th>
                            <th class="tablagrilla">
                            <center>
                                <input onchange="contador_mortandad_ppr()" type="date" id="idfecham" step="1 name="fechadesde" min="2014-10-01" class="tablagrilla form-control text-center cargar2" required="">
                            </center>
                            </th>
                            <th class="tablagrilla">
                            <center>
                                <div class="input-group-append">
                                    <button type="button" id="volver" name="volver" onclick="traer_vista_contador_huevo2_ppr();" class="btn-volver float-right bg-gradient-gray text-center" >Volver</button>
                                </div>
                            </center>
                            </th>
                        </table>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-7">
                                <div>
                                    <input type="hidden" value="287" id="lote" name="lote">
                                    <input type="hidden" value="A2" id="avis" name="avi">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla" colspan="29" class="text-center">Detalle de Mortandad</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tablagrilla">
                    <tr class="tablagrilla">
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" colspan="4" class="text-center">Columna 1</td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" colspan="4" class="text-center">Columna 2</td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" colspan="4" class="text-center">Columna 3</td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                        <td class="tablagrilla" colspan="4" class="text-center">Columna 4</td>
                        <td class="tablagrilla" rowspan="7" style="width:40px;background-color:#666;"></td>
                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">116</td>
                        <td contenteditable="true" id="celda116" class="tablagrilla text-right textcolor2 cerom"></td>
                        <td contenteditable="true" id="celda126" class="tablagrilla text-right textcolor2 cerom"></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">126</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">216</td>
                        <td contenteditable="true" id="celda216" class="tablagrilla text-right textcolor2 cerom"  ></td>
                        <td contenteditable="true" id="celda226" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">226</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">316</td>
                        <td contenteditable="true" id="celda316" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda326" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">326</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">416</td>
                        <td contenteditable="true" id="celda416" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda426" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">426</td>

                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">115</td>
                        <td contenteditable="true" id="celda115" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda125" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">125</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">215</td>
                        <td contenteditable="true" id="celda215" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda225" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">225</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">315</td>
                        <td contenteditable="true" id="celda315" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda325" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">325</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">415</td>
                        <td contenteditable="true" id="celda415" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda425" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">425</td>

                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">114</td>
                        <td contenteditable="true" id="celda114" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda124" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">124</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">214</td>
                        <td contenteditable="true" id="celda214" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda224" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">224</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">314</td>
                        <td contenteditable="true" id="celda314" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda324" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">324</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">414</td>
                        <td contenteditable="true" id="celda414" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda424" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">424</td>

                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">113</td>
                        <td contenteditable="true" id="celda113" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda123" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">123</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">213</td>
                        <td contenteditable="true" id="celda213" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda223" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">223</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">313</td>
                        <td contenteditable="true" id="celda313" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda323" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">323</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">413</td>
                        <td contenteditable="true" id="celda413" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda423" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">423</td>

                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">112</td>
                        <td contenteditable="true" id="celda112" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda122" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">122</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">212</td>
                        <td contenteditable="true" id="celda212" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda222" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">222</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">312</td>
                        <td contenteditable="true" id="celda312" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda322" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">322</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">412</td>
                        <td contenteditable="true" id="celda412" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda422" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">422</td>

                    </tr>
                    <tr class="tablagrilla">
                        <td class="tablagrilla text-center cursor-pointer btn-link">111</td>
                        <td contenteditable="true" id="celda111" contenteditable="true" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda121" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">121</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">211</td>
                        <td contenteditable="true" id="celda211" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda221" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">221</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link">311</td>
                        <td contenteditable="true" id="celda311" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda321" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">321</td>

                        <td class="tablagrilla text-center cursor-pointer btn-link" (411)">411</td>
                        <td contenteditable="true" id="celda411" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td contenteditable="true" id="celda421" class="tablagrilla text-right textcolor2 cerom" ></td>
                        <td class="tablagrilla text-center cursor-pointer btn-link">421</td>
                           
                    </tr>
                </tbody>
                                        <tfoot>
                                            <tr class="tablagrilla">
                                                <th colspan="29">Mortandad Total: <span id="total-morfilas"><input type="text" class=" form-control-sm cerom tablagrilla textcolor2" contenteditable="false" id="total-morfilas2"></span></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class="col-12 col-md-5">
                                <table class="tablagrilla table table-bordered table-striped compact">
                                    <thead>
                                        <tr>
                                            <th colspan="21" class="tablagrilla text-center bg-navy"><h5>RESUMEN</h5></th>
                                        </tr>
                                    </thead>
                                </table>
                                <table class="tablagrilla table table-bordered table-striped compact">
                                    <thead>
                                    <div class="row mt-4">
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Edad</label>
                                                <input type="text" id="dl_edad" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Saldo ant.</label>
                                                <input type="text" id="dl_saldoant" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">% mortandad</label>
                                                <input type="text" id="dl_mortpor" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Saldo</label>
                                                <input type="text" id="dl_saldo" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Productiv. (%)</label>
                                                <input type="text" id="prodpor" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Kg. Balanceados</label>
                                                <input type="text" id="kg_bal" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Bal. gr/ave</label>
                                                <input type="text" id="ave_bal" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Cons. agua Total</label>
                                                <input type="text" id="cons_agua" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Cons. agua/ave</label>
                                                <input type="text" id="cons_agua_t" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>    

                                    </div>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-12 col-md-4">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21">Tipos de Mortandad</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <div class="row mt-3">                    
                                        <div class="col-12 col-md-2">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Normal</label>
                                                <input type="number" id="dl_muertos_normal" name="dl_muertos_normal" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-2">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Prolapsos</label>
                                                <input type="number" id="dl_muertos_prolapso" name="dl_muertos_prolapso" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-2">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Livianos</label>
                                                <input type="number" id="dl_muertos_livianos" name="dl_muertos_livianos" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Total muertos</label>
                                                <input type="number" id="total-muertos" name="total-muertos" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">No Clasif.</label>
                                                <input type="number" id="mornoclas" name="mornoclas" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21">Consumo de Balanceados</th>
                                            </tr>
                                        </thead>
                                    </table>  
                                    <div class="row mt-3">
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Silo 1</label>
                                                <input type="number" id="dl_balkg1" name="dl_balkg1" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Silo 2</label>
                                                <input type="number" id="dl_balkg2" name="dl_balkg2" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-5">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Total Balanceados</label>
                                                <input type="text" id="baltotal" name="baltotal" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Calcico</label>
                                                <input type="number" id="dl_calcico" name="dl_calcico" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21" >Registros de Caudalimetros (agua)</th>
                                            </tr>
                                        </thead>
                                    </table>  
                                    <div class="row mt-3">
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Caudal. mañana</label>
                                                <input type="number" id="dl_caudal" name="dl_caudal" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Caudal. tarde</label>
                                                <input type="number" id="dl_caudal2" name="dl_caudal2" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-5">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Lectura Anterior (mañana)</label>
                                                <input type="text" id="dia_ant" name="dia_ant" class="form-control form-control-sm text-center" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21">Registro de Temperatura interior</th>
                                            </tr>
                                        </thead>
                                    </table>  
                                    <div class="row mt-3">
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Temp. mín.</label>
                                                <input type="number" id="dl_tempm2" name="dl_tempm2" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Temp. máx.</label>
                                                <input type="number" id="dl_tempm1" name="dl_tempm1" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>                            
                                    </div>
                                </div>
                                <div class="col-12 col-md-2">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21" >Producción de Huevos</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <div class="row mt-3">
                                        <div class="col-12 col-md-8">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Cant. Huevos</label>
                                                <input type="number" id="dl_huevos" name="dl_huevos" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>                    
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th class="bg-navy tablagrilla text-center" colspan="21">Transferencias / Ajustes / Ventas</th>
                                            </tr>
                                        </thead>
                                    </table>  
                                    <div class="row mt-3">
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Transf. Ingreso</label>
                                                <input type="number" id="dl_transferin" name="dl_transferin" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Transf. Salida</label>
                                                <input type="number" id="dl_transferout" name="dl_transferout" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div> 
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Ajuste</label>
                                                <input type="number" id="dl_ajuste" name="dl_ajuste" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>     
                                        <div class="col-12 col-md-3">
                                            <div class="form-group">
                                                <label class="form-control-placeholder">Venta</label>
                                                <input type="number" id="dl_venta" name="dl_venta" class="form-control form-control-sm text-center avi-input">
                                            </div>
                                        </div>                                
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <table class="tablagrilla table table-bordered table-striped compact">
                                        <thead>
                                            <tr>
                                                <th colspan="21" class="tablagrilla bg-navy text-center">Anotaciones</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea id="dl_anota" name="dl_anota" class="avi-input form-control form-control-sm avi-input" rows="3"></textarea>
                                            </div>
                                        </div>                                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </center>
            </section>
            <!-- /.content -->
        </div>
    </body>
</html>
