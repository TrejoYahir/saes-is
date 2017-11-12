<%-- 
    Document   : propuestaHorario2
    Created on : 17/10/2017, 01:36:48 AM
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre=(String)session.getAttribute("nombreUsuario");
    String id=(String)session.getAttribute("idUsuario");
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
					<div class="container-fluid ">
						<div class="row align-items-center ">
							<div class="col-12">
								<h1 class="display-5 my-3" align="center">Propuesta de horario</h1> <br><br>
							</div>
						</div>
						<div class="row align-items-center justify-content-center">
							<div class="col-10 ">
								<table class="table table-striped table-bordered table-hover table-responsive">
							<thead class="thead-inverse">
								<tr>
									<th>Grupo</th>
									<th>Materia</th>
									<th>Profesor</th>
									<th>Lunes</th>
									<th>Martes</th>
									<th>Miércoles</th>
									<th>Jueves</th>
									<th>Viernes</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td >1CM3</td>
									<td scope="row">Ecuaciones diferenciales</td>
									<td>Rojas Luna Hector</td>
									<td>12:00-13:30</td>
									<td> </td>
									<td>12:00-13:30</td>
									<td>12:00-13:30</td>
									<td> </td>
								</tr>
								<tr>
									<td >1CM5</td>
									<td scope="row">Cálculo Aplicado</td>
									<td>Manzanilla Granados Hector Manuel</td>
									<td> </td>
									<td>07:00-08:30</td>
									<td>07:00-08:30</td>
									<td> </td>
									<td>07:00-08:30</td>
								</tr>
								<tr>
									<td >1CM11</td>
									<td scope="row">Algebra lineal</td>
									<td>Mosso García Iván Giovanny</td>
									<td>08:30-10:00</td>
									<td>12:00-13:30</td>
									<td>08:30-10:00</td>
									<td>08:30-10:00</td>
									<td> </td>
								</tr>
								<tr>
									<td >1CM12</td>
									<td scope="row">Estructura de datos</td>
									<td>Rueda Meléndez Marco Antonio</td>
									<td>07:00-08:30</td>
									<td> </td>
									<td> </td>
									<td>07:00-08:30</td>
									<td>08:30-10:00</td>
								</tr>
								<tr>
									<td >1CM8</td>
									<td scope="row">Comunicación oral y escrita</td>
									<td>Muñoz Salazar Laura</td>
									<td>10:30-12:00</td>
									<td>08:30-10:00</td>
									<td> </td>
									<td>10:30-12:00</td>
									<td> </td>
								</tr>
								<tr>
									<td >1CM1</td>
									<td scope="row">Análisis fundamental de circuitos</td>
									<td>Sánchez Moreno Adriana de la P</td>
									<td> </td>
									<td>10:30-12:00</td>
									<td>10:30-12:00</td>
									<td> </td>
									<td>10:30-12:00</td>
								</tr>
							</tbody>
						</table>
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