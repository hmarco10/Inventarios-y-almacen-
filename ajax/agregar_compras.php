<?php
ob_start();
include('is_logged.php');
?>
<!DOCTYPE html>
<html>
<head>
    <style>
        input {
  float: right;
  clear: both;
}
        
    </style>    
</head>
<?php
$session_id= session_id();
if (isset($_POST['id'])){$id=$_POST['id'];}
if (isset($_POST['cantidad'])){$cantidad=$_POST['cantidad'];}
if (isset($_POST['precio_venta'])){$precio_venta=$_POST['precio_venta'];}
if (isset($_POST['stock'])){$stock=$_POST['stock'];}

if (isset($_POST['code']))
    {
        $cod=$_POST['code'];
    }

if (isset($_POST['code2']))
    {
        $cod2=$_POST['code2'];
    }

require_once ("../config/db.php");
require_once ("../config/conexion.php");	
if (!empty($id) and !empty($cantidad) and !empty($precio_venta) and ($cantidad>0) and ($precio_venta>0) )
{
    //print"1";
   //1.1) COMENTADO CON ESTO NO SE PODIA REPETIR EL INGRESO DE UN PRODUCTO EN EL MISMO INGRESO 
   // 1.1) $count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM tmp where id_producto='$id' and session_id='$session_id'");
	// 1.1)	$row= mysqli_fetch_array($count_query);
	// 1.1)	$numrows = $row['numrows'];
   // 1.1) if($numrows==0){
        $insert_tmp=mysqli_query($con, "INSERT INTO tmp (id_producto,cantidad_tmp,precio_tmp,session_id,tienda,cod,Renglon_Presupuestario) VALUES ('$id','$cantidad','$precio_venta','$session_id','$stock','$cod','$cod2')");
    // 1.1) }else{            
     // 1.1)   print"Producto Repetido";
    // 1.1) }    
    
}
if (isset($_GET['id']))
{
$id_tmp=intval($_GET['id']);	
$delete=mysqli_query($con, "DELETE FROM tmp WHERE id_tmp='".$id_tmp."'");
}
?>
<div class="display_box" align="left">
<table  style="color:black;width:100%;" border="1">
<tr style="background:#0489B1;color:white;">
	
	<th style="width:5%;" class='text-center'>CANT.</th>
        
	<th style="width:40%;">DESCRIPCION</th>
    <th style="width:10%;">Renglón</th>
    <th style="width:10%;">NOMENCLATURA</th>
	<th style="width:5%;" class='text-center'>P.U.</th>
	<th style="width:10%;" class='text-center'>TOTAL</th>
        <th style="width:5%;"></th>
</tr>
<?php
	$sumador_total=0;
	$sql=mysqli_query($con, "select * from tmp where tmp.session_id='".$session_id."' ORDER BY  `tmp`.`id_tmp` ASC ");
	while ($row=mysqli_fetch_array($sql))
	{
	$id_tmp=$row["id_tmp"];
	$id=$row["id_producto"];
	$cantidad=$row['cantidad_tmp'];
	$nombre_producto=$row["id_producto"];
        $cod=$row["cod"];
        $renglon=$row["Renglon_Presupuestario"];
        $codigo_producto="";
        if($id>0 and is_numeric($id)){
            $sql1=mysqli_query($con, "select * from products where id_producto='".$id."'");
            $row1=mysqli_fetch_array($sql1);
            $nombre_producto=$row1['nombre_producto'];
            $codigo_producto=$row1['codigo_producto'];
            //print"1";
        }
	$precio_venta=$row['precio_tmp'];
	$precio_venta_f=$precio_venta;//Formateo variables
	$precio_venta_r=$precio_venta_f;//Reemplazo las comas
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=$precio_total;//Precio total formateado
	$precio_total_r=$precio_total_f;//Reemplazo las comas
	$sumador_total+=$precio_total_r;//Sumador
	
		?>
		<tr style="background:white;">
			
                        <td class='text-center' style="background:white;"><textarea id="cantidad_tmp-<?php echo $id_tmp;?>" name="cantidad_tmp-<?php echo $id_tmp;?>" class="monto input" style="width:70px;background:#E6E6E6;text-align:right;height:40px;"><?php echo round($cantidad,2);?></textarea></td>
			
                        <td style="background:white;"><?php echo $nombre_producto;?></td>
                        <td class='text-right' style="background:white;"><textarea  id="cod2-<?php echo $id_tmp;?>" name="cod2-<?php echo $id_tmp;?>"  style="width:80px;background:#E6E6E6;text-align:right;height:40px;"><?php echo $renglon;?></textarea></td>
                        <td class='text-right' style="background:white;"><textarea  id="cod-<?php echo $id_tmp;?>" name="cod-<?php echo $id_tmp;?>"  style="width:80px;background:#E6E6E6;text-align:right;height:40px;"><?php echo $cod;?></textarea></td>
                        
                        <td class='text-right' style="background:white;"><textarea  id="precio_tmp-<?php echo $id_tmp;?>" name="precio_tmp-<?php echo $id_tmp;?>" class="monto input" style="width:70px;background:#E6E6E6;text-align:right;height:40px;"><?php echo str_replace(",","",number_format($precio_venta_f,6));?></textarea></td>
                        <td class='text-right' style="background:white;"><input class="monto total" type="text" readonly value="<?php echo str_replace(",","",number_format($precio_total_f,6));?>" style="width:100%;height:40px;text-align:right;"></td>
			<td class='text-center' style="background:white;"><a href="#" class='btn btn-danger btn-xs' onclick="eliminar('<?php echo $id_tmp ?>')"><i class="glyphicon glyphicon-trash"></i></a></td>
		</tr>		
		<?php
	}
	$subtotal=$sumador_total;
	
	
	$total_factura=$subtotal/1.18;
        $total_iva=$total_factura*0.18;

    if($_SESSION['tipo']==0)
        {
        
?> 
                
                
<tr style="background:white;">
	<td class='text-right' colspan=4 style="background:white;">TOTAL</td>
	<td class='text-right' style="background:white;"><input class="monto totales" id="total" style="width:100%;height:40px;text-align:right;" type="text" value="<?php echo str_replace(",","",number_format($subtotal,6));?>"></td>
	<td></td>
</tr>                
                



<?php
    } 
       
?> 
 
</table>
</div>
</body>

<?php
header("Content-type: application/vnd.ms-excel" ) ; 
        header("Content-Disposition: attachment; filename=stockmin.xls" ) ;

?>
</html>
<script>
// generamos un evento click y keyup para cada elemento input con la clase .input
var input=document.querySelectorAll(".input");
input.forEach(function(e) {
    e.addEventListener("click",multiplica);
    e.addEventListener("keyup",multiplica);
});
 
// funcion que genera la multiplicacion
function multiplica() {
 
    // nos posicionamos en el tr del producto
    var tr=this.closest("tr");
 
    var total=1;
 
    // recorremos todos los elementos del tr que tienen la clase .input
    var inputs=tr.querySelectorAll(".input");
    inputs.forEach(function(e) {
        total*=e.value;
        
    });
 
    // mostramos el total con dos decimales
    tr.querySelector(".total").value=total.toFixed(2);
 
    // indicamos que calcule el total
    calcularTotal(this.closest("table"));
}
 
// funcion que calcula la suma total de los productos
function calcularTotal(e) {
    var total=0;
    var total1=0;
    var total2=0;
    var total3=0;
    var total4=0;
    // obtenemos todos los totales y los sumamos
    var totales=e.querySelectorAll(".total");
    totales.forEach(function(e) {
        total+=parseFloat(e.value);
        total1+=parseFloat(e.value);
    });
    
    total2=total*1.18;
    total3=total*0.18;
    
    
    // mostramos la suma total con dos decimales
    e.getElementsByClassName("totales")[0].value=total.toFixed(2);
    
    <?php
    if($_SESSION['tipo']==1){
    ?>
            
    e.getElementsByClassName("monto4")[0].value=total4.toFixed(2);
    e.getElementsByClassName("monto5")[0].value=total.toFixed(2);    
    <?php
    
        
    }
    
    if($_SESSION['tipo']==0){
        
    
    ?>
    e.getElementsByClassName("monto4")[0].value=total3.toFixed(2);
    e.getElementsByClassName("monto5")[0].value=total2.toFixed(2);  
    <?php
    
        
    }
    
    ?>        
    
}


$(document).ready(function(){

    $('textarea').blur(function(){

        var field = $(this);

        field.css('background-color','#E6E6E6');

        var dataString = 'value='+$(this).val()+'&field='+$(this).attr('name');

        $.ajax({

            type: "POST",

            url: "ajax/edit.php",

            data: dataString,

        });

    });

});
</script>
<?php
ob_end_flush();
?>
  