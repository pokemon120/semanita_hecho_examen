<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body> 

 <div class="container">
 <h1>Crud de PortalWeb</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudPortalWeb">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudPortalWeb" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Ruta</th>
												<th>Pais</th>
												<th>Fecha Lanzamiento</th>
												<th>Inscriptores</th>
												<th>Idioma</th>
												<th>Categoria</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${portales}" var="x">
													<tr>
														<td>${x.idPortal}</td>
														<td>${x.nombre}</td>
														<td>${x.ruta}</td>
														<td>${x.pais}</td>
														<td>${x.fechaLanzamiento}</td>
														<td>${x.inscriptores}</td>
														<td>${x.idioma}</td>
														<td>${x.categoria.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idPortal}','${x.nombre}','${x.ruta}','${x.pais}','${x.fechaLanzamiento}','${x.inscriptores}','${x.idioma}','${x.categoria.idCategoria}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idPortal}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de PortalWeb</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudPortalWeb" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de PortalWeb</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ruta">Ruta</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_ruta" name="ruta" placeholder="Ingrese la ruta" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_pais" name="pais" placeholder="Ingrese el pais" type="text">
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaLanzamiento">Fecha Lanzamiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaLanzamiento" name="fechaLanzamiento" type="date">
		                                        </div>
		                                    </div>     
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_inscriptores">N° inscriptores</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_inscriptores" name="inscriptores" placeholder="Ingrese el numero de inscriptores" type="text">
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_idioma">Idioma</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_idioma" name="idioma" placeholder="Ingrese el idioma" type="text">
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_categoria" name="categoria.idCategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza PortalWeb</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudPortalWeb" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de PortalWeb</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idPortal" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ruta">Ruta</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_ruta" name="ruta" placeholder="Ingrese la ruta" type="text">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_pais">Pais</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_pais" name="pais" placeholder="Ingrese el pais" type="text">
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaLanzamiento">Fecha Lanzamiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaLanzamiento" name="fechaLanzamiento" type="date">
		                                        </div>
		                                    </div>     
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_inscriptores">N° inscriptores</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_inscriptores" name="inscriptores" placeholder="Ingrese el numero de inscriptores" type="text">
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_idioma">Idioma</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_idioma" name="idioma" placeholder="Ingrese el idioma" type="text">
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_act_categoria" name="categoria.idCategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaCategoria", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_categoria").append("<option value="+item.idCategoria +">"+ item.nombre +"</option>");
		$("#id_act_categoria").append("<option value="+item.idCategoria +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,ruta,pais,fechaLanzamiento,inscriptores,idioma,idCategoria){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_ruta]').val(ruta);
	$('input[id=id_act_pais]').val(pais);
	$('input[id=id_act_fechaLanzamiento]').val(fechaLanzamiento);
	$('input[id=id_act_inscriptores').val(inscriptores)
	$('input[id=id_act_idioma').val(idioma)
	$('select[id=id_act_categoria]').val(idCategoria);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "ruta": {
        		selector : '#id_reg_ruta',
                validators: {
                    notEmpty: {
                        message: 'La ruta es un campo obligatorio'
                    },
                }
            },
            "pais": {
        		selector : '#id_reg_pais',
                validators: {
                	notEmpty: {
                        message: 'El pais es un campo obligatorio'
                    },
                }
            },
            "fechaLanzamiento": {
        		selector : '#id_reg_fechaLanzamiento',
                validators: {
                	notEmpty: {
                        message: 'La fecha lanzamiento es un campo obligatorio'
                    },
                }
            },
            "inscriptores": {
        		selector : '#id_reg_inscriptores',
                validators: {
                	notEmpty: {
                        message: 'N° inscriptores es un campo obligatorio'
                    },
                }
            },
            "idioma": {
        		selector : '#id_reg_idioma',
                validators: {
                	notEmpty: {
                        message: 'El idioma es un campo obligatorio'
                    },
                }
            },
            "categoria.idCategoria": {
        		selector : '#id_reg_categoria',
                validators: {
                	notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "ruta": {
        		selector : '#id_act_ruta',
                validators: {
                    notEmpty: {
                        message: 'La ruta es un campo obligatorio'
                    },
                }
            },
            "pais": {
        		selector : '#id_act_pais',
                validators: {
                	notEmpty: {
                        message: 'El pais es un campo obligatorio'
                    },
                }
            },
            "fechaLanzamiento": {
        		selector : '#id_act_fechaLanzamiento',
                validators: {
                	notEmpty: {
                        message: 'La fecha lanzamiento es un campo obligatorio'
                    },
                }
            },
            "inscriptores": {
        		selector : '#id_act_inscriptores',
                validators: {
                	notEmpty: {
                        message: 'N° inscriptores es un campo obligatorio'
                    },
                }
            },
            "idioma": {
        		selector : '#id_act_idioma',
                validators: {
                	notEmpty: {
                        message: 'El idioma es un campo obligatorio'
                    },
                }
            },
            "categoria.idCategoria": {
        		selector : '#id_act_categoria',
                validators: {
                	notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 