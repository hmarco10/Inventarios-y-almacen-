<?php
include('is_logged.php');
?>
<!DOCTYPE html>
<html>
<head>
    <style>
    .monto {text-align:center;}
    .monto1 {text-align:center;}
    .monto2 {text-align:center;}
    .totales {font-weight:bold;}
    </style>
</head>
<?php
	

$session_id= session_id();
if (isset($_POST['id'])){$id=$_POST['id'];}
if (isset($_POST['cantidad'])){$cantidad=$_POST['cantidad'];}
if (isset($_POST['precio_venta'])){$precio_venta=$_POST['precio_venta'];}
if (isset($_POST['stock'])){$stock=$_POST['stock'];}
require_once ("../config/db.php");
require_once ("../config/conexion.php");

//print"INSERT INTO tmp (id_producto,cantidad_tmp,precio_tmp,session_id,tienda) VALUES ('$id','$cantidad','$precio_venta','$session_id','$stock')";

if (!empty($id) and !empty($cantidad) and !empty($precio_venta) and ($cantidad>0) and ($precio_venta>0) and ($cantidad<=$stock))
{
$insert_tmp=mysqli_query($con, "INSERT INTO tmp (id_producto,cantidad_tmp,precio_tmp,session_id,tienda) VALUES ('$id','$cantidad','$precio_venta','$session_id','$stock')");
}
if (isset($_GET['id']))
{
$id_tmp=intval($_GET['id']);	
$delete=mysqli_query($con, "DELETE FROM tmp WHERE id_tmp='".$id_tmp."'");
}
?>
<table class="table" style="color:black;">
<tr  style="background:#045FB4;color:white;">
	<th class='text-center'>CODIGO</th>
	<th class='text-center'>CANT.</th>
	<th>DESCRIPCION</th>
	<th class='text-right'>PU.</th>
	<th class='text-right'>P TOTAL</th>
	<th></th>
</tr>
<?php
	$sumador_total=0;
        $sql1=mysqli_query($con, "select * from facturas where id_factura='".$_SESSION['id_factura']."'");
        $row1=mysqli_fetch_array($sql1);
        $numero_factura=$row1["numero_factura"];
	$folio=$row1["folio"];
	$estado_factura=$row1['estado_factura'];
	$tienda=$row1["tienda"];
        
	$sql=mysqli_query($con, "select * from tmp where tmp.session_id='".$session_id."' ORDER BY  `tmp`.`id_tmp` ASC ");
	while ($row=mysqli_fetch_array($sql))
	{
	$id_tmp=$row["id_tmp"];
	$id=$row["id_producto"];
	$cantidad=$row['cantidad_tmp'];
	$nombre_producto=$row["id_producto"];
        $codigo_producto="";
        if($id>0){
            $sql1=mysqli_query($con, "select * from products where id_producto='".$id."'");
            $row1=mysqli_fetch_array($sql1);
            $nombre_producto=$row1['nombre_producto'];
            $codigo_producto=$row1['codigo_producto'];
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
			<td class='text-center' style="background:white;width:10%;"><?php echo $codigo_producto;?></td>
                        <td class='text-center' style="background:white;width:10%;"><textarea id="cantidad_tmp-<?php echo $id_tmp;?>" name="cantidad_tmp-<?php echo $id_tmp;?>" class="monto input" style="background:#A9D0F5;"><?php echo $cantidad;?></textarea></td>
			<td style="background:white;width:50%;"><?php echo $nombre_producto;?></td>
			<td class='text-right' style="background:white;width:10%;"><textarea id="precio_tmp-<?php echo $id_tmp;?>" name="precio_tmp-<?php echo $id_tmp;?>" class="monto input" style="background:#A9D0F5;"><?php echo $precio_venta_f;?></textarea></td>
                        <td class='text-right' style="background:white;width:10%;"><input class="monto total" type="text" readonly value="<?php echo $precio_total_f;?>"></td>
			<td class='text-center' style="background:white;width:10%;"><a href="#" class='btn btn-danger btn-xs' onclick="eliminar('<?php echo $id_tmp ?>')"><i class="glyphicon glyphicon-trash"></i></a></td>
		</tr>		
		<?php
	}
	$subtotal=$sumador_total;
	$total_factura=$subtotal/1.18;
        $total_iva=$total_factura*0.18;

        if ($_SESSION['doc_ventas']==5 or $_SESSION['doc_ventas']==6) {   
?>                
<tr style="background:white;">
	<td class='text-right' colspan=4 style="background:white;">SUBTOTAL</td>
	<td class='text-right' style="background:white;"><input type="text" class="monto1" value="<?php echo number_format($total_factura,2);?>"></td>
	<td></td>
</tr>
<tr style="background:white;">
	<td class='text-right' colspan=4 style="background:white;"><?php echo nom_iva;?> (<?php echo iva?>)% </td>
	<td class='text-right' style="background:white;"><input type="text" class="monto2" value="<?php echo number_format($total_iva,2);?>"></td>
	<td></td>
</tr>
<?php
        }
?>
<tr style="background:white;">
	<td class='text-right' colspan=4 style="background:white;">TOTAL</td>
	<td class='text-right' style="background:white;"><input class="monto totales" type="text" value="<?php echo number_format($subtotal,2);?>"></td>
	<td></td>
</tr>
</table>
</body>
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
    // obtenemos todos los totales y los sumamos
    var totales=e.querySelectorAll(".total");
    totales.forEach(function(e) {
        total+=parseFloat(e.value);
    });
    total1=total/1.18;
    total2=total1*0.18;
    // mostramos la suma total con dos decimales
    e.getElementsByClassName("totales")[0].value=total.toFixed(2);
    e.getElementsByClassName("monto1")[0].value=total1.toFixed(2);
     e.getElementsByClassName("monto2")[0].value=total2.toFixed(2);
}
</script>


<script type="text/javascript">

$(document).ready(function(){

    $('textarea').blur(function(){

        var field = $(this);

        field.css('background-color','#D0F5A9');

        var dataString = 'value='+$(this).val()+'&field='+$(this).attr('name');

        $.ajax({

            type: "POST",

            url: "ajax/edit.php",

            data: dataString,

        });

    });

});

</script>
