
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
                                    <%
                                    Conexion cx=new Conexion();
                                    Connection con=cx.MySQLConnect();
                                    PreparedStatement ps=null;
                                    ResultSet rs=null;
                                    try {
                                        ps=con.prepareStatement("select * from alumno_has_clase where alumno_boleta=?");
                                        ps.setString(1, idUsuario);
                                        rs=ps.executeQuery();
                                        if(rs.next()){
                                            System.out.println("Ya esta inscrito");
                                            //Ya esta inscrito
                                            %>
                                            <div class="col-11">
                                                <h2 class="my-4">Ya te encuentras inscrito en este semestre</h2>
                                            </div>
                                    <%
                                        }else{
                                            System.out.println("No esta inscrito");
                                            //No esta inscrito
                                            ps=con.prepareStatement("select * from cita_reinscripcion where alumno_boleta=?");
                                            ps.setString(1, idUsuario);
                                            rs=ps.executeQuery();
                                            if(rs.next()){
                                                System.out.println("Tiene cita");
                                                String fechaInicio=rs.getString("FechaInicio");
                                                String fechaFin=rs.getString("FechaFin");
                                                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                                Calendar calendario=Calendar.getInstance();
                                                Date fechaActual=calendario.getTime();
                                                Date dFechaInicio=sdf.parse(fechaInicio);
                                                Date dFechaFin=sdf.parse(fechaFin);
                                                System.out.println("Fecha actual: "+fechaActual);
                                                System.out.println("Fecha actual: "+dFechaInicio);
                                                System.out.println("Fecha actual: "+dFechaFin);
                                                if(fechaActual.after(dFechaInicio)){
                                                    if(fechaActual.before(dFechaFin)){
                                                        System.out.println("Te puedes reinscribir");
                                                    
                                                //Tiene cita de reinscripcion
                                            
                                        
                                    %>
						<div class="col-11">
							<h2 class="my-4">Reinscripción</h2>
                                                        <div class="form-group row justify-content-center" id="t">
                                                            
                                                        </div>
                                                        <h2 class="text-center">Tu Horario</h2>
                                                        <form action="Reinscribir" onsubmit="return confirmar()">
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
                                                                <button type="button" class="btn btn-primary my-3 mx-3" data-toggle="modal" data-target="#fm-modal-grid">Cargar horario</button>
                                                                <button type="submit" class="btn btn-success my-3 mx-3">Terminar reinscripción</button>
                                                            </div>
                                                            <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
                                                                <div class="modal-dialog modal-lg">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="">Horarios guardados</h5>
                                                                            <button class="close" data-dismiss="modal" aria-label="Cerrar">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                            <div class="modal-body">
                                                                                <div class="container-fluid">
                                                                                    <div class="row justify-content-center align-items-center">
                                                                                        <div class="col-10 ">
                                                                                            <%
                                                                                            PreparedStatement ps3=null;
                                                                                            ResultSet rs3=null;
                                                                                            try {
                                                                                                ps3=con.prepareStatement("select distinct Nombre_horario from alumno_quiere_clase where alumno_boleta=?");
                                                                                                ps3.setString(1, idUsuario);
                                                                                                rs3=ps3.executeQuery();
                                                                                                if(rs3.next()){
                                                                                                    rs3.previous();
                                                                                                    out.println("<table class='table table-hover table-responsive'>");
                                                                                                    while(rs3.next()){
                                                                                                        out.println("<tr>");
                                                                                                        out.println("<th>"+rs3.getString("Nombre_horario")+"</th>");
                                                                                                        out.println("<th><button class='btn btn-primary' data-dismiss='modal' onclick=\"agregarHorario('"+idUsuario+"','"+rs3.getString("Nombre_horario")+"')\">Agregar</button></th>");
                                                                                                        out.println("</tr>");
                                                                                                    }
                                                                                                    out.println("</table>");

                                                                                                }else{
                                                                                                    %>
                                                                                                    <h2 class="my-4 text-center">No tienes ningun horario guardado</h2>
                                                                                            <%
                                                                                                }
                                                                                            } catch (Exception e) {
                                                                                            }
                                                                                            %>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
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
                                                                ps=con.prepareStatement(query);
                                                                rs=ps.executeQuery();
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
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }
                                                            %>
                                                        </tbody>
                                                            </table>
                                                        </div>
                                                        
						</div>
                                                <%
                                                            }else{
                                                                System.out.println("Se te paso la fecha");
                                                                %>
                                                                <div class="col-11">
                                                                    <h2 class="my-4 text-center">La cita de reinscripción expiró</h2>
                                                                </div>
                                    <%
                                                            }
                                                        }else{
                                                            System.out.println("Muy temprano");
                                                            
%>
                                                                <div class="col-7">
                                                                    <h2 class="my-4 text-center">Se podra reinscribir a partir de la siguiente fecha </h2>
                                                                    <table class="table table-hover table-responsive">
                                                                        <tr>
                                                                            <th>Fecha de reinscripcion</th>
                                                                            <td><%=sdf.format(dFechaInicio)%> hrs.</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Fecha de caducidad</th>
                                                                            <td><%=sdf.format(dFechaFin)%> hrs.</td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                    <%
                                                        }
                                                    }else{
                                                        System.out.println("No tiene cita");
                                                        %>
                                                        <div class="col-11">
                                                            <h2 class="my-4 text-center">No se ha habilitado la temporada de reinscripción</h2>
                                                        </div>
                                                        <%
                                                    }
                                                }
                                                con.close();
                                                                                cx.cerrar();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                                %>
					</div>
			</main>
		</div>
	</div>	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/reinscripcion.js"></script>
</body>
</html>
