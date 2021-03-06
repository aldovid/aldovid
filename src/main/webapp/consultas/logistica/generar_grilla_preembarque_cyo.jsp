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
<%@include  file="../../chequearsesion.jsp" %>
<%@page contentType="application/json; charset=utf-8" %>
<%     
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    String area       = (String) sesionOk.getAttribute("area_log");
    String id_camion            = request.getParameter("id_camion");
    String id_pedido            = request.getParameter("id_pedido");
    
    JSONObject ob = new JSONObject();
    String area_form="";
    if(area.equals("A")){
        area_form="CCHA"; 
    }
    else if(area.equals("B")){
        area_form="CCHB"; 
    }
    else if(area.equals("H")){
        area="CCHH"; 
    }
    else if(area.equals("O")){
        area_form="LAVADOS"; 
    }
    else if(area.equals("C")){
        area_form="CYO"; 
    }
        String grilla_html="";
        String cabecera="  "
            + " "
            + " "
            + " <table id='tb_preembarque' class='display compact' style='width: 100%;'>"
            + "<thead>"
            + " <tr>"
            + "<th rowspan='2'  style='color: #fff;' class='bg-navy'><b>Fecha puesta</b></th>  "
            + " <th rowspan='2' class='bg-navy' ><b>Tipo</b></th>  "
            + " <th colspan='10'  style='color: #fff;'   class='bg-navy text-center'  ><b><a id='td_"+area_form+"'>"+area_form+ "</a></b></th>   </tr>"
            + " <tr>" 
            + " <th  style='color: #fff;   ' class='bg-navy'>LIB</th>      <th style='color: #fff;' class='bg-navy'>Cant</th>"
            + " <th  style='color: #fff;  'class='bg-navy'>Acep</th>      <th style='color: #fff; 'class='bg-navy' >Cant</th>"
            + " <th  style='color: #fff;  'class='bg-navy'>Invo</th>      <th  style='color: #fff;  'class='bg-navy'>Cant</th>"
            + " <th  style='color: #fff;  'class='bg-navy'>LDO</th>      <th  style='color: #fff;  'class='bg-navy'>Cant</th>  "
            + " <th  style='color: #fff;  'class='bg-navy'>Pallet</th>      <th  style='color: #fff;  'class='bg-navy'>Cant</th>"
            + " </tr>"
            + "</thead> <tbody >";
   
     if(area.equals("O"))
     {
         cabecera=" "
            + " "
            + " "
            + "  "
            + "<table id='tb_preembarque' class='table table-bordered table-hover' style='width:50%'>"
            + "<thead>"
            + " <tr>"
            + "<th rowspan='2'  style='color: #fff;'><b>Fecha puesta</b></th>  "
            + " <th rowspan='2' ><b>Tipo</b></th>  "
            + " <th colspan='6' class='text-center'   class='bg-navy'   ><b><a id='td_"+area_form+"'>"+area_form+ " </a></b></th>   </tr>"
            + " <tr>" 
            + " <th  style='color: #fff;  black;' >LIB</th>              <th style='color: #fff;' class='bg-navy' >Cant</th>"
            + " <th  style='color: #fff;  'class='bg-navy'>Acep</th>     <th style='color: #fff;  'class='bg-navy' >Cant</th>"
            + " <th  style='color: #fff;  'class='bg-navy'>Invo</th>     <th  style='color: #fff;  'class='bg-navy'>Cant</th>"
            + " <th  style = 'display:none' style='color: #fff;  'class='bg-navy' >LDO</th>      <th  style = 'display:none' style='color: #fff;  'class='bg-navy'>Cant</th>  "
            + " <th  style='color: #fff;  'class='bg-navy'>Pallet</th>      <th  style='color: #fff;  'class='bg-navy'>Cant</th>"
            + " </tr>"
            + "</thead> <tbody >";
     }
    try 
    {
        ResultSet rs,rs2,rs3;
        rs = fuente.obtenerDato(" exec mae_log_select_reserva_camion_modificacion_cyo @id_camion="+id_camion+"  , @area='"+area_form+"'");
     
        while(rs.next())
        {
            grilla_html=grilla_html+rs.getString("tr");
        }
        
         rs2 = fuente.obtenerDato("  select tipo_huevo "
                + "     from mae_log_ptc_det_pedidos2 a "
                + "     inner join mae_log_ptc_cab_pedidos b on a.id_cab=b.id where  b.id_camion="+id_camion+" "
                + "     and b.estado=2 group by tipo_huevo");
        String huevos_cargados="";
        int i=0;
        while(rs2.next())
        {
            if(i==0){
              huevos_cargados=rs2.getString("tipo_huevo");  
            }
            else{
              huevos_cargados=huevos_cargados+","+rs2.getString("tipo_huevo");  
            }
            i++;
        }
        rs3= fuente.obtenerDato("   select sum(cantidad) as cantidad,tipo_huevo from mae_log_ptc_det_pedidos2 where estado=2 and id_cab="+id_pedido+" and u_medida='ENTERO' group by tipo_huevo");
        String grilla_tipos="";
        int c=0;
        while(rs3.next())
        {
            if(c==0){
              grilla_tipos="<input type='hidden' id='"+rs3.getString("tipo_huevo")+"' texto='true' cantidad='"+rs3.getString("cantidad")+"' cargado='"+rs3.getString("cantidad")+"' tipo_huevo='"+rs3.getString("tipo_huevo")+"' value='"+rs3.getString("cantidad")+"' ><br>" ;  
            }
            else{
              grilla_tipos=grilla_tipos+"<input type='hidden' id='"+rs3.getString("tipo_huevo")+"' texto='true' cantidad='"+rs3.getString("cantidad")+"' cargado='"+rs3.getString("cantidad")+"' tipo_huevo='"+rs3.getString("tipo_huevo")+"' value='"+rs3.getString("cantidad")+"' ><br>";  
            }
            c++;
        }
        	

        
        ob=new JSONObject();
        ob.put("grilla",cabecera+grilla_html+"</tbody></table> ");
        ob.put("huevos_cargados",huevos_cargados);
        ob.put("grilla_tipos",grilla_tipos);
    } catch (Exception e) 
    {
        String error=e.getMessage();
    }
    finally 
    {
        clases.controles.DesconnectarBD();
        out.print(ob);
    }
%>