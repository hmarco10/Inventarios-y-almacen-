
<?php
//
		if (isset($con))
		{
	?>
	<!-- Modal -->
	<div class="modal fade" id="nuevoCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document" >
		<div class="modal-content" style="background: #F5ECCE;">
		  <div class="modal-header" style="background: #58FAAC;color:black;">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i><font color="black"> Agregar nuevo video</font></h4>
		  </div>
                     <font color="black">LLenar los campos obligatorios</font> <font style="background-color:#A9F5BC;color:white; "> &nbsp;&nbsp;&nbsp;&nbsp;</font>
                    
                  <div id="resultados_ajax"></div> 
		  
			<form style="color:black;" class="form-horizontal" method="post" id="guardar_video" name="guardar_video">
                        <div class="form-group">
				<label for="mod_estado" class="col-sm-3 control-label">Menu</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				 <select class="form-control" id="menu" name="menu" required>
					<option value="">-- Selecciona estado --</option>
					<option value="Empresa">Empresa</option>
					<option value="Usuarios">Usuarios</option>
                                        <option value="Productos y Servicios">Productos y Servicios</option>
                                        <option value="Proveedores">Proveedores</option>
                                        <option value="Clientes">Clientes</option>
                                        <option value="Ventas de productos">Ventas de productos</option>
                                        <option value="Facturación Electrónica">Facturación Electrónica</option>
                                        <option value="Compras">Compras</option>
                                        <option value="Ent/Sal Mercaderia">Ent/Sal Mercaderia</option>
                                        <option value="Pagos/Cobros-Reportes">Pagos/Cobros-Reportes</option>
                                        <option value="Reporte de Ventas">Reporte de Ventas</option>
                                        <option value="Reporte de Compras">Reporte de Compras</option>
                                        <option value="Contabilidad">Contabilidad</option>
				  </select>
				</div>
			</div>
                        <div class="form-group">
				<label  class="col-sm-3 control-label">SubMenu</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" class="form-control" id="submenu" name="submenu" placeholder="Sub Menu" required>
                                    
                                </div>
			</div>
                        <div class="form-group">
				<label  class="col-sm-3 control-label">Descripcion</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <textarea class="form-control"  id="descripcion" name="descripcion" placeholder="Descripcion"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-3 control-label">Video</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" class="form-control"  id="video" name="video" placeholder="Video">
				</div>
			</div>   
                          
		  
		  <div class="modal-footer">
			<button type="button" class="btn btn-warning" onclick="limpiarFormulario()">Limpiar</button>
                      <button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
			<button type="submit" class="btn btn-primary" onclick="nif()" id="guardar_datos">Guardar datos</button>
		  </div>
		  </form>
		</div>
	  </div>
	</div>
        
      
	<?php
		}
	?>



