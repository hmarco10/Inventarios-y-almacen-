<?php
session_start();
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=productos.xls" ) ; 
        
        $sTable = "products,und";
        
        
		
		$sWhere="where date_added BETWEEN '2021-03-01' AND '2021-03-31' and products.und_pro=und.id_und order by id_producto desc";
                $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
                $sql="SELECT *, (B1*costo_producto) AS TOTAL FROM  $sTable $sWhere ";
		$query = mysqli_query($con, $sql);
		if ($numrows>0){
			?>
			 
             
             <p style="text-align:center; font-weigth:bold;">Consejo Nacional De Adopciones
                <br>
                UNIDAD DE INVENTARIOS Y ALMACEN
                <br>
                Existencia de Materiales y Productos de Almacen
                <br>
                Inventario del 1 al 31 de Marzo de 2021<p>
                           
			 <table id="example" class="display nowrap" style="width:100%; border:1px solid #424242;">
                            <thead>
				<tr style="border:1px solid #424242;" >
                                       
					<!--th>Codigo</th-->
					<th>NOMBRE DEL PRODUCTO</th>
                                        <!-- COMENTADO th>Und Medida</th-->
                                        <th>EXISTENCIA</th>
                                        <th>UNITARIO</th>
					<!-- COMENTADO th>Tipo</th TRAE TIPO -->
                                       <th>TOTAL</th><!--trae marca stock Maximo-->
                                        <th>FECHA</th>
                                        <th>FECHA</th-->
                                        <TH>CANTIDAD INGRESADA</th>
                                        <th>VALOR POR INGRESOS</th>
                                        <th>CANTIDAD EGRESADA</th>
                                        <th>VALOR POR DESPACHOS</th>
                                        
				</tr>
                                </thead>
				<?php
                                $i=0;
				while ($row=mysqli_fetch_array($query)){
					$pro_ser=$row['pro_ser'];
                                        if ($pro_ser==1){
                                            
                                            if($i%2==0){
                                                $table="valor1";
                                            }else{
                                                $table="valor2";
                                            }
                                            $i=$i+1;
                                            $id_producto=$row['id_producto'];
                                            $codigo_producto=$row['codigo_producto'];
                                            $nombre_producto=$row['nombre_producto'];
                                            $status_producto=$row['status_producto'];
                                            $marca=$row['max'];
                                            $desc_corta=$row['desc_corta'];
                                            $color=$row['color'];
                                            $cat_pro=$row['cat_pro'];
                                            $pro_ser=$row['pro_ser'];
                                            $foto=$row['foto1'];
                                            $tienda=$_SESSION['tienda'];   
                                            $b=$row["b$tienda"];
                                            $mon_venta=$row['mon_venta'];
                                            $dolar=$row['mon_costo'];
                                            $mon_costo=1;
                                            $nom_und=$row["nom_und"];
                                            $total=$row["TOTAL"];
                                            $min=$row["min"];
                                            $label_class='label-success';
                                            if ($status_producto==1){$estado="Nuevo";}
                                            if ($status_producto==0){$estado="Segunda";}
                                            if ($status_producto==2){$estado="Repuesto";}
                                            $mon=moneda;
                                            $date_added= date('d/m/Y', strtotime($row['date_added']));
                                            $precio_producto=$row['precio_producto'];
                                            $precio2=$row['precio2'];
                                            $precio3=$row['precio3'];
                                            $und_pro=$row['und_pro'];
                                            $costo_producto=$row['costo_producto']/$row['mon_costo'];
                                            $costo=$row['costo_producto'];
                                            $utilidad=$row['precio_producto']-$row['costo_producto'];
                                             
					?>
                                        <tr style="border:1px solid #424242;" id="<?php echo $table;?>">
                                        
                                          	
                                            <!--td><?php echo $codigo_producto; ?></td-->
                                            <td width="50px"><?php echo $nombre_producto; ?></td>
                                            <!-- COMENTADO td width="50px"><?php echo $nom_und; ?></td-->
                                            <td ><span class="label <?php echo $label_class;?>"><?php echo $b; ?></span></td>
                                            <td width="50px"><?php echo $costo; ?> </td>
                                            <td width="50px"><?php echo number_format($total,2); ?> </td>
                                            <td ><?php echo $min; ?></td>
                                            <!-- COMENTADO td><?php echo $estado;?></td-->
                                            <td><?php echo $marca;?></td>
                                            <!-- COMENTADO td><?php echo $desc_corta;?></td>
                                            <td><?php echo $color;?></td>
                                            <td><?php echo $mon;?><span class='pull-right'><?php echo number_format($precio_producto,2);?></span></td-->
                                           
                                           
					</tr>
					<?php
                                    }
                                }
				?>
				
			  </table>

			
<?php
                                    }
                              
				?>


<!-- FINALIZA INFORME DE INVENTARIOS-->

<?php
ob_start();
session_start();
include('menu.php');
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos



$sql1="select * from users where user_id=$_SESSION[user_id]";
$rw1=mysqli_query($con,$sql1);//recuperando el registro
$rs1=mysqli_fetch_array($rw1);//trasformar el registro en un vector asociativo
$sql2="select * from sucursal ORDER BY  `sucursal`.`tienda` DESC ";
$rw2=mysqli_query($con,$sql2);//recuperando el registro
$rs2=mysqli_fetch_array($rw2);//trasformar el registro en un vector asociativo
$tienda3=$rs2["tienda"];   
$modulo=$rs1["accesos"];
$a = explode(".", $modulo); 
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
    header("location: login.php");
    exit;
}
if($a[12]==0){
    header("location:error.php");    
}

?>







<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html"; charset=utf-8"/> 
  <!-- Meta, title, CSS, favicons, etc. -->
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title> 
  
  Kardex
  </title>

  <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/custom.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/formularios.css"/>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="DataTables/DataTables/css/dataTables.bootstrap.min.css"/>
 <script type="text/javascript" src="DataTables/DataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="Buttons/js/buttons.colVis.min.js"></script>
<link rel="stylesheet" type="text/css" href="Buttons/css/buttons.dataTables.min.css"/>
<script type="text/javascript" src="Buttons/js/jszip.min.js"></script>
<script type="text/javascript" src="Buttons/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="Buttons/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="Buttons/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="Buttons/js/buttons.print.min.js"></script>
<style>
    table tr:nth-child(odd) {background-color: #FBF8EF;}

table tr:nth-child(even) {background-color: #EFFBF5;}
 #valor1 {
              

border-bottom: 2px solid #F5ECCE;

}  

#valor1:hover {
              
background-color: white;
border-bottom: 2px solid #A9E2F3;

} 

.dt-button.red {
        color: black;
        
        background:red;
    }
 
    .dt-button.orange {
        color: black;
        background:orange;
    }
 
    .dt-button.green {
        color: black;
        background:green;
    }
    
    .dt-button.green1 {
        color: black;
        background:#01DFA5;
    }
    
    .dt-button.green2 {
        color: black;
        background:#2E9AFE;
    }
    
  
</style>
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
          <!-- /menu prile quick info -->

        </div>
      </div>

        
        <?php
          menu3();
          
      
        ?>

    
      <div class="right_col" role="main">
<?php 


$consulta2 = "SELECT * FROM consultas ";
$result2 = mysqli_query($con, $consulta2);
$d=0;
$producto1="";

$fecha1="";
$fecha2="";
$id_producto=0;
$tienda=0;
while ($valor1 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
    
     if ($valor1['tipo']==100){
          $d=$valor1['id'];
          
          $id_producto=$valor1['a1'];
          $producto1=$valor1['a6'];
          //$nom_pro=trim($nom_pro1);
          $fecha1=$valor1['a2'];
          
          $fecha2=$valor1['a3'];
          $tiend=$valor1['a4'];
          if($tiend==7){
              $tienda1=1;
              $tienda2=$tienda1;
          }else{
              $tienda1=$tiend;
              $tienda2=$tiend;
          }
          
          if ($fecha1<>""){
            $d1 = explode("-", $fecha1);
            $dia1=$d1[0]; 
            $mes1=$d1[1];
            $ano1=$d1[2];
            }
            $dd1=$ano1."-".$mes1."-".$dia1;
            if ($fecha2<>""){
                $d2 = explode("-", $fecha2);
                $dia2=$d2[0]; 
                $mes2=$d2[1];
                $ano2=$d2[2];
                $dd2=$ano2."-".$mes2."-".$dia2;
            }
    
     }
    
}
    
            ?>
          
           
               
               <div class="row" >
                   <div class="col-md-12 col-sm-12 col-xs-12" >
                       
                  
                      <div style="background:<?php echo COLOR;?>">       
               
               
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <?php 
                                $video=videos;
                    
                                if($video==1){
                                    $v="q4O3a6drZ8Q";
                                    include("modal/registro_video.php");
                                    ?>
                                    <div class="btn-group pull-right">
                                        <button type='button' class="btn btn-danger" data-toggle="modal" data-target="#nuevoVideo"><span class="glyphicon glyphicon-play" ></span>Video Tutorial</button>
                                    </div>
                                    <?php
                    
                                }
                                ?>
                                <h2>Crear Informe Mensual De Inventario:</h2>
                            </div>        
                    </div>  
                 

                           <form style="color:black"  name="myForm" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="POST" action="kardex3.php">
                      
                          
                      <div class="col-md-12 col-sm-12 col-xs-12" >
                          <label>Nombre del Producto:</label>
                        <input class="textfield10" type="search" style="color:black;font-size:10pt; font-family:Verdana;" class="form-control input-sm" id="nombre_producto" name="producto" value="<?php echo $producto1;?>" placeholder="Nombre del producto" >
					  <input id="id_producto" name="id_producto" type='hidden' value="<?php echo $id_producto;?>">
                      </div>
                     
                         
                          <div class="col-md-4 col-sm-4 col-xs-12" style="width:35%;">
                            <label>Fecha Inicial:</label>
                            <input  class="textfield10"  name="fecha1"  data-validate-length-range="4" type="date"  class="form-control col-md-10" style="float: left;" id="fecha1"   value="<?php echo $fecha1;?>" required>
                              
                            
                          </div>
                      
                       <div class="col-md-4 col-sm-4 col-xs-12" style="width:35%;">
                            <label>Fecha Final:</label>
                            <input   class="textfield10" name="fecha2"  data-validate-length-range="4" type="date"  class="form-control col-md-10" style="float: left;" id="fecha2"   value="<?php echo $fecha2;?>" required>
                              
                            
                          </div>
                     
                      
                       <div class="col-md-4 col-sm-4 col-xs-12" style="width:30%;">
                        <label>Ubicación</label>
                           <select class="textfield11" class="form-control col-md-10" name="tienda" required="required" tabindex="-1" required>
                            <?php
                            if($tiend>0){
                                
                                if($tiend==7){
                                    $t="Todas";
                                }else{
                                    $t="Sucursal $tiend";
                                }
                                
                                ?>
                               
                            <?php  
                               }
                             
                               for($i=1 ;$i<=$tienda3;$i++){
                                ?>
                                    <option value="<?php echo $i;?>" >Bodega <?php echo $i;?></option>              
                               <?php
        
                            }
                               
                               
                            ?>
                                                                                      
                        
                           </select>
                        <br>
                      <br>
                      </div>
             
                      
                      <input type="hidden" name="d" value="1">
                      
                      <div class="col-md-12 col-sm-12 col-xs-12">
                          <br><button id="send" type="submit" name="enviar" class="btn btn-success">Buscar</button>
                      
                   </div>
                      
                    
                    </form>
                  
                       </div>
                   
                   </div>
               </div>
          
          <div class="row">

              <?php
                       

$total1=0;
$total2=0;
$saldo=0;
if($d==0){
//$sql="select * from products ORDER BY  `products`.`id_producto` DESC LIMIT 0 , 100";
    $sql="";
}else{
  
$host= $_SERVER["HTTP_HOST"];
$url= $_SERVER["REQUEST_URI"];
$aa="http://".$host.$url;


$consulta2 = "SELECT * FROM products where id_producto=$id_producto";
    $result2 = mysqli_query($con, $consulta2);
    while ($valor2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
        //if($valor1['user_id']==$id_vendedor){
            $nombre1=$valor2['nombre_producto'];
        //}      
        
    }

?>
       
  <div class="table-responsive">
      <a href="kardex4.php?id_producto=<?php echo $id_producto;?>&fecha1=<?php echo $fecha1;?>&fecha2=<?php echo $fecha2;?>">Descargar</a>
                  <table id="example"  style="width:100%;color:black;" border="1">
                      <thead>
                  
                          <tr >
                       
                        <th></th>
                        
                        
                        
                        <th></th>
                        <th style="width:20%;">&nbsp;</th>
                        
                        
                        <th></th>
                       
                        
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                      
                      </tr>
                      </thead>
                      
                      <tbody>  
                      <tr>
                       
                        <td></td>
                        
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        
                        
                        <td></td>
                       
                        <td style="text-align:center; font-weight:bold; font-size:20px"><?php echo $nombre1;?></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        
                      
                      </tr>
                      
                      <tr>
                       
                        <td> </td>
                        
                        
                        
                        <td></td>
                        
                        <td style="background-color:#2E9AFE;color:white; font-weight:bold; text-align:center;"></td>
                        <td style="background-color:#2E9AFE;color:black; font-weight:bold; text-align:center;">UNIDADES</td>
                        <td style="background-color:#2E9AFE;color:white; "></td>
                        <td style="background-color:#2E2EFE;color:white; "></td>
                        <td style="background-color:#2E2EFE;color:black; font-weight:bold; text-align:center;">COSTO</td>
                        <td style="background-color:#2E2EFE;color:white; "></td>
                        <td style="background-color:#2E2EFE;color:white; "></td>
                      </tr>
                  
                      <tr style="background-color:orange;color:white; ">
                       
                        <td style="font-weight:bold; text-align:center;color:black;">FECHA  </td>
                        
                        
                        
                        <td style="font-weight:bold; text-align:center; color:black;color:black;">DESCRIPCION  </td>
                        
                       
                        <td style="font-weight:bold; text-align:center;color:black;">INGRESO </td>
                        <td style="font-weight:bold; text-align:center;color:black;">EGRESO  </td>
                        <td style="font-weight:bold; text-align:center;color:black;">SALDO </td>
                        <td style="font-weight:bold; text-align:center;color:black;">COSTO<BR>UNITARIO </td>
                        <td style="font-weight:bold; text-align:center;color:black;">COSTO<BR>TOTAL </td>
                        <td style="font-weight:bold; text-align:center;color:black;">COSTO<BR>PROMEDIO </td>
                        <td style="font-weight:bold; text-align:center;color:black;">SALDO<BR>EN Q</td>
                      
                      </tr>
                      
                      <tr>
                       
                        <td></td>
                        
                        <td></td><!-- va dentro del td SIN MOVIMIENTO EN TARJETA ANTERIOR-->
                        
                        
                        <td></td>
                        
                        
                        <td></td>
                       
                       
                        <td>0</td>
                        <td></td>
                        <td></td>
                        <td>0</td>
                        <td>0</td>
                      
                      </tr>
                      
                      
                    

                    
 <?php 
 $texto1="";
 
    
 
 
 if($id_producto*1>0){
     $texto="id_producto=$id_producto";
 }
 if($id_producto*1==0){
     $texto="IngresosEgresos.id_producto=products.id_producto";
     $texto1=",products";
 }
 
    //if($id_producto1==$id_producto  && $fecha>=$fech1 && $fecha<=$fech2 && $tienda>=$tienda1 && $tienda<=$tienda2)
//$sql="select * from IngresosEgresos where ORDER BY `IngresosEgresos`.`fecha` ASC  "; 
$sql="select * from IngresosEgresos $texto1 where IngresosEgresos.ven_com<>12 and $texto and IngresosEgresos.tipo_doc<>8 and IngresosEgresos.tienda>=$tienda1 and IngresosEgresos.tienda<=$tienda1 and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')>='$fecha1' and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')<='$fecha2' ORDER BY `IngresosEgresos`.`id_detalle` ASC  ";         
$s=1;
$cp=0;
$cp1=0;
$q=0;
$q1=0;
$s1=0;

$d=0;
//print"$sql";
$rs=mysqli_query($con,$sql);
while($row= mysqli_fetch_array($rs)){
$id_vendedor=$row['id_vendedor'];
$numero_factura=$row['numero_factura'];
$cantidad1=$row['cantidad'];
$precio_compra=$row['precio_venta'];
$tienda3=$row['tienda'];
$tipo=$row['ot'];
$tipo_doc=$row['tipo_doc'];
$inv_ini=$row['inv_ini'];
$id_producto1=$row['id_producto'];
$ven_com=$row['ven_com'];
$activo=$row['activo'];
$descripcion1="Ninguno";
if($id_producto*1==0){
    $producto1=$row['nombre_producto'];
}

if($row['folio']<>""){
    $folio="$row[folio]";
}else{
   $folio=""; 
}


if($numero_factura==0){
    $descripcion="Traslado de tienda";
    if($row['folio']<>"777"){
        $descripcion="Se abrio packs";
    }
    
    
}else{
    if($tipo_doc==1){
        $descripcion1="Factura";
    }
    if($tipo_doc==2){
        $descripcion1="Boleta";
    }
    if($tipo_doc==3){
        $descripcion1="Guias";
    }
    if($tipo_doc==5){
        $descripcion="Nota de Debito";
        $descripcion1="Nota de Debito";
    }
    if($tipo_doc==6){
        $descripcion="Nota de Credito";
        $descripcion1="Nota de Credito";
    }
    if($ven_com==1 and $activo==1 and $precio_compra>0){
        if($tipo_doc<=3)
        {
            $descripcion="Despacho";
        }          
    }
    if($ven_com==2 and $activo==1 and $precio_compra>0){
        $descripcion="Compras";
    }
    if($precio_compra==0 and $activo==1){
        $descripcion="Traslado de tienda";
    }
    if($activo==0 ){
        $descripcion="Documento Eliminado";
        //$precio1=$row['precio_compra'];
        if($tipo_doc==9 && $precio_compra>0){
             $descripcion="Entrada Mercaderia";
        }
        if($tipo_doc==10 && $precio_compra>0){
             $descripcion="Salida Mercaderia";
        }
        
    }
}
if($tipo==0){
    $entrada=0;
    $salida=0;
}
if($tipo==1){
    $entrada=0;
    $salida=$cantidad1;
}
if($tipo==2){
    $salida=0;
    $entrada=$cantidad1;
}
//$saldo=$entrada-$salida; 
//if($d==0){
$saldo=$s1+$entrada-$salida; 
//}else{
//    $saldo=$inv_ini+$entrada-$salida; 
//}

$cliente1="";
$unidad_Profesional="";
if($tipo_doc>0){
$consulta1 = "SELECT * FROM facturas ";
$result1 = mysqli_query($con, $consulta1);
while ($valor1 = mysqli_fetch_array($result1, MYSQLI_ASSOC)) {   
    if($valor1['numero_factura']==$numero_factura && $valor1['estado_factura']==$tipo_doc && $valor1['tienda']==$tienda3){
        $id=$valor1['id_cliente'];
    }   
}
$consulta2 = "SELECT * FROM clientes ";
$result2 = mysqli_query($con, $consulta2);
while ($valor1 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {  
    if($valor1['id_cliente']==$id){
        $cliente1=$valor1['nombre_cliente'];
        $unidad_Profesional=$valor1['direccion_cliente'];
    }   
}
}
if($tipo_doc==0){
    $consulta2 = "SELECT * FROM users ";
    $result2 = mysqli_query($con, $consulta2);
    while ($valor1 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
        if($valor1['user_id']==$id_vendedor){
            $nombre1=$valor1['nombres'];
        }  
    }
$cliente1=$nombre1;
}
$fecha3=$row['fecha'];
$d3 = explode("-",$fecha3);
$dia=date("d",strtotime($fecha3)); 
$mes=date("m",strtotime($fecha3));  
$ano=date("Y",strtotime($fecha3)); 
$dd=$ano."-".$mes."-".$dia;
$dd5=$dia."-".$mes."-".$ano;
$hora=date("H:i",strtotime($fecha3)); 
$fecha=strtotime($dd);
$fech1=strtotime($dd1);
$fech2=strtotime($dd2);
$tienda=$row['tienda'];
$total_venta=$row['precio_venta']*$cantidad1;
//if($id_producto1==$id_producto  && $fecha>=$fech1 && $fecha<=$fech2 && $tienda>=$tienda1 && $tienda<=$tienda2){

        $total1=$total1+$total_venta;
        //$mon="S/.";
        $entrada1=round($entrada,2);
        $precio_compra1=round($precio_compra,2);
        $pre1=round($precio_compra*($entrada+$salida),2);
        if($entrada==0){
            $entrada1="";
            $precio_compra1="";
            //$pre1=""; 
        }
        $salida1=round($salida,2);
        if($salida==0){
            $salida1="";
        }
        
        
        if($entrada>0){
            $q=round($q+$pre1,2);
            $cp=round($q/$saldo,2);
            $q1=$q;
            $s1=$saldo;
        }else{
            $q=round($q-$pre1,2);
            if($s1<>0){
                $cp=round($q1/$s1,2); 
            }else{
                $cp=0; 
            }
           
            $q1=$q;
            $s1=$saldo;
        }
        
        $d=$d+1;
        ?>
                       
        <tr id="valor1">
               
                        <td class=" "><?php print"$dd5";?></td>
                       
                        
                       
                       <td class=" "><?php 
                       
                       if($entrada==0){
                           print"Despacho'$folio' No $numero_factura, $cliente1, $unidad_Profesional";
                       }else{
                           print"F.1H  '$folio'Factura No $numero_factura, $cliente1";
                       }
                       
                       
                       
                       ?>
                       
                       
                       
                       
                       </td>
                       
                        <td><?php echo $entrada1;?></td>
                        <td><?php echo $salida1;?></td>
                        <td><?php echo $saldo;?></td>
                        <td><?php echo $precio_compra1;?></td>
                        <td><?php echo $pre1;?></td>
                        <td><?php echo $cp;$cp1=$cp1+$cp;?></td>
                        <td><?php echo $q;?></td>
                      </tr>                
    <?php
    $s=$s+1;

}                       
                        ?>
                    
                    <tr>
                       
                        <td></td>
                        
                        <td style="font-weight:bold; text-align:center;">SALDO FINAL AL <?php echo $fecha2;?> </td>
                        <td></td>
                        <td></td>
                       
                       
                        <td><?php echo $s1;?></td>
                        <td></td>
                        <td></td>
                        <td><?php echo round($cp1/$d,2);?></td>
                        <td><?php echo round($s1*$cp1/$d,2);?></td>
                      
                      </tr>  
                      
                      
                      
                    </tbody>

                  </table>
                
                     </form>
                </div>
              
              
            <?php
}
?>
             
            </div>
      
          </div>
         
        <!-- /footer content -->
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

  <!-- bootstrap progress js -->
  <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
  <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
  <script src="js/icheck/icheck.min.js"></script>

  <script src="js/custom.js"></script>


  <!-- Datatables -->
  
<?php $a=$_SESSION['tabla'];?>
  <!-- pace -->
  <script src="js/pace/pace.min.js"></script>
  
  
  <script type="text/javascript" src="js/autocomplete/countries.js"></script>
  <script src="js/autocomplete/jquery.autocomplete.js"></script>
  <!-- pace -->
  <script src="js/pace/pace.min.js"></script>
  
  
  
  
  <script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		$("#datos_a_enviar").val( $("<div>").append( $("#example").eq(0).clone()).html());
		$("#FormularioExportacion").submit();
});
});
</script>
<link rel="stylesheet" href="css/jquery-ui.css">
  <script src="js/jquery-ui.js"></script>
  
        <script>
		$(function() {
						$("#nombre_producto").autocomplete({
							source: "./ajax/autocomplete/productos1.php",
							minLength: 1,
							select: function(event, ui) {
								event.preventDefault();
								$('#id_producto').val(ui.item.id_producto);
								$('#nombre_producto').val(ui.item.nombre_producto);
								
                                                               
                                                                
							 }
						});
						 
						
					});
					
	$("#nombre_producto" ).on( "keydown", function( event ) {
						if (event.keyCode== $.ui.keyCode.LEFT || event.keyCode== $.ui.keyCode.RIGHT || event.keyCode== $.ui.keyCode.UP || event.keyCode== $.ui.keyCode.DOWN || event.keyCode== $.ui.keyCode.DELETE || event.keyCode== $.ui.keyCode.BACKSPACE )
						{
							$("#id_producto" ).val("");
							
                                                      
											
						}
						if (event.keyCode==$.ui.keyCode.DELETE){
							$("#nombre_producto" ).val("");
							$("#id_producto" ).val("");
							
                                                        
                                                                
						}
			});	
	
  </script>

 <script>
 
$(document).ready(function() {
    $('#example').DataTable( {
        language: {
        "url": "/dataTables/i18n/de_de.lang",
                "decimal": "",
        "show": "Mostrar",
        "emptyTable": "No hay informacion",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        buttons: {
                copyTitle: 'Copiar filas al portapapeles',
                
                copySuccess: {
                    _: 'Copiado %d fias ',
                    1: 'Copiado 1 fila'
                },
                
                pageLength: {
                _: "Mostrar %d filas",
                '-1': "Mostrar Todo"
            }
            },
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
        
        
        
        
    },
         bDestroy: true,
            dom: 'Bfrtip',
        lengthMenu: [
            [ 10, 25, 50, -1 ],
            [ '10 filas', '25 filas', '50 filas', 'Mostrar todo' ]
        ],
        buttons: 
        
        [
                
             {
                    extend: 'colvis',
                    text: 'Mostrar columnas',
                    className: 'green2',
                    exportOptions: {
                    columns: ':visible'
                }
                
                },   
                          
{
                    extend: 'pageLength',
                    text: 'Mostrar filas',
                    className: 'orange',
                    exportOptions: {
                    columns: ':visible'
                }
                
                },
                
                {
                    extend: 'copy',
                    text: 'COPIAR',
                    className: 'red',
                    exportOptions: {
                    columns: ':visible'
                }
                },
                
                
                
                {
                    extend: 'excel',
                    text: 'EXCEL',
                    className: 'green',
                    exportOptions: {
                    columns: ':visible'
                }
                },
                {
                    extend: 'csv',
                    text: 'CSV',
                    className: 'green1',
                    exportOptions: {
                    columns: ':visible'
                }
                },
                {
                    extend: 'print',
                    text: 'IMPRIMIR',
                    className: 'green2',
                    exportOptions: {
                    columns: ':visible'
                }
                },
            ],
        "pageLength": 100,
        "order": [],
        
    } );
} );



</script>




</body>

</html>
<?php
ob_end_flush();
?>



