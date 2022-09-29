	<!DOCTYPE html>
<head>
 
    <style>
        .video-responsive {
    height: 0;
    overflow: hidden;
    padding-bottom: 56.25%;
    padding-top: 30px;
    position: relative;
    }
.video-responsive iframe, .video-responsive object, .video-responsive embed {
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    }
        
    </style>
</head>

    <body>  
        <div class="modal fade" id="nuevoVideo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" >
                <div class="modal-content" style="background: #F5ECCE;">
		  <div class="modal-header" style="background: #58FAAC;">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> <font color="black">Tutorial</font></h4>
		  </div>
                    <div id="resultados_ajax_productos"></div>
		  <div class="video-responsive">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/<?php echo $v;?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			 
                       
		  </div>
		  <div class="modal-footer">
                      
			<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
			
		  
                  </div>
		 
		</div>
	  </div>
	</div>
	<?php
	//	}
	?>
</body>
            
</html>