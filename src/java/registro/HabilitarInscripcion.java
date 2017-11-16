package registro;

import clases.NodoInscripcion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import mysql.Conexion;

/**
 *
 * @author Rogelio
 */




public class HabilitarInscripcion extends HttpServlet {
    String mensaje="";
    
    private ArrayList<NodoInscripcion> Regulares = new ArrayList<NodoInscripcion>();
    private NodoInscripcion Nodo=new NodoInscripcion();
    
    int añoI;
    int mesI;
    int diaI;
    int añoF;
    int mesF;
    int diaF;

    int horasI;
    int minutosI;
    int horasF;
    int minutosF;
    
    String shorasI;
    String sminutosI;
    String shorasF;
    String sminutosF;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String fI = request.getParameter("finicio");
        String fT = request.getParameter("ftermino");
        String hI = request.getParameter("hinicio");
        String hT = request.getParameter("htermino");

        añoI=Integer.parseInt(fI.substring(0,4));
        añoF=Integer.parseInt(fT.substring(0,4));
        mesI=Integer.parseInt(fI.substring(5,7));
        mesF=Integer.parseInt(fT.substring(5,7));
        diaI=Integer.parseInt(fI.substring(8,10));
        diaF=Integer.parseInt(fT.substring(8,10));

        horasI=Integer.parseInt(hI.substring(0,2));
        horasF=Integer.parseInt(hT.substring(0,2));
        minutosI=Integer.parseInt(hI.substring(3,4));
        minutosF=Integer.parseInt(hT.substring(3,4));
        
        shorasI=hI.substring(0,2);
        shorasF=hT.substring(0,2);
        sminutosI=hI.substring(3,5);
        sminutosF=hT.substring(3,5);
        
        java.util.Date fechaInicio=null;
        java.util.Date fechaFin=null;
        try {
            System.out.print("Entre al try");
            fechaInicio = new SimpleDateFormat("yyyy-MM-dd").parse(fI);
            fechaFin = new SimpleDateFormat("yyyy-MM-dd").parse(fT);
        } catch (ParseException ex) {
            System.err.println(ex);
        }
         //out.println("<script>alert('"+añoI+","+mesI+","+diaI+";; "+añoF+mesF+diaF+".');</script>");
        //Validando la fecha y la hora
        if(fechaInicio.after(fechaFin)){//La fecha de inicio es posterior a la de fin
             //System.out.print("Fecha inicio mayor a fin");
            out.println("<script>alert('La fecha de ﬁn del periodo de reinscripciones debe ser posterior a la fecha de inicio.');");
            out.println("location='gestionarPeriodos.jsp';</script>");
        }else if(horasI>horasF){
            out.println("<script>");
            out.println("alert('La hora de ﬁn por día del periodo de reinscripciones debe ser posterior a la hora de inicio.');");
            out.println("location='gestionarPeriodos.jsp';</script>");
        }else if(mesF<=mesI && (diaF-3)<diaI){
            out.println("<script>alert('El periodo de reinscripciones debe ser de al menos 3 días.');");
            out.println("location='gestionarPeriodos.jsp';</script>");           
        }else{
            //Generando citas
            Conexion cx=new Conexion();
            Connection con=cx.MySQLConnect();
            PreparedStatement ps=null,ps2=null;
            ResultSet rs=null;
            String alumno="";
            SimpleDateFormat spd=new SimpleDateFormat("yyyy-MM-dd");
            String FechaInicio=spd.format(fechaInicio)+" "+shorasI+":"+sminutosI+":00";
            String FechaFin=spd.format(fechaFin)+" "+shorasF+":"+sminutosF+":00";
            System.out.println(FechaInicio);
            System.out.println(FechaFin);
            try {
                ps=con.prepareStatement("select * from alumno where estado=? or estado=?");
                ps.setString(1,"Regular");
                ps.setString(2, "Irregular");
                rs=ps.executeQuery();
                if(rs.next()){
                    ps2=con.prepareStatement("delete from cita_reinscripcion");
                    ps2.executeUpdate();
                    rs.previous();
                    while(rs.next()){
                        alumno=rs.getString("Boleta");
                        ps2=con.prepareStatement("insert into cita_reinscripcion (FechaInicio,FechaFin,Alumno_Boleta)values(?,?,?)");
                        ps2.setString(1, FechaInicio);
                        ps2.setString(2, FechaFin);
                        ps2.setString(3, alumno);
                        ps2.executeUpdate();
                    }
                    out.println("<script>alert('Se generaron todas las citas de inscripción correctamente.');location='gestionarPeriodos.jsp';</script>");
                }else{
                    out.println("<script>alert('No se generaron todas las citas de inscripción.');location='gestionarPeriodos.jsp';</script>");   
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }                
    }
    
}
