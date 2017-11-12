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
<%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_06209a6566df5df";%>
        <%!String user = "b0087e4ae1fe04";%>
        <%!String psw = "eac1da17";%>
        <%
            String keyword = "";
            String select = "";
            if ((request.getParameter("keyword") != null)&&(!request.getParameter("keyword").equals(""))) {
                keyword = request.getParameter("keyword");
                select = " WHERE Nivel=" + keyword;
            }else{
                
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
                            <a href="#" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
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
								<li><a class="subitems" href="registrarMateria.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_materia.png" width="30" alt="">Registrar materia</a></li>
								<li><a class="subitems" href="registrarGrupo.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Registrar grupo</a></li>
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
								<li><a class="subitems" href="administrarMateria.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_materia.png" width="30" alt="">Materia</a></li>
								<li><a class="subitems" href="administrarGrupo.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Grupo</a></li>
								<li><a class="subitems" href="administrarAHorario.jsp"><img class="mr-1" src="img/gestion/registrar/Registrar_grupo.png" width="30" alt="">Horario</a></li>
								<li><a class="subitems" href="gestionarPeriodos.jsp"><img class="mr-1" src="img/gestion/gestionar/Periodos.png" width="30" alt="">Periodos</a></li>
							</ul>
						</li>
					</ul>
				</nav>
                </div>
                <main class="main col">
                    <div class="p-3">
                        <h3 class="pb-3">Administrar grupo</h3>
                        <form action="administrarGrupo.jsp" method="get">
                            <div class="input-group pb-4 pt-1">
                                <input type="number" min="1" max="4" class="form-control" placeholder="Buscar..." aria-label="Buscar..." name="keyword" value="<%=keyword%>">
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
                                String sql = "SELECT * FROM grupo" + select;
                                ps = con.prepareStatement(sql);
                                ResultSet rs = ps.executeQuery();
                                if(rs.next()) {
                                    rs.previous();
                        %>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Nivel</th>
                                    <th>Turno</th>
                                    <th>Número grupo</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                while (rs.next()) {
                                    int id = rs.getInt("idGrupo");
                                    int nivel = rs.getInt("Nivel");
                                    String turno = rs.getString("Turno");
                                    int numero=rs.getInt("Numero");
                            %>
                            <tr>
                                <th scope="row"><%=nivel%></th>
                                <td><%=turno%></td>
                                <td><%=numero%></td>
                                <th class="text-center"><a class="btn btn-primary" href="./editarGrupo.jsp?id=<%=id%>">Editar</a></th>
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