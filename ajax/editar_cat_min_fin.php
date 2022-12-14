<?php
	include('is_logged.php');
	if (empty($_POST['mod_id'])) {
           $errors[] = "ID vacío";
        }else if (empty($_POST['mod_nombre'])) {
           $errors[] = "Nombre vacío";
        }else if (trim($_POST['mod_nombre'])=="") {
           $errors[] = "Nombre vacío";
           
        }  else if ($_POST['mod_estado']==""){
			$errors[] = "Selecciona el estado del proveedor";
		}  else if (
			!empty($_POST['mod_id']) &&
			!empty($_POST['mod_nombre']) &&
			$_POST['mod_estado']!="" 
		){
		require_once ("../config/db.php");
		require_once ("../config/conexion.php");
		$nombre=mysqli_real_escape_string($con,(strip_tags($_POST["mod_tipo"],ENT_QUOTES)));
		$telefono=mysqli_real_escape_string($con,(strip_tags($_POST["mod_telefono"],ENT_QUOTES)));
		$email=mysqli_real_escape_string($con,(strip_tags($_POST["mod_email"],ENT_QUOTES)));		
        $direccion=mysqli_real_escape_string($con,(strip_tags($_POST["mod_departamento"],ENT_QUOTES)));        
        $provincia=mysqli_real_escape_string($con,(strip_tags($_POST["mod_provincia"],ENT_QUOTES)));
		$estado=intval($_POST['mod_estado']);
		$id_cliente=intval($_POST['mod_id']);
		$sql="UPDATE cat_min_fin SET Renglon='".$nombre."', Nombre='".$telefono."', Nom_Presentacion='".$email."', Caracteristicas='".$direccion."', Unidad_Medida_Presentacion='".$provincia."', Estado='".$estado."'";
		$query_update = mysqli_query($con,$sql);
			if ($query_update){
				$messages[] = "Registro ha sido actualizado satisfactoriamente.";
			} else{
				$errors []= "Registro duplicado.";
			}
		} else {
			$errors []= "Error desconocido.";
		}
		
		if (isset($errors)){
			
			?>
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Error!</strong> 
					<?php
						foreach ($errors as $error) {
								echo $error;
							}
						?>
			</div>
			<?php
			}
			if (isset($messages)){
				
				?>
				<div class="alert alert-success" role="alert">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>¡Bien hecho!</strong>
						<?php
							foreach ($messages as $message) {
									echo $message;
								}
							?>
				</div>
				<?php
			}

?>