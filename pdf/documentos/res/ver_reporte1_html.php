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
}
-->
</style>
<page backtop="15mm" backbottom="15mm" backleft="15mm" backright="15mm" style="font-size: 12pt; font-family: arial" >
        <page_footer>
        <table class="page_footer">
            <tr>

                <td style="width: 50%; text-align: left">
                   
                </td>
                
            </tr>
        </table>
    </page_footer>
    <table cellspacing="0" style="width: 100%;">
        <tr>

            <td style="width: 25%; color: #444444;">
                
                
            </td>
			<td style="width: 50%; color: #34495e;font-size:12px;text-align:center">
               
                
            </td>
			<td style="width: 25%;text-align:right">
			FACTURA Nº <?php echo $numero_factura;?>
			</td>
			
        </tr>
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>
            <th width="100"></th>
            <th width="200"></th>
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
            
        </tr>
        <tr>
            <td></td>
            
            <td colspan="5"><strong>CONSEJO  NACIONAL  DE  ADOPCIONES</strong></td>
           
            <td><strong>FACT.   No. <?php echo $numero_factura;?></strong></td>
            
        </tr>
        <tr>
            <td></td>
            
            <td colspan="4"><strong>ACTIVIDADES CENTRALES, RESTITUCION DE LOS DERECHOS DEL NNA</strong> </td>
            <td></td>
            <td><strong><?php echo date("d/m/Y", strtotime($fecha_factura));?></strong></td>
            
        </tr>
        <tr>
            <td></td>
            
            <td colspan="4"><strong>DATAFLEX, S.A</strong></td>
           <td></td>
            <td><strong>6978, 6976, 6912</strong></td>
            
        </tr>
        <tr>
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
            
        </tr>
        <tr>
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
while ($row=mysqli_fetch_array($sql))
	{
	$id_producto=$row["id_producto"];
	$codigo_producto=$row['codigo_producto'];
	$cantidad=$row['cantidad'];
	$nombre_producto=$row['nombre_producto'];
	$precio_venta=$row['precio_venta'];
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
            <td class='<?php echo $clase;?>' style="width: 60%; text-align: left"><?php echo $nombre_producto;?></td>
            <td>328</td>
            <td></td>
            
            
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right">Q <?php echo number_format($precio_venta_f,2);?></td>
            <td class='<?php echo $clase;?>' style="width: 15%; text-align: right">Q <?php echo  number_format($precio_total_f,2);?></td>
            <td></td>
            
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
            <td style="text-align: right;">Q <?php echo number_format($sumador_total,2);?></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="4">------------- U L T I M A     L I N E A ------------------</td>
            <td></td>
            <td></td>
        </tr>
    </table>
	
	
	
	<br>
	
	
	
	  

</page>

