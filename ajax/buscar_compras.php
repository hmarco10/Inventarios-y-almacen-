<?php
include('is_logged.php');
?>
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
 tfoot {
    display: table-header-group;
}     
</style>
<?php
require_once ("../config/db.php");
	require_once ("../config/conexion.php");
	$tienda1=$_SESSION['tienda'];
        $usuario=$_SESSION['user_id'];
        date_default_timezone_set('America/Lima');
        $fecha1  = date("Y-m-d H:i:s");
	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$id_factura=intval($_GET['id']);
		$del1="UPDATE facturas set activo=0 where id_factura='".$id_factura."'";
                $sql1=mysqli_query($con, "select * from facturas where id_factura='".$id_factura."'");
                $count_query= mysqli_query($con, "SELECT count(*) AS numrows FROM pagos  where id_factura=$id_factura");
		$row2= mysqli_fetch_array($count_query);
		$numrows = $row2['numrows'];
                if($numrows==0){
                while ($row1=mysqli_fetch_array($sql1))
                {
                    $numero_factura=$row1["numero_factura"];
                    $tipo_doc=$row1["estado_factura"];
                    $tienda=$row1["tienda"];
                    $deuda=$row1["deuda_total"];
                    $id_cliente=$row1["id_cliente"];
                    $folio=$row1["folio"];
                    $fecha=$row1["fecha_factura"];
                }
                
                $del4="UPDATE clientes SET debe=debe-$deuda WHERE id_cliente='".$id_cliente."'";
                
                $sql=mysqli_query($con, "select * from IngresosEgresos where numero_factura='".$numero_factura."' and ven_com=2 and tienda=$tienda and id_cliente=$id_cliente and tipo_doc=$tipo_doc and folio='$folio' and fecha='$fecha'" );
                while ($row=mysqli_fetch_array($sql))
                {
                    $id_producto=$row["id_producto"];
                    $tienda=$row["tienda"];
                    $cantidad=$row["cantidad"];
                    $b="b".$tienda;
                    $productos1=mysqli_query($con, "UPDATE products SET $b=$b-$cantidad WHERE id_producto=$id_producto");
                    $sql1=mysqli_query($con, "select * from products where id_producto='".$id_producto."'");
                    while ($row1=mysqli_fetch_array($sql1))
                    {
                        $b=$row1["b$tienda"];
                    }
                    $c=$b+$cantidad;  
                    $insert=mysqli_query($con,"INSERT INTO IngresosEgresos VALUES (NULL,'$id_cliente','$usuario','$numero_factura','1','$id_producto','$cantidad','0','$tienda1','0','1','$fecha1','0','$tipo_doc','$c','1','$folio','')");  
         
                }
                $del2="UPDATE IngresosEgresos set activo=0 where numero_factura='".$numero_factura."' and ven_com=2 and tienda=$tienda and tipo_doc=$tipo_doc and id_cliente=$id_cliente and folio='$folio' and fecha='$fecha'";
        
		if ($delete1=mysqli_query($con,$del1) and $delete2=mysqli_query($con,$del2) and $delete4=mysqli_query($con,$del4)){
			?>
			<div class="alert alert-success alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Aviso!</strong> Datos eliminados exitosamente
			</div>
			<?php 
		}else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se puedo eliminar los datos
			</div>
			<?php	
		}
                }else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> Existe pagos con esta compra.
			</div>
			<?php	
		}
	}
	if($action == 'ajax'){
        $q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
        $q2 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q2'], ENT_QUOTES)));
        $q3 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q3'], ENT_QUOTES)));
		$sTable = "facturas, clientes, users";
		$sWhere = "";
		$sWhere.=" WHERE facturas.id_cliente=clientes.id_cliente and facturas.id_vendedor=users.user_id and ven_com=2 and activo=1 and facturas.tienda=$tienda1";
		if ( $_GET['q'] != "" )
		{
		$sWhere.= " and  (clientes.nombre_cliente like '%$q%' or facturas.folio like '%$q%')";	
		}
                if ( $_GET['q2'] != "" )
		{
		$sWhere.= " and  (DATE_FORMAT(fecha_factura, '%Y-%m-%d')>='$q2' )";
		}
                if ( $_GET['q3'] != "" )
		{
		$sWhere.= " and  (DATE_FORMAT(fecha_factura, '%Y-%m-%d')<='$q3')";
		}
		$sWhere.=" order by facturas.id_factura desc";
		include 'pagination.php'; 
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 10; 
		$adjacents  = 4; 
		$offset = ($page - 1) * $per_page;
		$count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
		$total_pages = ceil($numrows/$per_page);
		$reload = './facturas.php';
		$sql="SELECT * FROM  $sTable $sWhere LIMIT $offset,$per_page";
		$query = mysqli_query($con, $sql);
		if ($numrows>0){
			echo mysqli_error($con);
			?>
			<div  class="table-responsive">
			  <table class="table" style="color:black;">
				<tr  style="background-color:orange;color:BLACK; ">
                                        <th style="text-align:center;">No. 1H</th>
                                        <th style="text-align:center;">Tipo de Doc</th>
                                	<th style="text-align:center;">Fecha</th>
					<th style="text-align:center;">Proveedor</th>
					<th style="text-align:center;">Responsable</th>
					<th style="text-align:center;">Tipo</th>
					<th style="text-align:center;">Total</th>
                                        <th style="text-align:center;">Acciones</th>	
				</tr>
				<?php
				while ($row=mysqli_fetch_array($query)){
                                                $activo=$row['activo'];
                                                $id_factura=$row['id_factura'];
						$numero_factura=$row['numero_factura'];
						$form1h=$row['folio'];
						$fecha=date("d/m/Y", strtotime($row['fecha_factura']));
						$nombre_cliente=$row['nombre_cliente'];
                                                $moneda=$row['moneda'];
                                                $mon=moneda;
                                                
                                                $estado_factura=$row['estado_factura'];
                                                if($estado_factura==1){
                                                    $estado1="Ingreso";   
                                                }
                                                if($estado_factura==2){
                                                    $estado1="Boleta"; 
                                                }
                                                if($estado_factura==3){
                                                    $estado1=doc; 
                                                }
						$telefono_cliente=$row['telefono_cliente'];
						$email_cliente=$row['email_cliente'];
                                                $ruc=$row['doc'];
                                                $obs=$row['obs'];
                                                $deuda=$row['deuda_total']-$row['cuenta1'];
						$nombre_vendedor=$row['nombres'];
						if ($row['ven_com']==1){$text_estado="Despacho";$label_class='label-success';}
						else{$text_estado="Compras";$label_class='label-warning';}
						$total_venta=$row['total_venta'];    
					?>
					<tr id="valor1">
						<td style="text-align:center;"><?php echo $form1h; ?></td>
                        <td style="text-align:center;"><?php echo $estado1; ?></td>
						<td style="text-align:center;"><?php echo $fecha; ?></td>
						<td style="text-align:center;"><?php echo $nombre_cliente;?></td>
						<td style="text-align:center;"><?php echo $nombre_vendedor; ?></td>
						<td style="text-align:center;"><span class="label <?php echo $label_class;?>"><?php echo $text_estado; ?></span></td>
						<td style="text-align:center;"><?php print"$mon ";echo number_format ($total_venta,2); ?></td>
                                                
                                                <td style="text-align:center;">
                                                    <!--a href="#" class='btn btn-primary btn-xs' title='Descargar documento' onclick="imprimir_factura('<?php echo $id_factura;?>');"><i class="glyphicon glyphicon-download"></i></a-->
                                                    <a href="pdf/documentos/ver_reporte1.php?id_factura=<?php echo $id_factura;?>" target="_blank" class='btn btn-dark btn-xs' ><i class="glyphicon glyphicon-download"></i></a> 
                                                    <a href="#" class='btn btn-danger btn-xs' title='Borrar documento' onclick="eliminar('<?php echo $id_factura; ?>')"><i class="glyphicon glyphicon-trash"></i> </a>
                                                </td>
						
					</tr>
					<?php
                                        $numrows=$numrows-1;
                                }
				?>
				<tr style="background:white;">
					<td colspan=10><span class="pull-right"><?php
					 echo paginate($reload, $page, $total_pages, $adjacents);
					?></span></td>
				</tr>
			  </table>
			</div>
			<?php
		}
        }
	
?>
