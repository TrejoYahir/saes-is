<%-- 
    Document   : propuestaHorario
    Created on : 17/10/2017, 01:31:18 AM
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre=(String)session.getAttribute("nombreUsuario");
    String id=(String)session.getAttribute("idUsuario");
%>
<!DOCTYPE html>
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
						<button class="btn btn-primary dropdown-toggle" id="dp-categorias" data-toggle="dropdown">Bienvenido <%=nombre%></button>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dp-categorias">
							<a href="#" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
							<a href="#" class="dropdown-item"><img class="mr-2" src="img/alumno/Cerrar_sesion.png" width="30" alt="">Cerrar sesión</a>
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
								<li><a class="subitems" href="estadoActual.jsp"><img class="mr-2" src="img/alumno/Historial_academico.png" width="30" alt="">Historial académico</a></li>
							</ul>
						</li>
						<li id="heading2">
							<a href="#collapse2" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse2">Inscripción actual</a>
							<ul id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2">
								<li><a class="subitems" href="horarioActual.jsp"><img class="mr-1" src="img/alumno/Horario_actual.png" width="30" alt="">Horario actual</a></li>
							</ul>
						</li>
						<li id="heading3">
							<a href="#collapse3" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse3">Reinscripción</a>
							<ul id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3">
								<li><a class="subitems" href="buscarHorarios.jsp"><img class="mr-1" src="img/alumno/Horarios_y_disponibilidad.png" width="30" alt="">Horarios y disponibilidad</a></li>
								<li><a class="subitems" href="crearHorario.jsp"><img class="mr-1" src="img/alumno/Crear_horario.png" width="30" alt="">Crear horario</a></li>
								<li ><a class="subitems" href="propuestaHorario.jsp"><img class="mr-1" src="img/alumno/Propuesta_de_horario.png" width="30" alt="">Propuesta de horario</a></li>
								<li><a class="subitems" href="reinscripcion.jsp"><img class="mr-1" src="img/alumno/Reinscripcion.png" width="30" alt="">Reinscripción</a></li>
								<li><a class="subitems" href="dictamen.jsp"><img class="mr-1" src="img/alumno/Horario_actual.png" width="30" alt="">Inscribir dictamen</a></li>
							</ul>
						</li>
					</ul>
					</nav>
				</div>
				<main class="main col ">
					<div class="container ">
						<div class="row align-items-center ">
							<div class="col-12">
								<h1 class="display-5 my-3" align="center">Generar propuesta de horario</h1> <br><br>
							</div>
						</div>
						<div class="row align-items-center justify-content-center">
							<div class="col-8 ">
								<form action="">
									<div class="form-group">
										<label for="">Materias a inscribir</label>
										<input type="number" name="nomaterias" id="" min="1" max="7" class="form-control">
									</div>
									<div class="form-group">
										<label for="">Hora de entrada</label>
										<input type="text" name="hentrada" id="" placeholder="Formato de 24hrs (13:00)" class="form-control" pattern="(\d{2}):(\d{2})">
									</div>
									<div class="form-group">
										<label for="">Hora de salida</label>
										<input type="text" name="hsalida" id="" placeholder="Formato de 24hrs (18:00)" class="form-control" pattern="(\d{2}):(\d{2})">
									</div>
									<div class="form-group row justify-content-center" id="t">
										<a href="propuestaHorario2.jsp"><button type="button" class="btn btn-primary " >Generar</button></a>
									</div>
								</form>
							</div>
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