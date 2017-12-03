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


public class RegistrarAlumnoG extends HttpServlet {

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
            boleta=request.getParameter("boleta");
            email=request.getParameter("email");
            contra=request.getParameter("contra");
            try {
                existe();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrarAcademico.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(regcorreo&regnum)
                out.println("<script>alert('"+mensaje+"');location='registrarAlumno.jsp';</script>");
            if(regcorreo&!regnum)
                       out.println("<script>alert('Lo sentimos, el número de boleta ya fue asignado a otro alumno');location='registrarAlumnoG.jsp';</script>");
            if(!regcorreo&regnum)
                       out.println("<script>alert('El correo está registrado en otra cuenta');location='registrarAlumnoG.jsp';</script>");
            if(!regcorreo&!regnum)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de boleta ya fue asignado a otro usuario');location='registrarAlumnoG.jsp';</script>");
    }
    

public void existe() throws SQLException{
    try{
        Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
        
        //Agarramos el ultimo id
        PreparedStatement st = conn.prepareStatement("select MAX(idUsuario) from usuario");
        ResultSet rs = st.executeQuery();
        
        //Checamos si existe el numero de boleta
        st = conn.prepareStatement("select count(*) from Alumno where Boleta= ?");
        st.setString(1, boleta);
        rs = st.executeQuery();
        
        if(rs.next()){
            if(rs.getInt(1)<1){
                regnum=true;
            }else{
                regnum=false;
            }
        }
        
        //Checamos si existe el correo en tabla usuario
        st = conn.prepareStatement("select count(*) from usuario where Mail= ?");
        st.setString(1, email);
        rs = st.executeQuery();
        if(rs.next()){
            if(rs.getInt(1)<1){
                regcorreo=true;
            }else{
                regcorreo=false;
            }
        }
        
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
        if(regcorreo && regnum){
            mensaje="registrar";
        }
        st.close();
        conn.close();
        cx.cerrar();
    }catch (Exception e){
        System.err.println("Got an exception! "+idaca);
        System.err.println(e.getMessage());
        mensaje="error en la base de datos";
    }
    
    if(mensaje.equals("registrar")){
        try{
          Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
          String query = " insert into usuario (Nombre, Paterno, Materno, Mail, Contra)"
          + " values (?, ?, ?, ?, ?)";
          
          String query2 = "insert into alumno (Boleta,Usuario_idUsuario,Estado)"
            + " values (?, ?, ?)";
          // create the mysql insert preparedstatement
          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString(1, nombre);
          preparedStmt.setString(2, paterno);
          preparedStmt.setString(3, materno);
          preparedStmt.setString(4, email);
          preparedStmt.setString(5, contra);
          
          // execute the preparedstatement
          preparedStmt.execute();
          Statement stm=conn.createStatement();
          ResultSet rs=stm.executeQuery("select idUsuario from usuario where Nombre='"+nombre+"' and Paterno='"+paterno+"' and Materno='"+materno+"' and Mail='"+email+"' and Contra='"+contra+"'");
          rs.next();
          idaca=rs.getInt("idUsuario");
          rs.close();
          preparedStmt = conn.prepareStatement(query2);
          preparedStmt.setString(1, boleta);
          preparedStmt.setInt(2, idaca);
          preparedStmt.setString(3, "Regular");
          
          
          // execute the preparedstatement
          preparedStmt.execute();
          
          mensaje="El alumno se registró exitosamente";
          preparedStmt.close();
          conn.close();
          cx.cerrar();
        }catch (Exception e){
          System.err.println("Got an exception!2 "+idaca);
          System.err.println(e.getMessage());
          mensaje="error en la base de datos";
        }
    }
}
}
