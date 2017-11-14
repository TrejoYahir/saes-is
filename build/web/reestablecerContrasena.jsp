

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SAES</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilosPre.css">
</head>
<body>
	<header class="container-fluid fondoNav">
		<nav class=" row justify-content-between navbar navbar-expand-lg navbar-light bg-feded">
			<a class="col-1  navbar-brand" href="index.html"><img src="img/logo/logo2.png" width="150" alt="Logo"></a>
		</nav>
	</header>
	<article class="container-fuid fondo "> <!--Comienza todo el contenido de la página -->
		<div class="row align-items-center justify-content-center alturacontenido">
			<div class="col-5">
				<form action="RecuperarContrasena" method="post" class="borde">
					<h3 class="text-center mb-2">Restablecer contraseña</h3>
					<div class="form-group row" id="t">
						<label class="col-3 col-form-label" for="email1" >Usuario</label>
						<input required="requiered" maxlength="13" type="text" class="col form-control" id="email1" name="idusuario" placeholder="No. Boleta o RFC" pattern="([A-ZÑ]{4})([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-ZÑ]{2})([0-9]{1})|(\d{10}))">
					</div>
					<div class="form-group row justify-content-center" id="t">
						<button type="submit" class="btn btn-primary">Restablecer contraseña</button>
					</div>
				</form>
			</div>
		</div>
	</article>
<script src="js/jquery.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>