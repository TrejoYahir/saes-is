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
            String select = " WHERE idGrupo = " + id;

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
                <main class="main col align-items-center justify-content-center main">
                    <%
                        Conexion cx=new Conexion();
                        Connection con =cx.MySQLConnect();
                        PreparedStatement ps, psa = null;
                        try {
                            String sql = "SELECT * FROM grupo" + select;
                            ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()) {
                                int nivel = rs.getInt("Nivel");
                                String turno = rs.getString("Turno");
                                int numero = rs.getInt("Numero");
                    %>
                    <div class="p-3">
                        <h3 class="pb-3">Editar grupo</h3>
                        <%
                            String message = (String)session.getAttribute("message");
                        %>
                        <% if (message!=null){session.removeAttribute("message");%><div class="alert alert-success my-0"><%=message%></div><%}%>
                    </div>                    
                    <form class="p-3" style="max-width: 400px;" action="EditarGrupoG" method="post">
                        <input type="hidden" value="<%=id%>" name="id" />
                       <div class="form-group row" >
                                <label class="col-4 col-form-label" for="Turno" >Turno</label>
                                <select class="col-8 form-control custom-select" value="<%=turno%>" name="Turno">
                                        <option values="Matutino" <%if(turno.equals("Matutino")){%>selected<%}%>>Matutino</option>
                                        <option value="Vespertino"<%if(turno.equals("Vespertino")){%>selected<%}%> >Vespertino</option>
                                </select>
                        </div>
                        <div class="form-group row" >
                                <label class="col-4 col-form-label" for="Nivel" >Nivel del grupo</label>
                                <select class="col-8 form-control custom-select" value="<%=nivel%>" name="Nivel">
                                        <option value="1"<%if(nivel==1){%>selected<%}%>>1</option>
                                        <option value="2"<%if(nivel==2){%>selected<%}%>>2</option>
                                        <option value="3"<%if(nivel==3){%>selected<%}%>>3</option>
                                        <option value="4"<%if(nivel==4){%>selected<%}%>>4</option>
                                </select>
                        </div>
                        <div class="form-group row" >
                                <label class="col-4 col-form-label" for="Numero" >Número del grupo</label>
                                <input required="requiered" value="<%=numero%>" type="number" min="1" max="15" class="col-8 form-control" name="Numero"  placeholder="Número entero">
                        </div>
                        <div style="visibility: hidden">
                            <select name="turnoAnt">
                                <option values="Matutino" <%if(turno.equals("Matutino")){%>selected<%}%>>Matutino</option>
                                <option value="Vespertino"<%if(turno.equals("Vespertino")){%>selected<%}%> >Vespertino</option>
                            </select>
                            <select name="nivelAnt">
                                        <option value="1"<%if(nivel==1){%>selected<%}%>>1</option>
                                        <option value="2"<%if(nivel==2){%>selected<%}%>>2</option>
                                        <option value="3"<%if(nivel==3){%>selected<%}%>>3</option>
                                        <option value="4"<%if(nivel==4){%>selected<%}%>>4</option>
                            </select>
                            <input value="<%=numero%>" type="number" name="numeroAnt" />
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        <a href="administrarGrupoG.jsp"><button type="button" class="btn btn-primary">Regresar</button></a>
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