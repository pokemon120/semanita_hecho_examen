<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra PortalWeb</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraPortalWeb" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruta">Ruta</label>
				<input class="form-control" id="id_ruta" name="ruta" placeholder="Ingrese la ruta" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">Pais</label>
				<input class="form-control" id="id_pais" name="pais" placeholder="Ingrese el pais" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaLanzamiento">FechaLanzamiento</label>
				<input class="form-control" id="id_fechaLanzamiento" name="fechaLanzamiento" type="date">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_inscriptores">N° Inscriptores</label>
				<input class="form-control" id="id_inscriptores" name="einscriptores" placeholder="Ingrese el numero de inscriptores" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_idioma">Idioma</label>
				<input class="form-control" id="id_idioma" name="idioma" placeholder="Ingrese el idioma" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria">Categoria</label>
				<select id="id_categoria" name="categoria.idCategoria" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crear</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaCategoria", {}, function(data){
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.idCategoria +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
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
        ruta: {
    		selector : '#id_ruta',
            validators: {
                notEmpty: {
                    message: 'La ruta es un campo obligatorio'
                },
            }
        },
        pais: {
    		selector : '#id_pais',
            validators: {
                notEmpty: {
                    message: 'El pais es un campo obligatorio'
                },
            }
        },
        fechaLanzamiento: {
    		selector : '#id_ fechaLanzamiento',
            validators: {
            	notEmpty: {
                    message: 'La fecha lanzamiento es un campo obligatorio'
                },
            }
        },
        inscriptores: {
    		selector : '#id_inscriptores',
            validators: {
            	notEmpty: {
                    message: 'N° inscriptores es un campo obligatorio'
                },
            }
        },
        idioma: {
    		selector : '#id_idioma',
            validators: {
            	notEmpty: {
                    message: 'El idioma es un campo obligatorio'
                },
            }
        },
        categoria: {
    		selector : '#id_categoria',
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
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




