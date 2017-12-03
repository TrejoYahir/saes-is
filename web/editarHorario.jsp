<%-- 
    Document   : asignarHorario
    Created on : 19/10/2017, 02:54:00 AM
    Author     : Alberto
--%>

<%@page import="mysql.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
				<div class="row align-items-center  ">
						<div class="col-12">
							<h1 class="display-5 mt-3" align="center">Editar horario</h1> <br><br>
						</div>
					</div>
					<div class="row align-items-center justify-content-center "><!--Esto es una fila de la página aú no continene nada -->
					<div class="col-8 ">
                                            <%
                                                String idclase=request.getParameter("idClase");
                                                String idgrupo="";
                                                String rfc="";
                                                String idmateria="";
                                                String idhorario="";
                                                Conexion cx=new Conexion();
                                                Connection con=cx.MySQLConnect();
                                                PreparedStatement ps=con.prepareStatement("select * from clase where idclase=?");
                                                ps.setString(1,idclase);
                                                ResultSet rs=ps.executeQuery();
                                                while(rs.next()){
                                                    idgrupo=rs.getString("grupo_idgrupo");
                                                    rfc=rs.getString("profesor_rfc");
                                                    idmateria=rs.getString("materias_idmaterias");
                                                    idhorario=rs.getString("tipo_horario_idtipo_horario");
                                                }
                                            %>
						<form action="EditarHorario" method="post" class="">
                                                    <input type="hidden" value="<%=idclase%>" name="idClase">
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="idMateria" >Materia</label>
                                                                
								<select name="materia" class="col-8 form-control custom-select">
                                                                    <%
                                                                        
                                                                        ps=con.prepareStatement("select idmaterias,nombre from materias");
                                                                        rs=ps.executeQuery();
                                                                        while(rs.next()){
                                                                            if(idmateria.equals(rs.getString("idmaterias"))){
                                                                                out.println("<option value='"+rs.getString("idmaterias")+"' selected='selected'>"+rs.getString("nombre")+"</option>");
                                                                            }else{
                                                                                out.println("<option value='"+rs.getString("idmaterias")+"'>"+rs.getString("nombre")+"</option>");
                                                                            }
                                                                        }
                                                                    %>
								</select>
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="NomProfesor" >Nombre del profesor</label>
								<select name="profesor" class="col-8 form-control custom-select">
                                                                    <%
                                                                    ps=con.prepareStatement("select rfc,nombre,paterno,materno from profesor");
                                                                    rs=ps.executeQuery();
                                                                    while(rs.next()){
                                                                        if(rfc.equals(rs.getString("rfc"))){
                                                                            out.println("<option value='"+rs.getString("rfc")+"' selected='selected'>"+rs.getString("nombre")+" "+rs.getString("paterno")+" "+rs.getString("materno")+"</option>");
                                                                        }else{
                                                                            out.println("<option value='"+rs.getString("rfc")+"'>"+rs.getString("nombre")+" "+rs.getString("paterno")+" "+rs.getString("materno")+"</option>");
                                                                        }
                                                                        
                                                                    }
                                                                    %>
								</select>
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Grupo" >Grupo</label>
								<select name="grupo" class="col-8 form-control custom-select">
                                                                    <%
                                                                    ps=con.prepareStatement("select idgrupo,nombre from grupo");
                                                                    rs=ps.executeQuery();
                                                                    while(rs.next()){
                                                                        if(idgrupo.equals(rs.getString("idgrupo"))){
                                                                            out.println("<option value='"+rs.getString("idgrupo")+"' selected='selected'>"+rs.getString("nombre")+"</option>");
                                                                        }else{
                                                                            out.println("<option value='"+rs.getString("idgrupo")+"' >"+rs.getString("nombre")+"</option>");
                                                                        }
                                                                        
                                                                    }
                                                                    %>
								</select>
							</div>
							<div class="form-group row" >
								<label class="col-4 col-form-label" for="Horario" >Horario</label>
								<select name="horario" class="col-8 form-control custom-select">
                                                                    <%
                                                                    ps=con.prepareStatement("select idtipo_horario from tipo_horario");
                                                                    rs=ps.executeQuery();
                                                                    while(rs.next()){
                                                                        if(idhorario.equals(rs.getString("idtipo_horario"))){
                                                                            out.println("<option value='"+rs.getString("idtipo_horario")+"' selected='selected'>"+rs.getString("idtipo_horario")+"</option>");
                                                                        }else{
                                                                            out.println("<option value='"+rs.getString("idtipo_horario")+"'>"+rs.getString("idtipo_horario")+"</option>");
                                                                        }
                                                                    }
                                                                    con.close();
                                                                                cx.cerrar();
                                                                    %>
								</select>
							</div>
							<div class="form-group row justify-content-center">
								<button type="submit" class="btn btn-primary mr-2">Editar materia</button>
                                                                <a href="administrarAHorario.jsp"><button type="button" class="btn btn-primary">Regresar</button></a>
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
