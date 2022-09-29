<?php
session_start();
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=productos.xls" ) ; 
        
        $sTable = "products,und";
        
        
		
		$sWhere="where products.und_pro=und.id_und order by id_producto desc";
                $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];
                $sql="SELECT * FROM  $sTable $sWhere ";
		$query = mysqli_query($con, $sql);
		if ($numrows>0){
			?>
			
                           
			 <table id="example" class="display nowrap" style="width:100%">
                            <thead>
				<tr >
                                       
					<th>Codigo</th>
					<th>Producto</th>
                                        <!-- COMENTADO th>Und Medida</th-->
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
                                            $tienda=$_SESSION['tienda'];   
                                            $b=$row["b$tienda"];
                                            $mon_venta=$row['mon_venta'];
                                            $dolar=$row['mon_costo'];
                                            $mon_costo=1;
                                            $nom_und=$row["nom_und"];
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
                                        <tr id="<?php echo $table;?>">
                                        
                                          	
                                            <td><?php echo $codigo_producto; ?></td>
                                            <td width="50px"><?php echo $nombre_producto; ?></td>
                                             <!-- COMENTADO td width="50px"><?php echo $nom_und; ?></td-->
                                            <td ><span class="label <?php echo $label_class;?>"><?php echo $b; ?></span></td>
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
