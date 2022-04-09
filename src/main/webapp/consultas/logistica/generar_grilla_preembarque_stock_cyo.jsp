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
        String cabecera= 
            "<table id='tb_preembarque' class='display compact hover cell-border stripe' style='width:50%'>"
            + "<thead>"
            + " <tr>"
            + "  "
            + " "
            + " <th colspan='12' class='text-center' style='color: #fff; background: black;  ' ><b><a id='td_"+area_form+"'>"+area_form+ "</a></b></th>   </tr>"
            + " <tr>" 
            + "<th   style='color: #fff; background: black;'><b>Fecha puesta</b></th>"
                + " <th  style='color: #fff; background: black;' ><b>Tipo</b></th>  "
                + "<th  style='color: #fff; background: black;' >LIB</th>       "
            + " <th  style='color: #fff; background: black;'>Acep</th>     "
            + " <th  style='color: #fff; background: black;'>Invo</th>      "
            + " <th  style='color: #fff; background: black;'>LDO</th>        "
            + " <th  style='color: #fff; background: black;'>Pallet</th>    "
            + " </tr>"
            + "</thead> <tbody >";
   
     if(area.equals("O"))
     {
         cabecera=  "<table id='tb_preembarque' class='display compact hover cell-border stripe' style='width:50%'>"
            + "<thead>"
            + " <tr>"
            + "  "
            + " "
            + " <th colspan='12' class='text-center' style='color: #fff; background: black;  ' ><b><a id='td_"+area_form+"'>"+area_form+ "</a></b></th>   </tr>"
            + " <tr>"  
            + " <th  style='color: #fff; background: black;' >LIB</th>     "
            + " <th  style='color: #fff; background: black;'>Acep</th>   "
            + " <th  style='color: #fff; background: black;'>Invo</th>      "
            + " <th  style = 'display:none' style='color: #fff; background: black;' >LDO</th>        "
            + " <th  style='color: #fff; background: black;'>Pallet</th>     "
            + " </tr>"
            + "</thead> <tbody >";
     }
    try 
    {
        
        ResultSet rs,rs2,rs3;
        
        rs2 = fuente.obtenerDato(" exec mae_log_stock_pedidos_maehara_3 @tipo=1 ,@id_pedido=0");
        while(rs2.next())
        {
         }
              
        rs = fuente.obtenerDato(" exec mae_log_select_stock_cyo  @area='"+area_form+"'");
     
        while(rs.next())
        {
            grilla_html=grilla_html+rs.getString("tr");
        }
         

        
        ob=new JSONObject();
        ob.put("grilla",cabecera+grilla_html+"</tbody></table>");
         
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