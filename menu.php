<?php
require_once ("config/db.php");
$db_db=DB_NAME;
$db_products = $db_db.'.products';  
$db_clientes = $db_db.'.clientes';
$db_users = $db_db.'.users';
$db_facturas = $db_db.'.facturas';
$db_categorias= $db_db.'.categorias';
$db_datosempresa = $db_db.'.datosempresa';
$db_sucursal= $db_db.'.sucursal';
$db_IngresosEgresos= $db_db.'.IngresosEgresos';
$db_documento = $db_db.'.documento';
$db_comprobante_pago= $db_db.'.comprobante_pago';
$db_sub_tipo= $db_db.'.sub_tipo';
$db_servicio= $db_db.'.servicio';
$db_consultas= $db_db.'.consultas';
$db_laborales= $db_db.'.laborales';
$db_fotos= $db_db.'.fotos';
$db_documento = $db_db.'.documento';

function conectar2()
{ 
$db = mysqli_connect(DB_HOST, DB_USER, DB_PASS);
    if (!$db) {
        print "<p>Imposible conectarse con la base de datos.</p>";
        exit();
    } else {
        return($db);
    }
}
function recoge1($var)
{
    $tmp = (isset($_REQUEST[$var])) ? trim(strip_tags($_REQUEST[$var])) : '';
    if (get_magic_quotes_gpc()) {
        $tmp = stripslashes($tmp);
    }
    $tmp = str_replace('&', '&amp;',  $tmp);
    $tmp = str_replace('"', '&quot;', $tmp);
    $tmp = str_replace('í', '&iacute;', $tmp);
    return $tmp;
}
function menu1(){
    ?>

  <style>
    li a{
      font-weight:bold;
    }
  </style>
   <div style="background-color:#222d32;" id="sidebar-menu" class="main_menu_side hidden-print main_menu" >

            <div class="menu_section">
            <br>
              <h3 style="text-align:center; font-weight:bold; color:withe;" >Sistema De Inventario CNA</h3>
              <br>
              <ul class="nav side-menu">
                 <li><a style="font-weight:bold;"><i class="fa fa-home" style="height:50%;"></i> Inicio <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none" style="font-weight:bold;">
                      <li><a style="font-weight:bold;" href="resumen.php">Gráficas</a></li>
                      <!--li><a style="font-weight:bold;" href="empresa.php">Institución</a></li-->
                   
                    <!--<li><a href="resumen.php">Resumen</a>
                    </li>
                    <li><a href="sucursal.php">Sucursales</a>
                    </li>
                    <li><a href="caja.php">Caja</a>
                    </li>-->
                   
                    
                  </ul>
                </li>
                
                <li ><a><i class="fa fa-lock"></i> En desarrollo... <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                       <!--li><a href="usuarios.php">Usuarios</a-->
                    </li>
                    <!--  <li><a href="acceso.php">Accesos</a>
                    </li>-->
                 
                  </ul>
                </li>
                
                <li><a style="font-weight:bold;"><i class="fa fa-truck"></i>Ministerio de Finanzas Públicas<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                      <li><a style="font-weight:bold;" href="Catalogo_Min_Fin.php">Nuevo Código</a>
                      </li>               
                  </ul>
                </li>
                
                
                <li><a style="font-weight:bold;"><i class="fa fa-barcode"></i> Productos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                      <!-- COMENTADO li><a href="categorias.php">Categorias</a-->
                    <li><a style="font-weight:bold;" href="ingresoproductos.php">Ingresar Productos</a>
                    </li>
                    <li><a style="font-weight:bold;" href="productos.php">Lista De Productos</a>
                    </li>
                    
                    <!--   <li><a href="servicio.php">Lista de Servicios</a>
                    </li>
                    <li><a href="kardex.php">Kardex de Productos</a>
                    </li>
                     <li><a href="kardex2.php">Entradas y Salidas Productos</a>
                    </li>
                    <li><a href="transferencia.php">Transferencia</a>
                    </li>
                    <li><a href="transferencia1.php">Lista de Transferencias</a>
                    </li>
                    <li><a href="transferencia3.php">Conversion de pack</a>
                    </li>
                    
                    <li><a href="consultaproductos.php">Consultas</a>
                    </li>
                     <li><a href="masvendidos.php">Productos mas vendidos</a>
                    </li>
                    
                    <li><a href="consultaprecios.php">Consulta Precios</a>
                    </li>
                    -->
                    
                  </ul>
                </li>
                
                <li><a style="font-weight:bold;"><i class="fa fa-truck"></i> Proveedores <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                      <li><a style="font-weight:bold;" href="proveedores.php">Nuevo Proveedor</a>
                      </li>               
                  </ul>
                </li>

                <li><a style="font-weight:bold;"><i class="fa fa-shopping-cart"></i> Ingresar Productos <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">                   
                      <li><a style="font-weight:bold;" href="nueva_compras.php">Nuevo Ingreso</a></li>
                      <li><a style="font-weight:bold;" href="nueva_comprasLap.php">Ingresar Equipo de computo</a></li>
                      <li><a style="font-weight:bold;" href="compras.php">Listado De ingresos</a></li>
                      <li><a style="font-weight:bold;" href="carga_inicial.php">Carga Inicial</a></li> 
                    </li>
                  </ul>
                </li>
                
                <li><a style="font-weight:bold;" ><i class="fa fa-list-alt"></i> Despachar Productos<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                     
                    <li><a style="font-weight:bold;" href="nueva_factura.php">Nuevo Despacho</a></li>
                    
                   
                    <li><a style="font-weight:bold;" href="facturas.php">Lista de Despachos</a></li>
                    <!--li><a href="nueva_cotizacion.php">Ingreso Cotizacion</a></li>
                     <li><a href="cotizacion.php">Lista de Cotizacion</a></li-->
                    
                  </ul>
                </li>
                
                <li><a><i class="fa fa-user"></i> Tarjeta De Responsabilidades <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none"> 
                      <li><a href="tarjetaResponsabilidad.php">Asignar Bien</a></li>
                      <li><a href="tarjetaResponsabilidadDescargar.php">Descargar Bien</a></li>
                      <li><a href="listaTarjetas.php">Lista De Tarjetas</a></li>
                  </ul>
                </li>
                
                <!--
                <li><a><i class="fa fa-user"></i> Clientes <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                      
                      <li><a href="clientes.php">Clientes</a>
                    </li>
                  
                  </ul>
                </li>
                
                
                
                <li><a><i class="fa fa-list-alt"></i> Facturación electrónica<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="conf_electronica.php"><strong>Configuracion</strong> </a></li>
                    <li><a href="facturaelectronica.php">Documentos electrónicos </a></li>
                    <li><a href="resumen_documentos.php">Lista Resumen diario boletas</a></li>
                    <li><a href="facturaseliminadas.php"><strong>Lista Comunicacion de baja</strong></a></li>
                    
                    <li><a href="listaguia.php">Lista de Guias de Remision </a></li>
                   
                       
                     
                    </li>
                  </ul>
                </li>
                
                -->
              <li><a style="font-weight:bold;"><i class="fa fa-barcode"></i> Kardex<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                      <li>
                        <a style="font-weight:bold;" href="kardex2.php">Kardex Detallado</a>
                      </li>
                      <li>
                        <a style="font-weight:bold;" href="kardex2G300.php">Kardex Consolidado G.300</a>
                      </li>
                      <!--li>
                        <a style="font-weight:bold;" href="kardex2G300Comp.php">Kardex Equipo De Computo</a>
                      </li-->
                    <!--li><a href="reporte2.php">2.-Dataflex</a-->
                    </li>
                   
                    
                    
                  </ul>
                </li>
                
                
                
              </ul>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
            </div>
            

          </div>
            <?php
}



function menu2(){
    ?>
    <div class="profile">
            <?php  
            $db_db=DB_NAME;
            $db_users = $db_db.'.users';
            $db = conectar2();
            $consulta1 = "SELECT * FROM $db_users ";
            $result1 = mysqli_query($db, $consulta1);
            while ($valor1 = mysqli_fetch_array($result1, MYSQLI_ASSOC)) {
                if($valor1['user_id']==$_SESSION['user_id']){
                    $name=$valor1['nombres'];  
                    $foto=$valor1['foto'];
                }    
            } 
            ?>
            
    </div>
    <?php
}

function menu3(){
    ?>
    <div class="top_nav">

        <div style="background:darkslategrey;" class="nav_menu">
          <nav class="" role="navigation">
            <div class="nav toggle">
              <a id="menu_toggle" ><i class="fa fa-bars"></i></a>
            </div>
<?php
$host= $_SERVER["HTTP_HOST"];
$url= $_SERVER["REQUEST_URI"];
$a="http://".$host.$url;
?>                     
            <ul class="nav navbar-nav navbar-right">
              <li class="">
                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  
                   <?php  
            $db_db=DB_NAME;
            $db_users = $db_db.'.users';
            $db = conectar2();
            $consulta11 = "SELECT * FROM $db_users ";
            $result11 = mysqli_query($db, $consulta11);
            while ($valor11 = mysqli_fetch_array($result11, MYSQLI_ASSOC)) {
                if($valor11['user_id']==$_SESSION['user_id']){
                    $name=$valor11['nombres'];  
                    $foto=$valor11['foto'];
                }    
            } 
            ?>     <span style="font-weight:bold; color:white">Bienvenido (a) <?php echo $name?></span>
                   <img src="images/<?php echo $foto;?>"> 
                    
                  <span class=" fa fa-angle-down"></span>
                </a>
                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">   
                
                
                
                <li><a href="salir.php">Salir</a></li>
                </ul>
                </li>
                
               
                
              
            </ul>
              
              
        </nav>
    </div>

</div>
<?php
}

function footer(){
    ?>
<footer>
          
    
    
    <div class="copyright-info">
            <p class="pull-right">Consejo Nacional De  Adopciones.            </p>
          </div>
          <div class="clearfix"></div>
        </footer>

<?php 

}
?>




