package registro;

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


public class EditarProfesor extends HttpServlet {

    private String nombre;
    private String paterno;
    private String materno;
    private String idempleado;
    private String rfc;
    private String email;
    private String contra;
    
    
    
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
                out.println("<script>alert('"+mensaje+"');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El rfc ya existe');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(!regcorreo&regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(!regcorreo&regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El rfc ya existe');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(!regcorreo&!regnum&regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');location='editarProfesor.jsp?id="+rfc+"';</script>");
            if(!regcorreo&!regnum&!regrfc)
                       out.println("<script>alert('El correo está registrado en otra cuenta');alert('El número de empleado ya fue asignado a otro usuario');alert('El rfc ya existe');location='editarProfesor.jsp?id="+rfc+"';</script>");
    }
    

public void existe() throws SQLException{
    try{
        Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();
       
        PreparedStatement st = conn.prepareStatement("select count(*) from Profesor where Numempleado= ?");
        st.setString(1, idempleado);
        ResultSet rs = st.executeQuery();
        
        if(regnum){
            //Checamos si existe el numero de empleado en academico
            st = conn.prepareStatement("select count(*) from Academico where Numempleado= ?");
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
        
        //Si ninguno existe podemos registrar
        if(regcorreo && regnum && regrfc){
            mensaje="registrar";
        }
        st.close();
        conn.close();
        cx.cerrar();
    }catch (Exception e){
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());
        mensaje="error en la base de datos";
    }
    
    if(mensaje.equals("registrar")){
        try{
          Conexion cx=new Conexion();
        Connection conn=cx.MySQLConnect();

          String query = " update profesor set Nombre=?, Paterno=?, Materno=?, Numempleado=?, Mail=?, Contra=? where RFC='"+rfc+"'";
          // create the mysql insert preparedstatement
          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString(1, nombre);
          preparedStmt.setString(2, paterno);
          preparedStmt.setString(3, materno);
          preparedStmt.setString(4, idempleado);
          preparedStmt.setString(5, email);
          preparedStmt.setString(6, contra);

          // execute the preparedstatement
          preparedStmt.execute();
          mensaje="Se actualizaron los datos correctamente.";
          preparedStmt.close();
          conn.close();
          cx.cerrar();
        }catch (Exception e){
          System.err.println("Got an exception!");
          System.err.println(e.getMessage());
          mensaje="error en la base de datos";
        }
    }
}
}
