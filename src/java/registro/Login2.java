package registro;

import mysql.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String usuario=(String)request.getParameter("usuario");
        String contra=(String)request.getParameter("contra");
        Conexion cx=new Conexion();
        Connection con=cx.MySQLConnect();
        Statement comando;
        String boleta="",idUsuario="",contrabd="",nombre="",id;
        boolean registrado=false;
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet 1</title>");
        out.println("</head>");
        out.println("<body>");
        if(usuario.length()==10){
            try {
                out.println("(probando alumno "+registrado+")");
                comando = con.createStatement();
                ResultSet resultado=comando.executeQuery("SELECT boleta,Usuario_idUsuario FROM alumno WHERE boleta='"+usuario+"'");
                ResultSet resultado2;
                while(resultado.next()){
                    out.println("alumno");
                    registrado=true;
                    boleta=resultado.getString("boleta");
                    idUsuario=resultado.getString("Usuario_idUsuario");
                    resultado2=comando.executeQuery("SELECT Contra,Nombre FROM usuario WHERE idUsuario="+idUsuario);
                    while(resultado2.next()){
                        contrabd=resultado2.getString("Contra");
                        nombre=resultado2.getString("Nombre");
                        if(boleta.equals(usuario) && contrabd.equals(contra)){
                            session.setAttribute("nombreUsuario",nombre);
                            session.setAttribute("idUsuario",boleta);
                            resultado.close();
                            resultado2.close();
                            con.close();
                            cx.cerrar();
                            response.sendRedirect("estadoActual.jsp");
                        }else{
                            String error="1";
                            session.setAttribute("error",error);
                            resultado.close();
                            resultado2.close();
                            con.close();
                            cx.cerrar();
                            response.sendRedirect("login.jsp");
                        }
                    }
                }
                if(!registrado){
                    String error="1";
                    session.setAttribute("error",error);
                    resultado.close();
                    con.close();
                    cx.cerrar();
                    response.sendRedirect("login.jsp");
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }else{
            String rfc="";
            String nivel="";
            try {
                out.println("(probando gestion "+registrado+")");
                comando = con.createStatement();
                ResultSet resultado=comando.executeQuery("SELECT RFC,Usuario_idUsuario,Nivel FROM gestion WHERE RFC='"+usuario+"'");
                ResultSet resultado2;
                while(resultado.next()){
                    out.println("gestion");
                    registrado=true;
                    rfc=resultado.getString("RFC");
                    idUsuario=resultado.getString("Usuario_idUsuario");
                    nivel=resultado.getString("Nivel");
                    resultado2=comando.executeQuery("SELECT Contra,Nombre FROM usuario WHERE idUsuario="+idUsuario);
                    while(resultado2.next()){
                        
                        contrabd=resultado2.getString("Contra");
                        nombre=resultado2.getString("Nombre");
                        out.println("gestion aprovado "+contra);
                        if(rfc.equals(usuario) && contrabd.equals(contra)){
                            out.println("gestion aprovadox "+nivel);
                            if(nivel.equals("1")){
                                out.println("gestion jefe");
                                session.setAttribute("nombreUsuario",nombre);
                                session.setAttribute("idUsuario",rfc);
                                resultado.close();
                                resultado2.close();
                                con.close();
                                cx.cerrar();
                                response.sendRedirect("datosPersonalesJG.jsp");
                            }else{
                                if(nivel.equals("2")){
                                    out.println("gestion normal");
                                    session.setAttribute("nombreUsuario",nombre);
                                    session.setAttribute("idUsuario",rfc);
                                    resultado.close();
                                    resultado2.close();
                                    con.close();
                                    cx.cerrar();
                                    response.sendRedirect("datosGestion.jsp");
                                }
                            }
                        }else{
                            String error="1";
                            session.setAttribute("error",error);
                            resultado.close();
                            resultado2.close();
                            con.close();
                            cx.cerrar();
                            response.sendRedirect("login.jsp");
                        }
                    }
                }
                if(!registrado){
                    out.println("(probando academico "+registrado+")");
                    comando = con.createStatement();
                    resultado=comando.executeQuery("SELECT RFC,Usuario_idUsuario FROM academico WHERE RFC='"+usuario+"'");
                    out.println("(probando academico "+registrado+")");
                    while(resultado.next()){
                        out.println("academico");
                        registrado=true;
                        rfc=resultado.getString("RFC");
                        idUsuario=resultado.getString("Usuario_idUsuario");
                        resultado2=comando.executeQuery("SELECT Contra,Nombre FROM usuario WHERE idUsuario="+idUsuario);
                        while(resultado2.next()){
                            contrabd=resultado2.getString("Contra");
                            nombre=resultado2.getString("Nombre");
                            if(rfc.equals(usuario) && contrabd.equals(contra)){
                                session.setAttribute("nombreUsuario",nombre);
                                session.setAttribute("idUsuario",rfc);
                                resultado.close();
                                resultado2.close();
                                con.close();
                                cx.cerrar();
                                response.sendRedirect("datosAcademico.jsp");
                            }else{
                                String error="1";
                                session.setAttribute("error",error);
                                resultado.close();
                                resultado2.close();
                                con.close();
                                cx.cerrar();
                                response.sendRedirect("login.jsp");
                            }
                        }
                    }
                    out.println("(probando academico "+registrado+")");
                    if(!registrado){
                        out.println("ningun lado");
                        String error="1";
                        session.setAttribute("error",error);
                        resultado.close();
                        con.close();
                        cx.cerrar();
                        response.sendRedirect("login.jsp");
                    }
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        out.println("</body>");
        out.println("</html>"); 
             
    }

}
