/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.Conexion;

/**
 *
 * @author Alberto
 */
public class AsignarHorario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            String materia=request.getParameter("materia");
            String profesor=request.getParameter("profesor");
            String grupo=request.getParameter("grupo");
            String horario=request.getParameter("horario");
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            String cupo="";
            try {
                PreparedStatement ps=con.prepareStatement("select cupo from materias where idmaterias='"+materia+"'");
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    cupo=rs.getString("cupo");
                }
                if(validado(materia,profesor,grupo,horario,out)){
                    ps=con.prepareStatement("insert into clase (Grupo_idGrupo,Materias_idmaterias,profesor_rfc,tipo_horario_idtipo_horario,cupo)values(?,?,?,?,?)");
                    ps.setString(1, grupo);
                    ps.setString(2, materia);
                    ps.setString(3, profesor);
                    ps.setString(4, horario);
                    ps.setString(5, cupo);
                    ps.executeUpdate();
                    out.println("<script>alert('Se ha registrado el horario correctamente'); location='asignarHorario.jsp';</script>");
                }else{
                    out.println("<script>location='asignarHorario.jsp';</script>");
                }
                
                
                
            } catch (SQLException ex) {
                ex.printStackTrace();
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

    private boolean validado(String materia, String profesor, String grupo, String horario, PrintWriter out) {
        boolean valido=true;
        
        Conexion cx=new Conexion();
        Connection con=cx.MySQLConnect();
        PreparedStatement ps=null;
        ResultSet rs=null;
        /*VALIDACION DE HORARIO DEL PROFESOR*/
        try {
            ps=con.prepareStatement("select * from clase where tipo_horario_idtipo_horario=? and profesor_rfc=?");
            ps.setString(1, horario);
            ps.setString(2, profesor);
            rs=ps.executeQuery();
            if(rs.next()){
                out.println("<script>alert('No se aceptan duplicados de horarios para un mismo profesor');</script>");
                valido=false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        /*VALIDACION DE MATERIA Y GRUPO*/
        try {
            ps=con.prepareStatement("select * from clase where grupo_idgrupo=? and materias_idmaterias=?");
            ps.setString(1, grupo);
            ps.setString(2, materia);
            rs=ps.executeQuery();
            if(rs.next()){
                out.println("<script>alert('No se aceptan duplicados de materias en un mismo grupo');</script>");
                valido=false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        /*VALIDACION DE HORARIO Y MATERIA*/
        try {
            ps=con.prepareStatement("select * from clase where grupo_idgrupo=? and tipo_horario_idtipo_horario=?");
            ps.setString(1, grupo);
            ps.setString(2, horario);
            rs=ps.executeQuery();
            if(rs.next()){
                out.println("<script>alert('El horario no está disponible, seleccione otro');</script>");
                valido=false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return valido;
    }
    
}
