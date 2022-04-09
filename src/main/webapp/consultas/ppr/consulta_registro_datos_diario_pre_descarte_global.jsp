<%-- 
    Document   : consulta_registro_datos_diario
    Created on : 21/02/2022, 08:48:31
    Author     : csanchez
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
  <% 
        String fecha1= request.getParameter("idfechad") ;
        String avia= request.getParameter("avia") ;
        String grilla_html_pre_descarte_global="";
        String aviario = "";
        String lote_name = "";
        String saldo_ant = "";
        String muer = "";
        String ing = "";
        String salida = "";
        String sub = "";
        String ventas = "";
        String ajuste = "";
        String saldo = "";
        String carton = "";
        String unidades = "";
        String total_unidades = "";
        String prodporcen = "";
        String kg = "";
        String gr_ave = "";
        
        //Pre descarte global
        Integer saldo_ant_total=0;
        Integer saldo_total=0;
        Integer kg_total=0;


        
        String cabecera = "  "
            + "    <div style='width: 100% !important  margin-left: 60%';' class='h_d2 text-center'>"
                + "<br>"
            + "<div style='width: 100% !important;' class='card-header bg-navy'>"
            + "    <h5 class='text-center'>Pre-Descarte Convencionales</h5>"
            + "</div>"
                + "<br>"
            + "<table class=' table-bordered tablagrilla compact-cs'>"
               + "             <thead>"
               + "                 <tr>"
               + "     <th width='60' rowspan='2' class='text-center bg-navy'>Aviario</th>"
               + "     <th width='60' rowspan='2' class='text-center bg-navy'>Lote</th>"
               + "     <th colspan='8' class='text-center bg-navy'>Aves</th>"
               + "     <th colspan='5' class='text-center bg-navy'>Huevos</th>"
               + "     <th colspan='2' class='text-center bg-navy'>Balanceados</th>"
               + " </tr>"
               + " <tr>"
               + "     <th class='text-center bg-navy' width='80'>Saldo ant.</th>"
               + "     <th class='text-center bg-navy' width='60'>Mue.</th>"
               + "     <th class='text-center bg-navy' class='text-center bg-navy' width='60'>T.Ing.</th>"
               + "     <th class='text-center bg-navy' width='60'>T.Sal.</th>"
               + "     <th class='text-center bg-navy' width='60'>Sub.</th>"
               + "     <th class='text-center bg-navy' width='60'>Ven.</th>"
               + "     <th class='text-center bg-navy' width='60'>Aju.</th>"
               + "     <th class='text-center bg-navy' width='80'>Saldo</th>"
               + "     <th class='text-center bg-navy' width='70'>Cartones</th>"
               + "     <th class='text-center bg-navy' width='70'>Cartones</th>"
               + "     <th class='text-center bg-navy' width=70'>Unidades</th>"
               + "     <th class='text-center bg-navy' width=100' class='text-center'>Total Unid.</th>"
               + "     <th class='text-center bg-navy' width='70'>% Product.</th>"
               + "     <th class='text-center bg-navy' width='80'>Total Kg.</th>"
               + "     <th class='text-center bg-navy' width='60'>gr/ave</th>"
               + " </tr>"
               + " </thead>"
               + " <tbody>";

    clases.controles.VerificarConexion();
    fuente.setConexion(clases.controles.connectSesion);
    JSONObject obje = new JSONObject();
    obje = new JSONObject();
    
    try {
            
 PreparedStatement pt=clases.controles.connectSesion.prepareStatement("execute stp_mae_ppr_select_datos_pre_descarte_C @fecha_desde='"+fecha1+"'");
    ResultSet rs=pt.executeQuery();
    ArrayList Fila = new ArrayList();
    
    //ArrayList fe1 = new ArrayList();
   // ArrayList fe2 = new ArrayList();
            while(rs.next()) {
                
                grilla_html_pre_descarte_global = grilla_html_pre_descarte_global + "<tr class='tablagrilla'><td class='tablagrilla' style= 'text-align:center;'>"
                + " " + rs.getString("aviario") + " </td> <td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("lote_name") + "  </td><td class='tablagrilla cero tdc' style= 'text-align:center;color:' ;> " + rs.getString("saldo_ant") +"  </td><td class='tablagrilla cero' style= 'text-align:center;color:'>  " + rs.getString("muer") + "  </td><td class='tablagrilla cero' style= 'text-align:center;color:'>  " + rs.getString("ing") + "  </td><td class='tablagrilla cero si' style= 'text-align:center';>  " + rs.getString("salida") + " </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("sub") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("ventas") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("ajuste") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("saldo") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("carton") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("carton") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("unidades") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("total_unidades") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("prodporcen") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("kg") + "  </td><td class='tablagrilla cero ' style= 'text-align:center';>  " + rs.getString("gr_ave") + "  </td></tr>";
                saldo_ant_total=(saldo_ant_total)+Integer.parseInt(rs.getString("saldo_ant"));
                saldo_total=(saldo_total)+Integer.parseInt(rs.getString("saldo"));
                kg_total=(kg_total)+Integer.parseInt(rs.getString("kg"));
                
        aviario = rs.getString("aviario");
        lote_name = rs.getString("lote_name");
        saldo_ant = rs.getString("saldo_ant");
        muer = rs.getString("muer");
        ing = rs.getString("ing");
        salida = rs.getString("salida");
        ventas = rs.getString("ventas");
        ajuste = rs.getString("ajuste");
        sub = rs.getString("sub");
        saldo = rs.getString("saldo");
        carton = rs.getString("carton");
        unidades = rs.getString("unidades");
        total_unidades = rs.getString("total_unidades");
        total_unidades = rs.getString("prodporcen");
        total_unidades = rs.getString("kg");
        total_unidades = rs.getString("gr_ave");
        
        
              }
    obje.put("grilla_datos_diarios_pre_descarte_global",cabecera + grilla_html_pre_descarte_global + "</tbody><tfoot class='total'><tr>"
                          +"  <td class='text-left bg-gray' colspan='2'>TOTAL</td>"
                           +" <td class='text-center bg-gray'>"+saldo_ant_total+"</td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'></td>"
                           +" <td class='text-center bg-gray'>"+saldo_total+"</td>"
                           +" <td class='text-center bg-gray'></td>"
                            +"<td class='text-center bg-gray'></td>"
                            +"<td class='text-center bg-gray'></td>"
                                   +"<td class='text-center bg-gray'></td>"
                            +"<td class='text-center bg-gray'></td>"
                            +"<td class='text-center bg-gray'>"+kg_total+"</td>"
                           +" <td class='text-center bg-gray'></td>"
                       +" </tr>"
                    +"</tfoot></body></div>" );
    obje.put("fecha1",fecha1 );
    
        } catch (Exception e) {
            String error=e.getMessage();
        }
    
    finally{
        
        
    out.print(obje); 
            clases.controles.connectSesion.close();

    }
 %>
