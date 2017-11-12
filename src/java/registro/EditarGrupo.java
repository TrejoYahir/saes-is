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
public class EditarGrupo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Connection conn = null;
        Statement stmt = null;
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        HttpSession session=request.getSession();
        
        try{
           PrintWriter out = response.getWriter();
           String nivel = request.getParameter("Nivel");
           String creditos = request.getParameter("Turno");
           String numero = request.getParameter("Numero");
           String id = request.getParameter("id");
           String nombre="";
           if(creditos.equals("Matutino")){
               nombre=nivel+"CM"+numero;
           }else{
                nombre=nivel+"CV"+numero;
           }
           

           //Nivel, Creditos, Clasificacion
           Conexion cx=new Conexion();
           conn=cx.MySQLConnect();
           stmt = conn.createStatement();
           String sql = "UPDATE grupo " +
                        "SET Nivel = "+ nivel + "," +
                        "Turno = '" + creditos + "'," +
                        "Numero = " + numero +
                       "Nombre = " + nombre +
                        " WHERE idGrupo = " + id;
           stmt.executeUpdate(sql);
           session.setAttribute("message","Se actualizaron los datos correctamente.");
           response.sendRedirect("editarGrupo.jsp?id="+id);
        }catch(SQLException se){
           se.printStackTrace();
        }catch(Exception e){
           e.printStackTrace();
        }finally{
           try{
              if(stmt!=null)
                 conn.close();
           }catch(SQLException se){
           }
           try{
              if(conn!=null)
                 conn.close();
           }catch(SQLException se){
              se.printStackTrace();
           }
        }
     }

}
