<?php
	
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ../../login.php");
		exit;
    }
	/* Connect To Database*/
	include("../../config/db.php");
	include("../../config/conexion.php");
	$id_factura= intval($_GET['id_factura']);
	$sql_count=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");
	$count=mysqli_num_rows($sql_count);
	if ($count==0)
	{
	echo "<script>alert('Cotizacion no encontrada')</script>";
	echo "<script>window.close();</script>";
	exit;
	}
        
        header("Content-type: application/vnd.ms-excel" ) ; 
        header("Content-Disposition: attachment; filename=cotizacion.xls" ) ; 
	$sql_factura=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");
	$rw_factura=mysqli_fetch_array($sql_factura);
	$numero_factura=$rw_factura['numero_factura'];
	$id_cliente=$rw_factura['id_cliente'];
	$id_vendedor=$rw_factura['id_vendedor'];
	$fecha_factura=$rw_factura['fecha_factura'];
	$condiciones=$rw_factura['condiciones'];
        $moneda=$rw_factura['condiciones'];
        $estado=$rw_factura['estado_factura'];
        $ven_com=$rw_factura['ven_com'];
        $fecha=$rw_factura['fecha_factura'];
        $folio=$rw_factura['folio'];
        //$fecha=$rw_factura['fecha_factura'];
        $tienda2=$rw_factura['tienda'];
        $tienda1=$_SESSION['tienda'];
        if($estado==1){
            $tipo1="Factura";
        }
        if($estado==2){
            $tipo1="Boleta";
        }
        if($estado==3){
            $tipo1="Nota de Venta";
        }
	
   
?>




    <?php

if($tienda1==$tienda2){
    ?>
<page backtop="15mm" backbottom="15mm" backleft="15mm" backright="15mm" style="font-size: 12pt; font-family: arial" >
        <page_footer>
        
    </page_footer>
    <table cellspacing="0" style=" text-align: left; font-size: 10pt;">
        <tr>
            <th width="100"></th>
            <th width="500">Licenciado Luis Alberto Aguilar Mayorga</th>
            <th width="100"></th>
           
            
        </tr>
        
        <tr>
            <td></td>
            
            <td><strong>Coordinador de la Unidad de Administracion Financiera</strong></td>
           
            <td><?php echo date("d/m/Y", strtotime($fecha_factura));?></td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            
            <td></td>
            <td></td>
            
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            
            <td></td>
            <td></td>
            
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            
            <td></td>
            <td></td>
            
            
        </tr>
        <tr>
            <td></td>
            
            
            <td>Por este medio solicito a usted se sirva proporcionar los bienes, materiales y/o servicios que a continuacion se detallan:</td>
            
            <td></td>
        </tr>
        
        
<?php
$nums=1;
$sumador_total=0;
$sql=mysqli_query($con, "select * from products, IngresosEgresos, facturas where IngresosEgresos.activo=0 and IngresosEgresos.tipo_doc=8 and products.id_producto=IngresosEgresos.id_producto and facturas.ven_com=1 and IngresosEgresos.folio='$folio' and IngresosEgresos.fecha='$fecha'  and IngresosEgresos.id_cliente=facturas.id_cliente and IngresosEgresos.numero_factura=facturas.numero_factura and facturas.id_factura='".$id_factura."' ORDER BY  `IngresosEgresos`.`id_detalle` ASC");

//print"";
while ($row=mysqli_fetch_array($sql))
	{
	$id_producto=$row["id_producto"];
	$codigo_producto=$row['codigo_producto'];
	$cantidad=$row['cantidad'];
	$nombre_producto=$row['nombre_producto'];
	$precio_venta=$row['precio_venta'];
        $nome=$row['nome'];
	$precio_venta_f=number_format($precio_venta,2);//Formateo variables
	$precio_venta_r=str_replace(",","",$precio_venta_f);//Reemplazo las comas
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=number_format($precio_total,2);//Precio total formateado
	$precio_total_r=str_replace(",","",$precio_total_f);//Reemplazo las comas
	$sumador_total+=$precio_total_r;//Sumador
	if ($nums%2==0){
		$clase="clouds";
	} else {
		$clase="silver";
	}
	?>
        <tr>
            <td class='<?php echo $clase;?>' style="width: 10%; text-align: center"><?php echo $cantidad; ?></td>
            <td class='<?php echo $clase;?>' style="width: 50%; text-align: left"><?php echo $nombre_producto;?></td>
           
            <td></td>
            
            
           
            
        </tr>
	<?php 
	$nums++;
	}
	
       
        ?>
       
       
        <tr>
            
            <td colspan="3">---------------------------------------------- U L T I M A     L I N E A --------------------------------------------</td>
           
        </tr>
         <tr>
            <td></td>
            <td>Para stock de Almacen y Cubrir requerimientos del Programa 11 del Consejo </td>
            <td></td>
           
        </tr>
        <tr>
            
            <td colspan="2">Nacional de Adopciones</td>
           <td></td>
           
        </tr>
        
        
    </table>
	
	<br>
</page>

</body>

<?php 


}
?>