<?php
ob_start();
session_start();
include('menu.php');
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
$sql1="select * from users where user_id=$_SESSION[user_id]";
$rw1=mysqli_query($con,$sql1);//recuperando el registro
$rs1=mysqli_fetch_array($rw1);//trasformar el registro en un vector asociativo

$modulo=$rs1["accesos"];
$a = explode(".", $modulo); 
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
    header("location: login.php");
    exit;
}
if($a[8]==0){
    header("location:error.php");    
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Lista de ventas Fac/Bol/Nota</title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/custom.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/formularios.css"/>
<script src="js/jquery.min.js"></script>
  
   
  
  
  
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>
  
</head>


<body class="nav-md">

  <div class="container body">


    <div class="main_container">

      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">

         
          <div class="clearfix"></div>

          <!-- menu prile quick info -->
         <?php
          menu2();
      
          menu1();
          
          ?>
     
        </div>
      </div>

      <!-- top navigation -->
       <?php
          menu3();
          
          ?>
     
      <div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              
            </div>

            
          </div>
          <div class="clearfix"></div>

          <div class="row">

          <div class="container">
		<div class="panel panel-info">
		<div class="panel-heading">
		    <div class="btn-group pull-right">
				<a  href="nueva_factura.php" class="btn btn-info"><span class="glyphicon glyphicon-plus" ></span> Nuevo Doc</a>
			</div>
			<h4>Lista de Boletas Facturas y Notas</h4>
		</div>
			
				<div class="panel-body">
				<form style="color:black;" class="form-horizontal" role="form" id="datos_cotizacion">
				
						<div class="form-group row">
							
							<div class="col-md-4 col-sm-4 col-xs-12">
                                                                Buscar Cliente
								<input type="text" autocomplete="off" class="form-control input-sm" id="q" placeholder="Nombre del cliente " onkeyup='load(1);'>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12">
                                                                Buscar Doc
								<input type="text" autocomplete="off" class="form-control input-sm" id="q1" placeholder="Nro doc " onkeyup='load(1);'>
							</div>
                                                        <div class="col-md-2 col-sm-2 col-xs-12">
                                                                Ventas/Compras
                                                                <select id="q4" class="form-control input-sm" onchange='load(1);'>
                                                                    <option value="">todo</option>
                                                                    <option value="1">Ventas</option>
                                                                    <option value="2">Compras</option>
                                                                </select>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12">
                                                                Fecha Inicial
								<input type="date"  class="form-control input-sm" id="q2"  onchange='load(1);'>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12">
                                                                Fecha Final
								<input type="date"  class="form-control input-sm" id="q3"  onchange='load(1);'>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
			
			</form>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
                            
                            
				
		</div>	
		
	</div>
          
          </div>
        </div>

        <!-- footer content -->
         <?php
          footer();
          
          ?>
      
      </div>
      <!-- /page content -->
    </div>

  </div>

  <div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
  </div>

<script src="js/bootstrap.min.js"></script>
<script src="js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="js/nicescroll/jquery.nicescroll.min.js"></script>

<script src="js/icheck/icheck.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/pace/pace.min.js"></script>
<script type="text/javascript" src="js/usuarios.js"></script>
<script type="text/javascript" src="js/VentanaCentrada.js"></script>
<script type="text/javascript" src="js/detalle.js"></script>

  </body>
</html>
<?php
ob_end_flush();
?>

















