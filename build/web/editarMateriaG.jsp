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
            String select = " WHERE idMaterias = '" + id + "'";

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
                            String sql = "SELECT * FROM materias" + select;
                            String sqlCat = "SELECT * FROM area_materias";
                            ps = con.prepareStatement(sql);
                            psa = con.prepareStatement(sqlCat);
                            ResultSet rs = ps.executeQuery();
                            ResultSet rsa = psa.executeQuery();
                            if(rs.next()) {
                                String nombre = rs.getString("Nombre");
                                String nivel = rs.getString("Nivel");
                                String creditos = rs.getString("Creditos");
                                int clasificacion = rs.getInt("Area_Materias_idArea_Materias");
                    %>
                    <div class="p-3">
                        <h3 class="pb-3">Editar materia</h3>
                        <h5><%=nombre%></h5>
                        <%
                            String message = (String)session.getAttribute("message");
                        %>
                        <% if (message!=null){session.removeAttribute("message");%><div class="alert alert-success my-0"><%=message%></div><%}%>
                    </div>                    
                    <form class="p-3" style="max-width: 400px;" action="EditarMateriaG" method="post">
                        <input type="hidden" value="<%=id%>" name="id" />
                        <div class="form-group">
                            <label for="nombre">Nombre de la materia</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=nombre%>" required pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+">
                        </div>
                        <div class="form-group">
                            <label for="nivel">Nivel de la materia</label>
                            <select id="nivel" class="form-control" name="nivel" required>
                                <option value="1" <%if(Integer.parseInt(nivel)==1){%>selected<%}%> >1</option>
                                <option value="2" <%if(Integer.parseInt(nivel)==2){%>selected<%}%> >2</option>
                                <option value="3" <%if(Integer.parseInt(nivel)==3){%>selected<%}%> >3</option>
                                <option value="4" <%if(Integer.parseInt(nivel)==4){%>selected<%}%> >4</option>
                                <option value="5" <%if(Integer.parseInt(nivel)==5){%>selected<%}%> >5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Créditos de la materia </label>
                            <input type="number" class="form-control" id="creditos" placeholder="Creditos" value="<%=creditos%>" name="creditos" required min="1.5" max="13.0" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="nivel">Clasificación de la materia</label>
                            <select id="nivel" class="form-control" name="clasificacion" required>
                                <%
                                    while (rsa.next()) {
                                        String idc = rsa.getString("idArea_Materias");
                                        String desc = rsa.getString("Nombre");
                                %>
                                <option value="<%=idc%>" <%if(idc.equals(String.valueOf(clasificacion))){%>selected<%}%> ><%=desc%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        <a href="administrarMateriaG.jsp"><button type="button" class="btn btn-primary">Regresar</button></a>
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
        <script src="js/vals.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>