<%@page import="clases.controles"%>
<%@page import="clases.fuentedato"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<div  class=" form-control bg-navy" role="alert">
         <strong style="color: white;"  ><center>Registros pendientes a facturar.</center></strong> 
    </div>    
   
<%     
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    ResultSet rs,rs2;
     rs = fuente.obtenerDato(" select "
             + "    a.id,FORMAT (a.fecha_registro, 'dd/MM/yyyy hh:mm') as fecha_registro,"
             + "    concat(b.code,'-',b.name) as camion ,a.cantidad,c.name as chofer"
             + "                from mae_log_pct_cab_pedidos a "
             + "                inner join maehara.dbo.[@CAMIONES] b    on a.id_camion=b.Code collate database_default and a.estado IN (1) "
             + "                inner join maehara.dbo.[@CHOFERES] c on a.id_chofer=c.Code  collate database_default"); %>

          
    <script>
    $( function() {
      $( "#accordion" ).accordion({ 

heightStyle: "content" 

});
    } );
    </script>
  <div id="accordion" >
  <%
    try {
        int i=0;
        while (rs.next()){
            
            String id=rs.getString("id");
            String contenido_cab="Pedido nro. "+rs.getString("id")+"  Fecha registro: "+rs.getString("fecha_registro")+"  Camion:"+rs.getString("camion")+" Chofer:"+rs.getString("chofer")+" TOTAL CARROS:"+rs.getString("cantidad"); %> 
            <br> 
            <div>
                
        <div class="row">
            <div class="col-12">

                <div class="card">
                    <div class="card-header bg-navy">
                        <h3 class="card-title">  Pedido nro: <%=rs.getString("id")%>  </h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body" style="display: block;">
                          
                        <table class="table border">
                             <thead>
                              <th class="bg-black">Fecha</th>
                             <th class="bg-black">Camión</th>
                             <th class="bg-black">Chofer</th>
                             <th class="bg-black">Total</th>
                            </tr>
                             </thead>
                             <tbody>
                                 <tr>
                                      <td><%=rs.getString("fecha_registro")%></td>
                                     <td><%=rs.getString("camion")%></td>
                                     <td><%=rs.getString("chofer")%></td>
                                     <td><%=rs.getString("cantidad")%></td>
                                      
                                 </tr>  
                             </tbody>
                         </table>
                    
                        
                          <table class="table">
                             <thead>
                          <tr>  
                                <th  class="bg-navy" >Número de artículo</th>  
                                <th  class="bg-navy">Descripcion del articulo</th>    
                                <th class="bg-navy">Almacén</th> 
                                <th class="bg-navy" background: black;'>Cantidad</th> 
                            </tr>
                             </thead>
                             <tbody>
                                        <%
                        rs2 = fuente.obtenerDato(" exec [mae_log_pendientes_facturar] @id="+id+" ");

                        while (rs2.next())
                    {  %>             
                        <tr> 
                            <td><%=rs2.getString("tipo_huevo")%></td>
                            <td><%=rs2.getString("itemName")%></td>
                            <td><%=rs2.getString("clasificadora")%></td>
                            <td><%=rs2.getString("cantidad")%></td>
                        </tr>
                        <% 
                        }
                        %>
                                  
                             </tbody>
                         </table>
                    </div>

                    <div class="card-footer" style="display: block;">
                     </div>

                </div>

            </div>
        </div> 
                
                
                
                 
              </p>
            </div> <%
            i++; 
        }

            if(i==0){
            %>
            <br>
             <button type="button" class="btn btn-danger btn-block btn-lg"><i class="fa fa-bell"></i>NO SE ENCONTRARON PEDIDOS PENDIENTES</button><!-- comment -->
         
            
            
										 
        <% 
        }
        } catch (Exception e) {
String as=e.getMessage();
                }
        %>
        
        
        
        
        
       
            
    </div>
 