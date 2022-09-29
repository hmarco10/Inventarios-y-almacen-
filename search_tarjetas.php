<?php
include('ajax/is_logged.php');
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");

if($_POST)
{
$i=0;
$q=$_POST['palabra'];//se recibe la cadena que queremos buscar
if(strlen ($q)>=1)
{
?>
<style>
tr:hover{background:#81F79F;}
</style>
<div class="display_box" align="left">
    <table style="color:black;" border="1">
     <tr style="background:#58FAD0;color:black;"><th style="width:5%;" align="center">Fotos</th><th style="width:50%;" align="center">Nombre</th><th style="width:5%;" align="center">Lote</th><th style="width:10%;" align="center">Stock</th><th style="width:10%;" align="center">Estado</th><th style="width:10%;">Cantidad</th><th style="width:10%;" align="center">Precio</th><th style="width:5%;"></th></tr>   
<?php
    
$sql_res=mysqli_query($con,"select * from products where nombre_producto like '%$q%' LIMIT 0 , 20");
while($row=mysqli_fetch_array($sql_res))
{
$id=$row['id_producto'];
$nombre=$row['nombre_producto'];
$codigo=$row['codigo_producto'];
$lote=$row['barras'];
$costo_producto=$row['costo_producto'];
$foto=$row['foto1'];
$estadoProducto=$row['descripcion'];

$tienda=$_SESSION['tienda'];
$b=round($row["b$tienda"], 2);
$i=$i+1;
if($estadoProducto==0){
    $estadoProducto="ALMACENADO";
}else {
    $estadoProducto="ASIGNADO";
}
?>


        
       
    <tr><td ><img src="fotos/<?php echo $foto?>" width="30" height="20" /></td>
        <td ><p style="text-align:left;width:100%;"><?php echo $nombre; ?></p></td>
        <!--td ><?php echo $lote; ?></td-->
        <td > 
          <input type="text"  style="text-align:center;width:100%;" id="lote_<?php echo $id; ?>" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '1';}">
        </td>
        <td >
          <input type="text"  style="text-align:center;width:100%;" disabled id="stoc_<?php echo $id; ?>" value="<?php echo $b;?>">  
            
        </td>
        <td >
          <input type="text"  style="text-align:center;width:100%;" disabled id="estado_<?php echo $id; ?>" value="<?php echo $estadoProducto;?>">  
            
        </td>
        
        <td >
            <input type="text"  style="text-align:center;width:100%;" id="cant_<?php echo $id; ?>" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '1';}">
        </td>
        <td >
            <input type="text" style="text-align:center;width:100%;" id="precio_<?php echo $id; ?>"  value="<?php echo $costo_producto; ?>" readonly="readonly">
        </td>
        <td >
            <a class='btn btn-info'href="#" onclick="agregar2('<?php echo $id ?>')"><i class="glyphicon glyphicon-plus"></i></a>
        </td>
    </tr>


<?php
}
?>
    </table></div>
<?php
}


}


?>
