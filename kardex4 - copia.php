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
	$tienda1=$_SESSION['tienda'];
        $item=$_SESSION['item'];
        $anio=$_SESSION['anio'];
        $entrega=$_SESSION['entrega'];
        
        
   $sql_factura2=mysqli_query($con,"select * from sucursal where tienda='".$tienda1."'");
        $rw_factura2=mysqli_fetch_array($sql_factura2);
        $logo=$rw_factura2['foto'];
        $dir=$rw_factura2['direccion'];
        $ruc=$rw_factura2['ruc'];
        

if($item>0 and $anio>0 and $entrega>0){
    $sql_factura=mysqli_query($con,"select * from facturas where  item='".$item."' and entrega='".$entrega."' and tienda=$tienda1 and YEAR(fecha_guia)=$anio ORDER BY  `facturas`.`numero_guia` ASC ");

}
//if($id_factura>0){
 //   $sql_factura=mysqli_query($con,"select * from facturas where id_factura='".$id_factura."'");

//}
$f1=2;
$f2=3;
$f3=4;
$f4=6;
$f5=7;
$f6=9;
$f7=11;
$f9=66;

while ($rw_factura=mysqli_fetch_array($sql_factura))  {

$id_factura=$rw_factura['id_factura'];
$numero_factura=$rw_factura['numero_guia'];
$id_cliente=$rw_factura['id_cliente'];
$id_vendedor=$rw_factura['id_vendedor'];
$fecha_factura=$rw_factura['fecha_guia'];
$id_buses=$rw_factura['id_veh'];
$fecha=date("d/m/Y", strtotime($rw_factura['fecha_guia']));
$tienda2=$rw_factura['tienda'];
$item=$rw_factura['item'];
$anio=date("Y", strtotime($rw_factura['fecha_guia']));        
        
$sql_factura3=mysqli_query($con,"select * from buses where id_buses='".$id_buses."'");
$rw_factura3=mysqli_fetch_array($sql_factura3);
$marca=$rw_factura3['max'];
$placa=$rw_factura3['placa'];
$hab_veh=$rw_factura3['hab_veh'];
$ruc_tra=$rw_factura3['ruc_tra'];
$raz_soc=$rw_factura3['raz_soc'];
        
        
$sql_factura4=mysqli_query($con,"select * from origen where id_origen='".$id_cliente."'");
$rw_factura4=mysqli_fetch_array($sql_factura4);
$direccion=$rw_factura4['dir_col']."-".$rw_factura4['cen_origen']."-".$rw_factura4['dis_origen']."-".$rw_factura4['pro_origen'];
$cod_mod=$rw_factura4['cod_mod'];

$consulta4 = "SELECT * FROM item,clientes WHERE item.nro_com=clientes.id_cliente and item.nro_item=$item and item.anio_item=$anio";
$result4 = mysqli_query($con, $consulta4);
$valor4 = mysqli_fetch_array($result4);  
$cliente=$valor4['nombre_cliente'];
$ruc=$valor4['doc'];

				$sql_cliente=mysqli_query($con,"select * from origen where id_origen='$id_cliente'");
				$rw_cliente=mysqli_fetch_array($sql_cliente);
                                
                                $sql_cliente1=mysqli_query($con,"select * from facturas where id_factura='$id_factura'");
				$rw_cliente1=mysqli_fetch_array($sql_cliente1);

$objPHPExcel->setActiveSheetIndex(0)->mergeCells('C'.$f2.':D'.$f2);                                
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('H'.$f3.':K'.$f3);
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('J'.$f4.':K'.$f4);
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('J'.$f5.':K'.$f5);

$objPHPExcel->setActiveSheetIndex(0)->mergeCells('J'.$f6.':K'.$f6);

$objPHPExcel->getActiveSheet()->getRowDimension("$f1")->setRowHeight(15);
$objPHPExcel->getActiveSheet()->getRowDimension("$f2")->setRowHeight(18.75);
$objPHPExcel->getActiveSheet()->getRowDimension("$f3")->setRowHeight(28.5);
$f31=$f3+1;
$objPHPExcel->getActiveSheet()->getRowDimension("$f31")->setRowHeight(9);
$objPHPExcel->getActiveSheet()->getRowDimension("$f4")->setRowHeight(15);
$objPHPExcel->getActiveSheet()->getRowDimension("$f5")->setRowHeight(25.5);
$f51=$f5+1;
$objPHPExcel->getActiveSheet()->getRowDimension("$f51")->setRowHeight(20.25);
$objPHPExcel->getActiveSheet()->getRowDimension("$f6")->setRowHeight(15.75);
$f61=$f6+1;
$objPHPExcel->getActiveSheet()->getRowDimension("$f61")->setRowHeight(25);
$objPHPExcel->getActiveSheet()->getRowDimension($f9)->setRowHeight(41.25);
$cod_mod1=str_pad($cod_mod, 7, "0", STR_PAD_LEFT);
$objPHPExcel->setActiveSheetIndex(0)
        
->setCellValue('G'.$f1, 'Cor:'.$rw_cliente1['numero_guia'])
->setCellValue('I'.$f1, 'C. MOD.')
->setCellValue('J'.$f1," ".$cod_mod1)
->setCellValue('C'.$f2, $fecha)
->setCellValue('I'.$f2, $fecha)                     
->setCellValue('A'.$f3, $dir) 
->setCellValue('H'.$f3, $direccion) 
->setCellValue('D'.$f4, $cliente) 
->setCellValue('J'.$f4, "                      ".$ruc) 
->setCellValue('D'.$f5, $raz_soc) 
->setCellValue('J'.$f5, "                      ".$ruc_tra)                      
->setCellValue('B'.$f6, $marca) 
->setCellValue('F'.$f6, $placa)                     
->setCellValue('I'.$f6, $hab_veh) 
->setCellValue('J'.$f6, "                      ".$hab_veh);                     
       

$sumador_total=0;
$sql1=mysqli_query($con, "select * from facturas where id_factura='".$id_factura."'");
$row1=mysqli_fetch_array($sql1);

$id_cliente=$row1["id_cliente"];

$numero_factura1=$row1["numero_guia"];

$sql=mysqli_query($con, "select * from products, IngresosEgresos, facturas where products.id_producto=IngresosEgresos.id_producto and IngresosEgresos.numero_guia=facturas.numero_guia  and IngresosEgresos.tienda=$tienda1 and facturas.ven_com=IngresosEgresos.ven_com and facturas.ven_com=1 and facturas.id_factura='".$id_factura."' and IngresosEgresos.id_cliente='".$id_cliente."' ORDER BY  `IngresosEgresos`.`id_detalle` ASC " );

$suma=0;
$suma1=0;
$codigo_producto="";

$f8=$f7;

while ($row=mysqli_fetch_array($sql))
	{
	$id_producto=$row["id_producto"];
	
        $codigo_producto=$row['codigo_producto'];
	$cantidad=$row['cantidad'];
        $unidades=$row['unidades'];
        
        $total=$row['cantidad']*$row['contenido']+$unidades;
        
	$nombre_producto=$row['nombre_producto']."-Lt.".$row['lote'];
        $presentacion=$row['presentacion'];
        $contenido=$row['contenido'];
        $peso=$row['peso'];
        $lote=$row['lote'];
	
	
        
	 
        if($suma1<=55){
        if($total>0){
          
            $total1=$peso*($cantidad*$contenido+$unidades);
            
            $objPHPExcel->setActiveSheetIndex(0)
->setCellValue('B'.$f8, $nombre_producto)
->setCellValue('I'.$f8, "                  UND")
->setCellValue('J'.$f8, $total)
->setCellValue('K'.$f8, round($total1,2));
 $objPHPExcel->getActiveSheet()->getRowDimension("$f8")->setRowHeight(8.5);           
        $f8=$f8+1;
        $suma=$suma+$peso*($cantidad*$contenido+$unidades);
        $suma1=$suma1+1;
        }
      }
 	}
        for($rr=$suma1;$rr<55;$rr++){
            //$objPHPExcel->setActiveSheetIndex(0)
            $objPHPExcel->getActiveSheet()->getRowDimension($f8)->setRowHeight(8.5);
            $f8=$f8+1;
        }
        
      $objPHPExcel->setActiveSheetIndex(0)
              
->setCellValue('J'.$f9,'TOTAL Kg:')
->setCellValue('K'.$f9,round($suma,2));  
      
$f1=$f1+65;
$f2=$f2+65;
$f3=$f3+65;
$f4=$f4+65;
$f5=$f5+65;
$f6=$f6+65;
$f7=$f7+65;
$f9=$f9+65;

}

$objPHPExcel->getActiveSheet()->setTitle('Inventario');
 
// Establecer la hoja activa, para que cuando se abra el documento se muestre primero.
$objPHPExcel->setActiveSheetIndex(0);
 
// Se modifican los encabezados del HTTP para indicar que se envia un archivo de Excel.
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="guias.xlsx"');
header('Cache-Control: max-age=0');
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;
?>



