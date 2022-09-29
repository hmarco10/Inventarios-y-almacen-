<?php 
session_start();
include('excel/Classes/PHPExcel.php');
 
// Crea un nuevo objeto PHPExcel
$objPHPExcel = new PHPExcel();
 
// Establecer propiedades
$objPHPExcel->getProperties()
->setCreator("Cattivo")
->setLastModifiedBy("Cattivo")
->setTitle("Documento Excel de Prueba")
->setSubject("Documento Excel de Prueba")
->setDescription("Demostracion sobre como crear archivos de Excel desde PHP.")
->setKeywords("Excel Office 2007 openxml php")
  
->setCategory("Pruebas de Excel");

 $style = array('font' => array('size' => 8,'bold' => false));

//apply the style on column A row 1 to Column B row 1
$objPHPExcel->getActiveSheet()->getStyle('A2:K16000')->applyFromArray($style);

 
// Agregar Informacion
$objPHPExcel-> getActiveSheet()-> getColumnDimension('A')->setWidth(4.28);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('B')->setWidth(7.71);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('C')->setWidth(5.57);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('D')->setWidth(11.42);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('E')->setWidth(11.42);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('F')->setWidth(7.57);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('G')->setWidth(5.28);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('H')->setWidth(13.85);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('I')->setWidth(14.28);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('J')->setWidth(10.57);
$objPHPExcel-> getActiveSheet()-> getColumnDimension('K')->setWidth(12.57);
$objPHPExcel->getActiveSheet()->getRowDimension("1")->setRowHeight(15);


 

if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location:login.php");
		exit;
    }

include("config/db.php");
	include("config/conexion.php");
//include("menu.php");
	
//if($id_factura>0){
 //   $sql_factura=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");

//}
$total1=0;        
$fecha1=$_GET['fecha1']; 
$fecha2=$_GET['fecha2']; 
$id_producto=$_GET['id_producto']; 
$tienda1=1;        
$f1=14;

$texto="";
$texto1="";
if($id_producto*1>0){
     $texto="id_producto=$id_producto";
 }
 if($id_producto*1==0){
     $texto="IngresosEgresos.id_producto=products.id_producto";
     $texto1=",products";
 }



$sql="select * from IngresosEgresos $texto1 where IngresosEgresos.ven_com<>12 and $texto and IngresosEgresos.tipo_doc<>8 and IngresosEgresos.tienda>=$tienda1 and IngresosEgresos.tienda<=$tienda1 and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')>='$fecha1' and DATE_FORMAT(IngresosEgresos.fecha, '%Y-%m-%d')<='$fecha2' ORDER BY `IngresosEgresos`.`id_detalle` ASC  ";         
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
$precio_compra=$row['precio_venta'];
$tienda3=$row['tienda'];
$tipo=$row['ot'];
$tipo_doc=$row['tipo_doc'];
$inv_ini=$row['inv_ini'];
$id_producto1=$row['id_producto'];
$ven_com=$row['ven_com'];
$activo=$row['activo'];
$descripcion1="Ninguno";
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
    $salida=$cantidad1;
}
if($tipo==2){
    $salida=0;
    $entrada=$cantidad1;
}
//$saldo=$entrada-$salida; 
//if($d==0){
$saldo=$s1+$entrada-$salida; 
//}else{
//    $saldo=$inv_ini+$entrada-$salida; 
//}

$cliente1="";
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
//$fecha=strtotime($dd);
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
        
                       
       
               
                        
                       if($entrada==0){
                           $dat="FACTURA '$folio' No $numero_factura, $cliente1";
                       }else{
                           $dat="DESPACHO '$folio' No $numero_factura, $cliente1";
                       }
                       
                       $objPHPExcel->setActiveSheetIndex(0)
        
->setCellValue('A'.$f1, $dd5)
->setCellValue('B'.$f1, $dat)
->setCellValue('C'.$f1,$entrada1)
->setCellValue('D'.$f1, $salida1)
->setCellValue('E'.$f1, $saldo)                     
->setCellValue('F'.$f1, $precio_compra1) 
->setCellValue('G'.$f1, $pre1) 
->setCellValue('H'.$f1, $cp) 
->setCellValue('I'.$f1, $q);                        
$f1=$f1+1;
   $cp1=$cp1+$cp;                    
                       ?>
                       
                       
                       
                       
                                      
    <?php
    $s=$s+1;

}



//while ($rw_factura=mysqli_fetch_array($sql_factura))  {



                    


/////

$objPHPExcel->getActiveSheet()->setTitle('Inventario');
 
// Establecer la hoja activa, para que cuando se abra el documento se muestre primero.
$objPHPExcel->setActiveSheetIndex(0);
 
// Se modifican los encabezados del HTTP para indicar que se envia un archivo de Excel.
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="guias.xls"');
header('Cache-Control: max-age=0');
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;
?>



