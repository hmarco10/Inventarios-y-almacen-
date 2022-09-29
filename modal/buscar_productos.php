	<?php
		if (isset($con))
		{
	?>	
			<!-- Modal -->
			<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Buscar productos</h4>
				  </div>
				  <div class="modal-body">
					<form class="form-horizontal">
					  <div class="form-group">
						<div class="col-sm-6">
                                                    <input type="text" class="form-control" autocomplete="off" id="q" placeholder="Buscar productos" onkeyup="load(1)">
						</div>
                                                <div class="col-sm-2">
						<button type="button" class="btn btn-default" onclick="load(1)"><span class='glyphicon glyphicon-search'></span> Buscar</button>
                                                </div>
                                                <div class="col-sm-4">
                                                    <select name="servicio" class="form-control" onchange="agregar4(this.value)">
                                                        <option value="">Elegir Servicio</option>
                                                        <?php
                        
                                                            $sql2="select * from servicios where tipo=1";
                        
                                                            $rs1=mysqli_query($con,$sql2);
                                                            while($row3=mysqli_fetch_array($rs1)){
                                                                $nom_servicio=$row3["nom_servicio"];
                                                                $id_servicio=$row3["id_servicio"];
                                                            ?>
                                                            <option value="<?php  echo $id_servicio;?>" ><?php  echo $nom_servicio;?></option>
                                                            <?php
                           
                                                            }
                        
                                                        ?>
                                                        
                                                       
                                                        
                                                    </select>
						</div>
                                          </div>
					</form>
					<div id="loader" style="position: absolute;	text-align: center;	top: 55px;	width: 100%;display:none;"></div><!-- Carga gif animado -->
					<div class="outer_div" ></div><!-- Datos ajax Final -->
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					
				  </div>
				</div>
			  </div>
			</div>
	<?php
		}
	?>