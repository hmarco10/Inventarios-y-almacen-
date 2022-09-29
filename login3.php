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

<html>
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
    
<br/>
<div class="m-0 row justify-content-center">
    <a href="#">
        <img src="images/miLogo.png" class="login-check" alt="">
    </a>
</div>
<br />
<h4 class="m-0 row justify-content-center" style="color:white">Consejo Nacional De Adopciones / Ingreso de Usuarios</h4>
<br />
<div class="main-agileits">
    <!--form-stars-here-->
    <div class="form-w3-agile">
        <h4>Formulario De Acceso</h4>
        <form method="post" accept-charset="utf-8" action="login3.php" name="loginform" autocomplete="off" role="form" class="form-signin">
            <div class="form-sub-w3">
                <input type="text" name="Name" placeholder="Customer number or username " required="" />
                <div class="icon-w3">
                    <i class="fa fa-user" aria-hidden="true"></i>
                </div>
            </div>
            <div class="form-sub-w3">
                <input type="password" name="Password" placeholder="Password" required="" />
                <div class="icon-w3">
                    <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                </div>
            </div>
            <p class="p-bottom-w3ls">Ingresar Nuevo Usuario<a class="w3_play_icon1" href="#small-dialog1">  Ingresar Usuario</a></p>
            <div class="submit-w3l">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
    <!--//form-ends-here-->
</div>
<div id="small-dialog1" class="mfp-hide">
    <div class="contact-form1">
        <div class="contact-w3-agileits">
            <h3>Formulario De Registro</h3>
            <form action="Insert" method="post">
                <div class="form-sub-w3ls">
                    <input name="Name" placeholder="Ingrese DPI" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Primer_nombre" placeholder="Primer Nombre" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Segundo_nombre" placeholder="Segundo Nombre" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Primer_apellido" placeholder="Primer Apellido" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Segundo_apellido" placeholder="Segundo Apellido" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Cargo" placeholder="Cargo" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="JefeInmediato" placeholder="Jefe Inmediato" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Password" placeholder="Password" type="password" required="">
                    <div class="icon-agile">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Email" placeholder="Correo Electronico" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input name="Usuario" placeholder="Usuario" class="mail" type="text" required="">
                    <div class="icon-agile">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="p-2 bd-highlight">
                    <select  class="selectpicker show-tick form-control" data-style="btn-danger" name="nivel" style="width:max-content; align-items:left;  " CssClass="form-control" runat="server">
                        <option value="1">Elija Nivel Jerarquico</option>
                        <option value="1">Director General</option>
                        <option value="2">Subdirector General</option>
                        <option value="3">Coordinador</option>
                        <option value="4">Subcoordinador</option>
                        <option value="5">Jefe</option>
                        <option value="6">Encargado</option>
                        <option value="7">Colaborador</option>
                    </select>

                </div>
                <div class="p-2 bd-highlight">
                    <br />
                    <select  class="selectpicker show-tick form-control" ID="DropDownList1" style="width:max-content;"  runat="server">
                        <option value="1">Elija Puesto Nominal</option>
                        <option VALUE="72">Abogado AJ</option>
                        <option VALUE="71">Abogado y Notario AJ</option>
                        <option VALUE="36">Apoyo Unidad de Asesoría Jurídica</option>
                        <option VALUE="67">Abogado UACHP</option>
                        <option VALUE="60">Abogado SUFB</option>
                        <option VALUE="10">Abogado UFA</option>
                        <option VALUE="63">Abogado y Notario UAN</option>
                        <option VALUE="1">Analista Programador</option>
                        <option VALUE="51">Apoyo Inventario</option>
                        <option VALUE="15">Asesor Dirección General</option>
                        <option VALUE="70">Asistente UACHP</option>
                        <option VALUE="16">Asistente Administrativa</option>
                        <option VALUE="14">Asistente de Dirección</option>
                        <option VALUE="5">Asistente de Registro</option>
                        <option VALUE="20">Asistente Ejecutiva</option>
                        <option VALUE="77">Asistente Técnica RRHH</option>
                        <option VALUE="9">Asistente Técnico Financiero UDAF</option>
                        <option VALUE="47">Asistente Técnico Financiero SGYT</option>
                        <option VALUE="23">Asistente EM</option>
                        <option VALUE="17"> Comunicador Social</option>
                    </select>


                </div>
                <br />
                <hr  color="black;" align="center" noshade="noshade" size="4" width="100%" />
                <br />
                <h3>Asignación De Permisos</h3>
                <div style="text-align:left; color:white;">
                    <ul style="display:inline;">
                        <li>
                            <label class="anim">
                                <input name="AsignarRecursos" value="1" type="checkbox" class="checkbox">
                                <span>Crear Comisión</span>
                            </label>
                        </li>
                        <li>
                            <label class="anim">
                                <input name="AsignarRecursos[]" value="2" type="checkbox" class="checkbox">
                                <span>Autorizar comisión</span>
                            </label>
                        </li>
                            <label class="anim">
                                <input name="AsignarRecursos[]" value="3" type="checkbox" class="checkbox">
                                <span>Asignar recursos</span>
                            </label>
                        </li>
                        <li>
                            <label class="anim">
                                <input name="AsignarRecursos[]" value="4" type="checkbox" class="checkbox">
                                <span>Imprimir aviso comisión</span>
                            </label>
                        </li>
                        <li>
                            <label class="anim">
                                <input name="AsignarRecursos[]" value="5" type="checkbox" class="checkbox">
                                <span>Imprimir formulario solicitud combustible</span>
                            </label>
                        </li>
                        <li>
                            <label class="anim">
                                <input name="AsignarRecursos[]" value="6" type="checkbox" class="checkbox">
                                <span>Anular o ampliar comisión</span>
                            </label>
                        </li>
                        <li>
                            <label class="AsignarRecursos[]">
                                <input name="AutPrestCupones" value="12" type="checkbox" class="checkbox">
                                <span>Autorizar prestamo cupones</span>
                            </label>
                        </li>
                    </ul>
                </div>



</div>
        <div class="login-check">
        <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><p>I Accept Terms & Conditions</p></label>
        <div>

            <div class="submit-w3l">
                <input type="submit" value="Register"><a class="w3_play_icon1">
                    <p class="p-bottom-w3ls"><a class="w3_play_icon1" href="#small-dialog2">  Siguiente -> </a></p>
            </div>
            </form>

        </div>
</div>
</div>






        <!-- copyright -->
        <div class="copyright w3-agile">
            <p> © 2017 Credit Login / Register Form . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
        </div>
        <!-- //copyright -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- pop-up-box -->
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!--//pop-up-box -->
        <script>
            $(document).ready(function () {
                $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>

</body>
</html>

<?php
}
ob_end_flush();
?>


