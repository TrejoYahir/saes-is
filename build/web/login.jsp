<%-- 
    Document   : login
    Created on : 17/10/2017, 01:38:45 AM
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error=(String)session.getAttribute("error");
    if(error==null){
        error="0";
    }
%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>SAES</title>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/estilosPre.css">
                <%
                if(error.equals("1")){
                    out.println("<script type='text/javascript'>");
                    out.println("alert('El usuario o la contraseña son incorrectos');");
                    out.println("</script>");
                    error="0";
                    session.setAttribute("error",error);
                }
                %>
	</head>
	<body>
		<header class="container-fluid fondoNav">
			<nav class=" row justify-content-between navbar navbar-expand-lg navbar-light bg-feded">
				<a class="col-1  navbar-brand" href="index.html"><img src="img/logo/logo2.png" width="150" alt="Logo"></a>
			</nav>
		</header>
		<article class="container-fuid fondo "> <!--Comienza todo el contenido de la página -->
		<div class="row align-items-center justify-content-center alturacontenido"><!--Esto es una fila de la página aú no continene nada -->
		<div class="col-5 ">
			<form action="Login2" method="post" class="borde">
				<div class="form-group row" id="t">
					<label class="col-4 col-form-label" for="email1" >Usuario</label>
					<input name="usuario" required="requiered" type="text" class="col-8 form-control" id="email1"  placeholder="No. Boleta o RFC" pattern="([A-ZÑ]{4})([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-ZÑ]{2})([0-9]{1})|(\d{10}))">
				</div>
				<div class="form-group row" id="t">
					<label class="col-4 col-form-label" for="password1" >Contraseña</label>
					<input name="contra" required="requiered" type="password" class="col-8 form-control" id="password1"  placeholder="Contraseña" minlength="6">
				</div>
				<div class="form-group row justify-content-center" id="t">
					<button type="submit" class="btn btn-primary ">Entrar</button>
				</div>
			</form>
		</div>
	</div>
</article>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>