<%-- 
    Document   : asignarHorario
    Created on : 19/10/2017, 02:54:00 AM
    Author     : Alberto
--%>

<%@page import="java.util.ArrayList"%>
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
				<div class="row align-items-center  justify-content-center">
                                    <div class="col-10">
                                            <h2 class="my-3 text-center">Administrar tipo de horarios</h2>
                                            <div class="text-center my-4">
                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#fm-modal-grid">Agregar</button>
                                            </div>
                                            <%
                                                Conexion cx=new Conexion();
                                                Connection con=cx.MySQLConnect();
                                                PreparedStatement ps=null;
                                                ResultSet rs=null;
                                                String query="select * from tipo_horario";
                                                String query2="";
                                                ArrayList<String> tipohorario=new ArrayList();
                                                ArrayList<String> horario=new ArrayList();
                                                boolean lunes=false,martes=false,miercoles=false,jueves=false,viernes=false;
                                                try {
                                                    ps=con.prepareStatement(query);
                                                    rs=ps.executeQuery();
                                                    if(rs.next()){
                                                        rs.previous();
                                                        %>
                                                <table class="table table-responsive table-hover">
                                                    <thead class="thead-inverse">
                                                            <tr>
                                                                    <th>Nombre</th>
                                                                    <th>Lunes</th>
                                                                    <th>Martes</th>
                                                                    <th>Miércoles</th>
                                                                    <th>Jueves</th>
                                                                    <th>Viernes</th>
                                                                    <th></th>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                        while(rs.next()){
                                                            tipohorario.add(rs.getString("idtipo_horario"));
                                                        }
                                                        for (int i = 0; i < tipohorario.size(); i++) {
                                                            query2="select horas.dia,horas.hora,tipo_horario.idTipo_horario from tipo_horario,horas,tipo_horario_has_horas where tipo_horario.idtipo_horario=tipo_horario_has_horas.tipo_horario_idtipo_horario and tipo_horario_has_horas.horas_idhorario=horas.idhorario and idtipo_horario=?";
                                                            ps=con.prepareStatement(query2);
                                                            ps.setString(1, tipohorario.get(i));
                                                            rs=ps.executeQuery();
                                                            if(!rs.next()){
                                                                horario.clear();
                                                                lunes=false;
                                                                martes=false;
                                                                miercoles=false;
                                                                jueves=false;
                                                                viernes=false;
                                                                continue;
                                                            }
                                                            rs.previous();
                                                            while(rs.next()){
                                                                horario.add(rs.getString("dia"));
                                                                horario.add(rs.getString("hora"));
                                                            }
                                                            for (int j = 0; j < horario.size(); j++) {
                                                                System.out.println(tipohorario.get(i)+" "+horario.get(j));
                                                                if(horario.get(j).equals("Lunes")){
                                                                    lunes=true;
                                                                    continue;
                                                                }
                                                                if(horario.get(j).equals("Martes")){
                                                                    System.out.println("Martes true");
                                                                    martes=true;
                                                                    continue;
                                                                }
                                                                if(horario.get(j).equals("Miercoles")){
                                                                    miercoles=true;
                                                                    continue;
                                                                }
                                                                if(horario.get(j).equals("Jueves")){
                                                                    jueves=true;
                                                                    continue;
                                                                }
                                                                if(horario.get(j).equals("Viernes")){
                                                                    viernes=true;
                                                                    continue;
                                                                }
                                                            }
                                                            out.println("<tr>");
                                                            out.println("<td>"+tipohorario.get(i)+"</td>");
                                                            if(lunes){
                                                                out.println("<td>"+horario.get(horario.indexOf("Lunes")+1)+"</td>");
                                                                lunes=false;
                                                            }else{
                                                                out.println("<td></td>");
                                                                lunes=false;
                                                            }
                                                            if(martes){
                                                                out.println("<td>"+horario.get(horario.indexOf("Martes")+1)+"</td>");
                                                                martes=false;
                                                            }else{
                                                                out.println("<td></td>");
                                                                martes=false;
                                                            }
                                                            if(miercoles){
                                                                out.println("<td>"+horario.get(horario.indexOf("Miercoles")+1)+"</td>");
                                                                miercoles=false;
                                                            }else{
                                                                out.println("<td></td>");
                                                                miercoles=false;
                                                            }
                                                            if(jueves){
                                                                out.println("<td>"+horario.get(horario.indexOf("Jueves")+1)+"</td>");
                                                                jueves=false;
                                                            }else{
                                                                out.println("<td></td>");
                                                                jueves=false;
                                                            }
                                                            if(viernes){
                                                                out.println("<td>"+horario.get(horario.indexOf("Viernes")+1)+"</td>");
                                                                viernes=false;
                                                            }else{
                                                                out.println("<td></td>");
                                                                viernes=false;
                                                            }
                                                            out.println("<td><a href='editarTHorarioG.jsp?idtipo_horario="+tipohorario.get(i)+"'>Editar</a></td>");
                                                            out.println("</tr>");
                                                            horario.clear();
                                                            lunes=false;
                                                            martes=false;
                                                            miercoles=false;
                                                            jueves=false;
                                                            viernes=false;
                                                        }
                                                        %>
                                                         </tbody>
                                            </table>
                                                        <%
                                                    }else{
                                                        %><p>No se encontraron registros</p><%
                                                    }
                                                    con.close();
                                                                                cx.cerrar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                           
                                                   
                                    </div>
				</div>
                                <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="">Agregar tipo de horario</h5>
                                                <button class="close" data-dismiss="modal" aria-label="Cerrar">
                                                        <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                                <form action="RegistrarTHorario" onsubmit="return validarTTipo()">
                                                        <div class="modal-body">
                                                                <div class="container-fluid">
                                                                        <div class="row justify-content-center align-items-center">
                                                                                <div class="col-10 ">
                                                                                        <div class="form-group">
                                                                                                <label for="dia">Nombre del horario</label>
                                                                                                <input name="tipoh" id="tipoh" class="form-control" type="text" pattern="([A-ZÑ]{1})|([A-ZÑ]{2})" required="required">
                                                                                                <small class="form-text text-muted">Combinación de 1 o 2 letras del abecedario en mayusculas</small>
                                                                                                <small class="form-text text-muted">Ejemplo: "A", "AB".</small>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                </div>
                                                        </div>

                                                        <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success">Registrar</button>
                                                                <button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                        </div>
                                                </form>
                                        </div>
                                    </div>
				</div>
			</main>
		</div>
	</div>	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/validations.js"></script>
</body>
</html>
