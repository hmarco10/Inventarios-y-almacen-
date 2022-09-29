<?php
if (isset($_GET['term'])){
include("../../config/db.php");
include("../../config/conexion.php");
$return_arr = array();
/* If connection to database, run sql statement. */
if ($con)
{
	// ORIGINAL $fetch = mysqli_query($con,"SELECT * FROM clientes where tipo1=2 and nombre_cliente like '%" . mysqli_real_escape_string($con,($_GET['term'])) . "%'  LIMIT 0 ,50"); 
	$fetch = mysqli_query($con,"SELECT user_id,dni,nombres,nombreUnidad,telefono FROM users INNER JOIN Unidad, puestos where users.id_unidad=Unidad.id_unidad and users.id_puesto=puestos.id_puesto AND nombres like '%" . mysqli_real_escape_string($con,($_GET['term'])) . "%'  LIMIT 0 ,50"); 
	
	/* Retrieve and store in array the results of the query.*/
	while ($row = mysqli_fetch_array($fetch)) {
		$id_cliente=$row['user_id'];
		$row_array['value'] = $row['nombres'];
		$row_array['id_cliente']=$id_cliente;
		$row_array['nombre_cliente']=$row['nombres'];
        $row_array['doc1']=$row['dni'];
		$row_array['telefono_cliente']=$row['telefono'];
		$row_array['direccion_cliente']=$row['nombreUnidad'];
                //$row_array['direccion_cliente']=$row['direccion_cliente'];
                /* COMENTADO if($row['doc']>0)
                {
                    $row_array['doc1']=$row['dni'];
                }
                if($row['doc']==0 and $row['dni']>0)
                {
                    $row_array['doc1']=$row['dni'];
                }*/
                
                
                
                
		array_push($return_arr,$row_array);
    }
	
}

/* Free connection resources. */
mysqli_close($con);

/* Toss back results as json encoded array. */
echo json_encode($return_arr);

}
?>