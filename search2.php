<?php
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");
include('ajax/is_logged.php');
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
    <table style="color:black;" border="1" style="text-align:center;width:90%;">
     <tr style="background:#58FAD0;color:black;">
        <th style="width:30%;" align="center">Nombre</th>
        <th style="width:10%;" align="center">Serie/Lote</th>
        <th style="width:5%;" align="center">Stock</th>
        <th style="width:5%;" align="center">Cantidad</th>
        <th style="width:10%;" align="center">Precio</th>
        <th style="width:10%;" align="center">Nomen.</th>
        <th style="width:5%;" align="center">Renglón</th>
    </tr>   
<?php
    
    
$sql_res=mysqli_query($con,"select * from products where nombre_producto like '%$q%' and cat_pro=23 LIMIT 0 , 20");
while($row=mysqli_fetch_array($sql_res))
{
$id=$row['id_producto'];
$nombre=$row['nombre_producto'];
$serie=$row['barras'];
$precio_venta=round($row['costo_producto'], 2);
$foto=$row['foto1'];

$tienda=$_SESSION['tienda'];
$b=round($row["b$tienda"], 2);
$i=$i+1;
?>


        
        
    <tr>
        <td><?php echo $nombre; ?></td>
        <td> <input type="text" autocomplete="off" style="text-align:center;width:100%;" id="lote_<?php echo $id; ?>" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"></td>
        <td>
             <input type="text"  style="text-align:center;width:100%;" disabled id="stoc_<?php echo $id; ?>" value="<?php echo $b;?>">  
            
        </td>
        
        <td>
            <input type="text" autocomplete="off" style="text-align:center;width:100%;" id="cant_<?php echo $id; ?>" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '1';}">
        </td>
        <td>
            <input type="text" autocomplete="off"  style="text-align:center;width:100%;" id="precio_<?php echo $id; ?>"  value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
        </td>
        <td>
            <input type="text" autocomplete="off"  style="text-align:center;width:100%;" id="code_<?php echo $id; ?>"  value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
        </td>
        <td>
            <input type="text" autocomplete="off"  style="text-align:center;width:100%;" id="code2_<?php echo $id; ?>"  value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
        </td>
        <td>
            <a  style="align:center;text-align:center; width:80%;" class='btn btn-info'href="#" onclick="agregar2('<?php echo $id ?>')"><i class="glyphicon glyphicon-plus"></i></a>
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
