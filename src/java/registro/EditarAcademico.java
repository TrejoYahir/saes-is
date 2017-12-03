package  registro;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.Conexion;


public class EditarAcademico extends HttpServlet {

    private String nombre;
    private String paterno;
    private String materno;
    private String idempleado;
    private String rfc;
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
            idempleado=request.getParameter("idempleado");
            rfc=request.getParameter("id");
            email=request.getParameter("email");
            contra=request.getParameter("contra");
    
            try {
                existe();
            } catch (SQLException ex) {
                Logger.getLogger(RegistrarAcademico.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(regcorreo&regnum&regrfc)
                out.println("<script>alert('"+mensaje+"');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El rfc ya existe');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(!regcorreo&regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(!regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El rfc ya existe');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(!regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');location='editarAcademico.jsp?id="+rfc+"';</script>");
            if(!regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarAcademico.jsp?id="+rfc+"';</script>");
    }
    

public void existe() throws SQLException{
    try{
        Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
        
        //Agarramos el ultimo id
        PreparedStatement st = conn.prepareStatement("select MAX(idUsuario) from usuario");
        ResultSet rs = st.executeQuery();
        
        //Checamos si existe el numero de empleado en profesor
        st = conn.prepareStatement("select count(*) from Profesor where Numempleado= ?");
        st.setString(1, idempleado);
        rs = st.executeQuery();
        
        if(rs.next()){
            if(rs.getInt(1)<1){
                regnum=true;
            }else{
                regnum=false;
            }
        }
        
        
        if(regnum){
            //Checamos si existe el numero de empleado en gestion
            st = conn.prepareStatement("select count(*) from Gestion where Numempleado= ?");
            st.setString(1, idempleado);
            rs = st.executeQuery();
            if(rs.next()){
                if(rs.getInt(1)<1){
                    regnum=true;
                }else{
                    regnum=false;
                }
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
        if(regcorreo && regnum && regrfc){
            mensaje="registrar";
        }
        st.close();
        conn.close();
        cx.cerrar();
    }catch (Exception e){
        System.err.println("Got an exception!1 ");
        System.err.println(e.getMessage());
        mensaje="error en la base de datos";
    }
    
    if(mensaje.equals("registrar")){
        try{
          Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
          PreparedStatement stm1=conn.prepareStatement("select usuario.idusuario from usuario,academico where usuario.idusuario=academico.usuario_idusuario and academico.RFC='"+rfc+"'");
          ResultSet rs=stm1.executeQuery();
          rs.next();
          String idUsuario=rs.getString("idUsuario");
          rs.close();
          String query = " update usuario set Nombre=?, Paterno=? ,Materno=? ,Mail=? ,Contra=? where idUsuario="+idUsuario;
          String query2 = "update academico set Numempleado=? where usuario_idUsuario="+idUsuario;
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
          
          PreparedStatement preparedStmt2 = conn.prepareStatement(query2); 
          preparedStmt2.setString(1, idempleado);
//          // execute the preparedstatement
          preparedStmt2.execute();
          
          mensaje="Se actualizaron los datos correctamente.";
          preparedStmt.close();
          preparedStmt2.close();
          stm1.close();
          conn.close();
          cx.cerrar();
        }catch (Exception e){
          System.err.println("Got an exception!2x");
          System.err.println(e.getMessage());
          mensaje="error en la base de datos";
        }
    }
}
}
