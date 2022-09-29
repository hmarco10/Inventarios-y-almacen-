<?php


ob_start();
session_start();
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");


$link= mysqli_connect("localhost","root","");
  if($link){
    mysqli_select_db($link,"inventarioscna");
    //desrrollo inventarioscnaDesarrollo
    //produccion inventarioscna
  }

  $checkbox=$_POST['checkbox'];
  $fac=$_POST['factura'];
  $id_fac=$_POST['id_fac'];

//$fecha_factura=$_POST['fecha1'];
//$f=explode('/',$fecha_factura);
//$fecha11=date("Y-m-d", strtotime($fecha_factura) );
$mensaje = "¡Ingreso Registrado Exitosamente!";
//$fecha_sql=$f[2]."-".$f[0]."-".$f[1];

echo '<script language="javascript">
              alert("'.$mensaje.'");
              window.location.href="compras.php"; 
      </script>';


  foreach ($checkbox as $llave => $valor) {
    $ficha2="INSERT INTO programas_facturas set Nom_Programa='$valor', numero_factura='$fac', id_factura='$id_fac'";
    $ejecutar_insertar_ficha2=mysqli_query($link,$ficha2);
  }

?>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>src="js/sweetalert.js"</script>