<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SAES</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilosPre.css">
</head>
<%
    String idusuario=request.getParameter("idusuario");
%>
<body>
	<header class="container-fluid fondoNav">
		<nav class=" row justify-content-between navbar navbar-expand-lg navbar-light bg-feded">
			<a class="col-1  navbar-brand" href="index.html"><img src="img/logo/logo2.png" width="150" alt="Logo"></a>
		</nav>
	</header>
	<article class="container-fuid fondo "> <!--Comienza todo el contenido de la página -->
		<div class="row align-items-center justify-content-center alturacontenido">
			<div class="col-5">
				<form action="ReestablecerContrasena2" class="borde" onsubmit="return validarRC()">
					<h3 class="text-center mb-2">Restablecer contraseña</h3>
                                        <input type="hidden" value="<%=idusuario%>">
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
	</article>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/cambiarContra.js"></script>
</body>
</html>