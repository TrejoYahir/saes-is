<%-- 
    Document   : registrarAcademico
    Created on : 17/10/2017, 03:49:36 AM
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombreUsuario=(String)session.getAttribute("nombreUsuario");
    String idUsuario=(String)session.getAttribute("idUsuario");
%>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>SAES</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Roboto:300,400,500" rel="stylesheet">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row justify-content-between encabezado">
			<div class="col-3 my-2">
				<a class="" href="#"><img class="img-fluid" src="img/logo/logo2.png" alt="Logo" width="150" height="50"></a>
			</div>
			<div class="col-3 my-2 text-right">
				<div class="btn-group mr-2 mb-2 ">
					<button class="btn btn-primary dropdown-toggle" id="dp-categorias" data-toggle="dropdown">Bienvenido <%=nombreUsuario%></button>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dp-categorias">
						<a href="cambiarContraJG.jsp" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
						<a href="login.jsp" class="dropdown-item"><img class="mr-2" src="img/alumno/Cerrar_sesion.png" width="30" alt="">Cerrar sesión</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="barra-lateral col-12 col-sm-auto">
				<nav class="menu d-flex d-sm-block justify-content-center flex-wrap text-left">
					<ul class=" navbar-nav">
						<li id="heading1">
							<a href="#collapse1" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse1">Datos personales</a>
							<ul id="collapse1" class="collapse" role="tabpanel" aria-labelledby="heading1">
								<li><a class="subitems" href="datosPersonalesJG.jsp"><img class="mr-2" src="img/alumno/Datos_generales.png" width="30" alt="">Datos generales</a></li>
							</ul>
						</li>
						<li id="heading2">
							<a href="#collapse2" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse2">Registro</a>
							<ul id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2">
								<li><a class="subitems" href="registrarAcademico.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Registrar académico</a></li>
								<li><a class="subitems" href="registrarAnalista.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_academico.png" width="30" alt="">Registrar analista</a></li>
								<li><a class="subitems" href="registrarProfesor.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Registrar profesor</a></li>
								<li><a class="subitems" href="registrarAlumno.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_alumno.png" width="30" alt="">Registrar alumno</a></li>
								<li><a class="subitems" href="asignarHorario.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Asignar horarios</a></li>
							</ul>
						</li>
						<li id="heading3">
							<a href="#collapse3" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse3">Administrar</a>
							<ul id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3">
								<li><a class="subitems" href="administrarAcademico.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Académico</a></li>
								<li><a class="subitems" href="administrarAnalista.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_academico.png" width="30" alt="">Analista</a></li>
								<li><a class="subitems" href="administrarProfesor.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Profesor</a></li>
								<li><a class="subitems" href="administrarAlumno.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_alumno.png" width="30" alt="">Alumno</a></li>
								<li><a class="subitems" href="administrarAHorario.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Horario</a></li>
								<li><a class="subitems" href="gestionarPeriodos.jsp"><img class="mr-1" src="img/gestion/gestionar/Periodos.png" width="30" alt="">Periodos</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<main class="main col">
				<div class="row align-items-center justify-content-center main">
					<div class="col-5">
						<h2 class="text-center mb-3 mt-5">Registrar académico</h2>
						<form action="RegistrarAcademico" method="POST">
							<div class="form-group">
								<label for="nombre">Nombre</label>
								<input type="text" class="form-control" title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="nombre" required="required" />
							</div>
							<div class="form-group">
								<label for="nombre">Apellido paterno</label>
								<input type="text" title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="paterno" required class="form-control" />
							</div>
							<div class="form-group">
								<label for="nombre">Apellido materno</label>
								<input type="text" title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="materno" required class="form-control"/>
							</div>
							<div class="form-group">
								<label for="nombre">Número de empleado</label>
								<input type="text" pattern="^[0-9]{10}$" name="idempleado" required class="form-control" />
								<small class="form-text text-muted">Solo números (10 dígitos)</small>
							</div>
							<div class="form-group">
								<label for="nombre">RFC</label>
								<input type="text" title="Ingresa un RFC válido" pattern="([A-ZÑ]{4})([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-ZÑ]{2})([0-9]{1})" name="rfc" required class="form-control" />
							</div>
							<div class="form-group">
								<label for="nombre">Correo electrónico</label>
								<input type="email" name="email" required class="form-control" />
							</div>
							<div class="form-group">
								<label for="nombre">Contraseña</label>
								<input type="text" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$" name="contra" required class="form-control" />
								<small class="form-text text-muted">Entre 6 y 20 caracteres, una letra mayúscula, una letra minúscula y un número</small>
							</div>
							<div class="form-group row justify-content-center" id="t">
								<button type="submit" class="btn btn-primary mb-5">Enviar</button>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
