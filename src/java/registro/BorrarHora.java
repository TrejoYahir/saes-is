/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class BorrarHora extends HttpServlet {

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
            String tipohorario=request.getParameter("idtipo_horario");
            String idhorario=request.getParameter("idhorario");
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            PreparedStatement ps=null;
            ResultSet rs=null;
            try {
                ps=con.prepareStatement("select count(*) from horas, tipo_horario_has_horas, tipo_horario where horas.idhorario = tipo_horario_has_horas.horas_idhorario and tipo_horario_has_horas.tipo_horario_idtipo_horario = tipo_horario.idtipo_horario and tipo_horario.idtipo_horario=?");
                ps.setString(1,tipohorario);
                rs = ps.executeQuery();
            if(rs.next()){
                if(rs.getInt(1)==1){
                    out.println("<script>alert('No puedes dejar el horario sin ninguna clase'); location='editarTHorarioG.jsp?idtipo_horario="+tipohorario+"'</script>");
                }else{
                    ps=con.prepareStatement("delete from tipo_horario_has_horas where tipo_horario_idtipo_horario=? and horas_idhorario=?");
                ps.setString(1, tipohorario);
                ps.setString(2, idhorario);
                ps.executeUpdate();
                out.println("<script>alert('Hora borrada correctamente'); location='editarTHorarioG.jsp?idtipo_horario="+tipohorario+"'</script>");
                }
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
