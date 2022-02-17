<%-- 
    Document   : contenedor_crear_roles_area
    Created on : 20/12/2021, 16:10:04
    Author     : csanchez
--%>

<%@page import="consultas_java.modelos"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<jsp:useBean id="conexion" class="clase.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clase.fuentedato" scope="page"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="../chequearsesion.jsp" %>
 <%
    clase.controles.VerificarConexion();
    fuente.setConexion(clase.controles.connectSesion); 
      String combo_opciones = (String) sesionOk.getAttribute("combo_opciones");
      String combo_nivel = (String) sesionOk.getAttribute("combo_nivel");
 
      modelos.cargar_roles();
   %>
 
   <input type="button" style="font-weight: bold;color:black;" value="CREAR AREA" class="form-control bg-success color_letra" data-toggle="modal"   data-target="#modal_add_area"  onclick="ir_grilla_areas();$('#area').val('');">
   <br>
   <input type="button" style="font-weight: bold;color:black;" value="CREAR ROL" class="form-control bg-primary color_letra" data-toggle="modal"  data-target="#modal_add_rol"     onclick="ir_grilla_roles();$('#rol').val('');">
   <br>
   <input type="button" style="font-weight: bold;color:black;" value="AGREGAR ACCESOS A ROLES" class="form-control bg-warning color_letra" data-toggle="modal"  data-target="#modal_add_vinculacion_rol"  onclick="cargar_rol();$('#rol').val('');">
   <input type="hidden" id="txt_areas_asignadas" >
   
   <div id="grilla_usuarios">
     
    </div>
   
    <form id="form_add_area" action="post">
 
    <div class="modal fade" id="modal_add_area" tabindex="-1" role="dialog"  data-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">REGISTRO DE NUEVO AREA</h5>
            <button class="close" type="button" style="font-weight: bold;color:black;" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <a>AREA</a>
            <input type="text" placeholder="INGRESE NUEVA AREA"  autocomplete="off"     name="area" id="area" required>            
            
          </div>
          <div class="modal-footer">
              <input type="submit" class="form-control btn btn-success"  id="btn_add_usuario" value="REGISTRAR" >
            <br>
        <button class="form-control btn btn-secondary" type="button" style="font-weight: bold;color:black;" data-dismiss="modal">CANCELAR</button> 

          </div>
            
            <div id="div_table_area"></div>
        </div>
      </div>
    </div></form>
               
    <form id="form_add_rol" action="post">
 
    <div class="modal fade" id="modal_add_rol" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">REGISTRO DE NUEVO ROL</h5>
            <button class="close" type="button" style="font-weight: bold;color:black;" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <a>ROL</a>
            <input type="text" placeholder="INGRESE NUEVO ROL"  autocomplete="off"     name="rol" id="rol" required>            
             
            </div>
          
          <div class="modal-footer">
              <input type="submit" class="form-control btn btn-success"  id="btn_add_usuario" value="REGISTRAR" >
            <br>
        <button class="form-control btn btn-secondary" type="button" style="font-weight: bold;color:black;" data-dismiss="modal">CANCELAR</button> 
        </div>
            <div id="div_table_rol"></div>

         </div>
      </div>
    </div></form>         
            
            
  <form id="form_add_vinculacion_rol" action="post">
 
    <div class="modal fade" id="modal_add_vinculacion_rol" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">VINCULACION DE OPCIONES A ROLES</h5>
            <button class="close" type="button" style="font-weight: bold;color:black;" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
            <div class="modal-body">
                <a>ROL</a><br>
                <select class="form-control color_letra" id="cbox_rol" required onchange="seleccionar_opciones()">
                   
                </select>
                <br>
                <a>OPCIONES DE LA APP</a>
                <select class="form-control" title="SELECCIONE OPCIONES" id="select_opciones" data-style="btn-dark" name="select_opciones" required  multiple data-live-search="true">
                    <%=combo_opciones%>                
                </select>
                <input id="contenido_multiple_opciones" type="hidden">
           </div>
          
          <div class="modal-footer">
              <input type="submit" class="form-control btn btn-success"  id="btn_add_usuario" value="REGISTRAR" >
            <br>
        <button class="form-control btn btn-secondary" type="button" style="font-weight: bold;color:black;" data-dismiss="modal">CANCELAR</button> 
        </div>
         </div>
      </div>
    </div></form>    
                <script src="../js/llamadas_claudio.js" type="text/javascript"></script>
