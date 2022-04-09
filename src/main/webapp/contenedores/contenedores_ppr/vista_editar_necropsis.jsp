<%-- 
    Document   : vista_registro_contador_huevo
    Created on : 26-ene-2022, 13:37:16
    Author     : aespinola
--%>


 

<script>
            var today = new Date();
            var dd = today.getDate(1);
            var mm = today.getMonth(1) + 1;
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("fecha").setAttribute("max", today);
           

            function setInputDate(_id) {
                var _dat = document.querySelector(_id);
                var hoy = new Date(),
                        d = hoy.getDate(),
                        m = hoy.getMonth() + 1,
                        y = hoy.getFullYear(),
                        data;

                if (d < 10) {
                    d = "0" + d;
                }
                ;
                if (m < 10) {
                    m = "0" + m;
                }
                ;

                data = y + "-" + m + "-" + d;
                console.log(data);
                _dat.value = data;
            }
            ;

        
            setInputDate("#fecha");

        </script>
        <% 
  //   String version=clases.versiones.contenedores_ppr_vista_registro_necropsias;
 
      %> 
      
      <div style="width: 100%;  text-align: left" >
      <div class="box-body" id="datos">       
      
    
          <div class="box box-solid box-default">
      <div class="box-body">
    
   <div>
       
       <p>Fecha:  <span id="fecha" class="text-blue">  </span> 
       | Aviario: <span id="aviario" class="text-blue"></span>
       | Lote:    <span id="lote" class="text-blue"></span> 
       | Edad:    <span id="edad" class="text-blue"></span></p>
   </div>
  <table bgcolor="#800000" id="datosnecropsiasregistrados" class="table table-bordered" style="width:50%"  ></table>

  </div>
      </div> 
      </div>

   <div  class="slideshow-container" style="width: 50%;" class="text-center">
                <div class="box-header">
                    <h4 class="text-center">ARCHIVOS CARGADOS</h4>
                </div>
    <div id="demo" class="carousel slide carousel-inner" data-ride="carousel"  >

        <!-- Indicators -->
        <ul class="carousel-indicators" id="ul_contenido_imagenes">
           
        </ul>

        <!-- The slideshow -->
        <div id="ave_nro"></div> 
        <div  class="text-center" class="carousel-inner" id="contenedor_imagenes"  >
            
          
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
</div>
 </div>           
</div>
      
      

      