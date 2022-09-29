<?php
ob_start();

// include the configs / constants for the database connection
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos

// load the login class
require_once("classes/Login.php");

// create a login object. when this object is created, it will do all login/logout stuff automatically
// so this single line handles the entire login process. in consequence, you can simply ...
$login = new Login();

// ... ask if we are logged in here:
if ($login->isUserLoggedIn() == true) {
    // the user is logged in. you can do whatever you want here.
    // for demonstration purposes, we simply show the "you are logged in" view.
   
   
   include('menu.php');
  
   $sql1="select * from users where user_id=$_SESSION[user_id]";
    $rw1= mysqli_query($con, $sql1);//recuperando el registro
    $rs1= mysqli_fetch_array($rw1);
    $modulo=$rs1["accesos"];
    $b = explode(".", $modulo);
   $c=0;
  if($b[47]==1){
        $_SESSION['tienda']=5; 
        $c=1;
        } 
  if($b[46]==1){
        $_SESSION['tienda']=4; 
        $c=1;
        }
        
  if($b[45]==1){
        $_SESSION['tienda']=3; 
        $c=1;
        }
  if($b[44]==1){
        $_SESSION['tienda']=2;
        $c=1;
        }
        
   if($b[43]==1){
        $_SESSION['tienda']=1;  
        $c=1;
        }
        
       
   if($c>0){
     $_SESSION['doc_ventas']=1;
     
     
 $_SESSION['tipo']=0;
     $_SESSION['tabla']=1;
   $_SESSION['servicio1']="0";
       header("location: resumen.php");   
   }else{
     header("location: login.php");   
   }
   
    
    

} else {
    // the user is not logged in. you can do whatever you want here.
    // for demonstration purposes, we simply show the "you are not logged in" view.
    ?>
<!DOCTYPE html>
<html lang="es" src="images/bg4.jpg">
<head>
<meta name="viewport" content="width=device-width" />
    <title>CNA-INVENTARIOS</title>

    <link href="styles/popuo-box.css" rel="stylesheet" />
    <link href="styles/style.css" rel="stylesheet" />
    <link href="styles/font-awesome.min.css" rel="stylesheet" />
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/jquery.magnific-popup.js"></script>
    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   
</head>
<body>
<br>
<div class="m-0 row justify-content-center">
    <a href="#">
        <img src="images/miLogo.png" class="login-check" alt="">
    </a>
</div>
<br>
<h4 class="m-0 row justify-content-center" style="color:white">Consejo Nacional De Adopciones / Ingreso de Usuarios</h4>
<br/>
<div class="main-agileits">
        <div class="form-w3-agile">
        <h4 class="m-0 row justify-content-center" style="color:white">INICIAR SESIÓN</h4>
            <p id="profile-name" class="profile-name-card"></p>
            <form method="post" accept-charset="utf-8" action="login.php" name="loginform" autocomplete="off" role="form" class="form-signin">
			<?php
				// show potential errors / feedback (from login object)
				if (isset($login)) {
					if ($login->errors) {
						?>
						<div class="form-sub-w3">
						    <strong>Error!</strong> 
						
						<?php 
						foreach ($login->errors as $error) {
							echo $error;
						}
						?>
						</div>
						<?php
					}
					if ($login->messages) {
						?>
			<div class="alert alert-success alert-dismissible" role="alert">
						    <strong>Aviso!</strong>
						<?php
						foreach ($login->messages as $message) {
							echo $message;
						}
						?>
						</div> 
						<?php 
					}
				}
				?>
              <div class="form-sub-w3">
                <input class="form-control" placeholder="Usuario" name="user_name" type="text" value="" autofocus="" required>
              </div>
              <div class="form-sub-w3">
                <input class="form-control" placeholder="Contraseña" name="user_password" type="password" value="" autocomplete="off" required>
              </div>
                <br>
                <button type="submit" class="btn btn-lg btn-success btn-block btn-signin" name="login" id="submit">Iniciar Sesión</button>

              </div>
            </form><!-- /form -->
            
        </div><!-- /card-container -->
    </div><!-- /container -->
  </body>
</html>

<?php
}
ob_end_flush();
?>


