/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego EG
 */
@WebServlet(name = "ServletRegistroGrupo", urlPatterns = {"/ServletRegistroGrupo"})
public class ServletRegistroGrupo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
        String turnoGpo = request.getParameter("Turno");
        String nivelGrupo = request.getParameter("Nivel");
        String numeroGrupo = request.getParameter("Numero");
        HttpSession session=request.getSession();
        try{
            int nivelGpo = Integer.parseInt(nivelGrupo);
            int numeroGpo = Integer.parseInt(numeroGrupo);
            
            BeanGrupo bg = new BeanGrupo(turnoGpo, nivelGpo, numeroGpo);
            String exito = "";
            
            
            if(Grupo.contieneRegistro(turnoGpo.trim(), nivelGpo, numeroGpo))
                exito = "Rantes";
            else{
                exito = Grupo.agregarGrupo(bg);
            }
            
            
                session.setAttribute("resultadoOperacion", exito);
                response.sendRedirect("registrarGrupoResultado.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
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
