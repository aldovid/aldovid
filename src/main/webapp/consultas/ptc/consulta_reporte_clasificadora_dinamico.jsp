<%-- 
    Document   : datos
    Created on : 02-ene-2022, 19:57:59
    Author     : aespinola
--%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include  file="../../chequearsesion.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<% 
    String fecha_desde_ptc= request.getParameter("fecha_desde_cla") ;
    String fecha_hasta_ptc= request.getParameter("fecha_hasta_cla") ;
    String tipo_grafico_ptc= request.getParameter("tipo_grafico_cla") ;
    //String[] array_clasificadora_ptc= request.getParameterValues("clasif_cla");
    String[] array_categoria_ptc= request.getParameterValues("categorias2_cla");
    
    String clasificadora="";
    String categoria="";
    int tot_mortandad=0;
    boolean ptc   =true;
    boolean rp =true;
    boolean pi     =true;
   

    clases.controles.VerificarConexion();
    fuente.setConexion(clases.controles.connectSesion);
    JSONObject charts_clasificadora = new JSONObject();
    
   // for(int i=0; i<array_clasificadora_ptc.length; i++)   
    //{
     //   if (array_clasificadora_ptc.length > 0)
      //  {
       //     if(i==0)
       //     {
       //         clasificadora="'"+array_clasificadora_ptc[i]+"'";  
        //    }
        //    else 
        //    {
        //        clasificadora=clasificadora  + ",'" +array_clasificadora_ptc[i]+"'"; 
        //    }
       // }
  //  }
    for(int i=0; i<array_categoria_ptc.length; i++)   
    {
        if(array_categoria_ptc[i].equals("ptcc")){
            ptc   =false;
        }
        else  if(array_categoria_ptc[i].equals("rpp")){
            rp   =false;
        }
        else  if(array_categoria_ptc[i].equals("pii")){
            pi   =false;
        }                   
        
    } 
   
    
      String query ="select FORMAT(fecha,'dd-MM')fecha,CONVERT(NUMERIC(10,2),(SUM(ptc)/(SUM(ptc)+sum(pi)))*100)PTC_POR,CONVERT(NUMERIC(10,2),(SUM(rp)/(SUM(rp)+sum(pi)))*100)RP_POR,CONVERT(NUMERIC(10,2),(SUM(pi)/(SUM(ptc)+sum(pi)))*100)PI_POR from v_mae_ptc_indicadores where  FECHA between '"+fecha_desde_ptc+"' and '"+fecha_hasta_ptc+"'GROUP BY FECHA order by fecha";
      
    PreparedStatement pt=clases.controles.connectSesion.prepareStatement(query);
    ResultSet rs=pt.executeQuery();
 
        
        JSONObject DataScale= new JSONObject();
         
        JSONObject  contenidoData,          dataOptions,        data,
                    Dataptc,                Datapi,             datalab,
                    Datarp,
                    DataA,                  DataB,              DataC, 
                    DataD,                  ticksA,             ticksB,  
                    ticksC,                 ticksD,             TitleB,
                    TitleC,                 TitleD,             ContenidoTitle,
                    DataTitle,              ContenidoPoint,     DataPoint,
                    Category                = new JSONObject();
      
        JSONArray   categories,             Dataset,            contenido_subcategorias, 
                    contenido_rp,           contenido_ptc,      contenido_cantidad,
                    contenido_pi,
                    dataArray               = new JSONArray();  
                    
                          
           
                    
            while(rs.next()) // va a recorrer 22 veces
            {
                    String clasificadora2=(clasificadora);
                    
                    
                    Dataptc = new JSONObject();
                    
                    Dataptc.put("label",  "ptc");
                    Dataptc.put("type",tipo_grafico_ptc);
                    Dataptc.put("yAxisID", "C");
                    Dataptc.put("backgroundColor",    "rgba(99, 255, 132)");
                    Dataptc.put("borderColor",  "rgba(99, 255, 132)");
                    Dataptc.put("borderWidth",       2);
                    Dataptc.put("hidden",    ptc);
                    
                     Datarp = new JSONObject();
                    
                    Datarp.put("label",  "rp");
                    Datarp.put("type",tipo_grafico_ptc);
                    Datarp.put("yAxisID", "B");
                    Datarp.put("backgroundColor",    "#ffcc00");
                    Datarp.put("borderColor",  "#ffcc00");
                    Datarp.put("borderWidth",       2);
                    Datarp.put("hidden",    rp);

                    Datapi= new JSONObject();
                    
                    Datapi.put("label",  "pi");
                    Datapi.put("yAxisID","A");
                    Datapi.put("backgroundColor",    "rgb(132, 132, 132)");
                    Datapi.put("borderColor",  "rgb(132, 132, 132)");
                    Datapi.put("borderWidth",  2);
                    Datapi.put("type",  tipo_grafico_ptc);
                    Datapi.put("hidden",    pi);

                    DataA= new JSONObject();                
                    DataA.put("type",    "linear");
                    DataA.put("display",    true);
                    DataA.put("position",    "left");
                    DataA.put("suggestedMin",    0);
                    DataA.put("suggestedMax",    110);
                    ticksA= new JSONObject();
                    ticksA.put("stepSize",    20);
                    DataA.put("ticks",    ticksA);
                    
                    DataB= new JSONObject();                
                    DataB.put("type",    "linear");
                    DataB.put("display",    true);
                    DataB.put("position ",    "right");
                    DataB.put("suggestedMin",    0);
                    DataB.put("suggestedMax",    110);
                    
                    TitleB= new JSONObject();                
                    TitleB.put("display",    true);
                    TitleB.put("text",    "pi");
                    DataB.put("title",    TitleB);
                    ticksB= new JSONObject(); 
                    ticksB.put("stepSize",    20);
                    DataB.put("ticks",    ticksB);
                 
                    DataC= new JSONObject();                
                    DataC.put("type",    "linear");
                    DataC.put("display",    true);
                    DataC.put("position",    "right");
                    DataC.put("suggestedMin",    0);
                    DataC.put("suggestedMax",    110);
                    
                    TitleC= new JSONObject();                
                    TitleC.put("display",    true);
                    TitleC.put("text",    "ptc");
                    DataC.put("title",    TitleC);
                    ticksC= new JSONObject(); 
                    ticksC.put("stepSize",    20);
                    DataC.put("ticks",    ticksC);
 
                    ContenidoTitle= new JSONObject();
                    ContenidoTitle.put("diplay",    true);
                    ContenidoTitle.put("text",    clasificadora2);
                    
                    DataTitle= new JSONObject();
                    DataTitle.put("title",ContenidoTitle); 
                    
                    ContenidoPoint= new JSONObject();
                    ContenidoPoint.put("radius",    0);
                    
                    DataPoint= new JSONObject();
                    DataPoint.put("point",   ContenidoPoint);
                    
                    
                   
                    contenido_subcategorias = new JSONArray();
                    contenido_rp = new JSONArray();
                    contenido_ptc = new JSONArray();
                    contenido_pi = new JSONArray(); 
                   while(rs.next()) 
                   { 
                    // este recorre la cantidad de registros que hay en ese mes y en ese aviario
                    
                    
                    contenido_subcategorias.put(rs.getString("fecha"));
                    contenido_ptc.put(rs.getString("PTC_POR"));
                    contenido_rp.put(rs.getString("RP_POR"));
                    contenido_pi.put(rs.getString("PI_POR")); 

                    
                } ////FIN DEL RECORRIDO LARGO
                 
                  
                
                categories=new JSONArray();
                categories.put(Category);   
                
                Dataptc.put(    "data",contenido_ptc);  
                Datarp.put(         "data",contenido_rp);   
                Datapi.put(        "data",contenido_pi);
                
   
                
                Dataset= new JSONArray();
                Dataset.put(Dataptc);   
                Dataset.put(Datarp);   
                Dataset.put(Datapi);   
                contenidoData= new JSONObject();
                data= new JSONObject();
                
              
                contenidoData.put("labels", contenido_subcategorias);
                contenidoData.put("datasets",    Dataset);
                
                DataScale.put(    "A",DataA);  
                DataScale.put(    "B",DataB);  
                DataScale.put(    "C",DataC); 

                
                data.put("data",contenidoData);
                
                data.put("type",  tipo_grafico_ptc);
                dataOptions= new JSONObject();   
                dataOptions.put("scales", DataScale);
                dataOptions.put("plugins", DataTitle);
                dataOptions.put("elements", DataPoint);

                data.put("options",dataOptions);

                dataArray.put(data);
                
                
            }
           
            
             PreparedStatement pt2 = clases.controles.connectSesion.prepareStatement("select CONVERT(NUMERIC(10,2),(SUM(ptc)/(SUM(ptc)+sum(pi)))*100) as ptc2,CONVERT(NUMERIC(10,2),(SUM(rp)/(SUM(rp)+sum(pi)))*100) as rp2,CONVERT(NUMERIC(10,2),(SUM(pi)/(SUM(ptc)+sum(pi)))*100) as pi2 from v_mae_ptc_indicadores where  FECHA between '"+fecha_desde_ptc+"' and '"+fecha_hasta_ptc+"'");
       ResultSet rs2 = pt2.executeQuery();
        
        //PreparedStatement pt2 = clases.controles.connectSesion.prepareStatement("select * from v_mae_ptc_indicadores where  FECHA between '"+fecha_desde_ptc+"' and '"+fecha_hasta_ptc+"'");
       // ResultSet rs2 = pt2.executeQuery();
        
        JSONObject DataScale2= new JSONObject();
         
        JSONObject  contenidoData2,          dataOptions2,        data2,
                    Dataptc2,                Datapi2,             datalab2,
                    Datarp2,
                    DataA2,                  DataB2,              DataC2, 
                    DataD2,                  ticksA2,             ticksB2,  
                    ticksC2,                 ticksD2,             TitleB2,
                    TitleC2,                 TitleD2,             ContenidoTitle2,
                    DataTitle2,              ContenidoPoint2,     DataPoint2,
                    Category2                = new JSONObject();
      
        JSONArray   categories2,             Dataset2,            contenido_subcategorias2, 
                    contenido_rp2,           contenido_ptc2,      contenido_cantidad2,
                    contenido_pi2,
                    dataArray2               = new JSONArray();    
        
        while(rs2.next()) // va a recorrer 22 veces
            {
                    String clasificadora22=(clasificadora);
                    
                    
                    Dataptc2 = new JSONObject();
                    
                    Dataptc2.put("label",  "ptc");
                    Dataptc2.put("type",tipo_grafico_ptc);
                    Dataptc2.put("yAxisID", "C");
                    Dataptc2.put("backgroundColor",    "rgba(99, 255, 132)");
                    Dataptc2.put("borderColor",  "rgba(99, 255, 132)");
                    Dataptc2.put("borderWidth",       2);
                    Dataptc2.put("hidden",    ptc);
                    
                    Datarp2 = new JSONObject();
                    
                    Datarp2.put("label",  "rp");
                    Datarp2.put("type",tipo_grafico_ptc);
                    Datarp2.put("yAxisID", "B");
                    Datarp2.put("backgroundColor",    "#ffcc00");
                    Datarp2.put("borderColor",  "#ffcc00");
                    Datarp2.put("borderWidth",       2);
                    Datarp2.put("hidden",    rp);

                    Datapi2= new JSONObject();
                    
                    Datapi2.put("label",  "pi");
                    Datapi2.put("yAxisID","A");
                    Datapi2.put("backgroundColor",    "rgb(132, 132, 132)");
                    Datapi2.put("borderColor",  "rgb(132, 132, 132)");
                    Datapi2.put("borderWidth",  2);
                    Datapi2.put("type",  tipo_grafico_ptc);
                    Datapi2.put("hidden",    pi);

                    DataA2= new JSONObject();                
                    DataA2.put("type",    "linear");
                    DataA2.put("display",    true);
                    DataA2.put("position",    "left");
                    DataA2.put("suggestedMin",    0);
                    DataA2.put("suggestedMax",    110);
                    ticksA2= new JSONObject();
                    ticksA2.put("stepSize",    20);
                    DataA2.put("ticks",    ticksA2);
                    
                    DataB2= new JSONObject();                
                    DataB2.put("type",    "linear");
                    DataB2.put("display",    true);
                    DataB2.put("position ",    "right");
                    DataB2.put("suggestedMin",    0);
                    DataB2.put("suggestedMax",    110);
                    
                    TitleB2= new JSONObject();                
                    TitleB2.put("display",    true);
                    TitleB2.put("text",    "pi");
                    DataB2.put("title",    TitleB2);
                    ticksB2= new JSONObject(); 
                    ticksB2.put("stepSize",    20);
                    DataB2.put("ticks",    ticksB2);
                 
                    DataC2= new JSONObject();                
                    DataC2.put("type",    "linear");
                    DataC2.put("display",    true);
                    DataC2.put("position",    "right");
                    DataC2.put("suggestedMin",    0);
                    DataC2.put("suggestedMax",    110);
                    
                    TitleC2= new JSONObject();                
                    TitleC2.put("display",    true);
                    TitleC2.put("text",    "ptc");
                    DataC2.put("title",    TitleC2);
                    ticksC2= new JSONObject(); 
                    ticksC2.put("stepSize",    20);
                    DataC2.put("ticks",    ticksC2);
 
                    ContenidoTitle2= new JSONObject();
                    ContenidoTitle2.put("diplay",    true);
                    ContenidoTitle2.put("text",    clasificadora22);
                    
                    DataTitle2= new JSONObject();
                    DataTitle2.put("title",ContenidoTitle2); 
                    
                    ContenidoPoint2= new JSONObject();
                    ContenidoPoint2.put("radius",    0);
                    
                    DataPoint2= new JSONObject();
                    DataPoint2.put("point2",   ContenidoPoint2);
                    
                    
                   
                    contenido_subcategorias2 = new JSONArray();
                    contenido_rp2 = new JSONArray();
                    contenido_ptc2 = new JSONArray();
                    contenido_pi2 = new JSONArray(); 
                   
                    // este recorre la cantidad de registros que hay en ese mes y en ese aviario
                    
                    
                    //contenido_subcategorias2.put('"+fecha_desde_ptc+"' / '"+fecha_hasta_ptc+"');
                    //contenido_ptc2.put(rs2.getString("ptc2"));
                    //contenido_rp2.put(rs2.getString("rp2"));
                    //contenido_pi2.put(rs2.getString("pi2")); 
                    
                    contenido_subcategorias2.put(""+fecha_desde_ptc+" / "+fecha_desde_ptc+"");
                    contenido_ptc2.put(rs2.getString("ptc2"));
                    contenido_rp2.put(rs2.getString("rp2"));
                    contenido_pi2.put(rs2.getString("pi2")); 
                    
                    
                
                categories2=new JSONArray();
                categories2.put(Category2);   
                
                Dataptc2.put(    "data",contenido_ptc2);  
                Datarp2.put(         "data",contenido_rp2);   
                Datapi2.put(        "data",contenido_pi2);
                
   
                
                Dataset2= new JSONArray();
                Dataset2.put(Dataptc2);   
                Dataset2.put(Datarp2);   
                Dataset2.put(Datapi2);   
                contenidoData2= new JSONObject();
                data2= new JSONObject();
                
              
                contenidoData2.put("labels", contenido_subcategorias2);
                contenidoData2.put("datasets",    Dataset2);
                
                DataScale2.put(    "A",DataA2);  
                DataScale2.put(    "B",DataB2);  
                DataScale2.put(    "C",DataC2); 

                
                data2.put("data",contenidoData2);
                
                data2.put("type",  tipo_grafico_ptc);
                dataOptions2= new JSONObject();   
                dataOptions2.put("scales", DataScale2);
                dataOptions2.put("plugins", DataTitle2);
                dataOptions2.put("elements", DataPoint2);

                data2.put("options",dataOptions2);

                dataArray2.put(data2);
                
                
            }
            
             charts_clasificadora.put("charts_clasificadora", dataArray); 
             charts_clasificadora.put("totales", dataArray); 
             charts_clasificadora.put("totales2", dataArray2); 
         clases.controles.DesconnectarBDsession();   
         out.print(charts_clasificadora); 
 %>
 
 