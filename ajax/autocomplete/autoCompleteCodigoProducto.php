<?php
if (isset($_GET['term'])){
include("../../config/db.php");
include("../../config/conexion.php");
$return_arr = array();
/* If connection to database, run sql statement. */
if ($con)
{
	
	$fetch = mysqli_query($con,"SELECT * FROM cat_min_fin where Codigo_Presentacion like '%" . mysqli_real_escape_string($con,($_GET['term'])) . "%' LIMIT 0 ,50"); 
	
	/* Retrieve and store in array the results of the query.*/
	while ($row = mysqli_fetch_array($fetch)) {
		$id_proveedores=$row['id_Cat_Min_Fin'];
		$row_array['value'] = $row['Codigo_Presentacion'];
		$row_array['id_proveedores']=$id_proveedores;
		$row_array['nombre_proveedores']=$row['Codigo_Presentacion'];
		$row_array['codigo']=$row['Codigo'];
		$row_array['nombre_producto']=$row['Nombre'];
		$row_array['desc_corta']=$row['Nombre']." ".$row['Nom_Presentacion'];
		$row_array['color']=$row['Nombre']." ".$row['Nom_Presentacion']." ".$row['Unidad_Medida_Presentacion']." ".$row['Caracteristicas'];
		array_push($return_arr,$row_array);
    }
	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
echo json_encode($return_arr);

}
?>