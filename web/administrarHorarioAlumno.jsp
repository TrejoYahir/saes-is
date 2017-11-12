<%-- 
    Document   : administrarMaterias
    Created on : 16/10/2017, 06:34:20 PM
    Author     : Yahir
--%>

<%@page import="mysql.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
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
            String keyword = "";
            String select = "";
            if (request.getParameter("keyword") != null) {
                keyword = request.getParameter("keyword");
                select = " WHERE Boleta LIKE '%" + keyword + "%' and alumno.usuario_idusuario=usuario.idusuario";
            }else{
                select = " WHERE alumno.usuario_idusuario=usuario.idusuario";
            }
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
                    <div class="p-3">
                        <h3 class="pb-3">Administrar horario de alumno</h3>
                        <form action="administrarHorarioAlumno.jsp" method="get">
                            <div class="input-group pb-4 pt-1">
                                <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar..." name="keyword" value="<%=keyword%>">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit">Buscar</button>
                                </span>
                            </div>
                        </form>
                        <%
                            Conexion cx=new Conexion();
                            Connection con =cx.MySQLConnect();
                            PreparedStatement ps = null;
                            try {
                                String sql = "SELECT * FROM alumno,usuario" + select;
                                ps = con.prepareStatement(sql);
                                ResultSet rs = ps.executeQuery();
                                if(rs.next()) {
                                    rs.previous();
                        %>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Boleta</th>
                                    <th>Nombre</th>
                                    <th>Apellido paterno</th>
                                    <th>Apellido materno</th>
                                    <th>Correo</th>
                                    <th>Estado</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                while (rs.next()) {
                                    String id = rs.getString("Boleta");
                                    String nombre = rs.getString("Nombre");
                                    String apellidop=rs.getString("Paterno");
                                    String apellidom=rs.getString("Materno");
                                    String correo = rs.getString("Mail");
                                    String estado = rs.getString("Estado");
                            %>
                            <tr>
                                <th scope="row"><%=id%></th>
                                <td><%=nombre%></td>
                                <td><%=apellidop%></td>
                                <td><%=apellidom%></td>
                                <td><%=correo%></td>
                                <td><%=estado%></td>
                                <th class="text-center"><a class="btn btn-primary" href="./editarHorarioAlumnoG.jsp?id=<%=id%>">Editar</a></th>
                            </tr>
                            <%
                                }
                            %>                                        
                            </tbody>
                        </table>
                        <%
                            }else{
                         %>
                        <p>No se encontraron resultados</p>
                         <%
                            }
                            } catch (SQLException sqe) {
                                out.println(sqe);
                            }
                        %>
                    </div>
                </main>
            </div>
        </div>	
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>