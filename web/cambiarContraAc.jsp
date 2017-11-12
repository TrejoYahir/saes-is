<%-- 
    Document   : datosPersonalesJG
    Created on : 17/10/2017, 03:31:29 AM
    Author     : Alberto
--%>

<%@page import="java.sql.*"%>
<%@page import="mysql.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String nombre=(String)session.getAttribute("nombreUsuario");
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
					<button class="btn btn-primary dropdown-toggle" id="dp-categorias" data-toggle="dropdown">Bienvenido <%=nombre%></button>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dp-categorias">
						<a href="cambiarContraAc.jsp" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
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
								<li><a class="subitems" href="datosAcademico.jsp"><img class="mr-2" src="img/alumno/Datos_generales.png" width="30" alt="">Datos generales</a></li>
							</ul>
						</li>
						<li id="heading2">
							<a href="#collapse2" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse2">Registro</a>
							<ul id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2">
								<li><a class="subitems" href="asignarHorarioAc.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Asignar horarios</a></li>
							</ul>
						</li>
						<li id="heading3">
							<a href="#collapse3" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse3">Administrar</a>
							<ul id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3">
								<li><a class="subitems" href="administrarAHorarioAc.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Horarios</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<main class="main col">
                             <div class="row justify-content-center align-items-start main">
                                        <div class="col-10">
                                            <h2 class="my-5">Cambiar contraseña</h2>
                                            <form action="CambiarContraAc" onsubmit="return validarAc()" class="form">
                                                <input type="hidden" value="<%=idUsuario%>">
                                                <div class="form-group">
                                                    <label for="actual">Contraseña actual</label>
                                                    <input type="password" name="contraActual" id="contraAc" class="form-control" required="required"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="actual">Nueva contraseña</label>
                                                    <input type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$" name="contraNueva" id="contra1" class="form-control" required="required"/>
                                                    <small class="form-text text-muted">Entre 6 y 20 caracteres, una letra mayúscula, una letra minúscula y un número</small>
                                                </div>
                                                <div class="form-group">
                                                    <label for="actual">Confirmar contraseña</label>
                                                    <input type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$"  id="contra2" class="form-control" required="required"/>
                                                    <small class="form-text text-muted">Entre 6 y 20 caracteres, una letra mayúscula, una letra minúscula y un número</small>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary">Enviar</button>
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
        <script src="js/cambiarContra.js"></script>
</body>
</html>