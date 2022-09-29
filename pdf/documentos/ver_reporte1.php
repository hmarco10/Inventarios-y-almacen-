<?php
	
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ../../login.php");
		exit;
    }
    header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=reporte1.xls" ) ; 
	/* Connect To Database*/
	include("../../config/db.php");
	include("../../config/conexion.php");
	$id_factura= intval($_GET['id_factura']);
	$sql_count=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");
	$count=mysqli_num_rows($sql_count);
	if ($count==0)
	{
	echo "<script>alert('Factura no encontrada')</script>";
	echo "<script>window.close();</script>";
	exit;
	}
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
        $folio=$rw_factura['folio'];
        $fecha=$rw_factura['fecha_factura'];
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

        //TRAEMOS EL NOMBRE DEL CLIENTE POR MEDIO DE SU ID
        $sql_factura2 = mysqli_query($con,"select nombre_cliente from clientes where id_cliente='".$id_cliente."'");
        $rw_factura2 = mysqli_fetch_array($sql_factura2);
        $nombre_cliente = $rw_factura2['nombre_cliente'];

        //TRAEMOS FOLIO ALMACEN Y FOLIO INVENTARIO 
        $sql_factura3 = mysqli_query($con,"SELECT detalle1, detalle2, detalle4  FROM detalle where id_factura='".$id_factura."' ");
        $rw_factura3 = mysqli_fetch_array($sql_factura3);
        $serie_fac = $rw_factura3['detalle1'];
        $libroAlmacen = $rw_factura3['detalle2'];
        $observaciones=$rw_factura3['detalle4'];  

        $sql_factura3 = mysqli_query($con,"SELECT detalle1, detalle2, detalle3, detalle6  FROM detalle where id_factura='".$id_factura."' ");
        $rw_factura3 = mysqli_fetch_array($sql_factura3);
        $serie_fac = $rw_factura3['detalle1'];
        $libroAlmacen = $rw_factura3['detalle2'];  
        $libroInv = $rw_factura3['detalle3'];
        $OrdenPago = $rw_factura3['detalle6'];

        /*$sql_Programas = mysqli_query($con,"SELECT Nom_Programa FROM programas_facturas where id_factura='".$id_factura."'");
        $rw_Programas = mysqli_fetch_array($sql_Programas);
        $programa2 =$rw_Programas['Nom_Programa'];*/

        $query = "SELECT Nom_Programa FROM programas_facturas where id_factura='".$id_factura."'";
        
        /*$result = mysqli_query($con, $query);
            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                print_r ($row);
            }*/

        //$json= json_encode($row);

        
   
?>

	
  
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>
            <th width="100"></th>
            <th width="200"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th width="100"></th>
        </tr>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <tr>
            <td></td>
            
            <td  colspan="5"><strong>CONSEJO  NACIONAL  DE  ADOPCIONES</strong></td>
            <td></td>
            <td class='<?php echo $clase;?>' style="width: 50%; text-align: right; font-size: 8pt;" ><strong>FACT. <?php echo '"'.$serie_fac.'"';?>  No. <?php echo $numero_factura;?></strong></td>
            
        </tr>
        <tr>
            <td></td>
            
            <td colspan="4"><strong>
            <?php 
                 $result = mysqli_query($con, $query);
                 while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                     //print_r ($row);
                     //echo json_encode($row);
                     echo join($row);
                 }
            
             
            ?>
            </strong> </td>
            <td></td>
            <td></td>
            <td><strong><?php echo date("d/m/Y", strtotime($fecha_factura));?></strong></td>
            
        </tr>
        <tr>
            <td></td>
            
            <td colspan="4"><strong><?php echo $nombre_cliente ?></strong></td>
           <td></td>
           <td></td>
            <td><strong><?php echo $OrdenPago ?></strong></td>
            
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <th></th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        
<?php
$nums=1;
$sumador_total=0;
$sql=mysqli_query($con, "select * from products, IngresosEgresos, facturas where IngresosEgresos.activo=1 and products.id_producto=IngresosEgresos.id_producto and facturas.ven_com=$ven_com and IngresosEgresos.folio='$folio' and IngresosEgresos.fecha='$fecha' and facturas.estado_factura=IngresosEgresos.tipo_doc and IngresosEgresos.id_cliente=facturas.id_cliente and IngresosEgresos.numero_factura=facturas.numero_factura and facturas.id_factura='".$id_factura."' ORDER BY  `IngresosEgresos`.`id_detalle` ASC");

//$sql2 = mysqli_query($con,"SELECT * FROM detalle where id_factura='".$id_factura."' "); 

while ($row=mysqli_fetch_array($sql))
	{
	$id_producto=$row["id_producto"];
	$codigo_producto=$row['codigo_producto'];
	$cantidad=$row['cantidad'];
        $nome=$row['nome'];
        $renglon=$row['Renglon'];
	$nombre_producto=$row['nombre_producto'];
    $Desc_Laga=$row['color'];
	$precio_venta=$row['precio_venta'];
    $lote=$row['Lote'];
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
            <td class='<?php echo $clase;?>' style="width: 50%; text-align: justify">
            <?php 
            if($lote<>""){
                echo "serie: ".$lote; 
            }
            ?> 
            <?php echo  $Desc_Laga;?></td>
           
            
            <td><?php echo $renglon ?></td>
            <td><?php echo $libroAlmacen ?></td>
            
            
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right">Q <?php echo $precio_venta_f;?></td>
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right">Q <?php echo  $precio_total_f;?></td>
            <td><?php echo $libroInv ?></td>
            <td style="width: 10%; text-align: center"><?php echo $nome;?></td>
            
        </tr>
	<?php 
	$nums++;
	}
	
       
        ?>
       
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td  style="text-align: right;"><strong>TOTAL</strong> </td>
            <td></td>
            <td style="text-align: right;">Q <?php echo number_format($sumador_total,4);?></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="4">------------- U L T I M A-----L I N E A ------------------</td>
            <td></td>
            <td></td>            
        </tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        
        <tr>
            <td></td>
                      
            <td colspan="6"><?php echo "<tab>".$observaciones; ?> </td>
            <td></td>
        </tr>
    </table>
	

<?php 



?>  