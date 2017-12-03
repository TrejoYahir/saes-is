package reinscripcion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.Conexion;

public class BuscarClaseR extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        String textoBuscar=request.getParameter("textoBuscar");
        Conexion cx=new Conexion();
        Connection con=cx.MySQLConnect();
        String grupo="";
        String materia="";
        String nombre="";
        String paterno="";
        String materno="";
        String tipohorario="";
        String cupo="";
        ArrayList<String> horario=new ArrayList();
        boolean lunes=false,martes=false,miercoles=false,jueves=false,viernes=false;
        String query="select grupo.nombre as grupo, materias.nombre as materia, profesor.nombre, profesor.paterno, profesor.materno,clase.tipo_horario_idtipo_horario as tipo_horario, clase.cupo from materias,clase,profesor,tipo_horario,grupo" +
        " where grupo.idgrupo=clase.grupo_idgrupo and profesor.rfc=clase.profesor_rfc and materias.idmaterias=clase.materias_idmaterias and tipo_horario.idTipo_horario=clase.tipo_horario_idtipo_horario and "+
        "(profesor.nombre like '%"+textoBuscar+"%' or materias.nombre like '%"+textoBuscar+"%')";
        try {
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                rs.previous();
                out.println("<table class='table table-hover' id='tablaBusqueda'>");
                    out.println("<thead class=\"thead-inverse\">\n" +
"                                                                            <th>Grupo</th>\n" +
"                                                                            <th>Materia</th>\n" +
"                                                                            <th>Profesor</th>\n" +
"                                                                            <th>Lunes</th>\n" +
"                                                                            <th>Martes</th>\n" +
"                                                                            <th>Miercoles</th>\n" +
"                                                                            <th>Jueves</th>\n" +
"                                                                            <th>Viernes</th>\n" +
"                                                                            <th>Disponibilidad</th>\n" +
"                                                                            <th></th>\n" +
"                                                                    </thead>");
                while(rs.next()){
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
                    out.println("<td><a href='#' onclick='agregar(this)'>Agregar</a></td>");
                    horario.clear();
                    out.println("</tr>");
                    lunes=false;
                    martes=false;
                    miercoles=false;
                    jueves=false;
                    viernes=false;
                }
                out.println("</table>");
            }else{
                out.println("No se han encontrado resultados");
            }
            con.close();
            cx.cerrar();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        out.println("");
        
    }

}
