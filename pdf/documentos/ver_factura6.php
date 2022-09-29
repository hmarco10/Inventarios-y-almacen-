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
	echo "<script>alert('despacho no encontrada')</script>";
	echo "<script>window.close();</script>";
	exit;
	}
header("Content-type: application/vnd.ms-excel" ) ; 
        header("Content-Disposition: attachment; filename=cotizacion.xls" ) ; 
        
$sql_factura1=mysqli_query($con,"select * from guia where id_doc='".$id_factura."'");
$rw_factura1=mysqli_fetch_array($sql_factura1);
$guia=$rw_factura1['guia']; 
$sql_factura=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");
$rw_factura=mysqli_fetch_array($sql_factura); 

$id_vendedor=$rw_factura['id_vendedor'];
$tienda1=$rw_factura['tienda'];
$id_cliente=$rw_factura['id_cliente'];

$sql_factura2=mysqli_query($con,"select * from users where user_id='".$id_vendedor."'");
$rw_factura2=mysqli_fetch_array($sql_factura2);
$vendedor=$rw_factura2['nombres'];
$telefono=$rw_factura2['telefono'];      
$sql_factura2=mysqli_query($con,"select * from sucursal where tienda='".$tienda1."'");
$rw_factura2=mysqli_fetch_array($sql_factura2);
$logo=$rw_factura2['foto'];
$dir=$rw_factura2['direccion'];
$ruc=$rw_factura2['ruc'];
$correo=$rw_factura2['correo'];
$nombre=$rw_factura2['nombre'];
$igv=18;

//if($tienda1==$tienda2){
    ?>   
    
    
    <?php 
	$sql_cliente=mysqli_query($con,"select * from clientes where id_cliente='$id_cliente'");
	$rw_cliente=mysqli_fetch_array($sql_cliente);
        $sql_cliente1=mysqli_query($con,"select * from facturas where id_factura='$id_factura'");
        $rw_cliente1=mysqli_fetch_array($sql_cliente1);
        $mot=$rw_cliente1['motivo'];
        $estado=$rw_cliente1['estado_factura'];
        $dia=date("d",strtotime($rw_cliente1['fecha_factura']));
                $mes=date("m",strtotime($rw_cliente1['fecha_factura']));
                $ano=date("Y", strtotime($rw_cliente1['fecha_factura']));
                $mes2=mes1($mes);
                $ano1=$ano%1000;
                $dia1=date("d/m/Y",strtotime($rw_cliente1['fec_eli']));
                
        if($estado==11 or $estado==12 or $estado==5 or $estado==6){                 
            $tipo2="FACTURA ELECTRÓNICA";               
        if($estado==2){
            $tipo2="BOLETA ELECTRÓNICA";
        }            
        if($estado==5){  
            $tipo2="NOTA DE DEBITO";
        }
        if($estado==6){  
            $tipo2="NOTA DE CREDITO";
        }
	?>  
    
    
    <table cellspacing="0" style="width: 100%; border: 0px solid black; font-size: 8pt;" >
        <tr>
           <td style="width: 50%; " >			
		 
           </td>
           <td style="width: 50%; " >		
                    
           </td>
                           
        </tr>
        
        
        <tr>
           <td> 
               <font color="black"><strong>FECHA DE SOLICITUD:</strong></font>
		<?php
                
                //echo $rw_cliente['nombre_cliente'];
                print"$dia/$mes/$ano";
                ?>	
           </td>
           <td> 
               <font color="black"><strong>FECHA DE ENTREGA:</strong></font>
		<?php
                
                //$mes=date("m",strtotime($rw_cliente1['fecha_factura']));
                //$ano=date("Y", strtotime($rw_cliente1['fecha_factura']));
                //$mes2=mes1($mes);
                //$ano1=$ano%1000;
                //echo $rw_cliente['nombre_cliente'];
                print"$dia1";
                ?>	
           </td>
            <?php
                
            ?>        
        </tr>
        <?php
        if($rw_cliente['doc']>0){
         ?>   
        
        <tr>
           <td colspan="2">
               <font color="black"><strong>DIRECCIÓN:</strong></font>
		<?php
                echo $rw_cliente['direccion_cliente'];  
                ?>		
            </td>            
        </tr>
         <?php
        }
        ?>
        <tr>
           <td colspan="2">
               <font color="black"><strong>UNIDAD 123 ADMINISTRATIVA:</strong></font><?php
                echo $rw_cliente['nombre_cliente'];  
                ?>
				
            </td>
            
        </tr>
        <tr>
           
           
            <td>
        
                 
           </td>
           
           <td>
               
            </td>
        </tr>
       
</table>
    
<?php
}
if($estado==3 or $estado==8){                      
    if($estado==3 ){  
            $tipo2=doc;
    }
    if($estado==8 ){  
            $tipo2="COTIZACION";
    }
    ?>
    

<?php
}
?>
<table cellspacing="0" style=" text-align: left;font-size: 8pt; margin-top: 2px;" >       
<tr class="border_bottom">
    <td width="100" align="center"></td>  
    <td width="100" align="center"></td>
    <td width="250" align="center"></td>
    <td width="100" align="center"></td>
    <td width="100" align="center"></td>
    <td width="100" align="center"></td>
    <td width="100" align="center"></td>
    <td width="100" align="center"></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
    
<tr class="border_bottom">
    <td ></td>  
    <td ></td>
    <td ></td>
    <td ><?php  echo $dia1;?></td>
    <td ></td>
    <td ></td>
    <td  align="center" colspan="2"><?php  echo $dia1;?></td>           
</tr>

<tr class="border_bottom">
    <td align="center"></td>  
    <td  align="center"></td>
    
    <td align="center" colspan="2">
               <font color="black"></font><?php echo $rw_cliente['direccion_cliente']; ?>
				
            </td>
    
               
</tr>

<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<?php
$nums=1;
$sumador_total=0;
$sql1=mysqli_query($con, "select * from facturas where id_factura='".$id_factura."'");
$row1=mysqli_fetch_array($sql1);
$servicio=$row1["servicio"];

$Observaciones=$row1["obs"];

$tipo1=$row1["estado_factura"];
$id_cliente=$row1["id_cliente"];
$numero_factura1=$row1["numero_factura"];
$tienda1=$row1["tienda"];
if($servicio==0){
$sql=mysqli_query($con, "select * from products, IngresosEgresos, facturas where products.id_producto=IngresosEgresos.id_producto and IngresosEgresos.precio_venta>0 and IngresosEgresos.numero_factura=facturas.numero_factura and IngresosEgresos.numero_factura=$numero_factura1 and IngresosEgresos.tienda=$tienda1 and facturas.ven_com=IngresosEgresos.ven_com and IngresosEgresos.tipo_doc='".$tipo1."' and facturas.id_factura='".$id_factura."' and IngresosEgresos.id_cliente='".$id_cliente."'" );
//print""select * from products, IngresosEgresos, facturas where products.id_producto=IngresosEgresos.id_producto and IngresosEgresos.precio_venta>0 and IngresosEgresos.numero_factura=facturas.numero_factura and IngresosEgresos.numero_factura=$numero_factura1 and IngresosEgresos.tienda=$tienda1 and facturas.ven_com=IngresosEgresos.ven_com and IngresosEgresos.tipo_doc='".$tipo1."' and facturas.id_factura='".$id_factura."' and IngresosEgresos.id_cliente='".$id_cliente."';

}else{
 $sql=mysqli_query($con, "select * from IngresosEgresos, facturas where IngresosEgresos.numero_factura=facturas.numero_factura and IngresosEgresos.precio_venta>0 and IngresosEgresos.numero_factura=$numero_factura1 and IngresosEgresos.tienda=$tienda1 and facturas.id_factura='".$id_factura."' and IngresosEgresos.tipo_doc='".$tipo1."' and IngresosEgresos.id_cliente='".$id_cliente."'" );   
//echo "select * from IngresosEgresos, facturas where IngresosEgresos.numero_factura=facturas.numero_factura and IngresosEgresos.precio_venta>0 and IngresosEgresos.numero_factura=$numero_factura1 and IngresosEgresos.tienda=$tienda1 and facturas.id_factura='".$id_factura."' and IngresosEgresos.tipo_doc='".$tipo1."' and IngresosEgresos.id_cliente='".$id_cliente."'";
 
}

$suma=0;

$r=1;
while ($row=mysqli_fetch_array($sql))
	{
	$id_producto=$row["id_producto"];
        
        $tipo=$row["tipo"];
        $codigo_producto="SER";
	$medida="UND";
        if($id_producto>0 and is_numeric($id_producto)){
            $sql2=mysqli_query($con, "select * from products,und where und.id_und=products.und_pro and id_producto='".$id_producto."'");
            $row2=mysqli_fetch_array($sql2);
            $nombre_producto=$row2["nombre_producto"];
            $codigo_producto=$row2["codigo_producto"];
            $desc_larga = $row2["color"];
            $lote=$row2["barras"];
            $medida=$row2["etiqueta"];
        }
        else{
            $nombre_producto=$row['id_producto'];  
        }     
        $lote2=$row['Lote'];
        $cantidad=$row['cantidad'];
	$precio_venta=$row['precio_venta'];
        $moneda=$row['moneda']; 
	$precio_venta_f=number_format($precio_venta,6);//Formateo variables
	$precio_venta_r=str_replace(",","",$precio_venta_f);//Reemplazo las comas
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=number_format($precio_total,6);//Precio total formateado
	$precio_total_r=str_replace(",","",$precio_total_f);//Reemplazo las comas
	$sumador_total+=$precio_total_r;//Sumador 
        if($estado==6 OR $estado==5){
            $num=20;
        }
        if($estado==3 OR $estado==8){
            $num=30;
        }
	if($estado==3 OR $estado==5 OR $estado==6 OR $estado==8){ 
        if($suma<=$num){
        ?>
        <tr class="border_bottom1">
            <td></td>
            <td  align="center"><?php echo $codigo_producto; ?></td>
            
            <td colspan="2">
                

                <?php echo 
                    "Serie: ".$desc_larga;
                ?> 
            </td>
            <td  align="center"><?php echo $medida;?></td>
            <td  align="center">
               
                <?php echo $cantidad; ?></td>
            <td  align="right"><?php echo $precio_venta_f;?>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</td>
            <td  align="right"><?php echo $precio_total_f;?>&nbsp; </td>  
        </tr>
	<?php 
        $suma=$suma+1;
        }
        }
        if($estado==1 or $estado==2){ 
            if($suma<=40){
            ?>
        <tr class="border_bottom1">
            <td></td>
            <td align="center"><?php echo $mot; ?></td>
            
            <td colspan="2">
                <?php 
                if($lote2<>""){
                    echo "serie: ".$lote2; 
                }
                ?> 
                <?php echo $desc_larga;?> 
            </td>
            <td align="center"><?php echo $cantidad; ?></td>
            <td   align="center"><?php echo $cantidad; ?></td>
            <td align="right">Q <?php echo $precio_venta_f;?>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</td>
            <td align="right">Q <?php echo $precio_total_f;?>&nbsp; </td>   
        </tr>
	<?php 
        $suma=$suma+1;
        } 
        }
        $r=$r+1;
     //fin 
	}
        
       
	$subtotal=number_format($sumador_total,2,'.','');
	$total_factura=number_format($sumador_total/(1+iva),2,'.','');
        $igv=number_format(iva*$sumador_total/(1+iva),2,'.','');
        $grav=$total_factura;
        $exo="0.00";
        $ina="0.00";
        if($tipo==1){
            $igv=0;$grav=0;
            $exo=number_format($subtotal,2);
            $ina=0;
            
        }
        if($tipo==2){
            $igv=0;$grav=0;
            $exo=number_format(0,2);
            $ina=number_format($subtotal,2);
            
        }
        $mon=moneda;
        $mo1=moneda;
        $mon2=moneda;
        
       
        
       
        
        ?>
    <tr class="border_bottom">
        <td></td>
    <td colspan="7" align="center">-----------------------------------------------------------------------------------------------------------  U L T I M A     L I N E A  ------------------------------------------------------------------------------------------------------------</td>  
   
</tr>

<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>  
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
    <td ></td>
</tr>
<tr class="border_bottom">
    <td></td>    
    <td colspan="7" align="center"><?php echo $Observaciones;?></td>
    
</tr>
    </table>
      
<br>
    

<?php
//}
function unidad($numuero){
switch ($numuero)
{
case 9:
{
$numu = "NUEVE";
break;
}
case 8:
{
$numu = "OCHO";
break;
}
case 7:
{
$numu = "SIETE";
break;
} 
case 6:
{
$numu = "SEIS";
break;
} 
case 5:
{
$numu = "CINCO";
break;
} 
case 4:
{
$numu = "CUATRO";
break;
} 
case 3:
{
$numu = "TRES";
break;
} 
case 2:
{
$numu = "DOS";
break;
} 
case 1:
{
$numu = "UN";
break;
} 
case 0:
{
$numu = "";
break;
} 
}
return $numu; 
}

function decena($numdero){

if ($numdero >= 90 && $numdero <= 99)
{
$numd = "NOVENTA ";
if ($numdero > 90)
$numd = $numd."Y ".(unidad($numdero - 90));
}
else if ($numdero >= 80 && $numdero <= 89)
{
$numd = "OCHENTA ";
if ($numdero > 80)
$numd = $numd."Y ".(unidad($numdero - 80));
}
else if ($numdero >= 70 && $numdero <= 79)
{
$numd = "SETENTA ";
if ($numdero > 70)
$numd = $numd."Y ".(unidad($numdero - 70));
}
else if ($numdero >= 60 && $numdero <= 69)
{
$numd = "SESENTA ";
if ($numdero > 60)
$numd = $numd."Y ".(unidad($numdero - 60));
}
else if ($numdero >= 50 && $numdero <= 59)
{
$numd = "CINCUENTA ";
if ($numdero > 50)
$numd = $numd."Y ".(unidad($numdero - 50));
}
else if ($numdero >= 40 && $numdero <= 49)
{
$numd = "CUARENTA ";
if ($numdero > 40)
$numd = $numd."Y ".(unidad($numdero - 40));
}
else if ($numdero >= 30 && $numdero <= 39)
{
$numd = "TREINTA ";
if ($numdero > 30)
$numd = $numd."Y ".(unidad($numdero - 30));
}
else if ($numdero >= 20 && $numdero <= 29)
{
if ($numdero == 20)
$numd = "VEINTE ";
else
$numd = "VEINTI".(unidad($numdero - 20));
}
else if ($numdero >= 10 && $numdero <= 19)
{
switch ($numdero){
case 10:
{
$numd = "DIEZ ";
break;
}
case 11:
{ 
$numd = "ONCE ";
break;
}
case 12:
{
$numd = "DOCE ";
break;
}
case 13:
{
$numd = "TRECE ";
break;
}
case 14:
{
$numd = "CATORCE ";
break;
}
case 15:
{
$numd = "QUINCE ";
break;
}
case 16:
{
$numd = "DIECISEIS ";
break;
}
case 17:
{
$numd = "DIECISIETE ";
break;
}
case 18:
{
$numd = "DIECIOCHO ";
break;
}
case 19:
{
$numd = "DIECINUEVE ";
break;
}
} 
}
else
$numd = unidad($numdero);
return $numd;
}

function centena($numc){
if ($numc >= 100)
{
if ($numc >= 900 && $numc <= 999)
{
$numce = "NOVECIENTOS ";
if ($numc > 900)
$numce = $numce.(decena($numc - 900));
}
else if ($numc >= 800 && $numc <= 899)
{
$numce = "OCHOCIENTOS ";
if ($numc > 800)
$numce = $numce.(decena($numc - 800));
}
else if ($numc >= 700 && $numc <= 799)
{
$numce = "SETECIENTOS ";
if ($numc > 700)
$numce = $numce.(decena($numc - 700));
}
else if ($numc >= 600 && $numc <= 699)
{
$numce = "SEISCIENTOS ";
if ($numc > 600)
$numce = $numce.(decena($numc - 600));
}
else if ($numc >= 500 && $numc <= 599)
{
$numce = "QUINIENTOS ";
if ($numc > 500)
$numce = $numce.(decena($numc - 500));
}
else if ($numc >= 400 && $numc <= 499)
{
$numce = "CUATROCIENTOS ";
if ($numc > 400)
$numce = $numce.(decena($numc - 400));
}
else if ($numc >= 300 && $numc <= 399)
{
$numce = "TRESCIENTOS ";
if ($numc > 300)
$numce = $numce.(decena($numc - 300));
}
else if ($numc >= 200 && $numc <= 299)
{
$numce = "DOSCIENTOS ";
if ($numc > 200)
$numce = $numce.(decena($numc - 200));
}
else if ($numc >= 100 && $numc <= 199)
{
if ($numc == 100)
$numce = "CIEN ";
else
$numce = "CIENTO ".(decena($numc - 100));
}
}
else
$numce = decena($numc);

return $numce; 
}

function miles($nummero){
if ($nummero >= 1000 && $nummero < 2000){
$numm = "MIL ".(centena($nummero%1000));
}
if ($nummero >= 2000 && $nummero <10000){
$numm = unidad(Floor($nummero/1000))." MIL ".(centena($nummero%1000));
}
if ($nummero < 1000)
$numm = centena($nummero);

return $numm;
}

function decmiles($numdmero){
if ($numdmero == 10000)
$numde = "DIEZ MIL";
if ($numdmero > 10000 && $numdmero <20000){
$numde = decena(Floor($numdmero/1000))."MIL ".(centena($numdmero%1000)); 
}
if ($numdmero >= 20000 && $numdmero <100000){
$numde = decena(Floor($numdmero/1000))." MIL ".(miles($numdmero%1000)); 
} 
if ($numdmero < 10000)
$numde = miles($numdmero);

return $numde;
} 

function cienmiles($numcmero){
if ($numcmero == 100000)
$num_letracm = "CIEN MIL";
if ($numcmero >= 100000 && $numcmero <1000000){
$num_letracm = centena(Floor($numcmero/1000))." MIL ".(centena($numcmero%1000)); 
}
if ($numcmero < 100000)
$num_letracm = decmiles($numcmero);
return $num_letracm;
} 

function millon($nummiero){
if ($nummiero >= 1000000 && $nummiero <2000000){
$num_letramm = "UN MILLON ".(cienmiles($nummiero%1000000));
}
if ($nummiero >= 2000000 && $nummiero <10000000){
$num_letramm = unidad(Floor($nummiero/1000000))." MILLONES ".(cienmiles($nummiero%1000000));
}
if ($nummiero < 1000000)
$num_letramm = cienmiles($nummiero);

return $num_letramm;
} 

function decmillon($numerodm){
if ($numerodm == 10000000)
$num_letradmm = "DIEZ MILLONES";
if ($numerodm > 10000000 && $numerodm <20000000){
$num_letradmm = decena(Floor($numerodm/1000000))."MILLONES ".(cienmiles($numerodm%1000000)); 
}
if ($numerodm >= 20000000 && $numerodm <100000000){
$num_letradmm = decena(Floor($numerodm/1000000))." MILLONES ".(millon($numerodm%1000000)); 
}
if ($numerodm < 10000000)
$num_letradmm = millon($numerodm);

return $num_letradmm;
}

function cienmillon($numcmeros){
if ($numcmeros == 100000000)
$num_letracms = "CIEN MILLONES";
if ($numcmeros >= 100000000 && $numcmeros <1000000000){
$num_letracms = centena(Floor($numcmeros/1000000))." MILLONES ".(millon($numcmeros%1000000)); 
}
if ($numcmeros < 100000000)
$num_letracms = decmillon($numcmeros);
return $num_letracms;
} 

function milmillon($nummierod){
if ($nummierod >= 1000000000 && $nummierod <2000000000){
$num_letrammd = "MIL ".(cienmillon($nummierod%1000000000));
}
if ($nummierod >= 2000000000 && $nummierod <10000000000){
$num_letrammd = unidad(Floor($nummierod/1000000000))." MIL ".(cienmillon($nummierod%1000000000));
}
if ($nummierod < 1000000000)
$num_letrammd = cienmillon($nummierod);

return $num_letrammd;
} 


function convertir($numero){
$numf = milmillon($numero);
return $numf;
}

function mes1($texto)
{
  if($texto=='01') {
    
    return "enero";
}elseif($texto=='02'){
    return "febrero";
}elseif($texto=='03'){
    return "marzo";
}elseif($texto=='04'){
    return "abril";
}elseif($texto=='05'){
    return "mayo";
}elseif($texto=='06'){
    return "junio";
}elseif($texto=='07'){
    return "julio";
}elseif($texto=='08'){
    return "agosto";
}elseif($texto=='09'){
    return "setiembre";
}elseif($texto=='10'){
    return "octubre";
}elseif($texto=='11'){
    return "noviembre";
}elseif($texto=='12'){
    return "diciembre";
}  
    
    
}

?>
