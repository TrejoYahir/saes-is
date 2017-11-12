package  registro;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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


public class EditarAlumnoG extends HttpServlet {

    private String nombre;
    private String paterno;
    private String materno;
    private String boleta;
    private String email;
    private String contra;
    
    private int idaca;
    
    boolean regcorreo=true;
    boolean regrfc=true;
    boolean regnum=true;
    
    
    String mensaje="";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            nombre=request.getParameter("nombre");
            paterno=request.getParameter("paterno");
            materno=request.getParameter("materno");
            boleta=request.getParameter("id");
            email=request.getParameter("email");
            contra=request.getParameter("contra");
    
            try {
                existe();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrarAcademico.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(regcorreo&regnum&regrfc)
                out.println("<script>alert('"+mensaje+"');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El rfc ya existe');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(!regcorreo&regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(!regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El rfc ya existe');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(!regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
            if(!regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarAlumnoG.jsp?id="+boleta+"';</script>");
    }
    

public void existe() throws SQLException{
    try{
        Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
        
        //Agarramos el ultimo id
        PreparedStatement st = conn.prepareStatement("select MAX(idUsuario) from usuario");
        ResultSet rs = st.executeQuery();
        
       
        if(regcorreo){
            //Checamos si existe el correo en tabla profesor
            st = conn.prepareStatement("select count(*) from profesor where Mail= ?");
            st.setString(1, email);
            rs = st.executeQuery();
            if(rs.next()){
                if(rs.getInt(1)<1){
                    regcorreo=true;
                }else{
                    regcorreo=false;
                }
            }
        }
        
        
        //Si ninguno existe podemos registrar
        if(regcorreo && regnum && regrfc){
            mensaje="registrar";
        }
        st.close();
        conn.close();
    }catch (Exception e){
        System.err.println("Got an exception!1 "+idaca);
        System.err.println(e.getMessage());
        mensaje="error en la base de datos";
    }
    
    if(mensaje.equals("registrar")){
        try{
          Conexion cx=new Conexion();
          Connection conn=cx.MySQLConnect();
          PreparedStatement stm1=conn.prepareStatement("select usuario.idusuario from usuario,alumno where usuario.idusuario=alumno.usuario_idusuario and alumno.Boleta='"+boleta+"'");
          ResultSet rs=stm1.executeQuery();
          rs.next();
          String idUsuario=rs.getString("idUsuario");
          rs.close();
          String query = " update usuario set Nombre=?, Paterno=? ,Materno=? ,Mail=? ,Contra=? where idUsuario="+idUsuario;
          // create the mysql insert preparedstatement
          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString(1, nombre);
          preparedStmt.setString(2, paterno);
          preparedStmt.setString(3, materno);
          preparedStmt.setString(4, email);
          preparedStmt.setString(5, contra);
//          
//          // execute the preparedstatement
          preparedStmt.execute();
          mensaje="Se actualizaron los datos correctamente.";
          preparedStmt.close();
          stm1.close();
          conn.close();
        }catch (Exception e){
          System.err.println("Got an exception!2 "+idaca);
          System.err.println(e.getMessage());
          mensaje="error en la base de datos";
        }
    }
}
}
