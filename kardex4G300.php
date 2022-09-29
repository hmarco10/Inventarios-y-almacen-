<?php
ob_start();
session_start();
include('menu.php');
require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
header("Content-type: application/vnd.ms-excel" ) ; 
header("Content-Disposition: attachment; filename=kardex.xls" ) ; 

$sql1="select * from users where user_id=$_SESSION[user_id]";
$rw1=mysqli_query($con,$sql1);//recuperando el registro
$rs1=mysqli_fetch_array($rw1);//trasformar el registro en un vector asociativo
$sql2="select * from sucursal ORDER BY  `sucursal`.`tienda` DESC ";
$rw2=mysqli_query($con,$sql2);//recuperando el registro
$rs2=mysqli_fetch_array($rw2);//trasformar el registro en un vector asociativo
$tienda3=$rs2["tienda"];   
$modulo=$rs1["accesos"];
$a = explode(".", $modulo); 
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
    header("location: login.php");
    exit;
}
if($a[12]==0){
    header("location:error.php");    
}
$total1=0;        
$fecha1=$_GET['fecha1']; 
$fecha2=$_GET['fecha2']; 
$id_producto=$_GET['id_producto']; 
$tienda1=1;  
?>


              <?php
                       


$total2=0;
$saldo=0;
$d=1;
if($d==0){
//$sql="select * from products ORDER BY  `products`.`id_producto` DESC LIMIT 0 , 100";
    $sql="";
}else{
  
$host= $_SERVER["HTTP_HOST"];
$url= $_SERVER["REQUEST_URI"];
$aa="http://".$host.$url;


$consulta2 = "SELECT * FROM products where id_producto=$id_producto";
    $result2 = mysqli_query($con, $consulta2);
    while ($valor2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
        //if($valor1['user_id']==$id_vendedor){
            $nombre1=$valor2['nombre_producto'];
        //}  
    }

?>
       
  
                   <table id="example"  style="width:100%;color:black;" >
                      <thead>
                  <?php
                  for($i=1;$i<=8;$i++){
                      
                  ?>
                        <tr>
                       
                        <th></th>
                        
                        
                        
                        <th></th>
                        <th style="width:20%;">&nbsp;</th>
                        
                        
                        <th></th>
                       
                        
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                      
                      </tr>
                     <?php
                     }
                     ?>
                      
                      
                      
                      
                      </thead>
                      
                      <tbody> 
                      <tr>
                       
                        <td></td>
                        
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        
                        
                        <td></td>
                       
                        <td colspan="4"><h3><?php echo $nombre1;?></h3></td>
                        
                        
                      
                      </tr>
                          
                       <tr>
                       
                        <td></td>
                        
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        
                        
                        <td></td>
                       
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        
                      
                      </tr>   
                          
                      <tr>
                       
                        <td></td>
                        
                        <td></td>
                        
                        <td colspan="3" style="border:1px solid #424242;" align="center"><strong>UNIDADES</strong></td>
                        <td colspan="4" style="border:1px solid #424242;" align="center"><strong>COSTO</strong></td>
                        
                        
                        
                        
                      
                      </tr>
                      
                      
                  
                      <tr >
                       
                          <td style="border:1px solid #424242;" align="center"><strong>FECHA</strong>  </td>
                        
                        
                        
                          <td style="border:1px solid #424242;" align="center"><strong>DESCRIPCION</strong>  </td>
                        
                       
                        <td style="border:1px solid #424242;" align="center">INGRESO </td>
                        <td style="border:1px solid #424242;" align="center">EGRESO  </td>
                        <td style="border:1px solid #424242;" align="center">SALDO </td>
                        <td style="border:1px solid #424242;" align="center">COSTO UNITARIO </td>
                        <td style="border:1px solid #424242;" align="center">COSTO TOTAL </td>
                        <td style="border:1px solid #424242;" align="center">COSTO PROMEDIO </td>
                        <td style="border:1px solid #424242;" align="center">SALDO EN Q</td>
                      
                      </tr>
                      
                      <tr>
                       
                        <td style="border:1px solid #424242;"></td>
                        
                        <td style="border:1px solid #424242;"><strong></strong></td>
                        
                        
                        <td style="border:1px solid #424242;"></td>
                        
                        
                        <td style="border:1px solid #424242;"></td>
                       
                       
                        <td style="border:1px solid #424242;">0</td>
                        <td style="border:1px solid #424242;"></td>
                        <td style="border:1px solid #424242;"></td>
                        <td style="border:1px solid #424242;">0</td>
                        <td style="border:1px solid #424242;">0</td>
                      
                      </tr>
                      
                      
                    

                    
 <?php 
 $texto1="";
 
    
 
 
 if($id_producto*1>0){
     $texto="id_producto=$id_producto";
 }
 if($id_producto*1==0){
     $texto="IngresosEgresos.id_producto=products.id_producto";
     $texto1=",products";
 }
 
    //if($id_producto1==$id_producto  && $fecha>=$fech1 && $fecha<=$fech2 && $tienda>=$tienda1 && $tienda<=$tienda2)
//$sql="select * from IngresosEgresos where ORDER BY `IngresosEgresos`.`fecha` ASC  "; 
$sql="select *, sum(cantidad) as TotCan from IngresosEgresos where IngresosEgresos.ven_com<>12 and id_producto=$id_producto and IngresosEgresos.tipo_doc<>8 and IngresosEgresos.tienda>=$tienda1 and IngresosEgresos.tienda<=$tienda1 and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')>='$fecha1' and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')<='$fecha2' GROUP BY `IngresosEgresos`.`numero_factura` ORDER BY IngresosEgresos.id_detalle ASC";         
$s=1;
$cp=0;
$cp1=0;
$q=0;
$q1=0;
$s1=0;

$d=0;
//print"$sql";
$rs=mysqli_query($con,$sql);
while($row= mysqli_fetch_array($rs)){
$id_vendedor=$row['id_vendedor'];
$numero_factura=$row['numero_factura'];
$cantidad1=$row['cantidad'];
$TotCant=$row['TotCan'];
$precio_compra=$row['precio_venta'];
$tienda3=$row['tienda'];
$tipo=$row['ot'];
$tipo_doc=$row['tipo_doc'];
$inv_ini=$row['inv_ini'];
$id_producto1=$row['id_producto'];
$ven_com=$row['ven_com'];
$activo=$row['activo'];
$descripcion1="Ninguno";
$orden=$row['Orden'];
$serie_fac=$row['Serie_fac'];
if($id_producto*1==0){
    $producto1=$row['nombre_producto'];
}

if($row['folio']<>""){
    $folio="$row[folio]";
}else{
   $folio=""; 
}


if($numero_factura==0){
    $descripcion="Traslado de tienda";
    if($row['folio']<>"777"){
        $descripcion="Se abrio packs";
    }
    
    
}else{
    if($tipo_doc==1){
        $descripcion1="Factura";
    }
    if($tipo_doc==2){
        $descripcion1="Boleta";
    }
    if($tipo_doc==3){
        $descripcion1="Guias";
    }
    if($tipo_doc==5){
        $descripcion="Nota de Debito";
        $descripcion1="Nota de Debito";
    }
    if($tipo_doc==6){
        $descripcion="Nota de Credito";
        $descripcion1="Nota de Credito";
    }
    if($ven_com==1 and $activo==1 and $precio_compra>0){
        if($tipo_doc<=3)
        {
            $descripcion="Despacho";
        }          
    }
    if($ven_com==2 and $activo==1 and $precio_compra>0){
        $descripcion="Compras";
    }
    if($precio_compra==0 and $activo==1){
        $descripcion="Traslado de tienda";
    }
    if($activo==0 ){
        $descripcion="Documento Eliminado";
        //$precio1=$row['precio_compra'];
        if($tipo_doc==9 && $precio_compra>0){
             $descripcion="Entrada Mercaderia";
        }
        if($tipo_doc==10 && $precio_compra>0){
             $descripcion="Salida Mercaderia";
        }
        
    }
}
if($tipo==0){
    $entrada=0;
    $salida=0;
}
if($tipo==1){
    $entrada=0;
    $salida=$TotCant;
}
if($tipo==2){
    $salida=0;
    $entrada=$TotCant;
}
//$saldo=$entrada-$salida; 
//if($d==0){
$saldo=$s1+$entrada-$salida; 
//}else{
//    $saldo=$inv_ini+$entrada-$salida; 
//}

$cliente1="";
$unidad_Profesional="";
if($tipo_doc>0){
$consulta1 = "SELECT * FROM facturas ";
$result1 = mysqli_query($con, $consulta1);
while ($valor1 = mysqli_fetch_array($result1, MYSQLI_ASSOC)) {   
    if($valor1['numero_factura']==$numero_factura && $valor1['estado_factura']==$tipo_doc && $valor1['tienda']==$tienda3){
        $id=$valor1['id_cliente'];
    }   
}
$consulta2 = "SELECT * FROM clientes ";
$result2 = mysqli_query($con, $consulta2);
while ($valor1 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {  
    if($valor1['id_cliente']==$id){
        $cliente1=$valor1['nombre_cliente'];
        $unidad_Profesional=$valor1['direccion_cliente'];
    }   
}
}
if($tipo_doc==0){
    $consulta2 = "SELECT * FROM users ";
    $result2 = mysqli_query($con, $consulta2);
    while ($valor1 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
        if($valor1['user_id']==$id_vendedor){
            $nombre1=$valor1['nombres'];
        }  
    }
$cliente1=$nombre1;
}
$fecha3=$row['fecha'];
$d3 = explode("-",$fecha3);
$dia=date("d",strtotime($fecha3)); 
$mes=date("m",strtotime($fecha3));  
$ano=date("Y",strtotime($fecha3)); 
$dd=$ano."-".$mes."-".$dia;
$dd5=$dia."-".$mes."-".$ano;
$hora=date("H:i",strtotime($fecha3)); 
$fecha=strtotime($dd);
//$fech1=strtotime($dd1);
//$fech2=strtotime($dd2);
$tienda=$row['tienda'];
$total_venta=$row['precio_venta']*$cantidad1;
//if($id_producto1==$id_producto  && $fecha>=$fech1 && $fecha<=$fech2 && $tienda>=$tienda1 && $tienda<=$tienda2){

        $total1=$total1+$total_venta;
        //$mon="S/.";
        $entrada1=round($entrada,2);
        $precio_compra1=round($precio_compra,2);
        $pre1=round($precio_compra*($entrada+$salida),2);
        if($entrada==0){
            $entrada1="";
            $precio_compra1="";
            //$pre1=""; 
        }
        $salida1=round($salida,2);
        if($salida==0){
            $salida1="";
        }
        
        
        if($entrada>0){
            $q=round($q+$pre1,2);
            $cp=round($q/$saldo,2);
            $q1=$q;
            $s1=$saldo;
        }else{
            $q=round($q-$pre1,2);
            if($s1<>0){
                $cp=round($q1/$s1,2); 
            }else{
                $cp=0; 
            }
           
            $q1=$q;
            $s1=$saldo;
        }
        
        $d=$d+1;
        ?>
                       
        <tr id="valor1">
               
                        <td style="border:1px solid #424242;"><?php print"$dd5";?></td>
                       
                        
                       
                       <td style="border:1px solid #424242;"><?php 
                       
                       if($entrada==0){
                        print"Despacho'$folio', $unidad_Profesional sop: $orden";
                        } else if ($folio<>''){
                            print"FACT.  '$serie_fac' No $numero_factura, $cliente1, CIAI $folio, Sop: $orden ";
                        }else{
                        print"    SALDO INICIAL AL 01/01/2021 VIENEN";
                        }
                        
                       
                       
                       
                       ?>
                       
                       
                       
                       
                       </td>
                       
                        <td style="border:1px solid #424242;">
                            <?php  
                                if($folio<>''){
                                    echo $entrada1;
                                }
                                else{
                                    echo "";
                            }?>
                        </td>
                        <td style="border:1px solid #424242;"><?php echo $salida1;?></td>
                        <td style="border:1px solid #424242;"><?php echo $saldo;?></td>
                        <td style="border:1px solid #424242;">
                        <?php 
                                if($folio<>''){
                                    echo $precio_compra1;
                                }
                                else{
                                    echo "";
                                }
                            ?>
                        </td>
                        <td style="border:1px solid #424242;" align="right">
                            <?php 
                                if($folio<>''){
                                    echo number_format($pre1,2);
                                }
                                else{
                                    echo "";
                                } 
                            ?>
                        </td>
                        <td style="border:1px solid #424242;" align="right"><?php echo number_format($cp,6);$cp1=$cp1+$cp;?></td>
                        <td style="border:1px solid #424242;" align="right"><?php echo number_format($q,2);?></td>
                      </tr>                
    <?php
    $s=$s+1;

                    if($d%15==0){
                        ?>
                        <tr>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;" style="font-weight:bold; text-align:center;">VAN:</td>
                            <td style="border:1px solid #424242;"><?php echo $saldo;?></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;" style="font-weight:bold; text-align:center;">VAN:</td>
                            <td style="border:1px solid #424242;"><?php echo number_format($q,2);?></td>
                        </tr>
                        <tr>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;" style="font-weight:bold; text-align:center;">VIENEN:</td>
                            <td style="border:1px solid #424242;"><?php echo $saldo;?></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;"></td>
                            <td style="border:1px solid #424242;" style="font-weight:bold; text-align:center;">VIENEN:</td>
                            <td style="border:1px solid #424242;"><?php echo number_format($q,2);?></td>
                        </tr>
                <?php
                    }

                }                       
                ?>                      
                                           
                    <tr>
                       
                        <td></td>
                        
                        <td style="font-weight:bold; text-align:center;">SALDO FINAL AL <?php echo $fecha2;?> </td>
                        <td></td>
                        <td></td>
                       
                       
                        <td><?php echo $s1;?></td>
                        <td></td>
                        <td></td>
                        <td><?php echo round($cp1/$d,2);?></td>
                        <td><?php echo round($s1*$cp1/$d,2);?></td>
                      
                      </tr>  
                      
                      
                      
                    </tbody>

                  </table>
                
                    
              
              
              
            <?php
}
?>
             
           
<?php
ob_end_flush();
?>



