/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reinscripcion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mysql.Conexion;

/**
 *
 * @author Alberto
 */
public class ReinscribirG extends HttpServlet {

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
            String idUsuario=request.getParameter("idalumno");
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            PreparedStatement ps=null;
            int contador=Integer.parseInt(request.getParameter("contador"));
            try {
                for (int i = 0; i < contador; i++) {
                    ps=con.prepareStatement("insert into alumno_has_clase values (?,?)");
                    ps.setString(1,idUsuario);
                    ps.setString(2,request.getParameter("materia"+(i+1)));
                    ps.executeUpdate();
                    ps=con.prepareStatement("update clase set cupo=cupo-1 where idclase=?");
                    ps.setString(1,request.getParameter("materia"+(i+1)));
                    ps.executeUpdate();
//                    out.println("<p>id materia: "+materias.get(i)+"</p>");
                }
                out.println("<script>alert('Se completo con éxito la reinscripcion'); location='editarHorarioAlumnoG.jsp?id="+idUsuario+"';</script>");
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet Reinscribir</title>");            
//                out.println("</head>");
//                out.println("<body>");
//                out.println("<h1>Servlet Reinscribir at " + request.getContextPath() + "</h1>");
//                out.println("<p>materias guardadas "+contador+"</p>");
//                out.println("<p>nombre "+nombre+"</p>");
//                out.println("</body>");
//                out.println("</html>");
            } catch (Exception e) {
                out.println("<script>alert('No se pudo registrar el horario');</script>");
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
