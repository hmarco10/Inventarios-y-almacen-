<?php
ob_start();
session_start();
//http://contenido.app.sunat.gob.pe/insc/ComprobantesDePago/GuiasManualesJul_2012/Manual+de+autorizacion.pdf
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
    header("location: ../../login.php");
    exit;
}
include("../../config/db.php");
include("../../config/conexion.php");
include("funciones.php");
require "phpqrcode/qrlib.php";
$session_id= session_id();
$tienda2=$_SESSION['tienda'];
$doc1=$_GET['doc1'];
$fecha2=$_GET['fecha2'];
$tip_doc=intval($_GET['tip_doc']);
$folio=$_GET['mail'];

//print"$tip_doc";
//print"$doc1";
$tip=intval($_GET['tip']);
$des=$_GET['des'];
$obs=$_GET['obs'];
$nombre_cliente1=mysqli_real_escape_string($con,(strip_tags($_GET["nombre_cliente"],ENT_QUOTES)));
if (trim($nombre_cliente1)=="")
{
    echo "<script>alert('No hay cliente');event.preventDefault();</script>";
    echo "<script>event.preventDefault();</script>";
    exit;
}

$sql_count=mysqli_query($con,"select * from tmp_descarga_tarjeta where session_id='".$session_id."'");
$count=mysqli_num_rows($sql_count);
if ($count==0)
{
    echo "<script>alert('No hay productos agregados a la factura');event.preventDefault();</script>";
    echo "<script>event.preventDefault();</script>";
    exit;
}
$sql_count5=mysqli_query($con,"select * from tmp_descarga_tarjeta where session_id='".$session_id."' and (cantidad_tmp=0 or precio_tmp=0)");
$count5=mysqli_num_rows($sql_count5);
if ($count5>0)
{
    echo "<script>alert('Hay productos que tienen cantidad o precio 0');event.preventDefault();</script>";
    echo "<script>event.preventDefault();</script>";
    exit;
}

if($des==1){
$sql_count1=mysqli_query($con,"select * from tmp_descarga_tarjeta,products where tmp_descarga_tarjeta.session_id='".$session_id."' and products.id_producto=tmp.id_producto and tmp_descarga_tarjeta.cantidad_tmp>products.b$tienda2");
$count1=mysqli_num_rows($sql_count1);
if (0>0)
//if ($count1>0)
{
    echo "<script>alert('Se ha producido un error Hay $count1 producto(s) que han sobrepasado el stock no se guardo la venta');event.preventDefault();</script>";
    
    exit;
}
}
require_once(dirname(__FILE__).'/../html2pdf.class.php');

$direccion=$_GET['direccion'];        
if($tip_doc==1){
    $dni=$doc1;
    $doc=0;
    $documento=$dni;
}else{
    $dni=0;
    $doc=$doc1;
    $documento=$doc;
}
$tienda1=$_SESSION['tienda'];

$sql_empresa=mysqli_query($con,"select * from datosempresa where id_emp=1");
$rw_empresa=mysqli_fetch_array($sql_empresa);
$fac_ele=$rw_empresa['fac_ele'];
$clave=$rw_empresa['clave'];
$tel1=$_GET['tel1'];
$mail=$_GET['mail'];

//CREAR CLIENTE NUEVO O EDITAR CLIENTE SI EXISTE  

    $accion3=mysqli_query($con, "select * from clientes where (doc='$doc1' or dni='$doc1') ");
    $row3=mysqli_fetch_array($accion3);
    $id_cliente=$row3["id_cliente"];
    date_default_timezone_set('America/Lima');
    $date_added1=date("Y-m-d H:i:s");
    
    if($id_cliente>0){
        $cambio1=mysqli_query($con, "UPDATE clientes SET email_cliente='$mail',direccion_cliente='$direccion',telefono_cliente='$tel1',nombre_cliente='$nombre_cliente1' WHERE id_cliente=$id_cliente");
    }
    if($id_cliente==""){
        $sql="INSERT INTO clientes (nombre_cliente, telefono_cliente, email_cliente, direccion_cliente, status_cliente, date_added,doc,dni,vendedor,pais,departamento,provincia,distrito,cuenta,tipo1,tienda,users,deuda,debe,documento) VALUES ('$nombre_cliente1','$tel1','$mail','$direccion','1','$date_added1','$doc','$dni','','Guatemala','','','','','1','$tienda1','0','0','0','$documento')";
        $query_new_insert = mysqli_query($con,$sql);
	if ($query_new_insert){
            echo "Cliente ha sido ingresado satisfactoriamente.";
        }else{
            echo "Error.";
        }
        $accion2=mysqli_query($con, "select * from clientes where documento=$documento ORDER BY  `clientes`.`id_cliente` DESC LIMIT 0 , 1");
        $row1=mysqli_fetch_array($accion2);
        $id_cliente=$row1["id_cliente"];
    }
  
    
$id_vendedor=$_GET['id_vendedor'];
$fecha=$_GET['fecha'];
$dolar=$_GET['tcp'];

$online=$_GET['online'];
$motivo=$_GET['motivo'];
$Ordencyp=$_GET['motivo'];
$nro_doc=0;
$nro_doc=$_GET['nro_doc'];
$razon_comercial="Computadoras";
$hora=$_GET['hora'];
$moneda=intval($_GET['moneda']);
$moneda1=1;
$dias=intval($_GET['dias']);
$condiciones=mysqli_real_escape_string($con,(strip_tags($_REQUEST['condiciones'], ENT_QUOTES)));
$sql=mysqli_query($con, "select LAST_INSERT_ID(numero_factura) as last from facturas order by id_factura desc limit 0,1 ");
$rw=mysqli_fetch_array($sql);
$rr5=0;
$tipo=intval($_GET['tipo_doc1']);
$tipo5=$tipo;
if($tipo==5 and $doc1<=999999999){
  $tipo5=$tipo+4;  
}
if($tipo==6 and $doc1<=999999999){
   $tipo5=$tipo+4; 
}

$accion77=mysqli_query($con, "select * from documento where id_documento=$tipo5");
$row77=mysqli_fetch_array($accion77);
$numero_factura=$row77["tienda$tienda1"]+1;
//$folio=$row77["folio$tienda1"];
 


$sql_cliente=mysqli_query($con,"select * from clientes where id_cliente='$id_cliente'");
$rw_cliente=mysqli_fetch_array($sql_cliente);
$ruc=$rw_cliente["doc"];
$dni=$rw_cliente["dni"];
$nombre_cliente=$rw_cliente["nombre_cliente"];                     
$nums=1;
$sumador_total=0;
$servicio=0;
$suma=0;

$ddd=1;
if($tipo==8){
  $ddd=0;  
}

$producto1="";
$NuevoEstado="ASIGNADO";
$cantidad1=array();
$und_pro=array();
$tipo_cantidad=array();
$precio_unitario=array();
$valor_unitario=array();
$total_producto=array();
$total_igv=array();
$producto=array();
$codigo=array();
$sql=mysqli_query($con, "select * from  tmp_descarga_tarjeta where tmp_descarga_tarjeta.session_id='".$session_id."'");
//COPIAR LOS PRODUCTOS
while ($row=mysqli_fetch_array($sql))
	{
	$id_tmp=$row["id_tmp"];
	$id_producto=$row["id_producto"];
	$cantidad=$row['cantidad_tmp'];
        $codigo_producto="SER";
	$nombre_producto=$row['id_producto'];	
	$precio_venta=$row['precio_tmp'];
    $lote=$row['cod'];
    $estado=$row['Renglon_Presupuestario'];
        $servicio=1;
	$precio_venta_f=number_format($precio_venta,6);//Formateo variables
	$precio_venta_r=str_replace(",","",$precio_venta_f);//Reemplazo las comas
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=number_format($precio_total,2);//Precio total formateado
	$precio_total_r=str_replace(",","",$precio_total_f);//Reemplazo las comas
	$sumador_total+=$precio_total_r;//Sumador
        $suma=$suma+1;
        $fecha1=date("Y-m-d", strtotime($fecha) );
        $medida="NIU";//medida del producto en unidades
        $date_added=$fecha1." ".$hora;
        $tienda2=$_SESSION['tienda'];
        $c=$tienda2;
        $d=0;
        $und_pro1="ZZ";
        $costo=0;
        if($id_producto>0 and is_numeric($id_producto)){
            $sql3=mysqli_query($con, "select * from products,und where products.und_pro=und.id_und and products.id_producto='".$id_producto."'");
            $row3=mysqli_fetch_array($sql3);
            $b="b$tienda2";
            $d=$row3["b$tienda2"];
            $codigo_producto=$row3['codigo_producto'];
            $nombre_producto=$row3['nombre_producto'];
            $und_pro1=$row3['xml_und'];
            $costo=$row3["costo_producto"];
            $estadoProducto=$row3["descripcion"];
            $pro_ser=$row3["pro_ser"];
        } 
        $igv=0.18;
        $cantidad1[$nums]=$cantidad;
        $und_pro[$nums]=$und_pro1;
        $tipo_cantidad[$nums]=$medida;
        $precio_unitario[$nums]=$precio_venta;
        $a=1.18;
        $valor_unitario[$nums]=round($precio_venta/$a,2);
        $total_producto[$nums]=round($valor_unitario[$nums]*$cantidad,2);
        $total_igv[$nums]=round($igv*$total_producto[$nums],2);
        $producto[$nums]=$nombre_producto;
        $codigo[$nums]=$codigo_producto;
        
        //INSERTAR DETALLE FACTURA
        //COMENTADO $insert_detail=mysqli_query($con, "INSERT INTO tarjeta_responsabilidad VALUES (NULL,'$id_cliente','$id_vendedor','$numero_factura','$des','$id_producto','$cantidad','','$cantidad','$precio_venta_r','$c','$ddd','1','$fecha2','','$costo','$tipo','$d','$moneda1','$folio','','','$lote','$Ordencyp','')");
        //ACTUALIZAR STOCK PARA FACTURAS/BOLETA/NOTA DE CREDITO       
        //if($id_producto>0 and $tipo<>8){
            if($des==1){
                $productos1=mysqli_query($con, "UPDATE products SET descripcion='0' WHERE id_producto=$id_producto and pro_ser=1");
                $FechabajaBien=mysqli_query($con, "UPDATE tarjeta_responsabilidad SET fecha_baja='$fecha2' WHERE id_producto=$id_producto ");
            }
        //}
        $nums++;
	//fin
        }
$subtotal=number_format($sumador_total,2,'.','');
$total_iva=($subtotal * 18 )/100;
$total_iva=number_format($total_iva,2,'.','');
$total_factura=$subtotal-$total_iva;
if($_SESSION['doc_ventas']==1){
    $decimales = explode(".",number_format($subtotal,2));
    $entera=explode(".",$subtotal);
    $texto_moneda=convertir($entera[0]).' y '. $decimales[1].'/100 NUEVOS SOLES';
}
if($condiciones==4){
    $deuda=$sumador_total;
}else{
    $deuda=0;
}
$fecha1=date("Y-m-d", strtotime($fecha) );
$date=$fecha1." ".$hora;
$condiciones1="";

$t1=$_SESSION['tienda'];
$cuenta="";
$tienda="tienda".$c;
$documento=mysqli_query($con, "UPDATE documento2 SET $tienda=$tienda+1 WHERE id_documento=$tipo5");
$dolar1=mysqli_query($con, "UPDATE datosempresa2 SET dolar=$dolar WHERE id_emp=1");
$deuda1=mysqli_query($con, "UPDATE clientes2 SET deuda=deuda+$deuda WHERE id_cliente=$id_cliente");

$insert=mysqli_query($con,"INSERT INTO detalle_tarjeta VALUES (NULL,'$numero_factura','$date','0','$nro_doc','$id_cliente','0','$id_vendedor','$condiciones','$sumador_total','$deuda','$tipo','$c','1','$ddd','1','$moneda1','$des','$obs','0','$fecha2','$dias','$folio','$des','','0','$motivo','$tip')");
//INSERT INTO facturas VALUES (NULL,'95','2019-01-11 12:17:40','0','undefined','192','0','1','1','20','0','2','1','1','1','1','1','1','','0','2018-11-11','0','B002','1','','0','undefined','0')
//$valor34="INSERT INTO facturas VALUES (NULL,'$numero_factura','$date','0','$nro_doc','$id_cliente','0','$id_vendedor','$condiciones','$sumador_total','$deuda','$tipo','$c','1','$ddd','1','$moneda1','$des','','0','2018-11-11','$dias','$folio','$des','','0','$motivo','$tip')";
//$delete=mysqli_query($con,"DELETE FROM tmp WHERE session_id='".$session_id."'");
$accion1=mysqli_query($con, "select * from detalle_tarjeta where numero_factura='".$numero_factura."' and folio='".$folio."' and estado_factura='".$tipo."' and tienda=$t1");
$row1=mysqli_fetch_array($accion1);
$id_factura=$row1["id_factura"];
if($online<>""){
   $online1=mysqli_query($con, "UPDATE factura_carrito2 SET activo=$id_factura WHERE codigo='$online'"); 
}

if($tipo<=2 or $tipo==5 or $tipo==6){
    if($tipo==1){
        $tipo_documento="01";//FACTURA
    }
    if($tipo==2){
        $tipo_documento="03";//BOLETA
    }
    if($tipo==5){
        $tipo_documento="08";//NOTA DE DEBITO
    }
    if($tipo==6){
        $tipo_documento="07";//NOTA DE CREDITO
    }
    $sql2=mysqli_query($con,"select * from sucursal where tienda='$tienda2'");
    $row2=mysqli_fetch_array($sql2);
    $nombre=$row2["nombre"];
    $departamento=$row2['dep_suc'];
    $provincia=$row2['pro_suc'];
    $distrito=$row2['dis_suc'];
    
    $ruc1=$row2['ruc'];
    $direccion=$row2['direccion'];
    if($ruc<>""){
        $documento_usuario=$ruc;
        $tipo_documento_usuario="6";
        $tipo5="01";
    }
    if($ruc=="0" and $dni<>""){
        $documento_usuario=$dni;
        $tipo_documento_usuario="1";
        $tipo5="03";

    }
    $razon_social_usuario=$nombre_cliente;

header('Content-Type: text/html; charset=UTF-8');
$cabecera = array();
//DATOS PARA LOS XML FACTURA/BOLETA/NOTA DE CREDITO/ NOTA DE DEBITO
//EMISOR
$cabecera["NRO_DOCUMENTO_EMPRESA"]=trim($ruc1);

$numero_factura1=str_pad($numero_factura, 8, "0", STR_PAD_LEFT);

$cabecera["NRO_COMPROBANTE"]=$folio."-".$numero_factura1;
$tipo_doc=$tipo_documento;
$cabecera["FECHA_DOCUMENTO"]=$fecha;
$cabecera["FECHA_VTO"]=$fecha;
$cabecera["COD_TIPO_DOCUMENTO"]=$tipo_documento;
$cabecera["TOTAL_LETRAS"]="";
$cabecera["NRO_OTR_COMPROBANTE"]="";
$cabecera["NRO_GUIA_REMISION"]="";
$cabecera["TIPO_DOCUMENTO_EMPRESA"]=6;
$moneda="PEN";
$cabecera["RAZON_SOCIAL_EMPRESA"]=trim($nombre);
$cabecera["NOMBRE_COMERCIAL_EMPRESA"]=trim($nombre);
$cabecera["DEPARTAMENTO_EMPRESA"]=trim($departamento);
$cabecera["PROVINCIA_EMPRESA"]=trim($provincia);
$cabecera["DISTRITO_EMPRESA"]=trim($distrito);
$cabecera["DIRECCION_EMPRESA"]=trim($direccion);
$cabecera["CONTACTO_EMPRESA"]="";
$cabecera["COD_PAIS_CLIENTE"]="PE";
$doc_emisor=6;
//Solo para NOTA DE CREDITO Y NOTA DE DEBITO
$cabecera["NRO_DOCUMENTO_MODIFICA"]=$nro_doc;
$cabecera["COD_TIPO_MOTIVO"]=$motivo;
//$cabecera["TIPO_COMPROBANTE_MODIFICA"]=tipo_comp($nro_doc);
$cabecera["TIPO_COMPROBANTE_MODIFICA"]=$tipo5;

$r="";
if($tipo==6){
    if($motivo=="01") {
       $r="ANULACION DE LA OPERACION";
    }
    if($motivo=="02") {
       $r="ANULACION POR ERROR EN EL RUC";
    }
    if($motivo=="03") {
       $r="CORRECION POR ERROR EN LA DESCRIPCION";
    }
    if($motivo=="04") {
       $r="DESCUENTO GLOBAL";
    }
    if($motivo=="05") {
       $r="DESCUENTO POR ITEM";
    } 
    if($motivo=="06") {
       $r="DEVOLUCION TOTAL";
    }
    if($motivo=="07") {
       $r="DEVOLUCION POR ITEM";
   }        
   if($motivo=="08") {
       $r="BONIFICACION";
   }
   if($motivo=="09") {
       $r="DISMINUCION EN EL VALOR";
   }
}
if($tipo==5){
    if($motivo=="01") {
        $r="INTERES POR MORA";
    }    
    if($motivo=="02") {
        $r="AUMENTO EN EL VALOR";
    }       
    if($motivo=="03") {
        $r="PENALIDADES";
    }          
}
$cabecera["DESCRIPCION_MOTIVO"]=$r;

//DATOS DEL CLIENTE
$cabecera["NRO_DOCUMENTO_CLIENTE"]=trim($documento_usuario);
$cabecera["RAZON_SOCIAL_CLIENTE"]=trim($razon_social_usuario);
$cabecera["COD_UBIGEO_CLIENTE"]="";
$igv=0.18;
$cabecera["TIPO_DOCUMENTO_CLIENTE"]=$tipo_documento_usuario;
$cabecera["DEPARTAMENTO_CLIENTE"]="";
$cabecera["PROVINCIA_CLIENTE"]="";
$cabecera["DISTRITO_CLIENTE"]="";
$cabecera["DIRECCION_CLIENTE"]="";
$cabecera["COD_PAIS_CLIENTE"] ="PE";
$cabecera["CODIGO_PAIS_EMPRESA"]="PE";
$cabecera["COD_MONEDA"]="PEN";
$cabecera["TOTAL_ISC"]=0;
$cabecera["TOTAL_EXPORTACION"]=0;
$cabecera["TOTAL_GRATUITAS"]=0;

if($tip==0){
    $cabecera["TOTAL_EXONERADAS"]=0;
    $cabecera["TOTAL_INAFECTA"]=0;
    $cabecera["TOTAL_OTR_IMP"]=0;
    $total=round($sumador_total,2);
    $cabecera["TOTAL_GRAVADAS"]=round($sumador_total/1.18,2);
    $cabecera["TOTAL_IGV"]=round(($sumador_total/1.18)*$igv,2);
    $cabecera["SUB_TOTAL"]=round($sumador_total/1.18,2);
    $cabecera["TOTAL"]=round($sumador_total,2);
    $cabecera["TOTAL_DESCUENTO"]=0;
    $mto_igv=round(($sumador_total/1.18)*$igv,2);
}
if($tip==1){
    $cabecera["TOTAL_EXONERADAS"]=0;
    $cabecera["TOTAL_INAFECTA"]=0;
    $cabecera["TOTAL_OTR_IMP"]=0;
    $total=round($sumador_total,2);
    $cabecera["TOTAL_GRAVADAS"]=round($sumador_total/1.18,2);
    $cabecera["TOTAL_IGV"]="0.00";
    $cabecera["SUB_TOTAL"]=round($sumador_total,2);
    $cabecera["TOTAL"]=round($sumador_total,2);
    $cabecera["TOTAL_DESCUENTO"]=0;
    $cabecera["TOTAL_EXONERADAS"]=round($sumador_total,2);
    $mto_igv=0;
}

if($tip==2){
    $cabecera["TOTAL_EXONERADAS"]=0;
    $cabecera["TOTAL_INAFECTA"]=round($sumador_total,2);;
    $cabecera["TOTAL_OTR_IMP"]=0;
    $total=round($sumador_total,2);
    $cabecera["TOTAL_GRAVADAS"]=round($sumador_total/1.18,2);
    $cabecera["TOTAL_IGV"]="0.00";
    $cabecera["SUB_TOTAL"]=round($sumador_total,2);
    $cabecera["TOTAL"]=round($sumador_total,2);
    $cabecera["TOTAL_DESCUENTO"]=0;
    //$cabecera["TOTAL_EXONERADAS"]=round($sumador_total,2);
    $mto_igv=0;
}

//CODIGO QR

/***** FACTURA: DATOS OBLIGATORIOS PARA EL CÓDIGO QR *****/
		/*RUC | TIPO DE DOCUMENTO | SERIE | NUMERO | MTO TOTAL IGV | MTO TOTAL DEL COMPROBANTE | FECHA DE EMISION |TIPO DE DOCUMENTO ADQUIRENTE | NUMERO DE DOCUMENTO ADQUIRENTE |*/
$text_qr = "$ruc1|$tipo_documento|$folio|$numero_factura1|$mto_igv|$total|$fecha|$tipo_documento_usuario|$documento_usuario|";
$ruta_qr = "qr/".$id_factura.".png";
QRcode::png($text_qr, $ruta_qr, 'Q',15, 0);
//CREACION DE XML DE DOCUMENTO FACTURA, BOLETA
$doc = new DOMDocument();
$doc->formatOutput = FALSE;
$doc->preserveWhiteSpace = TRUE;
$doc->encoding = 'utf-8';
$nums1=$nums-1;

    
    
    
    
}
//FIN DE CREACION DE DOCUMENTO XML FACTURAS Y BOLETAS
//DIRECCION DE PDF
//print"$valor34";
header("location:ver_detalle_tarjeta.php?id_factura=$id_factura");
ob_end_flush();
?>