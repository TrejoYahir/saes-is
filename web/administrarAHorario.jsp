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
    request.setCharacterEncoding("UTF-8");
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
    <%
            String keyword = "";
            String filtro = "";
            if (request.getParameter("filtro") != null) {
                keyword = request.getParameter("filtro");
                filtro = " and (profesor.nombre like '%"+keyword+"%' or materias.nombre like '%"+keyword+"%')";
            }else{
                filtro = "";
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
                            <div class="row align-items-start justify-content-center main">
					<div class="col-9">
						<form action="administrarAHorario.jsp">
                                                    <h2 class="my-3">Administrar horarios</h2>
                                                        <div class="form-group">
                                                            <input type="text" name="filtro" id="materia" placeholder="Materia o profesor" class="form-control my-2">
                                                        </div>
							<div class="form-group row justify-content-center" id="t">
								<button type="submit" class="btn btn-primary mt-3 ">Enviar</button>
							</div>
						</form>
						<div class="row">
                                                    <%
                                                    Conexion cx=new Conexion();
                                                    Connection con=cx.MySQLConnect();
                                                    String query="select clase.idclase as idclase, grupo.nombre as grupo, materias.nombre as materia, profesor.nombre, profesor.paterno, profesor.materno,clase.tipo_horario_idtipo_horario as tipo_horario, clase.cupo from materias,clase,profesor,tipo_horario,grupo" +
                                                    " where grupo.idgrupo=clase.grupo_idgrupo and profesor.rfc=clase.profesor_rfc and materias.idmaterias=clase.materias_idmaterias and tipo_horario.idTipo_horario=clase.tipo_horario_idtipo_horario"+
                                                    filtro;
                                                    String grupo="";
                                                    String materia="";
                                                    String nombre="";
                                                    String paterno="";
                                                    String materno="";
                                                    String tipohorario="";
                                                    String cupo="";
                                                    String idclase="";
                                                    %>
							<div class="col-12 resultadosHorarios">
								<table class="table table-striped table-bordered table-hover table-responsive">
									
                                                                            <%
                                                                            try {
                                                                                PreparedStatement ps=con.prepareStatement(query);
                                                                                ResultSet rs=ps.executeQuery();
                                                                                boolean lunes=false,martes=false,miercoles=false,jueves=false,viernes=false;
                                                                                ArrayList<String> horario=new ArrayList();
                                                                                if(rs.next()){
                                                                                    rs.previous();
                                                                                    %>
                                                                                    <thead class="thead-inverse">
                                                                                            <th>Grupo</th>
                                                                                            <th>Materia</th>
                                                                                            <th>Profesor</th>
                                                                                            <th>Lunes</th>
                                                                                            <th>Martes</th>
                                                                                            <th>Miércoles</th>
                                                                                            <th>Jueves</th>
                                                                                            <th>Viernes</th>
                                                                                            <th>Disponibilidad</th>
                                                                                            <th></th>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                    <%
                                                                                
                                                                                while(rs.next()){
                                                                                    idclase=rs.getString("idclase");
                                                                                    grupo=rs.getString("grupo");
                                                                                    materia=rs.getString("materia");
                                                                                    nombre=rs.getString("nombre");
                                                                                    paterno=rs.getString("paterno");
                                                                                    materno=rs.getString("materno");
                                                                                    tipohorario=rs.getString("tipo_horario");
                                                                                    cupo=rs.getString("cupo");
                                                                                    String query2="select horas.dia,horas.hora,tipo_horario.idTipo_horario from tipo_horario,horas,tipo_horario_has_horas where tipo_horario.idtipo_horario=tipo_horario_has_horas.tipo_horario_idtipo_horario and tipo_horario_has_horas.horas_idhorario=horas.idhorario and tipo_horario.idtipo_horario='"+tipohorario+"'";
                                                                                    ps=con.prepareStatement(query2);
                                                                                    ResultSet rs2=ps.executeQuery();
                                                                                    while(rs2.next()){
                                                                                        horario.add(rs2.getString("dia"));
                                                                                        horario.add(rs2.getString("hora"));
                                                                                    }

                                                                                    out.println("<tr>");
                                                                                    out.println("<td>"+grupo+"</td>");
                                                                                    out.println("<td>"+materia+"</td>");
                                                                                    out.println("<td>"+nombre+" "+paterno+" "+materno+"</td>");
                                                                                    for (int i = 0; i < horario.size(); i++) {
                                                                                        if(horario.get(i).equals("Lunes")){
                                                                                            lunes=true;
                                                                                            continue;
                                                                                        }
                                                                                        if(horario.get(i).equals("Martes")){
                                                                                            martes=true;
                                                                                            continue;
                                                                                        }
                                                                                        if(horario.get(i).equals("Miercoles")){
                                                                                            miercoles=true;
                                                                                            continue;
                                                                                        }
                                                                                        if(horario.get(i).equals("Jueves")){
                                                                                            jueves=true;
                                                                                            continue;
                                                                                        }
                                                                                        if(horario.get(i).equals("Viernes")){
                                                                                            viernes=true;
                                                                                            continue;
                                                                                        }
                                                                                    }
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
                                                                                    out.println("<td>"+cupo+"</td>");
                                                                                    out.println("<td><a href='editarHorario.jsp?idClase="+idclase+"'>Editar</a></td>");
                                                                                    out.println("</tr>");
                                                                                    horario.clear();
                                                                                    lunes=false;
                                                                                    martes=false;
                                                                                    miercoles=false;
                                                                                    jueves=false;
                                                                                    viernes=false;
                                                                                }
                                                                                }else{
                                                                                  %>
                                                                                    <p>No se encontraron resultados</p>  
                                                                                  <%
                                                                                }
                                                                                con.close();
                                                                                cx.cerrar();
                                                                            } catch (Exception e) {
                                                                                e.printStackTrace();
                                                                            }
                                                                            
                                                                            %>
                                                                        </tbody>
								</table>
							</div>
						</div>
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
