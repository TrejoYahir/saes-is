<%-- 
    Document   : registrarMateria
    Created on : 16/10/2017, 06:08:34 PM
    Author     : Diego EG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="registro.Materia"%>
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
							<a href="cambiarContraAn.jsp" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
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
								<li><a class="subitems" href="datosGestion.jsp"><img class="mr-2" src="img/alumno/Datos_generales.png" width="30" alt="">Datos generales</a></li>
							</ul>
						</li>
						<li id="heading2">
							<a href="#collapse2" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse2">Registro</a>
							<ul id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2">
								<li><a class="subitems" href="registrarAcademicoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Registrar académico</a></li>
								<li><a class="subitems" href="registrarProfesorG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Registrar profesor</a></li>
								<li><a class="subitems" href="registrarAlumnoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_alumno.png" width="30" alt="">Registrar alumno</a></li>
								<li><a class="subitems" href="registrarMateriaG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_materia.png" width="30" alt="">Registrar materia</a></li>
								<li><a class="subitems" href="registrarGrupoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Registrar grupo</a></li>
							</ul>
						</li>
						<li id="heading3">
							<a href="#collapse3" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse3">Administrar</a>
							<ul id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3">
								<li><a class="subitems" href="administrarAcademicoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Académico</a></li>
								<li><a class="subitems" href="administrarProfesorG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_profesor.png" width="30" alt="">Profesor</a></li>
								<li><a class="subitems" href="administrarAlumnoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_alumno.png" width="30" alt="">Alumno</a></li>
								<li><a class="subitems" href="administrarMateriaG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_materia.png" width="30" alt="">Materia</a></li>
								<li><a class="subitems" href="administrarGrupoG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Grupo</a></li>
								<li><a class="subitems" href="administrarTHorarioG.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Horario</a></li>
                                                                <li><a class="subitems" href="administrarHorarioAlumno.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Horario de alumno</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				</div>
				<main class="main col">
					<div class="row align-items-center  ">
						<div class="col-12">
							<h1 class="display-5" align="center">Registrar materia</h1> <br><br>
						</div>
					</div>
					<div class="row align-items-center justify-content-center "><!--Esto es una fila de la página aú no continene nada -->
					<div class="col-8 ">
						
						<form action="ServletRegistro" method="post" class="">
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="idMateria" >Identificador de la materia</label>
								<input required="requiered" type="text" class="col-8 form-control" name="idMateria" placeholder="CXYZ"
                                                                       pattern="^C[\d][\d][\d]" >
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="NomMateria" >Nombre de la materia</label>
								<input required="requiered" type="text" class="col-8 form-control" name="NomMateria"  placeholder="Nombre Materia"
                                                                       pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" >
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Creditos" >Créditos de la materia</label>
								<input required="requiered" type="text" class="col-8 form-control" name="Creditos"  placeholder="Número decimal"
                                                                        pattern="[0-9]+\.[0-9][0-9]" >
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Nivel" >Nivel de la materia</label>
								<input required="requiered" type="number" min="1" max="4" class="col-8 form-control" name="Nivel" placeholder="Nivel">
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Cupo" >Cupo de la materia</label>
								<input required="requiered" type="number" min="1" max="33" class="col-8 form-control" name="Cupo"  placeholder="Número entero">
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Clasificacion" >Clasificación de la materia</label>
								<select class="col-8 form-control custom-select" name= "Clasificacion">
									<option value = "1" selected>Formación Institucional</option>
									<option value="2">Formación Científica-Básica</option>
									<option value="3">Formación Profesional</option>
									<option value="4">Formación Terminal e Integración</option>
								</select>
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Serializacion">Serialización de la materia</label>
                                                                <%
                                                                    ArrayList<String> a = Materia.obtenerClavesMaterias();   
                                                                    request.setAttribute("claves", a);
                                                                %>
                                                                
                                                                
                                                                
								<select class="col-8 form-control custom-select" name="Serializacion">
                                                                    <option value="Ninguna">Ninguna</option>
                                                                    <%
                                                                        for (int i = 0; i < a.size(); i++) {
                                                                                out.println("<option value=\""+a.get(i)+"\">"+a.get(i)+"</option>");
                                                                            }
                                                                    %>
								</select>
							</div>
							
							<div class="form-group row justify-content-center" >
								<button type="submit" class="btn btn-primary ">Registrar materia</button>
								
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
