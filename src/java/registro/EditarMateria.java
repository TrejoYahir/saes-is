/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import mysql.Conexion;

/**
 *
 * @author Yahir
 */
public class EditarMateria extends HttpServlet {
   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Connection conn = null;
        Statement stmt = null;
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        HttpSession session=request.getSession();
        
        try{
           PrintWriter out = response.getWriter();
           String nombre = request.getParameter("nombre");
           String nivel = request.getParameter("nivel");
           String creditos = request.getParameter("creditos");
           String clasificacion = request.getParameter("clasificacion");
           String id = request.getParameter("id");
           
           

           //Nivel, Creditos, Clasificacion
           Conexion cx=new Conexion();
           conn=cx.MySQLConnect();
           stmt = conn.createStatement();
           String sql = "UPDATE materias " +
                        "SET Nombre = '"+ nombre + "'," +
                        "Nivel = " + Integer.parseInt(nivel) + "," +
                        "Creditos = " + Float.parseFloat(creditos) + "," +
                        "Area_materias_idArea_materias = '" + clasificacion + "'" +
                        " WHERE idMaterias = '" + id + "'";
           stmt.executeUpdate(sql);
           session.setAttribute("message","Se actualizaron los datos correctamente.");
           conn.close();
           cx.cerrar();
           response.sendRedirect("editarMateria.jsp?id="+id);
        }catch(SQLException se){
           se.printStackTrace();
        }catch(Exception e){
           e.printStackTrace();
        }
     }

}
