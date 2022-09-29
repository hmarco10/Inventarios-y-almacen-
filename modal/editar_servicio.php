<?php  
if (isset($con))
{
      
?>
<head>
 

</head>
    <body>  
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content" style="background: #F5ECCE;">
		  <div class="modal-header" style="background: #58FAAC;color:black;">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 style="color:black;" class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i><font color="black"> Editar Servicio</font></h4>
		  </div>
                  <div id="resultados_ajax2"></div>
		  <div class="modal-body" >
			<form style="color:black;" class="form-horizontal" method="post" id="editar_servicio" name="editar_servicio">
			
			  <div class="form-group">
				<label for="mod_codigo" class="col-sm-3 control-label">Código</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <input type="text" class="form-control" id="mod_cod_servicio" name="mod_cod_servicio" placeholder="Código del servicio" required>  
                                  <input type="hidden" name="mod_id" id="mod_id">
				</div>
			  </div>
			   <div class="form-group">
				<label for="mod_nombre" class="col-sm-3 control-label">Nombre</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
				  <textarea class="form-control" id="mod_nom_servicio" name="mod_nom_servicio" placeholder="Nombre del servicio" required></textarea>
				</div>
			  </div>
			
			
                        <div class="form-group">
				<label for="mod_precio" class="col-sm-3 control-label">Precio</label>
				<div class="col-md-8 col-sm-8 col-xs-12">
                                    <input type="text" class="form-control" id="mod_pre_servicio" name="mod_pre_servicio" placeholder="Precio del servicio" required pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales" maxlength="8" >
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