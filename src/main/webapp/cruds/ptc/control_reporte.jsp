 
<%@page import="clases.controles"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@include  file="../../chequearsesion.jsp" %>
<%     
        String fecha = request.getParameter("fecha");//parametro generico
        String archivo = request.getParameter("archivo");
        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String fecha_puesta = request.getParameter("fecha_puesta");
        
        String fecha_desde = request.getParameter("fecha_desde");
        String fecha_hasta = request.getParameter("fecha_hasta");
          
        clases.controles.connectarBD();  
        Connection cn = clases.controles.connect; 
        File reportfile = new File (application.getRealPath("reportes/ptc/"+archivo+".jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("fecha",          fecha);
        parameter.put("area",           clasificadora);        
        parameter.put("fecha_puesta",   fecha);

        parameter.put("fecha_desde",    fecha_desde );
        parameter.put("fecha_hasta",    fecha_hasta );
        parameter.put("fecha_puesta",   fecha_puesta );
        
 
         
        byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, cn);
         
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",  "inline; filename=Reporte.pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);

        outputstream.flush();
        outputstream.close();
        cn.close();
        controles.DesconnectarBD();
        %>