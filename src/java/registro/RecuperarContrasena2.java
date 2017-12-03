package registro;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class RecuperarContrasena2 extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            String ncontra=request.getParameter("contraNueva");
            String usuario=request.getParameter("idusuario");
            String idUsuario="";
            boolean rfc=false,boleta=false;
            if(usuario.length()==10){
                boleta=true;
            }else{
                rfc=true;
            }
            try {
                if(boleta){
                    PreparedStatement ps=con.prepareStatement("select usuario_idusuario from alumno where boleta=?");
                    ps.setString(1,usuario);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        idUsuario=rs.getString("usuario_idusuario");
                    }
                    ps=con.prepareStatement("update usuario set contra=? where idusuario=?");
                    ps.setString(1, ncontra);
                    ps.setString(2, idUsuario);
                    ps.executeUpdate();
                    con.close();
                    cx.cerrar();
                    out.println("<script>alert('Se actualizaron los datos correctamente'); location='login.jsp';</script>");
                }else{
                    PreparedStatement ps=con.prepareStatement("select usuario_idusuario from academico where rfc=?");
                    ps.setString(1,usuario);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next()){
                        rs.previous();
                        while(rs.next()){
                            idUsuario=rs.getString("usuario_idusuario");
                        }
                        ps=con.prepareStatement("update usuario set contra=? where idusuario=?");
                        ps.setString(1, ncontra);
                        ps.setString(2, idUsuario);
                        ps.executeUpdate();
                        con.close();
                        cx.cerrar();
                        out.println("<script>alert('Se actualizaron los datos correctamente'); location='login.jsp';</script>");
                    }else{
                         PreparedStatement ps2=con.prepareStatement("select usuario_idusuario from gestion where rfc=?");
                        ps.setString(1,usuario);
                        ResultSet rs2=ps.executeQuery();
                        while(rs.next()){
                            idUsuario=rs.getString("usuario_idusuario");
                        }
                        ps=con.prepareStatement("update usuario set contra=? where idusuario=?");
                        ps.setString(1, ncontra);
                        ps.setString(2, idUsuario);
                        ps.executeUpdate();
                        con.close();
                        cx.cerrar();
                        out.println("<script>alert('Se actualizaron los datos correctamente'); location='login.jsp';</script>");
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
