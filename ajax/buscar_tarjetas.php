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
</style>
<?php
	//include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
	/* Connect To Database*/
	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
	$tienda1=$_SESSION['tienda'];
        $usuario=$_SESSION['user_id'];
        date_default_timezone_set('America/Lima');
        $fecha1  = date("Y-m-d H:i:s");
 	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$id_factura=intval($_GET['id']);
		$del1="UPDATE facturas set activo=0 where id_factura='".$id_factura."'";
                $sql1=mysqli_query($con, "select * from facturas where id_factura='".$id_factura."'");
                $cuenta1=0;
                while ($row1=mysqli_fetch_array($sql1))
                {
                    $numero_factura=$row1["numero_factura"];
                    $folio=$row1["folio"];
                    $tipo_doc=$row1["estado_factura"];
                    $tienda=$row1["tienda"];
                    $id_cliente=$row1["id_cliente"];
                    $deuda=$row1["deuda_total"];
                    $nombre=$row1["nombre"];
                    $cuenta1=$row1["des"];
                }
                $del4="UPDATE clientes SET deuda=deuda-$deuda WHERE id_cliente='".$id_cliente."'";
                $del2="UPDATE IngresosEgresos set activo=0 where folio='".$folio."' and numero_factura='".$numero_factura."' and ven_com=1 and tienda=$tienda and tipo_doc=$tipo_doc and id_cliente=$id_cliente";
                $count_query= mysqli_query($con, "SELECT count(*) AS numrows FROM pagos  where id_factura=$id_factura");
		$row2= mysqli_fetch_array($count_query);
		$numrows = $row2['numrows'];
                $cuenta2=0;
          	if ($numrows==0 and $delete1=mysqli_query($con,$del1) and $delete2=mysqli_query($con,$del2) and $delete4=mysqli_query($con,$del4)){
                  $sql=mysqli_query($con, "select * from IngresosEgresos where folio='".$folio."' and numero_factura='".$numero_factura."' and ven_com=1 and tienda=$tienda and id_cliente=$id_cliente and tipo_doc=$tipo_doc" );
                    while ($row=mysqli_fetch_array($sql))
                    {
                        $id_producto=$row["id_producto"];
                        $tienda=$row["tienda"];
                        $cantidad=$row["cantidad"];
                        $b="b".$tienda;
                        //$serie=mysqli_query($con, "UPDATE serie SET id_venta=0,num_venta=0,tienda=0,folio='',tip_doc=0  where folio='".$folio."' and num_venta='".$numero_factura."' and tienda=$tienda and id_venta=$id_cliente and tip_doc=$tipo_doc");
                        
                        if($cuenta1==1){
                        $productos1=mysqli_query($con, "UPDATE products SET $b=$b+$cantidad WHERE id_producto=$id_producto");
                        $cuenta2=2;
                        }
                        if($cuenta1==2){
                        $productos1=mysqli_query($con, "UPDATE products SET $b=$b-$cantidad WHERE id_producto=$id_producto");
                        $cuenta2=1;
                        }
                        $sql1=mysqli_query($con, "select * from products where id_producto='".$id_producto."'");
                        while ($row1=mysqli_fetch_array($sql1))
                        {
                            $b=$row1["b$tienda"];
                        }
                         
                        if($id_producto>0){
                            $c=$b-$cantidad;
                            $insert=mysqli_query($con,"INSERT INTO IngresosEgresos VALUES (NULL,'$id_cliente','$usuario','$numero_factura','$cuenta2','$id_producto','$cantidad','0','$tienda1','0','2','$fecha1','0','$tipo_doc','$c','1','$folio','')");  
         
                        }
                        
                    }
                    ?>
			<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Aviso!</strong> Datos eliminados exitosamente.
			</div>
			<?php 
		}else{
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se puedo eliminar los datos existen cobros asociados.
			</div>
			<?php
			
		}
	}
	if($action == 'ajax'){
		// escaping, additionally removing everything that could be (html/javascript-) code
                $q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
                $q1 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q1'], ENT_QUOTES)));
                $q2 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q2'], ENT_QUOTES)));
                $q3 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q3'], ENT_QUOTES)));
                
		$sTable = "detalle_tarjeta, clientes, users";
		$sWhere = "";
		$sWhere.=" WHERE detalle_tarjeta.id_cliente=clientes.id_cliente and detalle_tarjeta.tienda=$tienda1 and detalle_tarjeta.id_vendedor=users.user_id and detalle_tarjeta.ven_com=1 and detalle_tarjeta.estado_factura>=1 and detalle_tarjeta.estado_factura<=3 and detalle_tarjeta.activo=1 and detalle_tarjeta.numero_factura>0";
                if ( $_GET['q'] != "" )
		{
		$sWhere.= " and  (clientes.nombre_cliente like '%$q%' )";
		}
                if ( $_GET['q1'] != "" )
		{
		$sWhere.= " and  (detalle_tarjeta.folio like '%$q1%' )";
		}
                
                if ( $_GET['q2'] != "" )
		{
		$sWhere.= " and  (DATE_FORMAT(fecha_factura, '%Y-%m-%d')>='$q2' )";
		}
                if ( $_GET['q3'] != "" )
		{
		$sWhere.= " and  (DATE_FORMAT(fecha_factura, '%Y-%m-%d')<='$q3')";
		}
		$sWhere.=" order by detalle_tarjeta.id_factura desc";
		include 'pagination.php'; //include pagination file
		//pagination variables
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 20; //how much records you want to show
		$adjacents  = 4; //gap between pages after number of adjacents
		$offset = ($page - 1) * $per_page;
		//Count the total number of row in your table*/
		$count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
		$total_pages = ceil($numrows/$per_page);
		$reload = './facturas.php';
		//main query to fetch the data
		$sql="SELECT * FROM  $sTable $sWhere LIMIT $offset,$per_page";
		$query = mysqli_query($con, $sql);
		//loop through fetched data
		if ($numrows>0){
			echo mysqli_error($con);
			?>
                        <a href="excel/buscar_facturas.php?q=<?php echo $q;?>&q1=<?php echo $q1;?>&q2=<?php echo $q2;?>&q3=<?php echo $q3;?>" target="_blanck"><img src="images/descargar-excel.png" width="80" height="25"></a>
			
			<div class="table-responsive">
			  <table  class="table" style=" color:black;">
				<tr  style="background-color:orange;color:black;">
                                <th class='text-center'>No. Tarjeta</th>
                                <th class='text-center'>Tipo</th>
                                <th class='text-center'>Fecha</th>
				<th class='text-center' style="width:20%;">Dirigido a</th>
				<th class='text-center'>Total</th>
                                <!-- COMENTADO th class='text-right'>Deuda</th-->
                                <th class='text-center'>Responsable</th>
                                <!-- COMENTADOth>Pago</th-->
                                <th class='text-center'>Estado</th>
                                <th class='text-center'>Descargas</th>
                                
                                <th class='text-center'>Acciones</th>
				</tr>
                		<?php
				while ($row=mysqli_fetch_array($query)){
                                    
                                                $activo=$row['activo'];
						if ($activo==1){
                                                $id_factura=$row['id_factura'];
						$numero_factura=$row['numero_factura'];
						$fecha=date("d/m/Y", strtotime($row['fec_eli']));
						$nombre_cliente=$row['nombre_cliente'];
						$telefono_cliente=$row['telefono_cliente'];
                                                $ruc=$row['doc'];
						$email_cliente=$row['email_cliente'];
                                                $folio=$row['folio'];
                                                $dni=$row['dni'];
                                                
						$nombre_vendedor=$row['nombres'];
                                                $aceptado=$row['aceptado'];
                                                $estado_factura1=$row['estado_factura'];
 						$estado_factura=$row['condiciones'];
                                                $ven_com=$row['ven_com'];
                                                $moneda=$row['moneda'];
                                                $mon=moneda;
                                                if($estado_factura1==1){
                                                    $estado1="Tarjeta";
                                                    
                                                }
                                                if($estado_factura1==2){
                                                    $estado1="Boleta";
                                                    
                                                }
                                                if($estado_factura1==3){
                                                    $estado1=doc;
                                                }
                                                if($estado_factura1==5){
                                                    $estado1="Nota de Debito";
                                                    
                                                }
                                                if($estado_factura1==6){
                                                    $estado1="Nota de Credito";
                                               }
                                               if($estado_factura==1){
                                                    $estado2="Efectivo";
                                                }
                                                if($estado_factura==2){
                                                    $estado2="Cheque";
                                                    
                                                }
                                                if($estado_factura==3){
                                                    $estado2="Transf Bancaria";
                                                }
                                                if($estado_factura==4){
                                                    $estado2="Crédito";
                                                }
                                                if($estado_factura==5){
                                                    $estado2="Tarjeta";
                                                }
                                                $deuda=$row['deuda_total']-$row['cuenta1'];
                                                $servicio=$row['servicio'];
                                                $guia=0;
                                                //$sql1="SELECT * FROM  servicio;";
                                                //$query1 = mysqli_query($con, $sql1);
                                               
                                                //while ($row1=mysqli_fetch_array($query1)){
                                                //  if($row1['doc_servicio']==$numero_factura && $row1['tip_doc']==$estado_factura1)  {
                                                 //    $guia=$row1['guia'];
                                                // }
                                                //}
                                                if ($servicio==0){$text_estado1="Productos";$label_class1='label-success';}
                                                else{$text_estado1="Servicios";$label_class1='label-warning';}
                                           	if ($deuda==0){$text_estado="Asignado";$label_class='label-success';}
						else{$text_estado="Pendiente";$label_class='label-warning';}
						$total_venta=$row['total_venta'];
					?>
					<tr id="valor1">
                                           
						<td class='text-center'><?php print"$folio" ; ?></td>
                                                <td class='text-center'><?php echo $estado1; ?></td>
                                                <td class='text-center'><?php echo $fecha; ?></td>
						<td class='text-center'><?php echo $nombre_cliente;?></td>
                                                <td class='text-center'><?php print"$mon"; echo number_format ($total_venta,2); ?></td>					
                                                <!-- COMENTADO td class='text-right'><?php print"$mon"; echo number_format ($deuda,2); ?></td-->
                                                <td class='text-center'><?php echo $nombre_vendedor; ?></td>
                                                <!-- COMENTADO td><span class="label label-success"><?php echo $estado2; ?></span></td-->
                                                <td class='text-center'><span class="label <?php echo $label_class;?>"><?php echo $text_estado; ?></span></td>
                                                 <td class='text-center'>
                                                     <!--a href="#" class='btn btn-primary btn-xs' title='Descargar pdf' onclick="imprimir_factura('<?php echo $id_factura;?>');"><i class="glyphicon glyphicon-download"></i></a--> 
                                                     <a href="pdf/documentos/ver_tarjeta_responsabilidad.php?id_factura=<?php echo $id_factura;?>" class='btn btn-dark btn-xs' title='Descargar excel' ><i class="glyphicon glyphicon-download"></i></a> 
                                                     <!-- YA MANDA CORREO (y) -->
                                                     <!-- COMENTADO a href="email/index.php?id_factura=<?php echo $id_factura;?>" class='btn btn-dark btn-xs' title='Enviar email' ><i class="glyphicon glyphicon-download"></i></a--> 
                                                 
                                                 </td>
                                                  <td class='text-center'>
					
						<?php  
                                                if ($estado_factura1==1){
                                                    ?>
                                                <!--a href="guia.php?accion=<?php echo $id_factura;?>" class='btn btn-info btn-xs' title='Guia de remision' ><i class="glyphicon glyphicon-download"></i></a--> 
                                                 <?php
                                                }   
                                                ?>
                                                
                                                
						<?php  
                                                //if ($estado_factura1<=3 && $aceptado=="aceptada"){
                                                    //?>
                                                    <a  href="#" class='btn btn-danger btn-xs' title='Borrar Doc' onclick="eliminar('<?php echo $id_factura; ?>')"><i class="glyphicon glyphicon-trash"></i> </a>
                                                    <?php
                                               // }   
                                                ?>
                                                </td>
					</tr>
					<?php
                                        $numrows=$numrows-1;
                   		}
                                }
				?>
				
			  </table>
                          <tr style="background:white;">
					<td colspan=13><span class="pull-right"><?php
					 echo paginate($reload, $page, $total_pages, $adjacents);
					?></span></td>
				</tr>
			</div>
			<?php
		}
                }
	
?>

