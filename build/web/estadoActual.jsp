
<%@page import="mysql.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre=(String)session.getAttribute("nombreUsuario");
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
            <% 
                String boleta=id;
                String idMaterias,materia,formaEval,periodo;
                int calificacion,reprobadas=0,numMaterias=0;
                float calTotal=0,calPromedio;
                float creditos,creditosF,creditosTotal=0,creditosP,creditosESCOM=239.20f;
                try{
                    Conexion cx=new Conexion();
                    Connection conn =cx.MySQLConnect();
                    
                    //Creditos
                    PreparedStatement st = conn.prepareStatement("select Materias.Creditos from Materias,Kardex,Forma_Evaluacion where Kardex.Alumno_Boleta = '"+boleta+"' and Kardex.Forma_Evaluacion_idForma_Evaluacion=Forma_Evaluacion.idForma_Evaluacion and Kardex.Materias_idMaterias=Materias.idMaterias;");
                    ResultSet rs = st.executeQuery();
                    while(rs.next()){
                        creditosTotal=creditosTotal + rs.getFloat("Creditos");
                    }
                    creditosF=creditosESCOM-creditosTotal;
                    creditosP=(creditosTotal*100)/creditosESCOM;
                    
                    //Materias reprobadas
                    st = conn.prepareStatement("select Kardex.Calificacion from Materias,Kardex,Forma_Evaluacion where Kardex.Alumno_Boleta = '"+boleta+"' and Kardex.Forma_Evaluacion_idForma_Evaluacion=Forma_Evaluacion.idForma_Evaluacion and Kardex.Materias_idMaterias=Materias.idMaterias and Kardex.Calificacion < 6;");
                    rs = st.executeQuery();
                    while(rs.next()){
                        reprobadas++;
                    }
                    
                    //Promedio
                    st = conn.prepareStatement("select Kardex.Calificacion from Materias,Kardex,Forma_Evaluacion where Kardex.Alumno_Boleta = '"+boleta+"' and Kardex.Forma_Evaluacion_idForma_Evaluacion=Forma_Evaluacion.idForma_Evaluacion and Kardex.Materias_idMaterias=Materias.idMaterias and Kardex.Calificacion;");
                    rs = st.executeQuery();
                    while(rs.next()){
                        numMaterias++;
                        calTotal=calTotal + rs.getInt("Calificacion");
                    }
                    calPromedio=calTotal/numMaterias;
            %>
		<div class="container-fluid">
			<div class="row justify-content-between encabezado">
				<div class="col-3 my-2">
					<a class="" href="#"><img class="img-fluid" src="img/logo/logo2.png" alt="Logo" width="150" height="50"></a>
				</div>
				<div class="col-3 my-2 text-right">
					<div class="btn-group mr-2 mb-2 ">
						<button class="btn btn-primary dropdown-toggle" id="dp-categorias" data-toggle="dropdown">Bienvenido <%=nombre%></button>
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
				<main class="main col ">
					<div class="container ">
						<div class="row align-items-center ">
							<div class="col-12">
								<h1 class="display-5 my-3" align="center">Estado Actual</h1> <br><br>
							</div>
						</div>
						<div class="row align-items-center justify-content-center">
							<div class="col-10 ">
								<table class="table table-hover table-sm">
									<tr>
										<th>Número de boleta</th>
										<td><%=id%></td>
									</tr>
									<tr>
										<th>Nombre</th>
										<td><%=nombre%></td>
									</tr>
									<tr>
										<th>Créditos obtenidos</th>
										<td><%=creditosTotal%></td>
									</tr>
									<tr>
										<th>Porcentaje de créditos</th>
										<td><%=creditosP%>%</td>
									</tr>
									<tr>
										<th>Créditos por obtener</th>
										<td><%=creditosF%></td>
									</tr>
									<tr>
										<th>Materias reprobadas</th>
										<td><%=reprobadas%></td>
									</tr>
									<tr>
										<th>Promedio</th>
										<td><%=calPromedio%></td>
									</tr>
								</table>
                                                                <%
                                                                            st = conn.prepareStatement("select Materias.idMaterias,Materias.Nombre, Materias.Creditos, Forma_Evaluacion.Forma_Evaluacion, Kardex.Periodo,Kardex.Calificacion from Materias,Kardex,Forma_Evaluacion where Kardex.Alumno_Boleta = '"+boleta+"' and Kardex.Forma_Evaluacion_idForma_Evaluacion=Forma_Evaluacion.idForma_Evaluacion and Kardex.Materias_idMaterias=Materias.idMaterias;");
                                                                            rs = st.executeQuery();
                                                                            %>
                                                                            <table class="table table-hover">
                                                                                <thead class="table-inverse">
                                                                                    <th>Clave</th>
                                                                                    <th>Materia</th>
                                                                                    <th>Créditos</th>
                                                                                    <th>Forma Evaluación</th>
                                                                                    <th>Periodo</th>
                                                                                    <th>Calificación</th>
                                                                                </thead>
                                                                            <%
                                                                            while(rs.next()){

                                                                            %>
                                                                                <tr class="table-success">
                                                                                <%
                                                                                idMaterias=rs.getString("idMaterias");
                                                                                materia=rs.getString("Nombre");
                                                                                creditos=rs.getFloat("Creditos");
                                                                                creditosTotal=creditosTotal+creditos;
                                                                                formaEval=rs.getString("Forma_Evaluacion");
                                                                                periodo=rs.getString("Periodo");
                                                                                calificacion=rs.getInt("Calificacion");

                                                                               %>
                                                                                    <td><%=idMaterias%></td>
                                                                                    <td><%=materia%></td>
                                                                                    <td><%=creditos%></td>
                                                                                    <td><%=formaEval%></td>
                                                                                    <td><%=periodo%></td>
                                                                                    <td><%=calificacion%></td>
                                                                               </tr>
                                                                               <%
                                                                            }
                                                                            %>

                                                                            </table>   
                                                                            <%
                                                                            st.close();
                                                                            conn.close();
                                                                            cx.cerrar();
                                                                        }catch (Exception e){
                                                                            System.err.println("Got an exception! ");
                                                                            System.err.println(e.getMessage());
                                                                        }

                                                                    %>
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