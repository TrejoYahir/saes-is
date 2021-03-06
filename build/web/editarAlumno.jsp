<%-- 
    Document   : editarMateria
    Created on : 16/10/2017, 07:59:28 PM
    Author     : Yahir
--%>

<%@page import="mysql.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String nombreUsuario=(String)session.getAttribute("nombreUsuario");
    String idUsuario=(String)session.getAttribute("idUsuario");
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
        <%
            String id = request.getParameter("id");
            String select = " WHERE Boleta = '" + id + "' and alumno.usuario_idusuario=usuario.idusuario";

        %>
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
                <main class="main col align-items-center justify-content-center main">
                    <%
                        Conexion cx=new Conexion();
                        Connection con =cx.MySQLConnect();
                        PreparedStatement ps, psa = null;
                        try {
                            String sql = "SELECT * FROM usuario,alumno" + select;
                            ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()) {
                                String nombre = rs.getString("Nombre");
                                String apellidop = rs.getString("Paterno");
                                String apellidom = rs.getString("Materno");
                                String Boleta = rs.getString("Boleta");
                                String Mail = rs.getString("Mail");
                                String contra= rs.getString("Contra");
                    %>
                    <div class="p-3">
                        <h3 class="pb-3">Editar alumno</h3>
                        <h5><%=nombre%> <%=apellidop%> <%=apellidom%>: <%=Boleta%></h5>
                        <%
                            String message = (String)session.getAttribute("message");
                        %>
                        <% if (message!=null){session.removeAttribute("message");%><div class="alert alert-success my-0"><%=message%></div><%}%>
                    </div>                    
                    <form class="p-3" style="max-width: 400px;" action="EditarAlumno" method="post">
                        <input type="hidden" value="<%=id%>" name="id" />
                        <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" value="<%=nombre%>" class="form-control" title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="nombre" required="required" />
                        </div>
                        <div class="form-group">
                                <label for="nombre">Apellido paterno</label>
                                <input type="text" value="<%=apellidop%>"  title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="paterno" required class="form-control" />
                        </div>
                        <div class="form-group">
                                <label for="nombre">Apellido materno</label>
                                <input type="text" value="<%=apellidom%>" title="Ingresa solo letras." pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" name="materno" required class="form-control"/>
                        </div>
                        <div class="form-group">
                                <label for="nombre">Correo electrónico</label>
                                <input type="email" value="<%=Mail%>" name="email" required class="form-control" />
                        </div>
                        <div class="form-group">
                                <label for="nombre">Contraseña</label>
                                <input type="text" value="<%=contra%>" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$" name="contra" required class="form-control" />
                                <small class="form-text text-muted">Entre 6 y 20 caracteres, una letra mayúscula, una letra minúscula y un número</small>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        <a href="administrarAlumno.jsp"><button type="button" class="btn btn-primary">Regresar</button></a>
                    </form>
                    <%
                        }else{
                     %>
                    <p>ID de materia inválido</p>
                     <%
                        }
                        con.close();
                        cx.cerrar();
                        } catch (SQLException sqe) {
                            out.println(sqe);
                        }
                    %>
                </main>
            </div>
        </div>	
        <script src="js/validations.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>