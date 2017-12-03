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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import mysql.Conexion;

/**
 *
 * @author Yahir
 */
public class EditarGrupoG extends HttpServlet {
    private String nombre="";
    private boolean noexiste = true;
    private String nivel;
    private String turno;
    private String numero;
    private String id;
    private String nivelAnt;
    private String turnoAnt;
    private String numeroAnt;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        nivel = request.getParameter("Nivel");
        turno = request.getParameter("Turno");
        numero = request.getParameter("Numero");
        id = request.getParameter("id");
        numeroAnt = request.getParameter("numeroAnt");
        nivelAnt = request.getParameter("nivelAnt");
        turnoAnt = request.getParameter("turnoAnt");
        
        if(turno.equals("Matutino")){
            nombre=nivel+"CM"+numero;
        }else{
            nombre=nivel+"CV"+numero;
        }
        
        try {
            existe();
        } catch (SQLException ex) {
                Logger.getLogger(RegistrarAcademico.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(noexiste) {
            out.println("<script>alert('Se actualizaron los datos correctamente.');location='editarGrupoG.jsp?id="+id+"';</script>");
        }
        if(!noexiste) {
            out.println("<script>alert('El grupo ya existe');location='editarGrupoG.jsp?id="+id+"';</script>");
        }
    }
    
    public void existe() throws SQLException{
        try {
            Conexion cx=new Conexion();
            Connection conn=cx.MySQLConnect();
            PreparedStatement st = conn.prepareStatement("select MAX(idUsuario) from usuario");
            ResultSet rs = st.executeQuery();
            st = conn.prepareStatement("select count(*) from grupo where Nombre= ?");
            st.setString(1, nombre);
            rs = st.executeQuery();
            if(numeroAnt.equals(numero) && nivelAnt.equals(nivel) && turnoAnt.equals(turno)) {
                
            }else {
               if(rs.next()){
                if(rs.getInt(1)<1){
                    noexiste=true;
                }else{
                    noexiste=false;
            } 
            }
            
        }
            conn.close();
            cx.cerrar();
        }catch (Exception e) {
            e.printStackTrace();
        }
        try{
          Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
          String query = " update grupo set idGrupo=?, Turno=? ,Nivel=? ,Numero=? ,Nombre=? where idGrupo="+id;
          // create the mysql insert preparedstatement
          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString(1, id);
          preparedStmt.setString(2, turno);
          preparedStmt.setString(3, nivel);
          preparedStmt.setString(4, numero);
          preparedStmt.setString(5, nombre);
//          
//          // execute the preparedstatement
          preparedStmt.execute();
         
          preparedStmt.close();
          conn.close();
          cx.cerrar();
        }catch (Exception e){
          System.err.println(e.getMessage());
          //mensaje="error en la base de datos";
        }
    }
    }