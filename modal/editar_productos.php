<?php  
if (isset($con))
{
$sql3="select * from datosempresa ";
$rs2=mysqli_query($con,$sql3);
while($row4=mysqli_fetch_array($rs2)){
    $dolar=$row4["dolar"];
}        
?>
<head>
<script type="text/javascript">
$(document).ready(function() {
    $("form").keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });
});

var mostrarValor = function(x){
    if (x>0){
        x1=1;                 
                        }
    else{
        x1=<?php echo $dolar;?>;                  
    }
     
    
   
};                         
</script>
</head>
    <body>  
	<!-- EDITAR Modal Editar Productos -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content" style="background: white;">
		  <div class="modal-header" style="background: orange;color:black;">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i><font color="black"> Editar producto</font></h4>
		  </div>
                  <div id="resultados_ajax2"></div>
		  <div class="modal-body" style="height:500px;overflow-y: scroll;">
			<form style="color:black;" class="form-horizontal" method="post" id="editar_producto" name="editar_producto">
			
			  <div class="form-group">
				<label for="mod_codigo" class="col-sm-3 control-label">Código De Insumo</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" class="form-control" readonly="" id="mod_codigo" name="mod_codigo" placeholder="Código del producto" required>  
                                  <input type="hidden" name="mod_id" id="mod_id">
				</div>
			  </div>
			<div class="form-group">
				<label for="mod_nombre" class="col-sm-3 control-label">Nombre</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <textarea class="form-control" id="mod_nombre"  name="mod_nombre" placeholder="Nombre del producto" required></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="mod_cat" class="col-sm-3 control-label">Categoria</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				 <select class="form-control" id="mod_cat" name="mod_cat" required>
					<option value="">-- Selecciona categoria de producto --</option>
					
                                         <?php
                                        $nom = array();
                                        $sql2="select * from categorias ";
                                        $rs1=mysqli_query($con,$sql2);
                                        while($row3=mysqli_fetch_array($rs1)){
                                            $nom_cat=$row3["nom_cat"];
                                            $id_categoria=$row3["id_categoria"];
                                        ?>

                                        <option value="<?php echo $id_categoria;?>"><?php  echo $nom_cat;?></option>

                                        <?php
                                        }         
                                        ?>              
				  </select>
				</div>
			  </div>
            <!--div class="form-group">
				<label for="mod_cat" class="col-sm-3 control-label">Und/Medida</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				 <select class="form-control" id="mod_und_pro" name="mod_und_pro" required>
					<option value="">-- Selecciona und/medida de producto --</option>
					
                                         <?php
                                        
                                        $sql3="select * from und ";
                                        $rs3=mysqli_query($con,$sql3);
                                        while($row4=mysqli_fetch_array($rs3)){
                                            $nom_und=$row4["nom_und"];
                                            $id_und=$row4["id_und"];
                                        ?>

                                        <option value="<?php echo $id_und;?>"><?php  echo $nom_und;?></option>

                                        <?php
                                        }         
                                        ?>              
				  </select>
				</div>
			</div--> 
			<div class="form-group">
				<label for="mod_nombre" class="col-sm-3 control-label">Codigo Presentacíon</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <textarea class="form-control" id="mod_und_pro"  name="mod_und_pro" placeholder="Nombre del producto" required></textarea>
				</div>
			</div> 
                            
                        <div class="form-group">
				<label for="mod_status" class="col-sm-3 control-label">Tipo de producto</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				 <select class="form-control" id="mod_status" name="mod_status" required>
					<option value="1" selected>Activo</option>
					<option value="0">Inactivo</option>
				  </select>
				</div>
			</div> 
                        <div class="form-group">
				<!-- COMENTADO label for="mod_costo" class="col-sm-3 control-label">Costo</label-->
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="hidden" class="form-control" onChange="multiplicar();" id="mod_costo" name="mod_costo" placeholder="Precio de costo del producto" required pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
			</div>
                       
			
                        <div class="form-group">
				<!-- COMENTADO label for="mod_precio" class="col-sm-3 control-label">Precio</label-->
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="hidden" class="form-control" id="mod_precio" name="mod_precio" placeholder="Precio 1" required pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8" >
				</div>
			</div>
                            
			<div class="form-group">
						<label for="precio" class="col-sm-3 control-label">Precio/Prom. Ingreso Mensual</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="mod_precio_producto" name="mod_precio_producto" placeholder="Precio Promedio mensual de despacho" required pattern="^[0-9]{1.5}(\.[0-9]{0,6})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
				<br>
				<br>         
            </div>

			<div class="form-group">
						<label for="precio" class="col-sm-3 control-label">Precio/Prom. despacho Mensual</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="mod_precio2" name="mod_precio2" placeholder="Precio Promedio mensual de despacho" required pattern="^[0-9]{1.5}(\.[0-9]{0,6})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
				<br>
				<br>         
            </div>

                <div class="form-group">
						<label for="precio" class="col-sm-3 control-label">Stock minimo</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="mod_min" name="mod_min" placeholder="Stock minimo del producto" required pattern="^[0-9]{1.5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
				<br>
				<br>

				<label for="mod_marca" class="col-sm-3 control-label">Stock Máximo</label> <!--<?php echo des3;?>-->
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="text" class="form-control" id="mod_marca" name="mod_marca" placeholder='max'>
				</div>
			</div>
                        <div class="form-group">
				<label for="mod_desc_corta" class="col-sm-3 control-label">Descripción Corta</label> <!-- <?php echo des1;?> -->
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="text" class="form-control" id="mod_desc_corta" name="mod_desc_corta" placeholder="desc_corta">
				</div>
			  </div>
                          <div class="form-group">
				<label for="mod_color" class="col-sm-3 control-label">Descripción Larga</label> <!-- <?php echo des2;?> -->
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="text" class="form-control" id="mod_color" name="mod_color" placeholder="Color">
				</div>
			  </div>
              <!-- COMENTADO div class="form-group">
			  <label for="mod_color" class="col-sm-3 control-label">Serie/Lote</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<input type="text" class="form-control" id="mod_barras" name="mod_barras" placeholder="Barras">
				</div>
			  </div-->   
                        <?php 
                        $aa="";
                        $sql1="select * from users where user_id=$_SESSION[user_id]";
                        $rw1=mysqli_query($con,$sql1);//recuperando el registro
                        $rs1=mysqli_fetch_array($rw1);
                        $modulo=$rs1["accesos"];
                        $a = explode(".", $modulo); 
                        //if($a[3]==0){
                            $aa="readonly";
                        //}
                        ?>
                         <div class="form-group">
				
			  </div>
                         <div class="form-group">
				<label for="mod_inv" class="col-sm-3 control-label">Inventario</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="text" <?php echo "$aa";?> class="form-control" id="mod_inv" name="mod_inv" placeholder="Precio de costo del producto" required pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8">
				</div>
			 </div>
                         
                    </div>
		<div class="modal-footer">
			<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
			<button type="submit" class="btn btn-primary" id="actualizar_datos">Actualizar datos</button>
		</div>
		</form>
            </div>
	  </div>
</div>
<?php
}
?>
</body>