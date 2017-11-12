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
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

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
    
    public ServletRegistro(){
        
    }
    
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
        String idMat = request.getParameter("idMateria");
        String nombreMat = request.getParameter("NomMateria");
        String creditosMateria = request.getParameter("Creditos");
        String nivelMateria = request.getParameter("Nivel");
        String cupoMateria = request.getParameter("Cupo");
        String clasificacionMateria = request.getParameter("Clasificacion");
        String serializacionMat = request.getParameter("Serializacion");
        HttpSession session=request.getSession();
        try{
            
            float creditosMat = Float.parseFloat(creditosMateria);
            int nivelMat = Integer.parseInt(nivelMateria);
           
            
            int clasificacionMat = Integer.parseInt(clasificacionMateria);
            
            int cupoMat = Integer.parseInt(cupoMateria);
  
            String exito = "";
            BeanMateria bm = new BeanMateria(idMat, nombreMat, creditosMat, nivelMat, cupoMat,clasificacionMat , serializacionMat);
            if(Materia.materiaRegistrada(bm)){
                exito = "repetido";
            }else{
            exito = Materia.agragarMateria(bm);
            }
            
            session.setAttribute("resultadoOperacion", exito);
            response.sendRedirect("registrarMateriaResultado.jsp");
            
        }catch(Exception e){
            response.getWriter().println(e);
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
