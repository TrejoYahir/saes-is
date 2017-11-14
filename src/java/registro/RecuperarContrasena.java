/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.Conexion;

/**
 *
 * @author Alberto
 */
public class RecuperarContrasena extends HttpServlet {

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
            String idusuario=request.getParameter("idusuario");
            boolean existe=false;
            //Buscando usuario
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            PreparedStatement ps=null;
            ResultSet rs=null,rs2=null,rs3=null;
            String correo="";
            try {
                ps=con.prepareStatement("select alumno.*,usuario.* from alumno,usuario where boleta=? and usuario.idusuario=alumno.usuario_idusuario");
                ps.setString(1, idusuario);
                rs=ps.executeQuery();
                if(rs.next()){
                    existe=true;
                    correo=rs.getString("Mail");
                }else{
                    ps=con.prepareStatement("select * from gestion where rfc=?");
                    ps.setString(1, idusuario);
                    rs2=ps.executeQuery();
                    if(rs2.next()){
                        existe=true;
                        correo=rs.getString("Mail");
                    }else{
                        ps=con.prepareStatement("select * from academico where rfc=?");
                        ps.setString(1, idusuario);
                        rs2=ps.executeQuery();
                        if(rs2.next()){
                            existe=true;
                            correo=rs.getString("Mail");
                        }else{
                            out.println("<script>alert('No hay cuenta asociada a este usuario. Ingrese un usuario válido'); location='reestablecerContrasena.jsp';</script>");
                        }
                    }
                }
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(existe){
                System.out.println("Encontrado");
                enviarCorreo(correo,idusuario);
                out.println("<script>alert('Se ha enviado un correo para la restauración de la contraseña al correo asociado con la cuenta.'); location='index.html';</script>");
            }else{
                System.out.println("No encontrado");
            }
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RecuperarContrasena</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RecuperarContrasena at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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

    private void enviarCorreo(String correo,String idusuario){
        try {
            Properties props = new Properties();

            // Nombre del host de correo, es smtp.gmail.com
            props.setProperty("mail.smtp.host", "smtp.gmail.com");

            // TLS si está disponible
            props.setProperty("mail.smtp.starttls.enable", "true");

            // Puerto de gmail para envio de correos
            props.setProperty("mail.smtp.port","587");

            // Nombre del usuario
            props.setProperty("mail.smtp.user", "saessoporte@gmail.com");

            // Si requiere o no usuario y password para conectarse.
            props.setProperty("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            Session session = Session.getDefaultInstance(props);
            session.setDebug(true);
            MimeMessage message = new MimeMessage(session);

            // Quien envia el correo
            message.setFrom(new InternetAddress("saessoporte@gmail.com"));

            // A quien va dirigido
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            message.setSubject("Reestablecer contraseña");
            message.setText("<p>Se ha pedido una solicitud para cambiar la contraseña de esta cuenta.<br/> Para cambiar su contraseña entrar al siguiente <a href='https://saes-is.herokuapp.com/reestablecerContrasena2.jsp?idusuario="+idusuario+"'>enlace</a></p>","ISO-8859-1","html");
            Transport t = session.getTransport("smtp");
            t.connect("saessoporte@gmail.com","SaesSoporte123");
            t.sendMessage(message,message.getAllRecipients());
            t.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("No se pudo enviar el correo");
                        
        }
        
    }
}
