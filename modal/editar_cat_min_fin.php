	<?php
		if (isset($con))
		{
	?>
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" style="background: white;">
		  <div class="modal-header" style="background: white;color:black;">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" style="color:black"><i class='glyphicon glyphicon-edit'></i><b>Editar Catálogo Presentación Ministerio de Finanzas Públicas</b></h4>
		  </div>
		  <div class="modal-body" style="height:500px;overflow-y: scroll;">
			<form style="color:black;" class="form-horizontal" method="post" id="editar_proveedores" name="editar_proveedores">
			<div id="resultados_ajax2"></div>
			 <div class="form-group">
				<label for="mod_nombre" class="col-sm-3 control-label">Código Presentación</label>
				<div class="col-sm-9">
				  <input readonly type="text" class="form-control" id="mod_nombre" name="mod_nombre"  required>
					<input type="hidden" name="mod_id" id="mod_id">
				</div>
			  </div>
                        <div class="form-group">
				<label for="mod_doc" class="col-sm-3 control-label">Código De Insumo</label>
				<div class="col-sm-9">
                                    <input  readonly type="text" class="form-control"  id="mod_doc" name="mod_doc" placeholder="Nro de Documento">
				</div>
			</div><br>
                        <div class="form-group">
				<label for="mod_doc" class="col-sm-3 control-label">Renglón</label>
				<div class="col-sm-9">
                                    <input type="text" class="form-control"  id="mod_tipo" name="mod_tipo" >
				</div>
			</div>
			<div class="form-group">
				<label for="mod_telefono" class="col-sm-3 control-label">Nombre</label>
				<div class="col-sm-9">
				  <input type="text" class="form-control" id="mod_telefono" name="mod_telefono" placeholder="Teléfono">
				</div>
			</div>
			<div class="form-group">
				<label for="mod_email" class="col-sm-3 control-label">Presentación</label>
				<div class="col-sm-9">
				 <input type="text" class="form-control" id="mod_email" name="mod_email" placeholder="Email">
				</div>
			 </div>
			<div class="form-group">
				<label for="mod_departamento" class="col-sm-3 control-label">Caracteristicas</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="mod_departamento" name="mod_departamento" placeholder="Departamento">
				  
				</div>
			</div>
                        <div class="form-group">
				<label for="mod_provincia" class="col-sm-3 control-label">Unidad De Medida</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="mod_provincia" name="mod_provincia" placeholder="Provincia">
				  
				</div>
			</div>
			<div class="form-group">
				<label for="mod_estado" class="col-sm-3 control-label">Estado</label>
				<div class="col-sm-9">
				 <select class="form-control" id="mod_estado" name="mod_estado" required>
					<option value="">-- Selecciona estado --</option>
					<option value="1" selected>Activo</option>
					<option value="0">Inactivo</option>
				  </select>
				</div>
			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info btn-flat pull-left" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-primary btn-flat" id="actualizar_datos">Actualizar datos</button>
		  		</div>
			</div> 
			</div> 
                      
			</div>
			
		  </div>
		  </form>
		</div>
	  </div>
	</div>
	<?php
		}
	?>