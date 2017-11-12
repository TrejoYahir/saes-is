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
            
            horasI=Integer.parseInt(hI.substring(0,1));
            horasF=Integer.parseInt(hT.substring(0,1));
            minutosI=Integer.parseInt(hI.substring(3,4));
            minutosF=Integer.parseInt(hT.substring(3,4));
            
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
                    //Consultando todos los alumnos regulares y ordenandolos por mejor promedio.
                try {
                      regulares();     

                } catch (SQLException ex) {
                    Logger.getLogger(HabilitarInscripcion.class.getName()).log(Level.SEVERE, null, ex);
                }
out.println("<script>alert('Se generaron todas las citas de inscripción correctamente.');location='gestionarPeriodos.jsp';</script>");   
            }                
        }
    private void regulares() throws SQLException{
        int numMaterias=0;
        float calTotal=0,calPromedio;
         
        try {
            Conexion cx=new Conexion();
            Connection conn=cx.MySQLConnect();
            
            PreparedStatement st = conn.prepareStatement("SELECT alumno.Boleta FROM alumno WHERE Estado=\"Regular\";");
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Nodo.setBoleta(rs.getString("Boleta"));
                Regulares.add(Nodo);
            }
            for (int i = 0; i < Regulares.size(); i++) {
                numMaterias=0;
                calTotal=0;
                 st = conn.prepareStatement("select kardex.Calificacion from kardex where kardex.AlumnoBoleta=\""+Regulares.get(i).getBoleta()+"\";");     
                 rs = st.executeQuery();
                while(rs.next()){
                    numMaterias++;
                    calTotal=calTotal + rs.getInt("Calificacion");
                }
                calPromedio=calTotal/numMaterias;
                Regulares.get(i).setPromedio(calPromedio);
            }
            
            Collections.sort(Regulares, new Comparator<NodoInscripcion>(){
                    @Override
                    public int compare(NodoInscripcion p1, NodoInscripcion p2) {
                            
                            return new Float(p2.getPromedio()).compareTo(new Float(p1.getPromedio()));
                    }
            });
            //Asignando Citas
            for (int i = 0; i < Regulares.size(); i++) {
                st = conn.prepareStatement("INSERT INTO cita_reincripcion VALUES(,'"+añoI+"-"+mesI+"-"+diaI+" "+horasI+":"+minutosI+":00','"+añoI+"-"+mesI+"-"+(diaI+1)+" "+horasI+":"+minutosI+":00',"+Regulares.get(i).getBoleta()+");");
                
            }
           
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
