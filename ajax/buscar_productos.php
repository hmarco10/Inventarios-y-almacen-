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
	include('is_logged.php');
	require_once ("../config/db.php");
	require_once ("../config/conexion.php");
        function generar_numero_aleatorio($longitud) {
            $key = '';
            $pattern = '1234567890';
            $max = strlen($pattern)-1;
            for($i=0;$i < $longitud;$i++) $key .= $pattern{mt_rand(0,$max)};
            return $key;
        }
        $tienda=$_SESSION['tienda'];
	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	if (isset($_GET['id'])){
		$id_producto=intval($_GET['id']);
		$query=mysqli_query($con, "select * from IngresosEgresos where id_producto='".$id_producto."'");
		$count=mysqli_num_rows($query);
		if ($count==0){
			if ($delete1=mysqli_query($con,"DELETE FROM products WHERE id_producto='".$id_producto."'")){
			?>
			<div class="alert alert-success alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Aviso!</strong> Datos eliminados exitosamente.
			</div>
			<?php 
		}else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se puede eliminar.
			</div>
			<?php
			
		}
			
		} else {
			?>
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Error!</strong> No se pudo eliminar éste  producto. Existen datos vinculadas a éste producto. 
			</div>
			<?php
		}
        }
	if($action == 'ajax'){
	$query1=mysqli_query($con, "select * from datosempresa where id_emp=1");
        $row1=mysqli_fetch_array($query1);
        $alerta=$row1['alerta'];
        $q = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q'], ENT_QUOTES)));
        $q1 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q1'], ENT_QUOTES)));
        $q2 = mysqli_real_escape_string($con,(strip_tags($_REQUEST['q2'], ENT_QUOTES)));
        $aColumns = array('codigo_producto', 'nombre_producto');//Columnas de busqueda
        $sTable = "products";
        $sWhere = "";
		if ( $_GET['q'] != "" )
		{
			$sWhere = "WHERE (";
			for ( $i=0 ; $i<count($aColumns) ; $i++ )
			{
				$sWhere .= $aColumns[$i]." LIKE '%".$q."%' OR ";
			}
			$sWhere = substr_replace( $sWhere, "", -3 );
			$sWhere .= ')';
		}
                if ( $_GET['q2'] != "" )
		{
		$sWhere.= " and  (products.cat_pro=$q2)";
		}
                if ( $_GET['q1'] != "" )
		{
                    $sWhere.=" $q1";
		}else{
                    $sWhere.=" order by id_producto desc";
                }
		
		include 'pagination.php'; 
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 20; 
		$adjacents  = 4; 
		$offset = ($page - 1) * $per_page;
                if($q==""){
                $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable WHERE pro_ser=1 $sWhere");}
                else
                {
                $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");    
                }
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
		$total_pages = ceil($numrows/$per_page);
		$reload = './productos.php';
		if($q==""){
                $sql="SELECT * FROM  $sTable WHERE pro_ser=1 $sWhere LIMIT $offset,$per_page";}
                else{  
                $sql="SELECT * FROM  $sTable $sWhere LIMIT $offset,$per_page";}
		$query = mysqli_query($con, $sql);
		if ($numrows>0){
			?>
			<div class="table-responsive">
                         <a href="descargar.php" target="_blanck"><img src="images/descargar-excel.png" width="80" height="25"></a>  <a href="descargar1.php?cat=<?php echo $q2;?>" target="_blank"><img src="images/stock_minimo.jpg" width="80" height="25"></a> 
			 
                         <!-- COMENTADO INFORME a href="informeInventario.php" target="_blanck"><img src="images/youtube.jpg" width="80" height="25"></a-->

                         <table class="table"  id="example"  style="width:100%;color:black;">
                            <thead >
				<tr  style="background-color:<?php echo tablas;?>;color:BLACK; ">
                                        <th style="align:center;">Foto</th>
					<th class='text-center'> Código</th>
					<th style="width:20%" class='text-center'>Producto</th>
                                        <th class='text-center'>Stock</th>
                                        <th class='text-center'>Stock<BR>Min.</th>
					<th class='text-center'>Stock<BR>Max.</th>
                                        <!--th><?php echo des3;?></th-->
                                        <th style="text-align:center;">Descripción</th>
                                        <!--th><?php echo des1;?></th-->
                                        <!--th><?php echo des2;?></th-->
                                        <!--th>Precio<br><?php echo moneda;?></th-->
					<!--th class='text-center'>Barras</th-->
                                        <th class='text-center'>Acciones</th>
				</tr>
                                </thead>
				<?php
                                $i=0;
				while ($row=mysqli_fetch_array($query)){
					$pro_ser=$row['pro_ser'];
                                        
                                            
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
                                            $cod_presentacion=$row['und_pro'];
                                            $marca=$row['max'];
                                            $desc_corta=$row['desc_corta'];
                                            $color=$row['color'];
                                            $cat_pro=$row['cat_pro'];
                                            $pro_ser=$row['pro_ser'];
                                            $foto=$row['foto1'];
                                               
                                            $b=$row["b$tienda"];
                                            $mon_venta=$row['mon_venta'];
                                            $dolar=$row['mon_costo'];
                                            $barras=$row['barras'];
                                            $min=$row['min'];
                                            if($barras==""){
                                                $barras=generar_numero_aleatorio(12);
                                            }
                                            $mon_costo=1;
                                            if($b<=$min)
                                            {$label_class='label-danger';}
                                            else
                                            {$label_class='label-success';}
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
                                        <tr id="<?php echo $table;?>">
                                        <input type="hidden" value="<?php echo $codigo_producto;?>" id="codigo_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $nombre_producto;?>" id="nombre_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $b;?>" id="inv<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $estado;?>" id="estado<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo $marca;?>" id="marca<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $desc_corta;?>" id="desc_corta<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $color;?>" id="color<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $status_producto;?>" id="status<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $cat_pro;?>" id="cat<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $mon_venta;?>" id="mon_venta<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $mon_costo;?>" id="mon_costo<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $mon_costo;?>" id="mon_costo<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo number_format($dolar,2,'.','');?>" id="dolar<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo number_format($costo,2,'.','');?>" id="costo<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo number_format($precio_producto,2,'.','');?>" id="precio_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo number_format($precio2,2,'.','');?>" id="precio2<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo number_format($precio3,2,'.','');?>" id="precio3<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo number_format($costo_producto,2,'.','');?>" id="costo_producto<?php echo $id_producto;?>">
					<input type="hidden" value="<?php echo number_format($utilidad,2,'.','');?>" id="utilidad<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $und_pro;?>" id="und_pro<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $barras;?>" id="barras<?php echo $id_producto;?>">
                                        <input type="hidden" value="<?php echo $min;?>" id="min<?php echo $id_producto;?>"> 
                                            <td class='text-center'>
                                                <a class="thumbnail1">
                                                <img  class="imagen2" src="fotos/<?php echo $foto;?>" width="30" height="30" border="0" />
                                                </a>  
                                            </td>	
                                            <td class='text-center'><?php echo $codigo_producto; ?></td>
                                            <td style="text-align:justify;"><?php echo $nombre_producto; ?></td>
                                            <td class='text-center'><span class="label <?php echo $label_class;?>"><?php echo $b; ?></span></td>
                                             <td class='text-center'><?php echo $min; ?></td>
                                             <td class='text-center'><?php echo $marca;?></td>
                                            <!-- COMENTADO td><?php echo $estado;?></td-->
                                            <!-- COMENTADO td><?php echo $marca;?></td-->
                                            <!-- COMENTADO td><?php echo $desc_corta;?></td-->
                                            <td style="text-align:justify;"><?php echo $color;?></td>
                                            <!-- COMENTADO td><font color="blue"><strong><span class='pull-right'><?php echo number_format($precio_producto,2);?></strong></font></span></td-->
                                            <!--td class='text-center'><span class="pull-right"><a href="#" class='btn btn-primary btn-xs' title='Descargar Codigo de barras' onclick="imprimir_barra('<?php echo $id_producto;?>');"><i class="fa fa-barcode"></i></a></span></td-->
                                            <td style="width:15%;" class='text-center'>
                                                <!--a href="fotos1.php?accion=<?php echo $id_producto;?>" class='btn btn-success btn-xs' title='Editar fotos'><i class="fa fa-pencil"></i></a--> 
                                                <a href="#" class='btn btn-warning btn-xs' title='Editar producto' onclick="obtener_datos('<?php echo $id_producto;?>');" data-toggle="modal" data-target="#myModal2"><i class="fa fa-pencil"></i></a> 
                                                <a href="#" class="btn btn-danger btn-xs" title='Borrar producto' onclick="eliminar('<?php echo $id_producto; ?>')"><i class="glyphicon glyphicon-trash"></i> </a></span>
                                                 <!--a href="#" class="btn btn-warning btn-xs"  title='Packs' onclick="imprimirproducto('<?php echo $id_producto; ?>');">Pack</a></td-->
                                         
					</tr>
					<?php
                                    
                                }
				?>
				
			  </table>
                          <tr>
					<td colspan=14><span class="pull-right"><?PHP
					 echo paginate($reload, $page, $total_pages, $adjacents);
					?></span></td>
				</tr>

			</div>
			<?php
		}
	}
?>

