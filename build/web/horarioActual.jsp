<%-- 
    Document   : horarioActual
    Created on : 17/10/2017, 01:18:39 AM
    Author     : Alberto
--%>

<%@page import="mysql.Conexion"%>
<%@page import="java.util.ArrayList"%>
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
        <%! ArrayList<String> diasSemana = new ArrayList();%>
        
        
        <%!String query = "SELECT grupo.Nombre as Grupo, materias.Nombre as Materia, profesor.Nombre, profesor.Paterno as Paterno, profesor.Materno as Materno,  horas.Dia, horas.Hora "+
        "FROM ((((((alumno_has_clase inner join clase on alumno_has_clase.Clase_idClase = clase.idClase) inner join "+
        "grupo on clase.Grupo_idGrupo = grupo.idGrupo) inner join "+
        "materias  on clase.Materias_idMaterias = materias.idMaterias) inner join "+
        "profesor on clase.Profesor_RFC = profesor.RFC ) inner join "+
        "tipo_horario on clase.Tipo_Horario_idTipo_Horario = tipo_horario.idTipo_Horario) inner join "+
        "tipo_horario_has_horas on tipo_horario.idTipo_Horario = tipo_horario_has_horas.Tipo_Horario_idTipo_Horario) inner join "+
        "horas on tipo_horario_has_horas.Horas_idHorario = horas.idHorario "; %>
        
        <%       
            String boleta = id;
            diasSemana.add("Lunes"); diasSemana.add("Martes"); diasSemana.add("Miercoles"); diasSemana.add("Jueves"); diasSemana.add("Viernes");
        %>
	<body>
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
					<div class="row align-items-center  ">
						<div class="col-12">
							<h1 class="display-5 mt-3" align="center">Horario actual</h1> <br>
						</div>
					</div>
					<div class="row align-items-center justify-content-center alturacontenido"><!--Esto es una fila de la página aú no continene nada -->
					<div class="col-11 ">
                                            <%
                                                
                                                Conexion cx=new Conexion();
                                                Connection con =cx.MySQLConnect();
                                                PreparedStatement psh = null;
                                                String q = "";
                                                try {
                                                     q = query +" WHERE alumno_has_clase.Alumno_Boleta = ?";
                                                     psh = con.prepareStatement(q);
                                                     psh.setString(1, boleta);
                                                     ResultSet rs = psh.executeQuery();
                                                     String matAnterior = "";
                                                     if(!rs.first()){
                                                     out.print("Aún no estas inscrito");
                                            %>
                                            
                                           <!-- <script>alert("No cuentas con materias inscritas en este momento");</script> -->
                                            
                                            <%
                                                }else{
                                            %>    
						<table class="table table-striped table-bordered table-hover table-responsive">
							<thead class="thead-inverse">
								<tr>
									<th>Grupo</th>
									<th>Materia</th>
									<th>Profesor</th>
									<th>Lunes</th>
									<th>Martes</th>
									<th>Miércoles</th>
									<th>Jueves</th>
									<th>Viernes</th>
								</tr>
							</thead>
							<tbody>
                                                            <%
                                                                while(rs.next()){
                                                                    String grupo = rs.getString("Grupo");
                                                                    String materia = rs.getString("Materia");
                                                                    String prof = rs.getString("Nombre");
                                                                    String paterno = rs.getString("Paterno");
                                                                    String materno = rs.getString("Materno");
                                                                    String nombreProfesor = prof +" "+paterno+" "+materno;
                                                                    //String dia = rs.getString("Dia");
                                                                    //String hora = rs.getString("Hora"); 
                                                            %>
                                                            <tr>
                                                                <%if(!matAnterior.equals(materia))
                                                                    {
                                                                %>
                                                                
                                                                <th><%=grupo%></th>
                                                                <th><%=materia%></th>
                                                                <th><%=nombreProfesor %></th>
                                                                        
                                                                
                                                                <%
                                                                    
                                                                    String query2 = "SELECT horas.Dia as Dia, horas.Hora as Hora "+
                                                                            "FROM ((((alumno_has_clase inner join clase on alumno_has_clase.Clase_idClase = clase.idClase) inner join " +
                                                                            "tipo_horario on clase.Tipo_Horario_idTipo_Horario = tipo_horario.idTipo_Horario) inner join "+
                                                                            "tipo_horario_has_horas on tipo_horario.idTipo_Horario = tipo_horario_has_horas.Tipo_Horario_idTipo_Horario) inner join "+
                                                                            "horas on tipo_horario_has_horas.Horas_idHorario = horas.idHorario)  inner join "+ 
                                                                            "materias on clase.Materias_idMaterias = materias.idMaterias ";
                                                                    Connection conDH = null;
                                                                    PreparedStatement psDH = null;
                                                                    try {
                                                                        int j =1;
                                                                        Conexion cs=new Conexion();
                                                                        conDH = cs.MySQLConnect();
                                                                        query2 = query2 +" WHERE alumno_has_clase.Alumno_Boleta = "+id+" and  materias.Nombre = ?";
                                                                        psDH = conDH.prepareStatement(query2);
                                                                        psDH.setString(1, materia);
                                                                        ResultSet rsDH = psDH.executeQuery();
                                                                       
                                                                        String dia = "";
                                                                        String hora = "";
                                                                        String horaAnterior = "";
                                                                        //for(int j = 1; j<=5; j++){
                                                                           for(String d : diasSemana){
                                                                           if( rsDH.absolute(j)){
                                                                           dia = rsDH.getString("Dia");
                                                                           hora = rsDH.getString("Hora");
                                                                           horaAnterior = "";
                                                                                if(dia.equals(d)){
                                                                                        j++;
                                                                %>
                                                                
                                                                <th><%=hora%></th>
                                                               
                                                                <%      
                                                                            

                                                                
                                                                        }else{
                                                                
                                                                 %>
                                                                 
                                                                 <th>  </th>
                                                                 
                                                                 <%
                                                                     }
                                                                            
                                                                  %>
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  <%
                                                                      if(d.equals("Jueves") && (j==4 || j==5)){
                                                                          
                                                                   %>
                                                                   
                                                                   <th>  </th>
                                                                   
                                                                   <%
                                                                     }
                                                                        }
                                                                       
                                                                   }//for dias
                                                                        
                                                                     %>
                                                                    
                                                                <%   
                                                                    conDH.close();
                                                                    }catch(Exception ea){out.print("Interno "+ea);}
                                                                  %>   
                                                                
                                                                
                                                                 
                                                                <%
                                                                    }
                                                                      matAnterior = materia; 
                                                                %>
                                                              
                                                                   
                                            
                                                            </tr>
                                                                
                                                            <%
                                                               }
                                                            %>
							</tbody>
                                                        
						</table>
                                                <%   }//else de materias
                                                    con.close();
                                                                                cx.cerrar();
                                                  }catch(Exception e){out.print("General "+e.getMessage());}
                                                 
                                                        //finally{psh.close(); con.close(); }
                                                     %>
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