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
	$sql_count=mysqli_query($con,"select * from detalle_tarjeta where id_factura='".$id_factura."'");
	$count=mysqli_num_rows($sql_count);
	if ($count=0)
	{
	echo "<script>alert('ERROR X(  ALGO SALIO MAL')</script>";
	echo "<script>window.close();</script>";
	exit;
	}else{
        echo "<script>alert('Datos Ingresados Correctamente!!!')</script>";  
    }
	$sql_factura=mysqli_query($con,"select * from detalle_tarjeta where id_factura='".$id_factura."'");
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
	require_once(dirname(__FILE__).'/../html2pdf.class.php');
   
?>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">  
    <script type="text/javascript">
 
    
    
function imprSelec(muestra)
{
    var ficha=document.getElementById(muestra);var ventimp=window.open(' ','popimpr');ventimp.document.write(ficha.innerHTML);ventimp.document.close();ventimp.print();ventimp.close();
    window.close();

}
</script>
    
</head>

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


    <?php

if($tienda1==$tienda2){
    ?>
<page backtop="15mm" backbottom="15mm" backleft="15mm" backright="15mm" style="font-size: 12pt; font-family: arial" >
        <page_footer>
        
    </page_footer>
    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 10pt;">
        <tr>
            <th style="width:15%;"></th>
            <th style="width:70%;">Licenciado Luis Alberto Aguilar Mayorga</th>
            <th style="width:15%;"></th>
           
            
        </tr>
        
        <tr>
            <td></td>
            
            <td><strong>Coordinador de la Unidad de Administración Financiera</strong></td>
           
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
            
            
            <td>PROGRAMA 11 RESTITUCIÓN DE LOS DERECHOS DEL NNA</td>
            
            <td></td>
        </tr>
        
        
<?php
$nums=1;
$sumador_total=0;
$sql=mysqli_query($con, "select * from products, tarjeta_responsabilidad, detalle_tarjeta where tarjeta_responsabilidad.activo=0 and tarjeta_responsabilidad.tipo_doc=8 and products.id_producto=tarjeta_responsabilidad.id_producto and detalle_tarjeta.ven_com=1 and tarjeta_responsabilidad.folio='$folio' and tarjeta_responsabilidad.fecha='$fecha'  and tarjeta_responsabilidad.id_cliente=detalle_tarjeta.id_cliente and tarjeta_responsabilidad.numero_factura=detalle_tarjeta.numero_factura and detalle_tarjeta.id_factura='".$id_factura."' ORDER BY  `tarjeta_responsabilidad`.`id_detalle` ASC");

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
            
            <td colspan="3">------------- U L T I M A     L I N E A ------------------</td>
           
        </tr>
         <tr>
            <td></td>
            <td>Para stock de Almacén y Cubrir requerimientos del Programa 11 del Consejo </td>
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