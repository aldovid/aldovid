<%-- 
    Document   : generar_grilla_preembarque
    Created on : 16-sep-2021, 8:37:03
    Author     : hvelazquez
--%>
<%@page import="org.json.JSONArray"%>
<%@page import="clases.controles"%>
<%@page import="clases.fuentedato"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8" %>

<%     
     clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
 try {
         
    ResultSet rs,rs2,rs3,rs5;
    String grilla_html="";
     
    
     String cabecera="   "
           
            
             + "<table id='tb_preembarque' class='compact ' style='width:100%'>"
            + "<thead>"
            + " <tr >"
                + " <th rowspan='1'     style='color: #fff; background:     black;' ><b> </b></th>  "
                + " <th rowspan='1'     style='color: #fff; background:     brown;font-weight:bold'  ><b></b></th>  "
                + " <th colspan='10' class='text-center'    id='th_ccha' style='color: #fff; background: black;'     ><b>    <a id='td_ccha'>CCHA TOTAL CARGADOS:0   </a></b></th>   "
                + " <th colspan='10' class='text-center'    id='th_cchb'  style='color: #fff; background: green;'     ><b>    <a id='td_cchb'>CCHB TOTAL CARGADOS:0   </a></b></th>   "
                + " <th colspan='10' class='text-center'    id='th_cchh' style='color: #fff; background: black;'     ><b>    <a id='td_cchh'>CCHH TOTAL CARGADOS:0   </a></b></th>   "
                + " <th colspan='8' class='text-center'     id='th_ovo'  style='color: #fff; background: green;'     ><b>    <a id='td_ovo'>LAVADOS TOTAL CARGADOS:0 </a></b></th>   "
                + " <th colspan='10' class='text-center'    id='th_cyo'  style='color: #fff; background: black;'     ><b>    <a id='td_cyo'>CYO TOTAL CARGADOS:0     </a></b></th>   "
            + "</tr>"
            
            + " <tr>" 
                + " <th       style='color: #fff; background:     black;'   > Fecha puesta  </th>     "
                + " <th     style='color: #fff; background:     brown;font-weight:bold' >  Tipo  </th>       "
                + " <th  style='color: #fff; background: black;' >LIB   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Acep   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Invo   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>LDO    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Pal    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: green;' >LIB   </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Acep   </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Invo   </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>LDO    </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Pal    </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>LIB    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Acep   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Invo   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>LDO    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Pal    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>LIB    </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Acep   </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Invo   </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: green;'>Pal    </th>        <th  style='color: #fff; background: green;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>LIB    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Acep   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Invo   </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>LDO    </th>        <th  style='color: #fff; background: black;'>Res</th>"
                + " <th  style='color: #fff; background: black;'>Pal    </th>        <th  style='color: #fff; background: black;'>Res</th>"
            + "</tr>"
            + "</thead> <tbody >";
       rs = fuente.obtenerDato("exec [mae_log_select_reserva_directorio]  ");
    
      while(rs.next())
        {
            grilla_html=grilla_html+rs.getString("tr");
         }
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        

              String cabecera_mixto="<div id='second'  style='width:50%'  '> "
                      + " <table id='tb_preembarque_mixto' class='stripe order-column dataTable no-footer' style='width:100%'>"
            + "<thead>"
               + " <tr>"
            + "<th colspan='6'  style='color: #fff; background: black;'  class='text-center'  ><b>CARROS MIXTOS</b></th>  </tr>"
            + "<tr>"
            + "<th  style='color: #fff; background: black;'>CARRO</th>      "
               + "<th style='color: #fff; background: green;' >AREA</th>"
               + "<th style='color: #fff; background: green;' >PUESTA</th>"
               + "<th style='color: #fff; background: green;' >DETALLE CAJONES</th>"
               + "<th style='color: #fff; background: green;' >ESTADO</th>"
             + "</tr>"
            + "</thead> <tbody > ";
              
                      
        String grilla_html2 ="";  
         rs2 = fuente.obtenerDato("   select * from v_mae_log_mixtos_directorio order by 1,4");
        String cod_carrito="";
        String cajones_unidos="";
        String fp_unido="";
        String td_estado="";
        String area_unido="";
        String cod_carro_bd="";
        String tipo_huevo_bd="";
        int f=0;
        while(rs2.next())
        {
           cod_carro_bd=rs2.getString("cod_carrito");
           tipo_huevo_bd=rs2.getString("tipo_huevo");
           
           if(f==0){
              cod_carrito=rs2.getString("cod_carrito");
                fp_unido=rs2.getString("fecha_puesta");
                area_unido=rs2.getString("clasificadora_actual");
                cajones_unidos=cajones_unidos+rs2.getString("tipo_huevo")+":"+rs2.getString("cantidad_caj"); 
                td_estado=rs2.getString("estado");
           }
           else if(cod_carrito.equals(""))
            {
                cod_carrito=fp_unido;
                fp_unido=fp_unido;
                area_unido=area_unido;
                cajones_unidos=cajones_unidos;
                td_estado=rs2.getString("estado");
            }
            else if(cod_carrito.equals(rs2.getString("cod_carrito")))
            {
                 cajones_unidos=cajones_unidos+","+rs2.getString("tipo_huevo")+":"+rs2.getString("cantidad_caj");
                td_estado=rs2.getString("estado");
            }
            else
            {
                grilla_html2=grilla_html2+ 
                "<tr>" + 
                "<td style='font-weight:bold' >"+cod_carrito+"</td>"+  
                "<td style='font-weight:bold'  >"+area_unido+"</td>"+   
                "<td style='font-weight:bold'  >"+fp_unido+"</td>"+ 
                "<td style='font-weight:bold' class='something' >"+cajones_unidos+"</td>"+ " "
                +td_estado
                + "</tr>";
                cod_carrito="";
                cajones_unidos="";
                fp_unido="";
                area_unido="";
                
                cod_carrito=rs2.getString("cod_carrito");
                fp_unido=rs2.getString("fecha_puesta");
                area_unido=rs2.getString("clasificadora_actual");
                cajones_unidos=cajones_unidos+rs2.getString("tipo_huevo")+":"+rs2.getString("cantidad_caj");
                
            }
            f++; 
        }
        
        if(f>0){ //LA ULTIMA FILA YA NO TRAE, ENTONCES CONSULTO SI EXISTIO ENTONCES TRAE.
             grilla_html2=grilla_html2+ 
                "<tr>" + 
                "<td style='font-weight:bold' >"+cod_carrito+"</td>"+  
                "<td style='font-weight:bold'  >"+area_unido+"</td>"+   
                "<td style='font-weight:bold'  >"+fp_unido+"</td>"+ 
                "<td style='font-weight:bold' class='something' >"+cajones_unidos+"</td>"+ " "
                      +   td_estado
                + "</tr>";
        }
        
        
        
        
         ResultSet rs4 = fuente.obtenerDato("select * from v_mae_log_reserva_directorio_mensaje order by estado ");
    String mensaje_div="";
      while(rs4.next())
        {
            mensaje_div=mensaje_div+rs4.getString("ESTADO_tr");
         }
        
        
        
        
        
    String asd="    <div class='media'>           <div class='media-body'>            "
            + "     <h3 class='dropdown-item-title'>   En reserva <span class='float-right text-sm text-success'><i class='fas fa-star'></i></span>  </h3>          "
            + "     <p class='text-sm'>Tipo J 360 Docenas </p>   <p class='text-sm text-muted'><i class='far fa-clock mr-1'>        "
            + "     </i> </p>  </div>  </div> <div class='dropdown-divider'></div>";
        
        
        
        
        
        
        ob.put("grilla",cabecera+grilla_html+"</tbody></table>");
        ob.put("grilla_mixto",cabecera_mixto+grilla_html2+"</tbody></table></div></div></div></div>");
        ob.put("mensaje_div",mensaje_div);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        out.print(ob); 
     } catch (Exception e) {
     }
finally{
        clases.controles.DesconnectarBD();
 }
     %> 