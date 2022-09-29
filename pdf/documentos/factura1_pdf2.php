<?php
ob_start();
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ../../login.php");
		exit;
        }
	include("../../config/db.php");
	include("../../config/conexion.php");
	$session_id= session_id();
	$sql_count=mysqli_query($con,"select * from tmp1 where session_id='".$session_id."'");
	$count=mysqli_num_rows($sql_count);
	if ($count==0)
	{
	echo "<script>alert('No hay productos agregados a la factura')</script>";
	echo "<script>window.close();</script>";
	exit;
	}
	$id_proveedores=intval($_GET['id_proveedores']);
        $id_vendedor=$_SESSION['user_id'];
        $fecha=$_GET['fecha'];
        $fecha2=$_GET['fecha_fac'];
        $hora=$_GET['hora'];
        $dolar=$_GET['tcp'];
        $obs=$_GET['obs'];
        $dias=$_GET['dias'];
        $ven_com=$_GET['ven_com'];
        $detalle1=$_GET['detalle1'];
        $detalle2=$_GET['detalle2'];
        $detalle3=$_GET['detalle3'];
        $checkBox=$POST['Prog'];
        $detalle4=$_GET['detalle4'];
        $detalle5=$_GET['detalle5'];
        $detalle6=$_GET['detalle6'];
        
        
        $moneda=intval($_GET['moneda']);
        $folio=$_GET['serie'];
        $moneda1=1;
        $tipo=intval($_GET['tipo_doc1']);
        if($tipo==1){
            $tipo1="Factura";
        }
        if($tipo==2){
            $tipo1="Boleta";
        }
        if($tipo==3){
            $tipo1="Nota de Venta";
        }
	$condiciones=mysqli_real_escape_string($con,(strip_tags($_REQUEST['condiciones'], ENT_QUOTES)));
	$sql=mysqli_query($con, "select LAST_INSERT_ID(numero_factura) as last from facturas order by id_factura desc limit 0,1 ");
	$rw=mysqli_fetch_array($sql);
	$numero_factura=intval($_GET['factura']);



?>
<style type="text/css">
<!--
table { vertical-align: top; }
tr    { vertical-align: top; }
td    { vertical-align: top; }
.midnight-blue{
	background:#2c3e50;
	padding: 4px 4px 4px;
	color:white;
	font-weight:bold;
	font-size:12px;
}
.silver{
	background:white;
	padding: 3px 4px 3px;
}
.clouds{
	background:#ecf0f1;
	padding: 3px 4px 3px;
}
.border-top{
	border-top: solid 1px #bdc3c7;
	
}
.border-left{
	border-left: solid 1px #bdc3c7;
}
.border-right{
	border-right: solid 1px #bdc3c7;
}
.border-bottom{
	border-bottom: solid 1px #bdc3c7;
}
table.page_footer {width: 100%; border: none; background-color: white; padding: 2mm;border-collapse:collapse; border: none;}

</style>
<script>
    function printPantalla()
{
   document.getElementById('cuerpoPagina').style.marginRight  = "0";
   document.getElementById('cuerpoPagina').style.marginTop = "1";
   document.getElementById('cuerpoPagina').style.marginLeft = "1";
   document.getElementById('cuerpoPagina').style.marginBottom = "0"; 
   document.getElementById('botonPrint').style.display = "none"; 
   window.print();
}
</script>
<body id="cuerpoPagina">
 <div><a href="#" id="botonPrint" onClick="printPantalla();"><img src="printer.png" border="0" style="cursor:pointer" title="Imprimir"></a></div>
<page backtop="15mm" backbottom="15mm" backleft="15mm" backright="15mm" style="font-size: 12pt; font-family: arial" >
        
    
    <?php
    date_default_timezone_set('America/Lima');
    ?>
    <table cellspacing="0" style="width: 100%;">
        <tr>

            <td style="width: 25%; color: #444444;">
                <br>
            </td>
            <td style="width: 50%; color: #34495e;font-size:12px;text-align:center"> 
            </td>
            <td style="width: 25%;text-align:right">
                   <?php print"$tipo1 $folio-$numero_factura";?>
            </td>
			
        </tr>
    </table>
    <br>
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
           <td style="width:50%;" class='midnight-blue'>FACTURADO POR:</td>
        </tr>
		<tr>
           <td style="width:50%;" >
			<?php 
				$sql_cliente=mysqli_query($con,"select * from clientes where id_cliente='$id_proveedores'");
				$rw_cliente=mysqli_fetch_array($sql_cliente);
				echo $rw_cliente['nombre_cliente'];
				echo "<br>Dirección:";
				echo $rw_cliente['direccion_cliente'];
				echo "<br> Telefono: ";
				echo $rw_cliente['telefono_cliente'];
				echo "<br> Email: ";
				echo $rw_cliente['email_cliente'];
			?>	
            </td>
        </tr>
    </table>
       <br>
		<table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt;">
        <tr>
           <td style="width:35%;" class='midnight-blue'>VENDEDOR</td>
		<td style="width:25%;" class='midnight-blue'>FECHA</td>
		<td style="width:40%;" class='midnight-blue'>FORMA DE PAGO</td>
        </tr>
	<tr>
            <td style="width:35%;">
			<?php 
				$sql_user=mysqli_query($con,"select * from users where user_id='$id_vendedor'");
				$rw_user=mysqli_fetch_array($sql_user);
				echo $rw_user['nombres'];
			?>
            </td>
            <td style="width:25%;"><?php echo date("d/m/Y");?></td>
            <td style="width:40%;" >
				<?php 
				if ($condiciones==1){echo "Efectivo";}
				elseif ($condiciones==2){echo "Cheque";}
				elseif ($condiciones==3){echo "Transferencia bancaria";}
				elseif ($condiciones==4){echo "Crédito";}
				?>
            </td>
        </tr> 
    </table>
	<br>
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>
            <th style="width: 10%;text-align:center" class='midnight-blue'>CANT.</th>
            <th style="width: 60%" class='midnight-blue'>DESCRIPCION</th>
            <th style="width: 15%;text-align: right" class='midnight-blue'>PRECIO UNIT.</th>
            <th style="width: 15%;text-align: right" class='midnight-blue'>PRECIO TOTAL</th>    
        </tr>

<?php
$nums=1;
$sumador_total=0;
$servicio=0;
//$tipo=intval($_GET['tipo_doc1']);
$sql=mysqli_query($con, "select * from products, tmp1 where products.id_producto=tmp1.id_producto and tmp1.session_id='".$session_id."'");
while ($row=mysqli_fetch_array($sql))
	{
	$id_tmp=$row["id_tmp"];
	$id_producto=$row["id_producto"];
	$codigo_producto=$row['codigo_producto'];
	$cantidad=$row['cantidad_tmp'];
	$nombre_producto=$row['nombre_producto'];
	$precio_venta=$row['precio_tmp'];
        $pro_ser=$row['pro_ser'];
        $cod=$row['cod'];
        $renglon=$row["Renglon_Presupuestario"];
        $lote=["lote"];
        $serie1=$row["Serie"];
        if ($pro_ser==1){
            $servicio=$servicio+1;
        }
	$precio_venta_f=$precio_venta;
	$precio_venta_r=str_replace(",","",$precio_venta_f);
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=number_format($precio_total,2);
	$precio_total_r=str_replace(",","",$precio_total_f);
	$sumador_total+=$precio_total_r;//Sumador
	if ($nums%2==0){
		$clase="clouds";
	} else {
		$clase="silver";
	}
	?>
        <tr>
            <td class='<?php echo $clase;?>' style="width: 10%; text-align: center"><?php echo $cantidad; ?></td>
            <td class='<?php echo $clase;?>' style="width: 60%; text-align: left"><?php echo $nombre_producto;?></td>
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right"><?php echo $precio_venta_f;?></td>
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right"><?php echo $precio_total_f;?></td>
            
        </tr>

	<?php 
        
        $sql3=mysqli_query($con, "select * from products where id_producto='".$id_producto."'");
        $row3=mysqli_fetch_array($sql3);
        $tienda=$_SESSION['tienda'];
        $b="b$tienda";
        $c=$tienda;
        $d=$row3["b$tienda"];
        $fecha1=date("Y-m-d", strtotime($fecha) );
        $date_added=$fecha1." ".$hora;
        $costo = $row3["costo_producto"];
        
        $nuevocosto = (($d*$costo)+($cantidad*$precio_venta_r))/($d+$cantidad);

	$insert_detail=mysqli_query($con, "INSERT INTO IngresosEgresos VALUES (NULL,'$id_proveedores','$id_vendedor','$numero_factura','$ven_com','$id_producto','$cantidad','$cantidad','','$precio_venta_r','$c','1','2','$date_added','0','$tipo','$d','$moneda1','$folio','$cod','$renglon','$serie1','$detalle6','$detalle1')");
        
        
        if($ven_com==1){
            $productos1=mysqli_query($con, "UPDATE products SET $b=$b-$cantidad WHERE id_producto=$id_producto and pro_ser=1"); 
	
        }
        if($ven_com==2){
            //$productos1=mysqli_query($con, "UPDATE products SET $b=$b+$cantidad, costo_producto=$nuevo_costo WHERE id_producto=$id_producto and pro_ser=1"); 
            $productos1=mysqli_query($con, "UPDATE products SET $b=$b+$cantidad, precio_producto=$precio_venta_r ,costo_producto=$nuevocosto, precio2=$nuevocosto WHERE id_producto=$id_producto and pro_ser=1");
        }
        
        
        $nums++;
	}
	$subtotal=number_format($sumador_total,2,'.','');
	
	$total_factura=number_format($sumador_total/(1+iva),2,'.','');
        $total_iva=number_format(iva*$sumador_total/(1+iva),2,'.','');
        $moneda=intval($_GET['moneda']);
        $mon=moneda;
        if ($_SESSION['doc_ventas']==11) {
        ?>  
        <tr>
            <td colspan="3" style="widtd: 85%; text-align: right;">SUBTOTAL <?php echo $mon;?> </td>
            <td style="widtd: 15%; text-align: right;"> <?php echo number_format($total_factura,2);?></td>
        </tr>
		<tr>
            <td colspan="3" style="widtd: 85%; text-align: right;"><?php echo nom_iva;?> (<?php echo 100*iva; ?>)% <?php echo $mon;?> </td>
            <td style="widtd: 15%; text-align: right;"> <?php echo number_format($total_iva,2);?></td>
        </tr>
        <?php
         }
         ?>
        <tr>
            <td colspan="3" style="widtd: 85%; text-align: right;">TOTAL <?php echo $mon;?> </td>
            <td style="widtd: 15%; text-align: right;"> <?php echo number_format($subtotal,2);?></td>
        </tr>
    </table>
<br>
</page>
</body>
<?php

if($condiciones==4){
    $deuda=$sumador_total;
}else{
    $deuda=0;
}
$fecha1=date("Y-m-d", strtotime($fecha) );
$fecha2F=date("Y-m-d", strtotime($fecha2) );
$date=$fecha1." ".$hora;
$date2=$fecha2F." ".$hora;
$condiciones1="";
$cuenta="";
$dolar1=mysqli_query($con, "UPDATE datosempresa SET dolar=$dolar WHERE id_emp=1");
$deuda1=mysqli_query($con, "UPDATE clientes SET debe=debe+$deuda WHERE id_cliente=$id_proveedores");
//print"INSERT INTO facturas VALUES (NULL,'$numero_factura','$date','0','','$id_proveedores','0','$id_vendedor','$condiciones','$sumador_total','$deuda','$tipo','$c','2','1','0','$moneda1','$cuenta','$obs','0','2018-11-11','$dias','$folio','2','','0','','0')";
$insert=mysqli_query($con,"INSERT INTO facturas VALUES (NULL,'$numero_factura','$date','0','','$id_proveedores','0','$id_vendedor','$condiciones','$sumador_total','$deuda','$tipo','$c','$ven_com','1','0','$moneda1','$cuenta','$obs','0','$date2','$dias','$folio','2','','0','','0')");
//$id=mysqli_insert_id($con);
$id_factura=mysqli_insert_id($con);

/*obtengo la fecha*/
$fecha_factura=$_POST['fecha1'];
$fecha11=date("Y-m-d", strtotime($fecha_factura) );
$insertarFecha=$fecha11."".$hora;
//$f=explode('/',$fecha_factura);
//$fecha_sql=$f[2]."-".$f[0]."-".$f[1];



$insert1=mysqli_query($con,"INSERT INTO detalle VALUES ('$id_factura','$detalle1','$detalle2','$detalle3','$detalle4','$detalle5','$detalle6','$insertarFecha')");



$delete=mysqli_query($con,"DELETE FROM tmp1 WHERE session_id='".$session_id."'");
header("location:ver_factura1.php?id_factura=$id_factura");
ob_end_flush();
?>