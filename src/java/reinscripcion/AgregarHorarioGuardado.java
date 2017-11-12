/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reinscripcion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.Conexion;

/**
 *
 * @author Alberto
 */
public class AgregarHorarioGuardado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String idUsuario=request.getParameter("idUsuario");
            String nombreHorario=request.getParameter("nombreHorario");
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            System.out.println("us "+idUsuario+" nom"+nombreHorario );
            PreparedStatement ps=null;
            ResultSet rs=null;
            String query="select materias.creditos as creditos, clase.idclase as idclase, grupo.nombre as grupo, materias.nombre as materia, profesor.nombre, profesor.paterno, profesor.materno,clase.tipo_horario_idtipo_horario as tipo_horario, clase.cupo from alumno_quiere_clase,materias,clase,profesor,tipo_horario,grupo" +
                          " where grupo.idgrupo=clase.grupo_idgrupo and profesor.rfc=clase.profesor_rfc and materias.idmaterias=clase.materias_idmaterias and tipo_horario.idTipo_horario=clase.tipo_horario_idtipo_horario and clase.idclase=alumno_quiere_clase.clase_idclase and alumno_quiere_clase.nombre_horario=? "
                        + "and alumno_quiere_clase.alumno_boleta=?";
            try {
                ps=con.prepareStatement(query);
                ps.setString(1, nombreHorario);
                ps.setString(2,idUsuario);
                rs=ps.executeQuery();
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
                boolean lunes=false,martes=false,miercoles=false,jueves=false,viernes=false;
                ArrayList<String> horario=new ArrayList();
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
                    String query2="select horas.dia,horas.hora,tipo_horario.idTipo_horario from tipo_horario,horas,tipo_horario_has_horas where tipo_horario.idtipo_horario=tipo_horario_has_horas.tipo_horario_idtipo_horario and tipo_horario_has_horas.horas_idhorario=horas.idhorario and tipo_horario.idtipo_horario=?";
                    ps=con.prepareStatement(query2);
                    ps.setString(1,tipohorario);
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
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
