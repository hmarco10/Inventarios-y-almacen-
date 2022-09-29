<?php
session_start();
include('menu.php');
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=productos.xls" ) ; 
        
        $sTable = "products,und";
        $tienda=$_SESSION['tienda'];   
        
		$cat=recoge1("cat");
                $cat1="";
                if($cat>0){
                    $cat1=" and products.cat_pro=$cat ";
                }
                /*compraramos lo que hay en bodega
                al stock minimo le sumamos siempre 5 
                entonces genera el repote cuando le falte su minimo + 5 */
		$sWhere="where products.b$tienda<=products.min $cat1 and products.und_pro=und.id_und order by b$tienda asc";
                $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
                $sql="SELECT `id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`, `costo_producto`, `mon_costo`, `mon_venta`, `max`, `desc_corta`, `color`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `cat_pro`, `pro_ser`, `foto1`, `foto2`, `foto3`, `foto4`, `fecha_caducidad`, `pre_web`, `descripcion`, `descripcion1`, `megusta`, `nomegusta`, `precio2`, `precio3`, `und_pro`, `barras`, `dcto`, `min`, (products.max - products.b1) as 
                reabastecimiento FROM  $sTable $sWhere ";
		$query = mysqli_query($con, $sql);
		if ($numrows>0){
			?>
			
                         <h3>Productos Necesarios De Reabastecer</h3>  
			 <table id="example" class="display nowrap" style="width:100%">
                            <thead>
				<tr >
                                       
					<th>Codigo</th>
					<th>Producto</th>
                                        <th>Reabastecimiento Necesario</th>
                                        <th>Stock Actual</th>
                                        <th>Stock Min.</th>
					<!-- COMENTADO th>Tipo</th TRAE TIPO -->
                                       <th>Stock Max.</th><!--trae marca stock Maximo-->
                                        <!-- COMENTADO th><?php echo des1;?></th-->
                                        <!-- COMENTADO th><?php echo des2;?></th-->
                                        <!-- COMENTADO th>Desc. Corta</th>
                                        <th>Desc. Larga</th>
                                        <th>Precio</th-->
					
                                        
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
                                            
                                            $b=$row["b$tienda"];
                                            $mon_venta=$row['mon_venta'];
                                            $dolar=$row['mon_costo'];
                                            $mon_costo=1;
                                            $nom_und=$row["reabastecimiento"];
                                            $min=$row["min"];
                                            $label_class='label-success';
                                            if ($status_producto==1){$estado="Nuevo";}
                                            if ($status_producto==0){$estado="Segunda";}
                                            if ($status_producto==2){$estado="Repuesto";}
                                            $mon=moneda;
                                            $date_added= date('d/m/Y', strtotime($row['date_added']));
                                            $costo_producto=$row['costo_producto'];
                                            $precio2=$row['precio2'];
                                            $precio3=$row['precio3'];
                                            $und_pro=$row['und_pro'];
                                            $costo_producto=$row['costo_producto']/$row['mon_costo'];
                                            $costo=$row['costo_producto'];
                                            $utilidad=$row['precio_producto']-$row['costo_producto'];
                                             
					?>
                                        <tr id="<?php echo $table;?>">
                                        
                                          	
                                            <td style="border:1px solid #424242;" ><?php echo $codigo_producto; ?></td>
                                            <td style="border:1px solid #424242;" width="50px"><?php echo $nombre_producto; ?></td>
                                            <td style="border:1px solid #424242;" width="50px"><?php echo $nom_und; ?></td>
                                            <td style="border:1px solid #424242;"><span class="label <?php echo $label_class;?>"><?php echo $b; ?></span></td>
                                            <td style="border:1px solid #424242;"><?php echo $min; ?></td>
                                            <!-- COMENTADO td><?php echo $estado;?></td-->
                                            <td style="border:1px solid #424242;"><?php echo $marca;?></td>
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
