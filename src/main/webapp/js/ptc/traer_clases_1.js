  var ruta_contenedores_ptc="./contenedores/ptc/";
  var ruta_controles_ptc="./cruds/ptc/";
  var ruta_grillas_ptc="./grillas/ptc/";
  var ruta_consultas_ptc="./consultas/ptc/";
 
    function comprobar_clasificadora(){
    var clasificadora=$('#clasificadora_menu').val();
    
        if (clasificadora=="O"||clasificadora=="C")
        {
           // $("#liberado_por").prop('required', 'required');
            $('#div_aviarios').hide();
            $('#cbox_aviarios').removeAttr('required');
        }

    }
  
    function ir_transferencia_menu() {
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_transferencia.jsp',
             beforeSend: function() 
             {
                cargar_load();     
                $("#contenedor_principal").html('');
            },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                cerrar_load();     
            }
            });  
        }      
        
    function ir_transferencia(pagina) {
            $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc+pagina+'.jsp',
                beforeSend: function() 
                {
                    cargar_load();     
                    $("#contenedor_principal").html('');
                },           
                success: function (res) 
                {

                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $.get(ruta_consultas_ptc+'consulta_fecha.jsp',function(data){ $("#fecha").val(data.fecha);});
                $("#contenedor_principal").show();
                cerrar_load();  
                cargar_estilo_calendario_insert("dd/mm/yyyy");

                //$('#grilla_transfer').dataTable(); 
                }
            });  
        
         
        }       
        
     
                                 
    function ir_agregar_motivo_retencion(){
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_motivo_retencion.jsp',
             beforeSend: function() {
            cargar_load();     
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            cargar_estilo_calendario_insert("dd/mm/yyyy");
            inicializar_unidad_medida_PTC();
                $('#grilla_lotes_liberacion').DataTable( {
                    "scrollX": true,
                    "pageLength": 100, 
                    "language": {
                    "sUrl": "js/Spanish.txt"
        }
                    } );
                cerrar_load();     

                           }
                });      
                        }   

    function ir_modificacion_lotes_ptc()
    {
            $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_reemplazo_motivos.jsp',
                beforeSend: function() 
                {
                    cargar_load();      
                    $("#contenedor_principal").html('');
                },           
                success: function (res) 
                {
                    $('#div_cargar_menu').hide();
                    $("#contenedor_principal").html(res);
                    $("#contenedor_principal").show();
                    ir_grilla_retenidos_panel();
                    cerrar_load();     
                }
            });   
          
    }
                                             
    function ir_reporte_historico_lotes_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_reporte_retenidos_historico.jsp',
             beforeSend: function() {
            cargar_load();     
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cargar_estilo_calendario_insert("dd/mm/yyyy");
                cerrar_load();     


                                }
                });   
          
                                             }     
                                             
    function ir_configuracion_empacadora(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_empacadora.jsp',
             beforeSend: function() {
                cargar_load(); 
                
               
                
                
                
                
                $("#contenedor_principal").html('');
                                    },           
            success: function (res) {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                ir_grilla_empacadoras();
                cerrar_load();     
                                    }
                                        });   
                                            }
 
    function ir_cambio_fp_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_cambio_fp.jsp',
             beforeSend: function() {
               cargar_load();  
                
               
                
                
                
                
                $("#contenedor_principal").html('');
                                    },           
            success: function (res) {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
              cargar_estilo_calendario_insert("dd/mm/yyyy");
                cerrar_load();     
                                    }
                    });   
                                    }
                                          
    function ir_cambio_nro_ptc()
    {
            $.ajax({
                    type: "POST",
                    url: ruta_contenedores_ptc+'contenedor_cambio_nro_ptc.jsp',
                    beforeSend: function() 
                    {
                       cargar_load(); 
                       
                      
                       
                       
                       
                       
                       $("#contenedor_principal").html('');
                   },           
                   success: function (res) 
                   {
                       $('#div_cargar_menu').hide();
                       $("#contenedor_principal").html(res);
                       $("#contenedor_principal").show();
                       cargar_estilo_calendario_insert("dd/mm/yyyy");
                       cerrar_load();     
                   }
                    });   
    }
                                    
    function ir_transformacion_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_transformacion_PTC.jsp',
             beforeSend: function() {
                cargar_load(); 
                
               
                
                
                
                
                $("#contenedor_principal").html('');
                                    },           
            success: function (res) {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                cerrar_load();     
                                    }
                    });   
                                    }                                   
     
    function ir_transformacion_pallet_carro(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_transformacion_pallet_carro.jsp',
             beforeSend: function() {
            cargar_load();     
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cargar_estilo_calendario_insert("dd/mm/yyyy");
            cerrar_load();

                                }
                });   
          
                                             }                                               
                                             
    function ir_grilla_retenidos_panel()
    {
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_retenidos_panel.jsp',
            beforeSend: function() {
            cargar_load();    
            
                                    },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $('#div_grilla').html(res);
                $('#grilla_lotes_motivos').DataTable( {
                "scrollX": true,
                "pageLength": 100,
                "language": 
                {
                "sUrl": "js/Spanish.txt"
                }
                        } );
                cerrar_load();     
            }
                });  
     
    }
      
    function ir_reportes_varios() {
            
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_menu_reporte.jsp',
             beforeSend: function() {
            cargar_load();     
            
            $("#contenedor_principal").html('');
            $("#contenido").html('');
            $("#contenedor_principal").html('');
           
            
            
            
                                            },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $('#contenido').html(res);
            cerrar_load();     
                           }
                });  
            }  

    
    function ir_liberados_viejo(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_registro_liberados_viejos.jsp',
             beforeSend: function() {
            cargar_load();     
           
            $("#contenedor_principal").html('');
                },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                cargar_toggles();
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                inicializar_unidad_medida_PTC();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                document.getElementById("boxColor_red").style.backgroundColor = "green";
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar('control_registro_costeado');
                    event.stopPropagation();
                }); 
                $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                comprobar_clasificadora();
                        cerrar_load();

            }
                });       
      }        
   
    function ir_registro_carros_alimentados(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_registro_alimentados.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                cargar_toggles();
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                inicializar_unidad_medida_PTC();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                document.getElementById("boxColor_red").style.backgroundColor = "green";
                document.getElementById("contenedor_alimentacion").style.backgroundColor = "red";
                
                
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar_carro_alimentado();
                    event.stopPropagation();
                }); 
                $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                comprobar_clasificadora();
                        cerrar_load();
                  $(document).on('click', '.borrar', function (event) {
        event.preventDefault();
        $(this).closest('tr').remove();
    });           
            }
                });  
                    }
  
  
    function ir_registro_reprocesos()
    {
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_registro_reprocesos.jsp',
            beforeSend: function() 
            {
                cargar_load();
                
               
                
                
                
                $("#contenedor_principal").html('');
            },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                cerrar_load();
                generar_boton_reproceso();
                
                
                
            }
                });  
    } 
   
    function generar_boton_reproceso(){

         $.ajax({
              type: "POST",
              url: ruta_consultas_ptc+'generar_btn_reprocesar.jsp',
              beforeSend: function() 
              {

              },           
              success: function (res) 
              {
                  $("#contenedor_boton").html(res.boton);
              }
                  });  
    }
    
    
    function registrar_reproceso (registro){
        var mensaje="DESEA INICIAR LA ALIMENTACION?";
        var json_string="";
        var validacion=1;
           
        if(registro==2)
        {
            mensaje="DESEA FINALIZAR LA ALIMENTACION?";
            var filas = document.querySelectorAll("#grilla_transfer tbody tr");
            jsonObj = [];
            validacion=0;// SI QUEDA EN CERO NO SE PODRA REGISTRAR. 
            filas.forEach(function (e) 
            {
                var columnas = e.querySelectorAll("td");
                item = {}
                item ["cod_interno"]    = columnas[0].textContent;
                item ["cod_carrito"]    = columnas[1].textContent;
                item ["cantidad"]       = columnas[2].textContent;
                item ["tipo_huevo"]     = columnas[6].textContent;
                jsonObj.push(item);
                validacion++;
            });
              json_string = JSON.stringify(jsonObj);
        }
        
        if(validacion>=1){
               Swal.fire({
            title: mensaje,
            type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
        
        $.ajax({
        type: "POST",
        url: ruta_controles_ptc+"control_aper_cierre_reproceso.jsp",
        data: ({ registro: registro,jsonObj:json_string}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
                    }, 1000); }
                        });  },
        success: function (data) 
            {
                if(data.tipo_respuesta==1)
                {
                    swal.fire({
                    type: 'success',
                    title: data.mensaje,
                    confirmButtonText: "CERRAR" });  
                    generar_boton_reproceso(); 
                }
                else if(data.tipo_respuesta==2)
                {
                    swal.fire({
                    type: 'success',
                    title: data.mensaje,
                    confirmButtonText: "CERRAR" });  
                    ir_registro_reprocesos();
                }
                else 
                {
                    swal.fire({
                    type: 'error',
                    title: data.mensaje,
                    confirmButtonText: "CERRAR" });  
                }
               
            }   });
        
            
                    }
        });
         }
         else {
             
              swal.fire({
                    type: 'error',
                    title: "ERROR, NO SE INGRESARON DATOS.",
                    confirmButtonText: "CERRAR" });  
         }
        
        
        
                    

    }

    function agregar_fila_alimentacion_ptc(cantidad,fecha_puesta){

   if(cantidad.length==0 ||fecha_puesta.length==0 ){
          alert('DEBE LLENAR TODOS LOS CAMPOS REQUERIDOS');
   }
   else {
    $('#grilla_reposicion').find('tbody').append( "<tr><td>"+cantidad+"</td><td>"+fecha_puesta+"</td><td><input type='button' value='Eliminar' class='borrar'></td></tr>" );

      $('#txt_cantidad_reposicion').val(""),$('#txt_fp_reposicion').val("")
   }



    }

    function registrar_lotes_con_alimentacion(){
       var fp;
      var cantidad;
      var i=0;
      var contenido="";
       var filas = document.querySelectorAll("#grilla_reposicion tbody tr");
       filas.forEach(function (e) {
            var columnas = e.querySelectorAll("td");
            cantidad        = parseInt(columnas[0].textContent);
            fp        = columnas[1].textContent;
            
            if(i==0){
                contenido=cantidad+"&"+fp;
            }
            else {
                
                contenido=contenido+","+cantidad+"&"+fp;
            }
            
            i++;
            
        });
            $('#txt_lotes_reposicionados').val(contenido); 
 
      
  }
  
    function traer_registro_lib(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_registro.jsp',
             beforeSend: function() {
                  cargar_load();
                $("#contenedor_principal").html('');
                },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                cargar_toggles();
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                inicializar_unidad_medida_PTC();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                document.getElementById("boxColor_red").style.backgroundColor = "green";
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar_PTC('control_registro');
                    event.stopPropagation();
                }); 
                $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                comprobar_clasificadora();
                cerrar_load();

            }
                });  
                    }
                    
    function traer_registro_retenido()
    {
        $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_registro_retenido.jsp',
                beforeSend: function() 
                { cargar_load();
                    
                   
                    
                    
                    
                    
                    $("#contenedor_principal").html('');
                },           
                success: function (res) 
                {
                    $('#div_cargar_menu').hide();
                    $("#contenedor_principal").html(res);
                    $("#contenedor_principal").show();
                    $('.checkbox').bootstrapToggle();
                    $(".dtBox").DateTimePicker();
                    document.getElementById("boxColor").style.backgroundColor = "lightblue";
                    document.getElementById("boxColor_red").style.backgroundColor = "green";
                    
                    cargar_toggles();
                    cargar_estilo_calendario_insert("dd/mm/yyyy");
                    $('#formulario').on('submit', function(event)
                    {
                        event.preventDefault();
                        procesar_PTC('control_retenidos');
                        event.stopPropagation();
                    });     
                    $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                    comprobar_clasificadora();
                            cerrar_load();


                }
            });   
    }    
    
   
    function traer_registro_SC()
    {
        cargar_load();
        $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_registro_SC.jsp',
                beforeSend: function() 
                {
                     $("#contenedor_principal").html('');
                },           
                success: function (res) 
                {
                    $('#div_cargar_menu').hide();
                    $("#contenedor_principal").html(res);
                    $("#contenedor_principal").show();
                    $('.checkbox').bootstrapToggle();
                    $(".dtBox").DateTimePicker();
                    document.getElementById("boxColor").style.backgroundColor = "lightblue";
                    document.getElementById("boxColor_red").style.backgroundColor = "green";
                    
                    cargar_toggles();
                    cargar_estilo_calendario_insert("dd/mm/yyyy");
                    $('#formulario').on('submit', function(event)
                    {
                        event.preventDefault();
                        procesar_sc();
                        event.stopPropagation();
                    });     
                    $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                    comprobar_clasificadora();
                    
                    $('#chkToggletiporeco').change(function () 
                    {
                        if ($(this).prop("checked") == true) 
                        {
                            $('#tipo_reco').val('MANUAL');
                        }
                        else 
                        {
                            $('#tipo_reco').val('MAQUINA');
                        }
                    });
        
                    cerrar_load();
                }
            });   
    }    
    
    function traer_registro_retenido_costeado(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_registro_retenido_costeados.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                        },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                cargar_toggles();
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar_PTC('control_retenidos_costeados');
                    event.stopPropagation();
                });   
                comprobar_clasificadora();
                        cerrar_load();

            }
                });   
          
                                             }

    function validar_fechaInicial_fechaFinal ()
    {
         $('#cbox_aviarios').html('');  
        var fecha_clasificacion_inicial=$('#calendario_registro').val();
        var fecha_clasificacion_final=$('#fecha_clas_final').val();
        var hora_inicial=$('#hora_desde').val();
        var hora_final=$('#hora_hasta').val();
        var date_inicial=new Date(fecha_clasificacion_inicial+' '+hora_inicial+':00') ;
        var date_final=new Date(fecha_clasificacion_final+' '+hora_final+':00') ; 
        var date_inicial_consulta= fecha_clasificacion_inicial+' '+hora_inicial+':59.000';
        var date_final_consulta= fecha_clasificacion_final+' '+hora_final+':00.000';
        
        
        if(fecha_clasificacion_inicial.length>0&&fecha_clasificacion_final.length>0&&hora_inicial.length>0&&hora_final.length>0)
        {
            if(date_inicial>date_final)
            {
               swal.fire({
                        type: 'error',
                        title: "FECHA DE CLASIFICACION INICIAL NO PUEDE SER MAYOR A LA FINAL.!!!",
                        confirmButtonText: "CERRAR"
                        });  
                $('#fecha_clas_final').val('');
               
            }
            else 
            {
                 $.get(ruta_consultas_ptc+'consulta_aviarios_hora.jsp',{fecha_inicio:date_inicial_consulta,fecha_final:date_final_consulta},function(res)
                {
                  $('#cbox_aviarios').html(res.aviarios);  
                }); 
            }
        }
    }

function ir_movimiento()
{
    $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc + 'contenedor_movimientos.jsp',
                beforeSend: function ()
                {
                    cargar_load();
                    $("#contenedor_principal").html('');
                },
                success: function (res)
                {
                    $('#div_cargar_menu').hide();
                    $("#contenedor_principal").html(res);
                    $("#contenedor_principal").show();
                    cargar_estilo_calendario_insert("dd/mm/yyyy");
                    filtrar_grilla_retenido();
                    get_checkbox_selected_movimientos();
                    $(".dtBox").DateTimePicker();
                    $("#boxColor").css('background-color', 'lightblue');
                    $("#tabla_lotes").dataTable({"scrollX": true});
                    cerrar_load();
                }
            });
}
                
    function traer_retenido_fecha_puesta(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_retenidos_puesta.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            filtrar_grilla_retenido();
            cargar_estilo_calendario_insert("dd/mm/yyyy");
                    cerrar_load();

                           }
            }); 
        }
      
    function traer_fecha_involucrada(){
           
             $.get(ruta_contenedores_ptc+'contenedor_fecha_involucrada.jsp',function(res)
            { 
                
                $("#contenedor_principal").html(res);
                $('#contenedor_principal').show();
                $('#contenido').hide();
                $('#contenido_password').hide();
                $('#contenido_reporte').hide();
                $('#contenido_visualizar').hide();
                $('#contenido_retenido').hide(); 
                cargar_estilo_calendario_insert("dd/mm/yyyy");
                $('#txt_fecha_involucradas').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                $('#formulario_correccion').on('submit', function(event)
                    {
                        event.preventDefault();
                        registrar_fecha_involucradas();
                        event.stopPropagation();
                    });               
            });
                                    }
    
    function traer_eliminar(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_eliminar.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            elminar_fila();
            cargar_estilo_calendario_insert("dd/mm/yyyy");  
            cerrar_load();

                           }
             }); 
                                }
      
    function traer_informe(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_informe.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cargar_estilo_calendario_insert("dd/mm/yyyy");
                    cerrar_load();

                }
            }); }
      
    function traer_insert(){
           
          $.get(ruta_controles_ptc+'lotes_control.jsp',function(res){
                    $("#contenedor_principal").html(res);
          });
           $('#contenido').hide();
            $('#contenedor_principal').show();
          
      }
      
    function traer_control(){
           $.get(ruta_controles_ptc+'control_registro.jsp',function(res){
                    $("#contenedor_principal").html(res);
                                         });
                     $('#contenedor_principal').show();
                    $('#contenido').hide();  
      }
      
    function traer_contendor_cambiar_pass_jsp(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_password.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cerrar_load();
                           }
                });
             }
       
    function traer_contendor_pdf_jsp(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_pdf.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            $("#calendario").datepicker();
                    cerrar_load();

                          }
                });
                 }
                                     
    function traer_carro_mesa(){
                     
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_carro_mesa.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                            },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            $("#calendario_mesa").datepicker();
            filtrar_grilla_carromesa();     
            elminar_fila();                
            cerrar_load();
            }
            
        });       }                 
                 
    function traer_contendor_pdf_reproceso(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_pdf_reproceso.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            $('#calendario_reporte_reproceso').datepicker();
            cerrar_load();
                }
            });  
                }  
                                     
    function traer_grilla_retenido(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+'contenedor_disposicion.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cargar_estilo_calendario_insert("dd/mm/yyyy"); 
            cerrar_load();
             }
            }); 
          }             
    
    function traer_reporte_lotes() {
             $.ajax({
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_reporte_carros.jsp',
             beforeSend: function() {
                    cargar_load();
                    
                   
                    
                    
                    
                    
                    $("#contenedor_principal").html('');

                       },           
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(res);
                $("#contenedor_principal").show();
                cargar_estilo_calendario_insert("dd/mm/yyyy"); 
                $(".dtBox").DateTimePicker();
                $('.selectpicker').selectpicker();
                $('.checkbox').bootstrapToggle();   
                $('#check_tipo_calendario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#tipo_calendario').val('INVOLUCRADA');
                    }
                    else 
                    {
                        $('#tipo_calendario').val('PUESTA');
                    }
                });
                
                  $('#check_filtro_aviario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#filtro_aviario').val('SI');
                        $('#boxColor').hide();
                        $('#div_aviarios').show();

                    }
                    else 
                    {
                        $('#filtro_aviario').val('NO');
                        $('#boxColor').show();
                        $('#div_aviarios').hide();

                    }
                });
            cerrar_load();

            }
            
        }); 
        
         
        }                    
                                     
    function traer_reporte_mixtos_historial() {
 
            $.ajax({
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_reporte_mixtos_variable.jsp',
             beforeSend: function() {
                  cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
              cargar_estilo_calendario_insert("dd/mm/yyyy"); 
            $('.selectpicker').selectpicker();
            $('.checkbox').bootstrapToggle();   
            $('#check_filtro_aviario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#filtro_aviario').val('SI');
                        $('#boxColor').hide();
                        $('#div_aviarios').show();
                        $('#div_filtro_carro').hide();
                        $('#cod_carrito').val('0')();

                    }
                    else 
                    {
                        $('#filtro_aviario').val('NO');
                        $('#boxColor').show();
                        $('#div_aviarios').hide();
                        $('#div_filtro_carro').show();
                        $('#cod_carrito').val('0')();
                    }
                });
              $('#check_filtro_carro').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                         $('#div_carrito').show();
                    }
                    else 
                    {
                        $('#div_carrito').hide();
                        $('#cod_carrito').val('0')();
                    }
                });  
                
            cerrar_load();
             }
            }); 
             }  

    function traer_reporte_ptc_excel() {
           $.ajax({
             type: "POST",
            url: ruta_contenedores_ptc+'contenedor_info_ptc_excel.jsp',
            
            beforeSend: function() {
                 cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
         
            cargar_estilo_calendario_insert("dd/mm/yyyy"); 
            
            ir_reporte_excel_ptc();
            cerrar_load();
             }
            
        });   
              }  

    function ir_grilla_transferencia(fecha,tipo) {
    $.ajax({
        type: "POST",
        url: ruta_contenedores_ptc+"acordeon_transferencia.jsp",
        data: {fecha:fecha,tipo:tipo},
        
         beforeSend: function() {
             cargar_load();
    $('#div_cargar').show();
            },
        success: function(data) {
         $('#div_grilla_tipo_transferencia').html(data);
         $('#div_cargar').hide();
            cerrar_load();
                                }
                });
 
 
        }  

    function traer_pendiente_liberacion_ptc() {
             
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_pendiente_liberacion.jsp',
            
            beforeSend: function() 
            {
                cargar_load();
                $("#contenedor_principal").html('');
            },           
            success: function (data) 
            {
                $('#div_cargar_menu').hide();
                $("#contenedor_principal").html(data);
                $("#contenedor_principal").show();
                cargar_estilo_calendario_insert("dd/mm/yyyy"); 
                $('#grilla_lotes_liberacion').DataTable( 
                {  
                    "scrollX": true,     
                    "paging":   false,
                    "ordering": false,
                    "info":     true,
                    "language": 
                    {
                        "sUrl": "js/Spanish.txt"
                    }} 
             );
            cerrar_load();
            }
                 });   
               } 
   
    function buscar_aviarios_disponibles()
    {
        var fecha_clasificacion_inicial=$('#calendario_registro').val();
        var fecha_clasificacion_final=$('#fecha_clas_final').val();
        var hora_inicial=$('#hora_desde').val();
        var hora_final=$('#hora_hasta').val();
        var date_inicial= fecha_clasificacion_inicial+' '+hora_inicial+':00.000';
        var date_final= fecha_clasificacion_final+' '+hora_final+':59.000';
        
        if(fecha_clasificacion_inicial.length>0&&fecha_clasificacion_final.length>0&&hora_inicial.length>0&&hora_final.length>0)
        {
            $.get(ruta_consultas_ptc+'eliminar_control.jsp',{fecha_inicio:date_inicial,fecha_final:date_final},function(res)
            {
              $('#cbox_aviarios').html(res.aviarios)  
            }); 
        }
    }
    function traer_control_eliminar(id,cod_lote) 
    {
            $.get(ruta_controles_ptc+'eliminar_control.jsp',{id:id,cod_lote:cod_lote},function(res)
            {
            Eliminar_fila_grilla_eliminar(cod_lote);
            traer_detalle_eliminar($('#calendario_eliminar').val());
            swal.fire({
            type: 'error',
            title: "REGISTRO ELIMINADO ",
            confirmButtonText: "CERRAR"
            });
            });
    }
    
    function traer_grilla_reproceso(){
        $.get(ruta_grillas_ptc+'grilla_reproceso.jsp',function(res){
        $("#contenedor_grilla_reproceso").html(res);
                });
                }                                     
 
    function inicializar_unidad_medida_PTC(){
    medida=$("#unidad_medida");     
    tipo_huevo=$("#tipo_huevo");
    tipo_huevo.change(cargar_unidad_medida_PTC);
                                        }

    function cargar_unidad_medida_PTC(id_select_huevo,id_uMedida) { 
  var tipo=id_select_huevo;
   var html=""; 
 
   if ($('#'+tipo).val()==="1") {
        html="<OPTION style='font-weight: bold;' VALUE='180'>CAJON GIGANTE</OPTION>";
    }
    else { 
      html="<OPTION style='font-weight: bold;' VALUE='' selected >SELECCIONE UNIDAD DE MEDIDA</OPTION>\n\
            <OPTION style='font-weight: bold;' VALUE='4320'>CARRITO NORMAL</OPTION>\n\
            <OPTION style='font-weight: bold;' VALUE='360'>CAJON</OPTION>";
        }
    $('#'+id_uMedida).html(html);

}         

 
 
  

    function parpadeo(cantidad,fecha_vieja_retenido,fecha_vieja){

        if (cantidad=='0'){
        endAnimation();
           $( "#texto_global" ).html( "<font color='black'><center><b>FECHA DE PUESTA MAS VIEJA, "+fecha_vieja+" </b></center></font>" );
            $('#notificacion').hide(true);
    }
        else {
          initAnimation(fecha_vieja_retenido,fecha_vieja);  
            }
       }
    
    function initAnimation(fecha_vieja_retenido,fecha_vieja)
    {
        document.getElementById('div_pendiente').className =' card border-left-success shadow h-100 py-2 animacion';
        $( "#texto" ).html( "<font color='black'><b>TIENE PENDIENTES DE LIBERACION, CON FECHA DE PUESTA MAS VIEJA, "+fecha_vieja_retenido+" </b></font>" );
        $( "#texto_global" ).html( "<font color='black'><center><b>FECHA DE PUESTA MAS VIEJA, "+fecha_vieja+" </b></center></font>" );
        $('#notificacion').show(true);
        
     }

    function endAnimation(){
    document.getElementById('div_pendiente').className ='';
    document.getElementById('div_principal_pendiente').className ='ocultar_div';
}

    function ir_grilla_transformacion_pallet_carro(){
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_transformacion_pallet_carro.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
             beforeSend: function() {
                 cargar_load();
            
                                },           
            success: function (res) {
           $("#contenido_grilla_transformacion_pallet_carro").html(res);
             $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100
                    ,"language": {
                    "sUrl": "js/Spanish.txt"
                    }} );
                cerrar_load();
                                }
                });   
          
                                             }
                                             
    function ir_grilla_transformacion_carro(){
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_transformacion_carro.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
             beforeSend: function() {
            cargar_load();
                                },           
            success: function (res) {
           $("#contenido_grilla_transformacion_carro").html(res);
             $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100,
                    "language": {
              "sUrl": "js/Spanish.txt"
                }
                    } );
                    cerrar_load();
                                }
                });   
          
                                             }                                            
    
    function ir_grilla_cambio_fp_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_ptc_cambio_fp.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
            beforeSend: function() {
            cargar_load();
                                },           
            success: function (res) {
                $("#contenido_grilla_cambio_fp").html(res);
                $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100,
                "language": {
              "sUrl": "js/Spanish.txt"
                }} );
            cerrar_load();
                                }
                });   
          
                                             }  
 
    function ir_grilla_cambio_nro_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_grillas_ptc+'grilla_ptc_cambio_nro_ptc.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
            beforeSend: function() {
            cargar_load();
                                },           
            success: function (res) {
                $("#contenido_grilla_cambio_fp").html(res);
                $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100,
                "language": {
              "sUrl": "js/Spanish.txt"
                }} );
            cerrar_load();
                                }
                });   
          
                                             }  
                                             
    function registro_transformacion_pallet_carro(id,nro_pallet,tipo){
      
         Swal.fire({
            title: 'TRANSFORMACION DE PALLET A CARRO',
            type: 'warning',
            html: " <a><strong>PALLET NRO"+nro_pallet+"</strong> \n\
                    </a><br><br><a>INGRESE EL NUMERO DE CARRO</a> \n\
                    <input type='number' class='form-control' id='txt_nro_carro' placeholder='INGRESE NRO'/>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      var url;
      if(tipo=="N"){
          url=ruta_controles_ptc+"control_tranformacion_pallet_ptc.jsp";
      }
      else {
          url="http://192.168.6.162/ws/ptc_upd.aspx";
      }
       var cod_carrito = $('#txt_nro_carro').val();

                if (cod_carrito.length <6) {
                    Swal.fire({
                        title: 'ERROR, DEBE INGRESAR UN NUMERO DE CARRO VALIDO.',
                       // title: cod_carrito+"  "+id + "  "+ nro_pallet ,
                        type: 'error',
                        animation: true,
                        customClass: {
                            popup: 'animated tada'
                        }
                    });
                }

                else {
                    
        $.ajax({
        type: "POST",
        url: url,
        data: ({ id: id,cod_carrito:cod_carrito}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        });  },
        success: function (data) {
                aviso_transformacion(data.tipo,data.mensaje);
            }   });
                }   }
        });
  }
 
    function liberar_retenidos_mensaje(cod_carrito,cod_lote,disposicion,cod_interno,tipo_registro){
        var html="";
      
        if(disposicion=='7'||disposicion=='6'){
         html="<form id='form_liberar'> <a>INGRESE EL RESPONSABLE</a>\n\
                \n\<input type='hidden'   id='id_carro' name='id_carro' value='"+cod_lote+"-"+cod_interno+"-"+tipo_registro+"-"+disposicion+"' /> \n\
                \n\<input type='hidden'   id='estado_requerido' name='estado_requerido' value='L' /> \n\
                <input type='text' class='form-control ' id='responsable' name='responsable' placeholder='RESPONSABLE' required/> \n\
                <br> <a>FECHA DE ALIMENTACION</a> \n\
                <input type='date' style='font-weight: bold;' min='2020-11-20' max='2030-12-25' id='fecha_alimentacion' name='fecha_alimentacion' placeholder='INGRESE FECHA' class='form-control '  required/><br><br>\n\
                <input type='submit'  value='LIBERAR' class='form-control bg-success btn color_letra'>\n\
                </form>";  
            
    //+ "&tipo=2"({id_carro:cod_lote+"-"+cod_interno+"-"+tipo_registro+"-"+disposicion,
    //responsable:responsable,
    //fecha_alimentacion:$('#cal').val(),estado_requerido:'L'}), 

            
            }
        else {
             html="<form id='form_liberar'> <a>INGRESE EL RESPONSABLE</a>\n\
                \n\<input type='hidden'   id='id_carro' name='id_carro' value='"+cod_lote+"-"+cod_interno+"-"+tipo_registro+"-"+disposicion+"' /> \n\
                \n\<input type='hidden'   id='estado_requerido' name='estado_requerido' value='L' /> \n\
                <input type='text' class='form-control ' id='responsable' name='responsable' placeholder='RESPONSABLE' required/> \n\
                <input type='hidden' value='' id='fecha_alimentacion' name='fecha_alimentacion' >\n\
                 <input type='submit'  value='LIBERAR' class='form-control bg-success btn color_letra'>\n\
                </form>";  
        
            }
         Swal.fire({
            title: 'LIBERACION DE LOTE NRO.'+cod_carrito,
            type: 'warning',
            html: html,
            showCancelButton: false,
            showConfirmButton: false
                    });
        cargar_estilo_calendario_insert("dd/mm/yyyy");
      //$(document).on('click','.btn'+cod_interno,function(){
            control_retenidos_pendientes(cod_lote,$('#res').val(),disposicion,cod_interno,tipo_registro);
        //});  
       
    }
  
    function control_retenidos_pendientes(cod_lote,responsable,disposicion,cod_interno,tipo_registro) {
        $('#form_liberar').submit(function(evt){
        evt.preventDefault();// to stop form submitting
            $.ajax({
                type: "POST",
                url: ruta_controles_ptc+'control_movimientos.jsp',
                data: $("#form_liberar").serialize(),//+ "&tipo=2"({id_carro:cod_lote+"-"+cod_interno+"-"+tipo_registro+"-"+disposicion,responsable:responsable,fecha_alimentacion:$('#cal').val(),estado_requerido:'L'}),//estado_requerido= LIBERADO O RETENIDO O RETENIDO CON REPORTE.
                beforeSend: function() {
                Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        }); 
                     },           
                success: function (res) 
                {
                    if(res.tipo_mensaje=="1")
                    {
                        swal.fire({
                        type: 'success',
                        title: res.mensaje,
                        confirmButtonText: "CERRAR"
                           });
                        $(this).addClass('selected');
                        var table = $('#grilla_lotes_liberacion').DataTable();
                        table.row('#'+cod_interno).remove().draw( false );
                        $("#grilla_lotes_liberacion").dataTable().fnDestroy();
                        $('#grilla_lotes_liberacion').DataTable( {  "scrollX": true,     "paging":   false, "ordering": false, "info":     true,"language": {  "sUrl": "js/Spanish.txt" } } );

                    }
                    else   {
                          swal.fire({
                             type: 'error',
                             title: res.mensaje,
                             confirmButtonText: "CERRAR"
                         });
                     }
                     notificacion();
                    } 
                        }); 
              evt.stoppropagation();
            });
            
         }
                       
    function registro_transformacion_ptc(id,nro_carro,tipo,cantidad,fecha_puesta,itemcode_origen,area_cch){
      var option,url;
      if(tipo=="N"){
        url=ruta_controles_ptc+"control_transformacion_ptc.jsp";
        option="<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'> <OPTION value='A'>TIPO A</OPTION> <OPTION value='B'>TIPO B</OPTION>   <OPTION value='C'>TIPO C</OPTION> <OPTION value='D'>TIPO 4TA</OPTION> <OPTION value='S'>TIPO SUPER</OPTION> <OPTION value='J'>TIPO JUMBO</OPTION> <OPTION value='G'>TIPO G</OPTION></select>";
      }
      else {
        option="<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'> <OPTION value='4'>TIPO A</OPTION> <OPTION value='5'>TIPO B</OPTION>   <OPTION value='6'>TIPO C</OPTION> <OPTION value='7'>TIPO 4TA</OPTION> <OPTION value='3'>TIPO SUPER</OPTION> <OPTION value='2'>TIPO JUMBO</OPTION> <OPTION value='1'>TIPO G</OPTION><OPTION value='8'>TIPO SUBPRODUCTO</OPTION></select>";
        url="http://192.168.6.162/ws/control_transformar_ptc.aspx"; 
       }
       
         Swal.fire({
            title: 'TRANSFORMACION DE TIPO DE HUEVO',
            type: 'warning',
            html: " <a><strong>PTC NRO "+nro_carro+"</strong> </a><br><br><a>SELECCIONE EL TIPO DE HUEVO</a> "+option,
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      
        $.ajax({
        type: "POST",
        url: url,
        data: ({ cod_interno: id,fecha_puesta:fecha_puesta,cantidad:cantidad,itemcode:$('#tipo_huevo').val(),itemcode_origen:itemcode_origen,clasificadora:area_cch}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        });  },
        success: function (data) {
                aviso_transformacion(data.tipo,data.mensaje);
            }   });
                  }
        });
  }
  
    function registro_cambio_fp_ptc(id,tipo){
      
         Swal.fire({
            title: 'CAMBIO DE FECHA DE PUESTA DEL LOTE',
            type: 'warning',
            html: "</a><br><br><a>INGRESE LA FECHA DE PUESTA</a> <input type='text' class='datepicker' id='txt_fecha' placeholder='INGRESE FECHA DE PUESTA'/><br><br><br><br>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      var url;
      if(tipo=="N"){
          url=ruta_controles_ptc+"control_cambio_fp_ptc.jsp";
      }
      else {
          url="http://192.168.6.162/ws/ptc_upd_fp.aspx";
      }
       var txt_fecha_puesta = $('#txt_fecha').val();

                if (txt_fecha_puesta.length==0) {
                    Swal.fire({
                        title: 'ERROR, DEBE INGRESAR LA FECHA DE PUESTA.',
                        type: 'error',
                        animation: true,
                        customClass: {
                            popup: 'animated tada'
                        }
                    });
                }

                else {
                    
        $.ajax({
        type: "POST",
        url: url,
        data: ({ id: id,fecha_puesta:txt_fecha_puesta}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        });  },
        success: function (data) 
            {
                aviso_transformacion(data.tipo,data.mensaje);
            }   });
                }   }
        });
        
                    cargar_estilo_calendario_insert("dd/mm/yyyy");

  }
  
    function registro_cambio_nro_ptc(id,tipo){
      
         Swal.fire({
            title: 'CAMBIO DE NRO DEL LOTE',
            type: 'warning',
            html: "</a><br><br><a>INGRESE EL NUEVO NUMERO DE CARRO</a> <input type='number' class='form-control' id='nro_carrito' placeholder='INGRESE NRO DE CARRO'/><br><br><br><br>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      var url;
      if(tipo=="N"){
          url=ruta_controles_ptc+"control_cambio_nro_ptc.jsp";
      }
      else  {
          url="http://192.168.6.162/ws/ptc_upd_nro_carrito.aspx";
            }
       var nro_carrito = $('#nro_carrito').val();

                if (nro_carrito.length<6||nro_carrito.length>6) {
                    Swal.fire({
                        title: 'ERROR, CODIGO DE CARRO INGRESADO INVALIDO.',
                        type: 'error',
                        animation: true,
                        customClass: {
                            popup: 'animated tada'
                        }
                    });
                }

                else {
                    
                $.ajax({
                type: "POST",
                url: url,
                data: ({ id: id,cod_carrito:nro_carrito}),
                beforeSend: function () {
                    Swal.fire({
                        title: 'PROCESANDO!',
                        html: '<strong>ESPERE</strong>...',
                        allowOutsideClick: false,
                        onBeforeOpen: () => {
                            Swal.showLoading();
                            timerInterval = setInterval(() => {
                                Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
                           }, 1000); }
                                });  },
                success: function (data) 
                    {
                        aviso_transformacion_PTC(data.tipo,data.mensaje);
                    }   });
                        }   }
                });

                  

  }
 
   
    function aviso_transformacion(tipo,mensaje){
      if(tipo==0)
        {
              swal.fire({
              type: 'success',
              title: "TRANSFORMACION REALIZADA CON EXITO.",
              confirmButtonText: "CERRAR" });  
               $("contenedor_principal").html("");
        }
      else 
        {
              swal.fire({
              type: 'error',
              html: mensaje,
              confirmButtonText: "CERRAR" });    
        }
  }
    
    function aviso_transformacion_PTC(tipo,mensaje){
      if(tipo==0)
        {
              swal.fire({
              type: 'success',
              title: "TRANSFORMACION REALIZADA CON EXITO.",
              confirmButtonText: "CERRAR" });  
              ir_grilla_transformacion_carro();
        }
      else 
        {
              swal.fire({
              type: 'error',
              html: mensaje,
              confirmButtonText: "CERRAR" });    
        }
  }
  
    function cuadro_empacadoras(){
 Swal.fire({
            title:  'ACTIVAR EMPACADORA',
            html:   "<a>SELECCIONE EMPACADORA</a><br><select style='font-weight: bold;' class='form-control' name='empacadora' id='empacadora'  > "+
                    "<OPTION style='font-weight: bold;' VALUE='0'>0</OPTION> "+
                    "<OPTION style='font-weight: bold;' VALUE='1'>1</OPTION> "+
                    "<OPTION style='font-weight: bold;' VALUE='2'>2</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='3'>3</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='4'>4</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='5'>5</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='6'>6</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='7'>7</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='8'>8</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='9'>9</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='10'>10</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='11'>11</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='12'>12</OPTION>"+
                    "</select> <br><a>SELECCIONE TIPO DE HUEVO</a><br>"+ 
                    "<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'  > "+
                    "<OPTION style='font-weight: bold;' VALUE='G'>G</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='J'>J</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='S'>S</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='A'>A</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='B'>B</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='C'>C</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='D'>4TA</OPTION>"+
                    "</select> ",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor:  '#d33',
            confirmButtonText:  'ACTIVAR',
            cancelButtonText:   'CANCELAR'
                    }).then((result) => {
            if (result.value) {
 
                
    $.ajax({
        type: "POST",
        url: ruta_controles_ptc+"control_empacadora.jsp",
        data: ({ empacadora: $('#empacadora').val(), tipo_huevo: $('#tipo_huevo').val()}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft();
                    }, 1000);
                }
            });
        },
        success: function (data) {
            
            Swal.close();
           if(data.tipo_respuesta==0){
               swal.fire({
            type: 'success',
            title: data.mensaje,
            confirmButtonText: "CERRAR"
        });
          ir_grilla_empacadoras();
           }
           else {
               
                 swal.fire({
            type: 'error',
            html: data.mensaje,
            confirmButtonText: "CERRAR"
        });   
           }
           
        } 
    });
               
            }
        });
  }
  
    function ir_grilla_empacadoras(){
    $.ajax({
        type: "POST",
        url: ruta_grillas_ptc+'grilla_empacadora.jsp',
        beforeSend: function() { 
            cargar_load();
                       },           
        success: function (data) {
        $("#div_tabla").html(data);
        cerrar_load();
        }
        }); 
  }
  
    function consulta_empacadora(){
    $.ajax({
        type: "POST",
        url: ruta_consultas_ptc+'grilla_option_empacadoras.jsp',
        data:({tipo_huevo:$('#tipo_huevo option:selected').text()}),
        beforeSend: function() { 
                       },           
        success: function (data) {
        //$("#nro_empacadora").html(data.mensaje);
          $("#nro_empacadora").empty();
        $("#nro_empacadora").append(data.mensaje);
        }
        }); 
  }
  
    function consulta_empacadora_retenido(){
    $.ajax({
        type: "POST",
        url: ruta_consultas_ptc+'grilla_option_empacadoras.jsp',
        data:({tipo_huevo:$('#tipo_huevo_retenido option:selected').text()}),
        beforeSend: function() { 
                       },           
        success: function (data) {
        //$("#nro_empacadora").html(data.mensaje);
          $("#nro_empacadora").empty();
        $("#nro_empacadora").append(data.mensaje);
        }
        }); 
  }
  
    function cerrar_empacadora(id){
        
        Swal.fire({
            title: 'EMPACADORA',
            type: 'warning',
            text: "DESEA CERRAR LA EMPACADORA",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'ACEPTAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
    $.ajax({
            type: "POST",
            url: ruta_controles_ptc+'control_cerrar_empacadora.jsp',
            data:({id:id}),
             beforeSend: function() {
            
                                },           
            success: function (data) {
         
                  Swal.close();
           if(data.tipo_respuesta==0){
               swal.fire({
            type: 'success',
            title: data.mensaje,
            confirmButtonText: "CERRAR"
        });
          ir_grilla_empacadoras();
           }
           else {
               
                 swal.fire({
            type: 'error',
            html: data.mensaje,
            confirmButtonText: "CERRAR"
        });   
           }
                                }
                });   
    }
        });
         }
         
    function habilitar_boton_registrar() {
	$('#tipo_almacenamiento').change(function(){
        $('#btn_registrar').removeAttr('disabled');
        });}
 
    function cargar_toggles() 
    {
        $('#chkToggle2').change(function () 
        {
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_borroso').val('SI');
            }
            else 
            {
                $('#codigo_borroso').val('NO');
            }
        });
    
        $('#chkToggle_especial').change(function () 
        {
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_especial').val('SI');

            }
            else 
            {
                $('#codigo_especial').val('NO');
            }
        });
      $('#chkToggle_recogida').change(function () 
        {  
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_reposicion').val('SI');
                $('#txt_lotes_reposicionados').val('');
                $('#btn_huevos_recogidas').show();
                $('#grilla_reposicion tbody').empty();
            }
            else 
            {
                $('#txt_lotes_reposicionados').val('');
                $('#codigo_reposicion').val('NO');
                $('#btn_huevos_recogidas').hide();
$('#grilla_reposicion tbody').empty();
            }
        });
        $('#chkToggle_cepillado').change(function () 
        {  
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_cepillado').val('SI');
            }
            else 
            {
                $('#codigo_cepillado').val('NO');
            }
        });
        
        $('#chkToggle_aviario').change(function () 
        {  
            $('#fecha_puesta').val("");
            if ($(this).prop("checked") == true) 
            {
               
          $('#cbox_aviarios').removeAttr('required');
            }
            else 
            {
                 $("#cbox_aviarios").prop('required', 'required');
            }
        });
    }

    function  filtro_eliminar(){
                    $("#buscar_eliminar").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                     $("#grilla_eliminar tr").filter(function() {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      };
                      
    function traer_detalle_eliminar(fecha)  {
               $.get(ruta_grillas_ptc+'grilla_eliminar.jsp',{fecha:fecha},function(res){
                    $("#id_div").html(res);
                 $('#grilla_eliminar').DataTable({ "language": {
              "sUrl": "js/Spanish.txt"
        }});
    });  } 
    
    function traer_detalle_fecha_involucrada(fecha){
        $.get(ruta_grillas_ptc+'grilla_fecha_involucrada.jsp',{fecha:fecha},function(res){
        $("#div_id_involucrada").html(res);
        $('#grilla_involucrada').DataTable({"language": {
              "sUrl": "js/Spanish.txt"
                }});
    });  } 

    function visible_div_eliminar(){
        var elemento = document.getElementById("div_eliminar");
        elemento.style.display = 'block';
    }
    
    function filtrar_grilla_retenido (){
        $("#buscar_retenido").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#tabla_retenido tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      }
    
    function setear_grilla(){     
        var arr = $('[name="checks[]"]:checked').map(function(){
        return this.value;
        }).get();
        var resultado_seleccionado = arr.join(',');
        $('#resultado_seleccionado').val(resultado_seleccionado);
        var combo=$('#estado_requerido').val(); 
        var  select=$("#resultado_seleccionado").val();
        var txt_liberado= $('#liberado_por').val();  
        var estado_liberacion= $('#estado_liberacion').val();  
        var motivo_retencion= $('#motivo_retencion').val();  
        var disposicion= $('#disposicion').val();  
        if( select==="")
            {
            swal({   
            title: "ERROR, SELECCIONE LOTE!!!",   
            text: "",   
            timer: 2000,   
            showConfirmButton: false
            });
               $.preloader.stop();
            }
            else    {
                if(combo==="L"){
                if(txt_liberado==="")
                {
                swal({   
                title: "ERROR, COMPLETE TODOS LOS DATOS!!!",   
                text: "",   
                timer: 2000,   
                showConfirmButton: false
                        }); 
                }
                else{
                    imprimir();
                    enviar_datos_retenidos2();    
                                }
            }
            if(combo==="R"){
            if(estado_liberacion===null||motivo_retencion===null||disposicion===null ){
                swal({   
                    title: "ERROR, COMPLETE TODOS LOS DATOS!!!",   
                    text: "",   
                    timer: 2000,   
                    showConfirmButton: false
                        }   ); 
                    $.preloader.stop(); 
            }
            else{
                imprimir();
                enviar_datos_retenidos2();    
                }
            }
        }
    } 
   
    function validar_seleccion(){
      if($("#resultado_seleccionado").val()=="") {
          alert("DEBE SELECCIONAR AL MENOS UN LOTE"); 
      }
 }
 
function buscar_lotes_movimientos()
{
    if ($("#desde").val() == "" || $("#hasta").val() == "" || $("#calendario_retenido").val() == "")
    {
        alert("ERROR COMPLETAR DATOS");
    } else
    {
        var estado = $("#estado_requerido").val();

        if (estado === "R" || estado === "Z")
        {
            $("#estado_liberacion").prop('required', 'required');
            $("#motivo_retencion").prop('required', 'required');
            $("#disposicion").prop('required', 'required');
            $('#liberado_por').removeAttr('required');
            $("#combo_retenido").show();
            $("#liberado_por").hide();
        } else if (estado === "L")
        {
            $("#liberado_por").show();
            $("#liberado_por").prop('required', 'required');
            $('#motivo_retencion').removeAttr('required')
            $('#motivo_retencion').removeAttr('required')
            $('#disposicion').removeAttr('required')
            $("#combo_retenido").hide();
        }

        $('#tabla_lotes').DataTable(
                {//INICIO
                    "scrollX": true,
                    scrollY: "500px",
                    "bPaginate": false,
                    "destroy": true,
                    "language":
                            {
                                "sUrl": "js/Spanish.txt"
                            },
                    "ajax":
                            {
                             "url": ruta_grillas_ptc + 'grilla_lotes_movimiento.jsp',
                               //    "url":   'https://gyrocode.github.io/files/jquery-datatables/arrays_id.json',
                        
                        
                                "data":
                                        {"fecha_retenido": $("#calendario_retenido").val(), "inicio_retenido": $("#desde").val(), "fin_retenido": $("#hasta").val(),
                                            "combo_estado_retenido": $("#estado_requerido").val(), "tipo": $("#tipo").val()
                                        }
                            },

                    'columnDefs':
                            [
                                {
                                    'targets': 0,
                                    'checkboxes':
                                    {
                                        'selectRow': true
                                    },
                                    'render': function (data, type, full, meta)
                                    {
                                        return '<input type="checkbox" value="' + data + '" class="dt-checkboxes" autocomplete="off">';
                                    }
                                },
                                {       
                                    "targets": [1, 2, 6, 7, 8],
                                    className: "ocultar "
                                },
                                {
                                    "targets": [3, 4, 5, 9, 10, 11, 12, 13],
                                    className: 'bolded'
                                }
                            ],
                    'select':
                            {
                                'style': 'multi'
                            },
                    'order': [[1, 'asc']],
                    "rowCallback": function (row, data, index)
                    {
                        if (data[5] == "L")
                        {
                            $('td', row).css('background-color', 'Green');
                        } else if (data[5] == "R.")
                        {
                            $('td', row).css('background-color', 'cyan');
                        } else
                        {
                            $('td', row).css('background-color', 'red');
                        }
                    },
                    "initComplete": function (settings, json)
                    {
                        //FUNCION QUE SE EJECUTA DESPUES DE CARGAR EL DATATABLE.
                        $('.ocultar').hide();
                    }
                }); //FIN
    }

}
   
    function get_checkbox_selected_movimientos() 
    {  $('#frm_movimiento').on('submit', function(e){
        e.preventDefault();
        //Reference the Table.
        var grid = document.getElementById("tabla_lotes");
        //Reference the CheckBoxes in Table.
        var checkBoxes = grid.getElementsByClassName("dt-checkboxes");
        var grilla_chequeada = "";
        //Loop through the CheckBoxes.
         var c=0;
          
        for (var i = 0; i < checkBoxes.length; i++) 
        { 
            var row = checkBoxes[i].parentNode.parentNode;
          
            
            
                if (checkBoxes[i].checked) 
                {
                    
                    if (c==0)
                    {
                    /*   if(row.cells[6].innerHTML==="Tipo"){
                    }
                        
                    else 
                                 
                    {    */                          
                            grilla_chequeada +=row.cells[2].innerHTML;
                            grilla_chequeada += "-" + row.cells[1].innerHTML;
                            grilla_chequeada += "-" + row.cells[6].innerHTML;
                            grilla_chequeada += "-" + row.cells[7].innerHTML;  
                            c++;      
                    //  } 
                     }
                    else 
                    {
                         
                        grilla_chequeada += ",";
                        grilla_chequeada +=row.cells[2].innerHTML;
                        grilla_chequeada += "-" + row.cells[1].innerHTML;
                        grilla_chequeada += "-" + row.cells[6].innerHTML;
                        grilla_chequeada += "-" + row.cells[7].innerHTML;
                         c++;  
                    }
                 
                } 
                  
                } 
         
        //Display selected Row data in Alert Box.
        
       
      if (grilla_chequeada.length==0){
           Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    html: "DEBE SELECCIONAR ALGUN LOTE." });   
      }
      
      else {
          // alert(grilla_chequeada);
        Swal.fire({
            title: 'DESEAR PROCESAR EL CAMBIO DE LIBERACION?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ACEPTAR!',
            cancelButtonText: 'CANCELAR!'
            }).then((result) => {
        if (result.value) {
            
                $.ajax({
        type: "POST",
       
        url: ruta_controles_ptc+"control_movimientos.jsp",
        data: ({    id_carro:           grilla_chequeada,               estado_requerido:   $("#estado_requerido").val(),
                    disposicion:        $("#disposicion").val(),        estado_liberacion:  $("#estado_liberacion").val(),
                    motivo_retencion:   $('#motivo_retencion option:selected').toArray().map(item => item.text).join()   ,   
                    responsable:        $("#liberado_por").val()}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        });  },
        success: function (data) 
            {
                if(data.tipo_mensaje=="1"){
                Swal.fire({
                    type: 'success',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
                    $("#contenedor_principal").html("");
                }
                else 
                {
                Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    html: data.mensaje });    
                }
                
            }   });
                             }
                                }); 
        } 
      
      e.stopPropagation();
           }); 
    }
    
   
    function ir_reporte_excel_ptc(){
        
         $(document).on('click','.btn_buscar_excel',function(){
          
         $('#form_excel').on('submit', function(e){
            e.preventDefault();
           
     
        $.get(ruta_grillas_ptc+'grilla_ptc_excel.jsp',{calendario_informe:$('#calendario_ptc_excel').val(),estado:$('#estado').val()},
        function(res){
             
      
        $("#ptc_excel").html(res);  
        
  
    var texto;
    if($('#estado').val()=='E'){
        texto="FORMULARIO REGISTROS ELIMINADOS DE HUEVOS CLASIFICADOS FRESCOS Y LAVADOS FECHA DE PUESTA"
        
    }
    else {
        texto="FORMULARIO HUEVOS CLASIFICADOS FRESCOS Y LAVADOS FECHA DE PUESTA"

    }
    
     $('#example tfoot th').each( function (i) {
        var title = $('#example thead th').eq( $(this).index() ).text();
        $(this).html( '<input type="text" placeholder="'+title+'" data-index="'+i+'" />' );
    } );
  
    // DataTable
    var table = $('#example').DataTable( {
        scrollY:        "500px",
        scrollX:        true,
        dom: 'Bfrtip',
        "pageLength": 100,
       
            "language": {
                "sSearch":         "Buscar:",
                "sLengthMenu":     "Mostrar _MENU_ registros",
                "sZeroRecords":    "No se encontraron resultados",
                "sEmptyTable":     "Ningún dato disponible en esta tabla",
                "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                "sInfoThousands":  ",",
                "sLoadingRecords": "Cargando...",
            "oPaginate": {
                            "sFirst":    "Primero",
                            "sLast":     "Último",
                            "sNext":     "Siguiente",
                            "sPrevious": "Anterior"
                        }, 
             //  "sUrl": "js/Spanish.txt" ,
               buttons: {
                copyTitle: 'DATOS COPIADOS',
                copySuccess: {
                    _: '%d FILAS COPIADAS' 
                }
            }  
        },
         buttons: [
            {
                extend: 'copyHtml5',
                text: 'COPIAR GRILLA',
                exportOptions: {
                columns: [ 0, ':visible' ]
                    }
            },
            {
                extend: 'excelHtml5',
                title:texto+$('#calendario_ptc_excel').val(),                
                text: 'EXCEL',
                     
            
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                title:texto + '\n' + 
                '        FECHA DE PUESTA:'+$('#calendario_ptc_excel').val(),
                orientation: 'landscape',
                pageSize: 'LEGAL',
                customize: function(doc) {
                  
                    doc.styles.title = {
                      color: 'white',
                      fontSize: '20',
                      background: 'black',
                      alignment: 'center'
                      
                    }
                    doc.styles.tableHeader = {
                       fontSize: '6'
                    }
                    doc.styles.tableBodyEven = {
                      fontSize: '6'
                    }
                    doc.styles.tableBodyOdd = {
                       fontSize: '6'
                    }
                   doc.styles.tableFooter = {
                       fontSize: '6'
                    }
                   doc.styles['td:nth-child(2)'] = { 
                      width: '100px',
                      'max-width': '100px'
                    }
                  }   ,
                  
                  
                exportOptions: {
                    columns: ':visible'
                 }
            },
            'colvis'
        ], keys: {
        clipboard: false
    }}) ;
 
    // Filter event handler
    $( table.table().container() ).on( 'keyup', 'tfoot input', function () {
        table
            .column( $(this).data('index') )
            .search( this.value )
            .draw();
    } );
    
    
 /*
  var table=   $('#tabla_ptc_lotes_excel').DataTable ({//INICIO
	"scrollX": true,
        "bPaginate": false,
          dom: 'Bfrtip',
          orderCellsTop: true,
        fixedHeader: true,
        "destroy": true,
        "language": {
              "sUrl": "js/Spanish.txt",
                buttons: {
                copyTitle: 'DATOS COPIADOS',
                copySuccess: {
                    _: '%d FILAS COPIADAS' 
                }
            }
        }, buttons: [
            {
                extend: 'copyHtml5',
                text: 'COPIAR GRILLA',
                exportOptions: {
                    columns: [ 0, ':visible' ]
                    }
            },
            {
                extend: 'excelHtml5',
                title:texto+$('#calendario_ptc_excel').val(),                text: 'EXCEL',
                     
            
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                title:texto + '\n' + 
                      '        FECHA DE PUESTA:'+$('#calendario_ptc_excel').val(),
                html:'HOLA MUNDO',
                orientation: 'landscape',
                pageSize: 'LEGAL',
                customize: function(doc) {
                  
                    doc.styles.title = {
                      color: 'white',
                      fontSize: '20',
                      background: 'black',
                      alignment: 'center'
                      
                    }
                    doc.styles.tableHeader = {
                       fontSize: '6'
                    }
                    doc.styles.tableBodyEven = {
                      fontSize: '6'
                    }
                    doc.styles.tableBodyOdd = {
                       fontSize: '6'
                    }
                   doc.styles.tableFooter = {
                       fontSize: '6'
                    }
                   doc.styles['td:nth-child(2)'] = { 
                      width: '100px',
                      'max-width': '100px'
                    }
                  }   ,
                  
                  
                exportOptions: {
                    columns: ':visible'
                 }
            },
            'colvis'
        ], keys: {
        clipboard: false
    }}); 
        */
      
        }); 
        
        e.stopimmediatepropagation();
           }); }); 
     }
    
    function exportar_excel_ptc(elem) {
        var table =document.getElementById("mobiles"); 
        var html = table.outerHTML;
        var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
        elem.setAttribute("href", url);
        elem.setAttribute("download", "REPORTE PTC.xls"); // Choose the file name
        return false;
    }
    
    function registrar_fecha_involucradas(){
       
     $.ajax({                        
           type: "POST",                 
           url: ruta_controles_ptc+'control_correccion.jsp',                    
           data: $("#formulario_correccion").serialize(),
              beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000); }
                        });  },
            
            success: function(data)            
           {
           if(data.tipo_respuesta==1){
               Swal.fire({
                    type: 'success',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
                 $('#cuadro1').modal('toggle');
                 
            }
           else {
               Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
           }
            
           }
                });
        }
        
    function remover_required_reporte_ptc(){
    $('#cbox_estado').removeAttr('required');
    $('#calendario_reporte_carros').removeAttr('required') ;
    $('#calendario_reporte_clasificacion').removeAttr('required') ;
    $('#cbox_estado').removeAttr('required') ;
    $('#tipo_huevo').removeAttr('required') ;
    $('#desde').removeAttr('required');
    $('#hasta').removeAttr('required');
    $('#hasta').removeAttr('required');
    $("#txt_fecha_involucrada_rep").prop('required',true);
     }
  
  
    function add_required_reporte_ptc()
    {
        $('#cuadro1').modal('toggle');
        $('#txt_fecha_involucrada_rep').val("");

        $("#cbox_estado").prop('required',true);
        $("#calendario_reporte_carros").prop('required',true);
        $("#calendario_reporte_clasificacion").prop('required',true);
        $("#cbox_estado").prop('required',true);
        $("#tipo_huevo").prop('required',true);
        $("#desde").prop('required',true);
        $("#hasta").prop('required',true);
        $('#txt_fecha_involucrada_rep').removeAttr('required');
   }
   
     function consulta_huevos_recibidos(fecha) {
    var cantidad_ccha="0";
    var cantidad_cchb="0";
    var cantidad_cchh="0";
    var cantidad_LDO="0";
    var ptc_ccha="0";
    var sc_ccha="0";
    var sc_cchb="0";
    var sc_cchh="0";
    var pr_ccha="0";
    var pr_cchh="0";
    var pr_cchb="0";
    
    var reproceso_ccha="0";
    var reproceso_LDO="0";
    
    var rotos_ccha="0";
    var subproductos_ccha="0";
    var subproductos="0";
    
    var ptc_cchb="0";
    var reproceso_cchb="0";
    var rotos_cchb="0";
    var subproductos_cchb="0";
        var ptc_lav_ccha="0";
        var ptc_lav_cchb="0";
        var ptc_lav_cchh="0";
        var ptc_ret_ccha="0";
        var ptc_ret_cchb="0";
        var ptc_ret_cchh="0";

    var ptc_cchh="0";
    var reproceso_cchh="0";
    var rotos_cchh="0";
    var subproductos_cchh="0";
    var ccha="CCHA";
    var cchb="CCHB";
    var cchh="CCHH";
      cargar_load();

         $.ajax({
            type: "POST",
            url: ruta_consultas_ptc+'consulta_huevos_recibidos.jsp',
            data: ({ fecha: fecha}),
            beforeSend: function() {
               $('#div_cargar').show();
                       },           
            success: function (data) {
            $('#div_cargar').hide();
           $.each(data.cantidades_clasificadoras,function(i, item)
           {    switch (item.Clasificadora) {
                case "CCHA":
                cantidad_ccha =item.Cantidad;           
                break;
                case "CCHB":
                cantidad_cchb =item.Cantidad;           
                  break;

                case "CCHH":
                cantidad_cchh =item.Cantidad;           
                  break;
               case "LAVADOS":
                cantidad_LDO =item.Cantidad;           
                  break; 
                
                  
              }    
              }    );
             
               $.each(data.cantidades_tipo,function(i, item)
           {    switch (item.clasificadora) {
                case "CCHA":
                 switch (item.tipo) {
                    case "REPROCESOS": 
                     reproceso_ccha=   item.Cantidad;
                    break;
                    case "SUBPRODUCTOS": 
                     subproductos_ccha=   item.Cantidad;
                    break;
                    case "ROTOS": 
                     rotos_ccha=   item.Cantidad;
                    break;
                    case "PTC": 
                     ptc_ccha=   item.Cantidad;
                    break;
                     case "SIN CLASIFICAR": 
                     sc_ccha=   item.Cantidad;
                    break;
                    case "PENDIENTE RECOGIDA":
                        pr_ccha =item.Cantidad;           
                    break;  
                
                 case "PTC LAVADOS": 
                     ptc_lav_ccha=   item.Cantidad;
                    break;
                    
                     case "PTC RETENIDOS": 
                     ptc_ret_ccha=   item.Cantidad;
                    break;
                
                
                
                 }
                           
                break;
                case "CCHB":
                    switch (item.tipo) 
                    {
                        case "REPROCESOS": 
                         reproceso_cchb=   item.Cantidad;
                        break;
                        case "SUBPRODUCTOS": 
                         subproductos_cchb=   item.Cantidad;
                        break;
                        case "ROTOS": 
                         rotos_cchb=   item.Cantidad;
                        break;
                        case "PTC": 
                         ptc_cchb=   item.Cantidad;
                        break;

                         case "SIN CLASIFICAR": 
                         sc_cchb=   item.Cantidad;
                        break;
                        case "PENDIENTE RECOGIDA":
                            pr_cchb =item.Cantidad;           
                        break;           
                       case "PTC LAVADOS": 
                     ptc_lav_cchb=   item.Cantidad;
                    break;
                  case "PTC RETENIDOS": 
                     ptc_ret_cchb=   item.Cantidad;
                    break;
                    } 
                break;
                 

                case "CCHH":
                    switch (item.tipo) {
                    case "REPROCESOS": 
                     reproceso_cchh=   item.Cantidad;
                    break;
                    case "SUBPRODUCTOS": 
                     subproductos_cchh=   item.Cantidad;
                    break;
                    case "ROTOS": 
                     rotos_cchh=   item.Cantidad;
                    break;
                    case "PTC": 
                     ptc_cchh=   item.Cantidad;
                    break;
                     case "SIN CLASIFICAR": 
                     sc_cchh=   item.Cantidad;
                    break;
                     case "PENDIENTE RECOGIDA":
                        pr_cchh =item.Cantidad;           
                    break;  
                       case "PTC LAVADOS": 
                     ptc_lav_cchh=   item.Cantidad;
                    break;
                  case "PTC RETENIDOS": 
                     ptc_ret_cchh=   item.Cantidad;
                    break;
                 }                  
                 break;
               
               
                case "LAVADOS":
                 reproceso_LDO=   item.Cantidad;
                break;
                
                 case "SUBPRODUCTOS":
                 subproductos=   item.Cantidad;
                break;
              }    
              }    );
             
               
                huevos_recibidos_grafico(cantidad_ccha,cantidad_cchb,cantidad_cchh,reproceso_ccha,subproductos_ccha,rotos_ccha,ptc_ccha,
               reproceso_cchb,subproductos_cchb,rotos_cchb,ptc_cchb,
               reproceso_cchh,subproductos_cchh,rotos_cchh,ptc_cchh,reproceso_LDO,cantidad_LDO,subproductos,sc_ccha,sc_cchb,
               sc_cchh,pr_ccha,pr_cchb,pr_cchh,ptc_lav_ccha,ptc_lav_cchb,ptc_lav_cchh,ptc_ret_ccha,ptc_ret_cchb,ptc_ret_cchh);
             } ,
            error: function (error) {
            //$.get(ruta_consultas_ptc+'generar_grilla_preembarque.jsp', function(res){$("#contenido").html(res.grilla); });
            consulta_huevos_recibidos("sad");
            }
        });
   
}

    function ir_reporte_generico(pagina){
                     
            $.ajax({
            type: "POST",
            url: ruta_contenedores_ptc+pagina+'.jsp',
             beforeSend: function() {
            cargar_load();
            
           
            
            
            
            
            $("#contenedor_principal").html('');
                            },           
            success: function (res) 
            
            {
            $('#div_cargar_menu').hide();
            $("#contenedor_principal").html(res);
            $("#contenedor_principal").show();
            cargar_estilo_calendario_insert("dd/mm/yyyy");              
            cerrar_load();




        $(function(){
  $(".accordion-titulo").click(function(e){
           
        e.preventDefault();
    
        var contenido=$(this).next(".accordion-content");

        if(contenido.css("display")=="none"){ //open		
          contenido.slideDown(250);			
          $(this).addClass("open");
        }
        else{ //close		
          contenido.slideUp(250);
          $(this).removeClass("open");	
        }

      });
});


            }
            
        });       }       
  

    function huevos_recibidos_grafico(
    c_ccha,c_cchb,c_cchh,reproceso_ccha,subproductos_ccha,rotos_ccha,ptc_ccha,
    reproceso_cchb,subproductos_cchb,rotos_cchb,ptc_cchb,
    reproceso_cchh,subproductos_cchh,rotos_cchh,ptc_cchh,reproceso_ldo,c_ldo,subproductos,sc_ccha,sc_cchb,sc_cchh,
    pr_ccha,pr_cchb,pr_cchh,ptc_lav_ccha,ptc_lav_cchb,ptc_lav_cchh,ptc_ret_ccha,ptc_ret_cchb,ptc_ret_cchh) 
    {
        var total=(parseFloat(parseInt(c_ccha)+parseInt(c_cchb)+parseInt(c_cchh)+parseInt(c_ldo)+parseInt(subproductos)));

        var totalA=(parseFloat(parseInt(reproceso_ccha)+parseInt(subproductos_ccha)+parseInt(rotos_ccha)+parseInt(ptc_ccha)+parseInt(sc_ccha)+parseInt(pr_ccha)+parseInt(ptc_ret_ccha)+parseInt(ptc_lav_ccha)));
        var totalB=(parseFloat(parseInt(reproceso_cchb)+parseInt(subproductos_cchb)+parseInt(rotos_cchb)+parseInt(ptc_cchb)+parseInt(sc_cchb)+parseInt(pr_cchb)+parseInt(ptc_ret_cchb)+parseInt(ptc_lav_cchb)));
        var totalH=(parseFloat(parseInt(reproceso_cchh)+parseInt(subproductos_cchh)+parseInt(rotos_cchh)+parseInt(ptc_cchh)+parseInt(sc_cchh)+parseInt(pr_cchh)+parseInt(ptc_ret_cchh)+parseInt(ptc_lav_cchh)));
        var totalVisitors = 883000;
        var visitorsData = {
	"Clasificadoras": [{
		click: visitorsChartDrilldownHandler,
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Totales recibidos: "+total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                indexLabel: "{y}",
		indexLabelFontColor: "#000000",
		indexLabelPlacement: "inside",
                fontSize: 16,
		fontColor: "black",
                 fontWeight: "bold",
		padding: 5,
                  indexLabelFontWeight: "bold",
		      toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

		dataPoints: [
                    
			{ y: parseInt(c_ccha),              name: "Clasificadora A",    label: "Clasificadora A" ,color: "green" ,},
			{ y: parseInt(c_cchb),              name: "Clasificadora B",    label: "Clasificadora B" ,color:"#ff0d11" },
			{ y: parseInt(c_cchh),              name: "Clasificadora H",    label: "Clasificadora H" ,color: "#ffff00"},
			{ y: parseInt(c_ldo),               name: "Lavados",            label: "Lavados" ,color: "pink"},
			{ y: parseInt(subproductos),        name: "Subproductos",       label: "Subproductos" ,color: "cyan"}
                ]
	}],
	"Clasificadora A": [{
		color: "#000000",
		name: "Clasificadora A",
		type: "column",
                indexLabelFontColor: "#000000",
                indexLabelFontWeight: "bold",
 		legendText: "Totales recibidos: "+totalA.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                type: "column",  
		showInLegend: true, 
		indexLabelPlacement: "inside",
		legendMarkerColor: "black",
                indexLabel: "{y}",
                type: "column",
                toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

                dataPoints: 
                [
			 
                    { y: parseInt(ptc_ccha),                label: "PTC" ,                  color: "green" },
                    { y: parseInt(ptc_lav_ccha),            label: "RETENIDO LAVADOS" ,     color: "green" },
                    { y: parseInt(ptc_ret_ccha),            label: "PTC RETENIDOS" ,        color: "red" },
                    { y: parseInt(reproceso_ccha),          label: "REPROCESO" ,            color: "yellow"},
                    { y: parseInt(subproductos_ccha),       label: "SUBPRODUCTOS",          color: "#3a7df2"  },
                    { y: parseInt(rotos_ccha),              label: "ROTOS" ,                color: "red" },
                    { y: parseInt(sc_ccha),                 label: "HUEVOS SIN CLASIFICAR", color: "gray" },
                    { y: parseInt(pr_ccha),                 label: "PENDIENTE RECOGIDA",    color: "#47ff3d" }
                ] 
                
	
    
                     }],
	"Clasificadora B": [{
               
		color: "#E7823A",
		name: "Clasificadora B",
		type: "column",
                indexLabelFontWeight: "bold",
                showInLegend: true, 
 		legendText: "Totales recibidos: "+totalB.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
                indexLabel: "{y}",
		indexLabelFontColor: "#000000",
		indexLabelPlacement: "inside",
		      toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

                    dataPoints: 
                [
			 
                        { y: parseInt(ptc_cchb),            label: "PTC" ,                  color: "green" },
                        { y: parseInt(ptc_lav_cchb),        label: "RETENIDO LAVADOS" ,     color: "green" },
                        { y: parseInt(ptc_ret_cchb),        label: "PTC RETENIDOS" ,        color: "red" },
			{ y: parseInt(reproceso_cchb),      label: "REPROCESO",             color: "yellow" },
			{ y: parseInt(subproductos_cchb),   label: "SUBPRODUCTOS" ,         color: "#3a7df2" },
			{ y: parseInt(rotos_cchb),          label: "ROTOS",                 color: "red"  },
			{ y: parseInt(sc_cchb),             label: "HUEVOS SIN CLASIFICAR", color: "gray" },
                        { y: parseInt(pr_cchb),             label: "PENDIENTE RECOGIDA" ,   color: "#47ff3d" }

                ]
	}],
    
    "Clasificadora H": [{
		color: "#E7823A",
		name: "Clasificadora H",
		type: "column",
                showInLegend: true, 
                indexLabelFontWeight: "bold",
                type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Totales recibidos: "+totalH.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                indexLabel: "{y}",
		indexLabelFontColor: "#000000",
		indexLabelPlacement: "inside",
		      toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

                    dataPoints: 
                [
			 
                        { y: parseInt(ptc_cchh),            label: "PTC",                   color: "green" },
                        { y: parseInt(ptc_lav_cchh),        label: "RETENIDO LAVADOS" ,     color: "green" },
                        { y: parseInt(ptc_ret_cchh),        label: "PTC RETENIDOS" ,        color: "red" },
			{ y: parseInt(reproceso_cchh),      label: "REPROCESO" ,            color: "yellow"},
			{ y: parseInt(subproductos_cchh),   label: "SUBPRODUCTOS" ,         color: "#3a7df2" },
			{ y: parseInt(rotos_cchh),          label: "ROTOS" ,                color: "red" },
			{ y: parseInt(sc_cchh),             label: "HUEVOS SIN CLASIFICAR" ,color: "gray" },
                        { y: parseInt(pr_cchh),             label: "PENDIENTE RECOGIDA" ,   color: "#47ff3d" }

                ]
	}],
    
    "Lavados": [{
		color: "#E7823A",
		name: "Lavados",
		type: "column",
                showInLegend: true, 
                indexLabelFontWeight: "bold",
                type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Totales recibidos: "+reproceso_ldo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                indexLabel: "{y}",
		indexLabelFontColor: "#000000",
		indexLabelPlacement: "inside",
		      toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

                    dataPoints: 
                [
			 
                      //   { y: parseInt(0),              label: "PTC",           color: "green" },
			{ y: parseInt(reproceso_ldo),   label: "TRADICIONAL REPROCESO" ,    color: "yellow"},
			//{ y: parseInt(0),               label: "SUBPRODUCTOS" , color: "#3a7df2" },
			//{ y: parseInt(0),               label: "ROTOS" ,        color: "red" }
                ]
	}],
    
    "Subproductos": [{
		color: "#E7823A",
		name: "Subproductos",
		type: "column",
                showInLegend: true, 
                indexLabelFontWeight: "bold",
                type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Totales recibidos: "+subproductos.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."),
                indexLabel: "{y}",
		indexLabelFontColor: "#000000",
		indexLabelPlacement: "inside",
		      toolTipContent: "<a  {name}> {label}</a><hr/>Total: {y}",                

                    dataPoints: 
                [
			 
                        
			{ y: parseInt(subproductos),    label: "SUBPRODUCTOS TRADICIONAL" , color: "#3a7df2" },
                 ]
	}]
};

var newVSReturningVisitorsOptions = {
	animationEnabled: true,
	theme: "dark",
	title: {
		text: "Huevos Recibidos Maehara"
	},
	subtitles: [{
		text: "Clic en cualquier columna para visualizar detalle.",
		backgroundColor: "#fff58c",
		fontSize: 16,
		fontColor: "black",
		padding: 5
	}],
	legend: {
		fontFamily: "calibri",
		fontSize: 14,
		itemTextFormatter: function (e) {
			return e.dataPoint.name + ": WEQE" + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
		}
	},
	data: []
};

var visitorsDrilldownedChartOptions = {
	animationEnabled: true,
	theme: "dark",
	axisX: {
		labelFontColor: "#717171",
		lineColor: "#080101",
		tickColor: "#a2a2a2"
	},
	axisY: {
		gridThickness: 0,
		includeZero: false,
		labelFontColor: "#717171",
		lineColor: "#080101",
		tickColor: "#a2a2a2",
		lineThickness: 1
	},
	data: []
};

var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
chart.options.data = visitorsData["Clasificadoras"];
chart.render();
 
function visitorsChartDrilldownHandler(e) {
	chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.name];
	chart.options.title = { text: e.dataPoint.name }
	chart.render();
        $( "#backButton" ).removeClass( "invisible" )
}
 
 
$("#backButton").click(function() { 
	$(this).toggleClass("invisible");
	chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["Clasificadoras"];
	chart.render();
 
}); 
      cerrar_load();
      $('#btn_buscar').show();
      
      
 }
 
    function ir_pendientes_recogidas()
    {    
       
        $.ajax(
            {
                type: "POST",
                url: ruta_contenedores_ptc+'contenedor_registro_pendientes_recogidas.jsp',
                beforeSend: function() 
                {
                     cargar_load();
                     $("#contenedor_principal").html('');
                },           
                success: function (res) 
                {
                    cerrar_load();
                    $('#div_cargar_menu').hide();
                    $("#contenedor_principal").html(res);
                    $("#contenedor_principal").show();
                    cargar_estilo_calendario_insert('dd/mm/yyyy');
 
                    $('#formulario').on('submit', function(event)
                    {
                        event.preventDefault();
                        registrar_pendientes_recogidas();
                        event.stopPropagation();
                    });     
                //   cerrar_load();

                },
                 error: function (error) {
                     ir_pendientes_recogidas();
                 }
            });   
    }    
    
    function registrar_pendientes_recogidas()
    {
        
        if($('#fecha_puesta').val()==""){
            swal.fire({
            type: 'error',
            title: "INGRESE FECHA DE PUESTA",
            confirmButtonText: "CERRAR"
        }); 
        }
        else {
            
       Swal.fire({
        title: 'CONFIRMACION',
        text: "DESEA REGISTRAR LOS DATOS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, REGISTRAR!',
        cancelButtonText: 'NO, CANCELAR!' }).then((result) => 
        {
            if (result.value) 
            {
                $.ajax({
                type: "POST",
                url: ruta_controles_ptc+'control_registro_pendientes_recogidas.jsp',
                data: $("#formulario").serialize(),
                beforeSend: function() 
                {
                    Swal.fire({
                    title: 'PROCESANDO!',
                    html: 'ESPERE<strong></strong>...',
                    allowOutsideClick: false,
                    onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                    Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft()
                        }, 1000);
                    } 
                    });
                },           
            success: function (res) 
            {
                aviso_registro_general(res.tipo_respuesta,res.mensaje,"registroRecogida")            
            }
                });
               
                
            }
            }); 
          } 
    }
 
    function liberar_recogida(id, mensaje,estado){
           Swal.fire({
        title: 'CONFIRMACION',
        text: mensaje,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'ACEPTAR!',
        cancelButtonText: 'CANCELAR!' }).then((result) => 
        {
            if (result.value) 
            {
                $.ajax({
                type: "POST",
                url: ruta_controles_ptc+'control_liberar_pendientes_recogidas.jsp',
                data: ({id:id,estado:estado}),
                beforeSend: function() 
                {
                    Swal.fire({
                    title: 'PROCESANDO!',
                    html: 'ESPERE<strong></strong>...',
                    allowOutsideClick: false,
                    onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                    Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft()
                        }, 1000);
                    } 
                    });
                },           
            success: function (res) 
            {
                aviso_registro_general(res.tipo_respuesta,res.mensaje,"registroRecogida");
            }
                });
               
                
            }
            }); 
    
        
    }
    
    function grilla_recogidas_liberadas()
    {
        
        var html ="<a>LISTADO DE HUEVOS LIBERADOS EN RECOGIDAS</a><br><br><br>\n\
                <input type='text' value='INGRESE MES' class='form-control from_date' id='txt_mes' name='txt_name' >\n\
                <br></hr> <div id='contenido_grilla_liberadas' ></div>";
        
          swal.fire({
              html: html,
            showConfirmButton:false
         }); 
         
         $('.from_date').pickadate({
            today: 'Ok',
            format: 'yyyy-mm',
            //min: new Date(),
            formatSubmit: 'yyyy-mm-dd',
            hiddenPrefix: 'prefix__',
            hiddenSuffix: '__suffix',
            selectYears: true,
            selectMonths: true,
          });
          
          $(document).on('change','#txt_mes',function(){
          
             $.ajax({
                type: "POST",
                url: ruta_consultas_ptc+'generar_grilla_reco_liberados.jsp',
                data: ({fecha_puesta:$('#txt_mes').val() }),
                beforeSend: function() 
                {
                    cargar_load();
                },           
            success: function (res) 
            {
                $('#contenido_grilla_liberadas').html(res.grilla);
                cerrar_load();
            }
                });
          }); 
    }
    
    function huevos_sc_liberar()
    {  
        
        var html ="<div style='display:none' class='alert alert-danger alert-dismissible fade show' role='alert' id='div_alerta'> \n\
          </div> \n\
        <a>LISTADO DE HUEVOS PENDIENTES DE ALIMENTACION</a><br><br><a>FECHA DE ALIMENTACION</a> \n\
                <input type='text' placeholder='INGRESE FECHA DE ALIMENTACION' class='form-control datepicker' id='txt_fecha' name='txt_fecha' >\n\
                <br><input type='button' value='LIBERAR' class='form-control' id='btnLiberar' name='btnLiberar' >\n\
                 <br></hr> <div id='contenido_grilla_liberadas' ></div> ";
        
          swal.fire({
              html: html,
            showConfirmButton:false
         }); 
         
         cargar_estilo_calendario_insert("dd/mm/yyyy");
          
           
             $.ajax({
                type: "POST",
                url: ruta_consultas_ptc+'generar_grilla_sc_liberar.jsp',
                data: ({fecha_puesta:$('#txt_mes').val() }),
                beforeSend: function() 
                {
                    cargar_load();
                },           
            success: function (res) 
            {
                $('#contenido_grilla_liberadas').html(res.grilla);
                cerrar_load();
                
                $('.checkBoxChecked').on('click', function()
                {
                    var checkbox = $(this).find('.Aps_checkbox');
                    checkbox.prop("checked", !checkbox.prop("checked"));
                });
                $("#box_reproceso").on('click',function()
                {
                    var checked = $("#box_reproceso").prop('checked');
                    $('#contenido_grilla_liberadas').find('input:checkbox').prop('checked', checked);
                });
                
                $('#btnLiberar').on('click', function()
                {
                    var arr = $('[name="checks[]"]:checked').map(function()
                    {
                        return this.value;
                    }).get();
                    var resultado_seleccionado = arr.join(',');
                    
                    if(resultado_seleccionado.length==0)
                    {
                        $('#div_alerta').show();
                        $('#div_alerta').html("<strong><center>DEBE SELECCIONAR LOTES.</center></strong>   ");
                        $("#div_alerta").fadeTo(10000, 5000).slideUp(5000, function() 
                        {
                            $("#div_alerta").slideUp(5000);
                        });
                    }
                    else if( $('#txt_fecha').val().length==0)
                    {
                        $('#div_alerta').show();
                        $('#div_alerta').html("<strong><center>DEBE INGRESAR LA FECHA DE ALIMENTACION.</center>");
                        $("#div_alerta").fadeTo(10000, 5000).slideUp(5000, function() 
                        {
                            $("#div_alerta").slideUp(5000);
                        });
                    }
                    else
                    {
                        $.ajax(
                        {
                            type: "POST",
                            url: ruta_controles_ptc+'control_liberar_sc.jsp',
                            data: ({fecha_alimentacion:$('#txt_fecha').val(),contenido:resultado_seleccionado}),
                            beforeSend: function() 
                            {
                                Swal.fire({
                                title: 'PROCESANDO!',
                                html: 'ESPERE<strong></strong>...',
                                allowOutsideClick: false,
                                onBeforeOpen: () => {
                                Swal.showLoading()
                                timerInterval = setInterval(() => {
                                Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft()
                                    }, 1000);
                                } 
                                });
                            },           
                            success: function (res) 
                            {
                                aviso_registro_general(res.tipo_respuesta,res.mensaje,"LiberacionSC");
                            }
                        });
                    }
                });
            },
              error: function (res) 
            {
                  cerrar_load();
                   huevos_sc_liberar();
            }
                });
        }
    
    function aviso_registro_general(tipo,mensaje,modulo){
        if(tipo=="1")
       {
            swal.fire({
            type: 'success',
            text:mensaje,
            confirmButtonText: "CERRAR"
                });
          if(modulo=="registroRecogida"){
              ir_pendientes_recogidas();
          }
          else if(modulo=="LiberacionSC"){
              
          }
             else if(modulo=="ptc_alimentacion"){
              ir_registro_carros_alimentados();
          }
       }
         else {
           swal.fire({
                type: 'error',
                html:mensaje,
                confirmButtonText: "CERRAR"
                });  
       }
        
   }    

 