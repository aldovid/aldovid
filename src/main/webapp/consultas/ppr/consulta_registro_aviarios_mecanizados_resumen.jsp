<%-- 
    Document   : consulta_registro_aviarios_mecanizados_resumen
    Created on : 24/02/2022, 15:19:45
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
        String aviario= request.getParameter("aviario") ;
        String fecha= request.getParameter("fecha") ;
        String grilla_html="";
        String lote = "";
        String dias = "";
        String sems = "";
        String saldoini = "";
        String saldoant = "";
        String muer = "";
        String mort = "";
        String ti = "";
        String ts = "";
        String su = "";
        String aj = "";
        String ve = "";
        String saldo = "";
        String via = "";
        String cant= "";
        String prodpor = "";
        String kg = "";
        String gr_ave = "";
        String calcico = "";
        String tmin = "";
        String tmax = "";
        String notas = "";
        String prolapso = "";
        String normal = "";
        String livianos = "";
        String silo1 = "";
        String silo2 = "";
        String caudal1 = "";
        String caudal2 = "";
        String litros = "";
        String totalm = "";
        String totalbalanceados = "";
        String dia_ant = "";

    clases.controles.VerificarConexion();
    fuente.setConexion(clases.controles.connectSesion);
    JSONObject obje,obje2 = new JSONObject();
    obje = new JSONObject();
    
    
    PreparedStatement pt2=clases.controles.connectSesion.prepareStatement("execute stp_mae_ppr_select_datos_diarios_resumen  @fecha_desde='"+fecha+"',@aviario='"+aviario+"'");
    ResultSet rs2=pt2.executeQuery();
 
     while(rs2.next()) {
       

        lote = rs2.getString("lote");
        dias = rs2.getString("dias");
        sems = rs2.getString("sems");
        saldoini = rs2.getString("saldoini2");
        saldoant = rs2.getString("saldoant");
        muer = rs2.getString("muer");
        mort = rs2.getString("mor");
        ti = rs2.getString("TI2");
        ts = rs2.getString("TI");
        su = rs2.getString("TI");
        aj = rs2.getString("AJ");
        ve = rs2.getString("VE");
        saldo = rs2.getString("saldo");
        via = rs2.getString("via");
        cant= rs2.getString("cant");
        prodpor= rs2.getString("pro");
        kg = rs2.getString("kg");
        gr_ave = rs2.getString("gramo_ave");
        calcico = rs2.getString("calcico");
        tmin = rs2.getString("tmin");
        tmax = rs2.getString("tmax");
        notas = rs2.getString("notas");
        prolapso = rs2.getString("prolapso");
        normal = rs2.getString("normal");
        livianos = rs2.getString("livianos");
        silo1 = rs2.getString("silo1");
        silo2 = rs2.getString("silo2");
        caudal1 = rs2.getString("caudal1");
        caudal2 = rs2.getString("caudal2");
        litros = rs2.getString("litros");
        totalm = rs2.getString("totalm");
        totalbalanceados = rs2.getString("totalbalanceados");
        dia_ant = rs2.getString("dia_ant");
              }

        clases.controles.DesconnectarBDsession();             
        obje.put("lote", lote);
        obje.put("dias", dias);
        obje.put("sems", sems);
        obje.put("saldoini2", saldoini);
        obje.put("saldoant", saldoant);
        obje.put("muer", muer);
        obje.put("mor", mort);
        obje.put("ti", ti);
        obje.put("ts", ts);
        obje.put("su", su);
        obje.put("aj", aj);
        obje.put("ve", ve);
        obje.put("saldo", saldo);
        obje.put("via", via);
        obje.put("cant", cant);
        obje.put("prodpor", prodpor);
        obje.put("kg", kg);
        obje.put("gr_ave", gr_ave);
        obje.put("calcico", calcico);
        obje.put("tmin", tmin);
        obje.put("tmax", tmax);
        obje.put("notas", notas);
        obje.put("prolapso", prolapso);
        obje.put("normal", normal);
        obje.put("livianos", livianos);
        obje.put("silo1", silo1);
        obje.put("silo2", silo2);
        obje.put("caudal1", caudal1);
        obje.put("caudal2", caudal2);
        obje.put("litros", litros);
        obje.put("totalm", totalm);
        obje.put("totalbalanceados", totalbalanceados);
        obje.put("dia_ant", dia_ant);
    out.print(obje); 
 %>
