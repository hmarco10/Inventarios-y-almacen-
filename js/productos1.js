		$(document).ready(function(){
			load(1);
		});

		function load(page){
			var q= $("#q").val();
                        var q1= $("#q1").val();
                        var q2= $("#q2").val();
			$("#loader").fadeIn('slow');
			$.ajax({
				url:'./ajax/buscar_productos1.php?action=ajax&page='+page+'&q='+q+'&q1='+q1+'&q2='+q2,
				 beforeSend: function(objeto){
				 $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
			  },
				success:function(data){
					$(".outer_div").html(data).fadeIn('slow');
					$('#loader').html('');
					
				}
			})
		}

	
		
			
		
		
		
		

