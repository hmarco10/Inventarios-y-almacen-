<?php
if (isset($_GET['term'])){
include("../../config/db.php");
include("../../config/conexion.php");
$return_arr = array();
/* If connection to database, run sql statement. */
if ($con)
{
	$fetch = mysqli_query($con,"SELECT * FROM clientes where tipo1=1 and nombre_cliente like '%" . mysqli_real_escape_string($con,($_GET['term'])) . "%'  LIMIT 0 ,50");  
	
	
	/* Retrieve and store in array the results of the query.*/
	while ($row = mysqli_fetch_array($fetch)) {
		$id_cliente=$row['id_cliente'];
		$row_array['value'] = $row['nombre_cliente'];
		$row_array['id_cliente']=$id_cliente;
		$row_array['nombre_cliente']=$row['nombre_cliente'];
		$row_array['telefono_cliente']=$row['telefono_cliente'];
		$row_array['email_cliente']=$row['email_cliente'];
        $row_array['direccion_cliente']=$row['direccion_cliente'];
        $row_array['doc1']=$row['documento'];
        /*        $row_array['direccion_cliente']=$row['direccion_cliente'];
                if($row['doc']>0)
                {
                    $row_array['doc1']=$row['doc'];
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