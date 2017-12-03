<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="mysql.Conexion"%>
<%-- 
    Document   : crearHorario
    Created on : 17/10/2017, 01:30:15 AM
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombreUsuario=(String)session.getAttribute("nombreUsuario");
    String id=(String)session.getAttribute("idUsuario");
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
					<button class="btn btn-primary dropdown-toggle" id="dp-categorias" data-toggle="dropdown">Bienvenido  <%=nombreUsuario%></button>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dp-categorias">
						<a href="cambiarContraAl.jsp" class="dropdown-item"><img class="mr-2" src="img/alumno/Cambiar_contraseña.png" width="30" alt="">Cambiar contraseña</a>
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
								<li><a class="subitems" href="estadoActual.jsp"><img class="mr-2" src="img/alumno/Historial_academico.png" width="30" alt="">Historial académico</a></li>
							</ul>
						</li>
						<li id="heading2">
							<a href="#collapse2" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse2">Inscripción actual</a>
							<ul id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2">
								<li><a class="subitems" href="horarioActual.jsp"><img class="mr-1" src="img/alumno/Horario_actual.png" width="30" alt="">Horario actual</a></li>
							</ul>
						</li>
						<li id="heading3">
							<a href="#collapse3" data-toggle="collapse" data-parent="#acordion" aria-expanded="true" aria-controls="collapse3">Reinscripción</a>
							<ul id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3">
								<li><a class="subitems" href="buscarHorarios.jsp"><img class="mr-1" src="img/alumno/Horarios_y_disponibilidad.png" width="30" alt="">Horarios y disponibilidad</a></li>
								<li><a class="subitems" href="crearHorario.jsp"><img class="mr-1" src="img/alumno/Crear_horario.png" width="30" alt="">Crear horario</a></li>
								<li><a class="subitems" href="reinscripcion.jsp"><img class="mr-1" src="img/alumno/Reinscripcion.png" width="30" alt="">Reinscripción</a></li>
							</ul>
						</li>
					</ul>
					</nav>
			</div>
			<main class="main col">
				<div class="row justify-content-center align-items-start main">
						<div class="col-11">
							<h2 class="my-4">Crear Horario</h2>
                                                        <h2 class="text-center">Tu Horario</h2>
                                                        <form action="CrearHorario" onsubmit="return validar()">
                                                            <table class="table table-hover tablehorario" id="tablaHorario">
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
                                                            </table>
                                                                <input id="contador" name="contador" type="hidden" value="0">
                                                            <div class="form-group row justify-content-center" id="t">
                                                                <button type="button" class="btn btn-primary my-3" data-toggle="modal" data-target="#fm-modal-grid">Guardar horario</button>
                                                            </div>
                                                            <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
                                                                <div class="modal-dialog modal-lg">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="">Nombre del horario</h5>
                                                                            <button class="close" data-dismiss="modal" aria-label="Cerrar">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                            <div class="modal-body">
                                                                                <div class="container-fluid">
                                                                                    <div class="row justify-content-center align-items-center">
                                                                                        <div class="col-10 ">
                                                                                            <div class="form-group">
                                                                                                <label for="dia">Nombre del horario</label>
                                                                                                <input name="nombreh" id="tipoh" class="form-control" type="text" pattern="[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙñ\s]+" required="required">
                                                                                                <small class="form-text text-muted">Sólo letras</small>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-success">Registrar</button>
                                                                                    <button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                                                            </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <h2 class="text-center">Clases</h2>
								<div class="form-group">
                                                                    <label id="destino"></label>
									<input type="text" id="filtrar" class="form-control mr-3" placeholder="Buscar materia">
								</div>
                                                        
                                                        <div id="destinoBusqueda">
                                                            <%
                                                            Conexion cx=new Conexion();
                                                            Connection con=cx.MySQLConnect();
                                                            String textoBuscar=request.getParameter("filtro");
                                                            String query="select materias.creditos as creditos, clase.idclase as idclase, grupo.nombre as grupo, materias.nombre as materia, profesor.nombre, profesor.paterno, profesor.materno,clase.tipo_horario_idtipo_horario as tipo_horario, clase.cupo from materias,clase,profesor,tipo_horario,grupo" +
                                                            " where grupo.idgrupo=clase.grupo_idgrupo and profesor.rfc=clase.profesor_rfc and materias.idmaterias=clase.materias_idmaterias and tipo_horario.idTipo_horario=clase.tipo_horario_idtipo_horario";
                                                            String grupo="";
                                                            String materia="";
                                                            String nombre="";
                                                            String paterno="";
                                                            String materno="";
                                                            String tipohorario="";
                                                            String cupo="";
                                                            String idclase="";
                                                            String creditos="";
                                                            int noclase=0;
                                                            %>
                                                            
                                                            <%
                                                            try {
                                                                PreparedStatement ps=con.prepareStatement(query);
                                                                ResultSet rs=ps.executeQuery();
                                                                boolean lunes=false,martes=false,miercoles=false,jueves=false,viernes=false;
                                                                ArrayList<String> horario=new ArrayList();
                                                                if(rs.next()){
                                                                    rs.previous();
                                                                    out.println("<table class='table table-hover table-responsive' id='tablaBusqueda'>");
                                                                    out.println("<thead class=\"thead-inverse\">\n" +
"                                                                            <th>Grupo</th>\n" +
"                                                                            <th>Materia</th>\n" +
"                                                                            <th>Profesor</th>\n" +
"                                                                            <th>Lunes</th>\n" +
"                                                                            <th>Martes</th>\n" +
"                                                                            <th>Miércoles</th>\n" +
"                                                                            <th>Jueves</th>\n" +
"                                                                            <th>Viernes</th>\n" +
"                                                                            <th>Disponibilidad</th>\n" +
"                                                                            <th></th>\n" +
"                                                                    </thead>");
                                                                    out.println("<tbody class='buscar'>");
                                                                while(rs.next()){
                                                                    noclase++;
                                                                    grupo=rs.getString("grupo");
                                                                    materia=rs.getString("materia");
                                                                    nombre=rs.getString("nombre");
                                                                    paterno=rs.getString("paterno");
                                                                    materno=rs.getString("materno");
                                                                    tipohorario=rs.getString("tipo_horario");
                                                                    cupo=rs.getString("cupo");
                                                                    idclase=rs.getString("idclase");
                                                                    creditos=rs.getString("creditos");
                                                                    String query2="select horas.dia,horas.hora,tipo_horario.idTipo_horario from tipo_horario,horas,tipo_horario_has_horas where tipo_horario.idtipo_horario=tipo_horario_has_horas.tipo_horario_idtipo_horario and tipo_horario_has_horas.horas_idhorario=horas.idhorario and tipo_horario.idtipo_horario='"+tipohorario+"'";
                                                                    ps=con.prepareStatement(query2);
                                                                    ResultSet rs2=ps.executeQuery();
                                                                    while(rs2.next()){
                                                                        horario.add(rs2.getString("dia"));
                                                                        horario.add(rs2.getString("hora"));
                                                                    }

                                                                    out.println("<tr id='clase"+noclase+"'>");
                                                                    out.println("<input name='materia"+noclase+"' class='materia' type='hidden' value='"+idclase+"'>");
                                                                    out.println("<input name='horario' id='tipoh"+noclase+"' type='hidden' value='"+tipohorario+"'>");
                                                                    out.println("<input name='creditos' id='creditos"+noclase+"' type='hidden' value='"+creditos+"'>");
                                                                    out.println("<td>"+grupo+"</td>");
                                                                    out.println("<td class='nombreMateria'>"+materia+"</td>");
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
                                                                    out.println("<td class='cupo'>"+cupo+"</td>");
                                                                    out.println("<td><a href='#' onclick='agregar(this)'>Agregar</a></td>");
                                                                    out.println("</tr>");
                                                                    horario.clear();
                                                                    lunes=false;
                                                                    martes=false;
                                                                    miercoles=false;
                                                                    jueves=false;
                                                                    viernes=false;
                                                                }
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
			</main>
		</div>
	</div>	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/crearHorario.js"></script>
</body>
</html>
