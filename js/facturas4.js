		$(document).ready(function(){
			load(1);
			
		});

		function load(page){
			var q= $("#q").val();
                        var q1= $("#q1").val();
                        var q2= $("#q2").val();
                        var q3= $("#q3").val();
			$("#loader").fadeIn('slow');
			$.ajax({
				url:'./ajax/buscar_facturas_online.php?action=ajax&page='+page+'&q='+q+'&q1='+q1+'&q2='+q2+'&q3='+q3,
				 beforeSend: function(objeto){
				 $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
			  },
				success:function(data){
					$(".outer_div").html(data).fadeIn('slow');
					$('#loader').html('');
					$('[data-toggle="tooltip"]').tooltip({html:true}); 
					
				}
			})
		}

		
		
		function imprimir_factura(id_factura){
			VentanaCentrada('./pdf/documentos/ver_factura.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}
                
                function imprimir_factura1(id_factura){
			VentanaCentrada('email/index.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}

function imprimir_factura2(id_factura){
			VentanaCentrada('./pdf/documentos/ver_ticket.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}
function imprimir_facturas(id_factura){
			VentanaCentrada('./pdf/documentos/ver_factura3.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}