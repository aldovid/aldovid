<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@include  file="../../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
    <% 
        clases.controles.VerificarConexion();
       // Connection cn = clases.controles.connectSesion;
        fuente. setConexion(clases.controles.connectSesion);       
        String  numero_factura      = request.getParameter("nro_factura") ;
        String  area                =(String)sesionOk.getAttribute("area_gm");
        String  area_cch            =(String)sesionOk.getAttribute("area");
        int     mensaje             =0;
        int ultimo = Integer.parseInt(numero_factura.substring(numero_factura.length() - 7)) ;
         String  grilla="";
       int i=0;  
        try { 
         ResultSet rs = fuente.obtenerDato ("exec [select_embarque_lotes_pendientes] @area='"+area+"',@nro_factura="+ultimo+"");
           
         
         while  (rs.next())
            {
                grilla=grilla+  "<tr class='suma' id='row"+rs.getString("identificador_lote")+"'  > "
                + "<td class='ocultar'>"+rs.getString("cod_lote")+"</td>"
                + "<td class='font-weight-bold' >"+rs.getString("tipo_huevo")+"</td>"
                  + "<td class='font-weight-bold'>"+rs.getString("carro")+"</td>"
                  + "<td class='ocultar' >"+rs.getString("cod_huevo")+"</td>"
                  + "<td class='font-weight-bold'  >"+rs.getString("cantidad")+"</td>"
                  + "<td class='font-weight-bold' >"+rs.getString("fecha_puesta")+"</td>"
                  + "<td class='font-weight-bold'  >  <a class='btn btn-danger font-weight-bold remove'> <i class='fa fa-trash-o fa-lg'></i> Eliminar</a>  </td>"
                  + "<td  class='ocultar' >"+rs.getString("estado_lote")+"</td>"
                  + "<td for='id'  class='ocultar' >"+rs.getString("identificador_lote")+"</td><td>"+i+"</td> "
                  + "</tr> ";  
                i++;
            }
            clases.controles.connectSesion.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            callableStatement = clases.controles.connectSesion.prepareCall("{call [mae_cch_embarque_insertar_lotes_disponibles](?,?,?)}");
            callableStatement .setString(   1,  area_cch );
            callableStatement .setString(   2,  area);
              
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            mensaje = callableStatement.getInt("mensaje");
            clases.controles.connectSesion.commit();
            } catch (Exception e) 
            {
                clases.controles.connectSesion.rollback();
            }
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        ob.put("grilla", grilla);  
        ob.put("count", i);
        //cn.close();
       // clases.controles.DesconnectarBD();        
        out.print(ob); 
        %>  
   
 
