<?php
session_start();
header("Content-Type: text/html;charset=utf-8");
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=InformeMensual.xls" ) ; 

/* VARIABLES QUE CAPTURAN FECHA */
$fecha1=$_POST["fecha1"];
$fecha2=$_POST["fecha2"];

/*SELECT *,fecha, ven_com, SUM(cantidad) as IngresoMes FROM `products`,`und` inner join 
ingresosegresos where date(fecha) BETWEEN '2021-03-01' AND '2021-03-31' 
and products.und_pro=und.id_und and products.id_producto=11552 and ingresosegresos.id_producto=11552 and ven_com=2*/

        /* Inicio query para traer info de los ingresos*/
        $sTable = "products";                                         
		$sWhere="left outer join ingresosegresos on products.id_producto=ingresosegresos.id_producto and date(fecha) BETWEEN '$fecha1' AND '$fecha2' and ven_com<>12 GROUP BY products.id_producto DESC ORDER BY nombre_producto ASC";
        $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
		$row= mysqli_fetch_array($count_query);
		$numrows = $row['numrows'];     
        $sql="SELECT *, sum(cantidadIngreso*precio_venta) AS saldoIngreso, sum(cantidadEgreso*precio_venta) as SaldoEgreso, (B1*costo_producto) AS TOTAL,fecha, (sum(cantidad)-sum(cantidadEgreso))as IngresoMes, sum(cantidadEgreso) as egresoMes,  ( (sum(cantidad)-sum(cantidadEgreso)) * precio_producto) as ValIngMes, (sum(cantidadEgreso) * precio2) as ValEgMes, ven_com FROM  $sTable $sWhere ";
		$query = mysqli_query($con, $sql);
        /*Fin query para traer info de los ingresos*/

     

        /*$sTable2 = "products,und";
        $innerJoin="inner join ingresosegresos where date_sub(fecha, INTERVAL '-1' MONTH) BETWEEN '$fecha1' AND '$fecha2' and products.und_pro=und.id_und and products.id_producto=ingresosegresos.id_producto and ven_com<>12 GROUP BY `products`.`id_producto` DESC";
        $count_query2 = mysqli_query($con,"SELECT count(*) AS numrows FROM $sTable2 $innerJoin");
        $row2 = mysqli_fetch_array($count_query2);
        $numrows2 = $row2['numrows'];
        $sql2="SELECT *, (B1*costo_producto) AS TOTAL,fecha, (sum(cantidad)-sum(cantidadEgreso))as IngresoMes, sum(cantidadEgreso) as egresoMes,  ( (sum(cantidad)-sum(cantidadEgreso)) * costo_producto) as ValIngMes, (sum(cantidadEgreso) * costo_producto) as ValEgMes, ven_com FROM  $sTable2  $innerJoin";
        $query2=mysqli_query($con,$sql2);
        /*Fin query para traer info de los egresos */
		//if ($numrows>0 || $numrows3>0 ){
            if ($numrows>0){
			?>
             
            
                           
			 <table id="example" class="display nowrap" style="border:1px solid #424242;">
                <thead>
                <tr style="border:1px solid #424242; text-align:center;">
                <p style="text-align:center; font-weight:bold; font-size:25px;">Consejo Nacional De Adopciones     
                <br>
                UNIDAD DE INVENTARIOS Y ALMACEN
                <br>
                Existencia de Materiales y Productos de Almacen
                <br>
                Inventario del <?php echo $fecha1 ?> al <?php echo $fecha2 ?><p>
                </tr>
    				<tr style="border:1px solid #424242;" >
    					<!--th>Codigo</th-->
                        <th width="50px" style="height: 10px; font-size:20px;">No.</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2016</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2017</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2018</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2019</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2020</th>
                        <th style="width=10px;height: 10px; font-size:20px;">Año <br> 2021</th>
    					<th style="width: 300px;">NOMBRE DEL PRODUCTO</th>
                        <!-- COMENTADO th>Und Medida</th-->
                        <th style="width: 120px;">EXISTENCIA</th>
                        <th style="width: 120px;">UNITARIO</th>
    					<!-- COMENTADO th>Tipo</th TRAE TIPO -->
                        <th style="width: 120px;">TOTAL</th><!--trae marca stock Maximo-->
                        <th style="width: 120px;">FECHA</th>
                        <th style="width: 120px;">FECHA</th-->
                        <TH style="width: 120px;">CANTIDAD <br> INGRESADA</th>
                        <th style="width: 120px;">VALOR POR <br> INGRESOS</th>
                        <th style="width: 120px;">CANTIDAD <br> EGRESADA</th>
                        <th style="width: 120px;">VALOR POR <br> DESPACHOS</th>
    				</tr>
                </thead>
				
                <?php       
                /*INGRESOS POR PRODUCTO*/
                $i=0; $sum_total=0; $sum_total_cant_ingresada=0; $sum_total_ingreso_mes=0;
                $sum_total_cant_egresada=0;
                $sum_total_engreso_mes=0;
                
                /* MES ANTERIOR */
                //$sum_total_cant_egresada_mesanterior=0;
                //$sum_total_mes_anterior=0;
                /* FIN MES ANTERIOR */
			    //while (($row=mysqli_fetch_array($query)) || ($row3=mysqli_fetch_array($query3)))
                $index = 1;
                while ($row=mysqli_fetch_array($query)  )
                {
                    
				    $pro_ser=$row['pro_ser'];
                    //$cpro=$row2['pro_ser']; && $cpro==1
                    if ($pro_ser==1 ){
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
                        //$nom_und=$row["nom_und"];
                        $total=$row["TOTAL"];
                        $sum_total=$sum_total+$total;/*TRAE LA SUMATORIA TOTAL DE LA COLUMNA TOTAL*/
                        
                        $min=$row["min"];
                        /*INGRESOS POR FECHA ELEGIDA */
                        $saldoIngreso=$row["saldoIngreso"];
                        $ingresoMes=$row["IngresoMes"];
                        //$valor_por_ingresos=$row["ValIngMes"];
                        /*VAN VIENEN INGRESOS */
                        $sum_total_cant_ingresada=$sum_total_cant_ingresada+$ingresoMes;/*traemos la sumatoria de cantidad ingresada por mes */
                        $sum_total_ingreso_mes=$sum_total_ingreso_mes+$saldoIngreso;
                        /*EGRESOS POR FECHA ELEGIDA */
                        $saldoEgreso=$row['SaldoEgreso'];
                        $EGRESO=$row['egresoMes'];
                        //$total_egreso_mes=$row['ValEgMes'];
                        /*VAN VIENEN EGRESOS */
                        $sum_total_cant_egresada=$sum_total_cant_egresada+$EGRESO;
                        $sum_total_engreso_mes=$sum_total_engreso_mes+$saldoEgreso;
                        /*fecha caducidad */
                        $fecha_caducidad=$row['fecha_caducidad'];
                        
                        /*TOTAL MES ANTERIOR */
                        //$sum_total_cant_egresada_mesanterior=$row2['TOTAL2'];
                        //$sum_total_mes_anterior=$sum_total_mes_anterior+$total_anterior;
                        //$label_class='label-success';
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
                        

                        $insert_detail2=mysqli_query($con,"INSERT INTO saldo_mensual values(NULL,'$id_producto','$nombre_producto','$b','$costo_producto','$total','$ingresoMes','$saldoIngreso','$EGRESO','$saldoEgreso','$fecha1','$fecha2')");
                        $index++; 
                        /*FIN INGRESOS POR PRODUCTO */
                        
                        /*EGRESOS */
                        
                        //$ValEgMes=$row2['ValEGgMes'];
                 ?>


                
                    <tr style="border:1px solid #424242;" id="<?php echo $table;?>">
                        <!--td><?php echo $codigo_producto; ?></td-->
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td ><?php echo $nombre_producto; ?></td>
                        <!-- COMENTADO td width="50px"><?php echo $nom_und; ?></td-->
                        <td ><span class="label <?php echo $label_class;?>"><?php echo $b; ?></span></td>
                        <td width="50px"><?php echo $costo; ?> </td>
                        <td width="50px"><?php echo round($total,2); ?> </td><!-- LE PUSE ROUND DE 2 DIGITOS NO TENIA 12/08/2021-->
                        <td >
                            <?php 
                                if($fecha_caducidad==='1969-12-31')
                                {
                                    echo "NMFV";
                                }else
                                {
                                    echo $fecha_caducidad; 
                                }
                                
                            ?>
                        </td>
                        <!-- COMENTADO td><?php echo $estado;?></td-->
                        <td></td>
                        <td><?php echo number_format($ingresoMes);?></td>
                        <td><?php echo number_format($saldoIngreso,2);?></td>
                        <td>
                            <?php 
                                if($EGRESO==0){
                                    echo "0";
                                   
                                }
                                else{
                                    echo $EGRESO;
                                }
                             ?>
                        </td>
                        <td><?php echo number_format($saldoEgreso,2,",", "");?><span class='pull-right'></td>
                    </tr>
				 <?php
                    }
                    if($i%82==0){
                        ?>
                        <tr style="border:1px solid #424242;" id="<?php echo $table;?>">
                            <td width="50px"></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <th width="50px">VAN:</th>
                            <th width="50px"><?php echo number_format($sum_total,6); ?> </th>
                            <td></td>
                            <td></td>
                            <th width="50px"><?php echo number_format($sum_total_cant_ingresada,2); ?> </th>
                            <th width="50px"><?php echo number_format($sum_total_ingreso_mes,2); ?></th>
                            <th width="50px"><?php echo number_format($sum_total_cant_egresada,2); ?> </th>
                            <th width="50px"><?php echo number_format($sum_total_engreso_mes,2); ?></th>
                            
                        </tr>
                        <tr style="border:1px solid #424242;" id="<?php echo $table;?>">
                            <td width="50px"></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <th width="50px">VIENEN:</th>
                            <th width="50px"><?php echo number_format($sum_total,6); ?> </th>
                            <td></td>
                            <td></td>
                            <th width="50px"><?php echo number_format($sum_total_cant_ingresada,2); ?> </th>
                            <th width="50px"><?php echo number_format($sum_total_ingreso_mes,2); ?></th>
                            <th width="50px"><?php echo number_format($sum_total_cant_egresada,2); ?> </th>
                            <th width="50px"><?php echo number_format($sum_total_engreso_mes,2); ?></th>
                            
                        </tr>
                        <?php
                    }
                }
                ?>
                <tr style="border:1px solid #424242;" id="<?php echo $table;?>">
                    <td width="50px"></td>
                    <td></td>
                    <td ></td>
                    <td ></td>
                    <td ></td>
                    <td ></td>
                    <td ></td>
                    <td ></td>
                    <td ></td>
                    <th width="50px">TOTAL:</th>
                    <th width="50px">
                    <?php echo number_format($sum_total,2); 
                    
                    $insert_detail=mysqli_query($con, "INSERT INTO saldos VALUES (NULL,'$sum_total','$fecha1','$fecha2')");
                    
                    
                             
                    
                    //while($row = mysqli_fetch_array($query)){
                    //$valor = $row["nombre"];
                    //$valor2 = $row["apellido"];

                    //$insertsql= "insert into lista (`dato1`,`dato2`)values ('$valor', now())";
                    // mysql_query($insertsql);
                    //$conn->query($insertsql);
                    //$index++;
                    //}

                    ?> 
                    </th>
                    <!--th></th-->
                    <td></td>
                    <td></td>
                    <th width="50px"><?php echo number_format($sum_total_cant_ingresada,2); ?> </th>
                    <th width="50px"><?php echo number_format($sum_total_ingreso_mes,2); ?></th>
                    <th width="50px"><?php echo number_format($sum_total_cant_egresada,2); ?> </th>
                    <th width="50px"><?php echo number_format($sum_total_engreso_mes,2); ?></th>
                    
                </tr>
                
                
			 </table>
             <br>
             <br>
             <table>
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                    <?php
                    /*Inicio query para traer info del total mes ANTERIOR*/
                    $sTable3 = "saldos";
                    $sWhere3="where date_sub(fecha_final, INTERVAL '-1' MONTH) BETWEEN '$fecha1' AND '$fecha2' order by id_saldo DESC limit 1";
                    $count_query3= mysqli_query($con,"SELECT count(*) AS numrows FROM $sTable3 $sWhere3");
                    $row3=mysqli_fetch_array($count_query3);
                    $numrows3=$row3['numrows'];
                    $sql3="SELECT saldo, fecha_final from $sTable3 $sWhere3";
                    $query3=mysqli_query($con,$sql3);
                
                        while ($row3=mysqli_fetch_array($query3)  )
                        {
                            $saldo100=0;
                            $saldo100=$row3['saldo'];
                            $fecha_mes_anterior=$row3['fecha_final'];

                        
                    ?>
                    <td style="font-weight:bold; font-size:20px; text-align:right;">Saldo del mes anterior <?php echo $fecha_mes_anterior ?>  </td>
                    <td><?php echo number_format($saldo100,6) 
                        ?></td>
                        <?php }?>
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="font-weight:bold; font-size:20px; text-align:right;">Ingresos</td>
                    <td><?php echo number_format($sum_total_ingreso_mes,6); ?></td>
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="font-weight:bold; font-size:20px; text-align:right;">Despachos</td>
                    <td><?php echo number_format($sum_total_engreso_mes,6); ?></td>
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="font-weight:bold; font-size:20px; text-align:right;">Saldo del mes actual</td>
                    <td><?php echo number_format(($saldo100 + ($sum_total_ingreso_mes - $sum_total_engreso_mes)),6)  ?></td>
                    </th>
                </tr>
             </table>

			
        <?php
        }
        ?>
