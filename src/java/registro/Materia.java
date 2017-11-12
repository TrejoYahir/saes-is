package registro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego EG
 */
public class Materia {
    
    public static String agragarMateria(BeanMateria materia){
        String agregado = "false";
        try {
            BD bd=new BD();
            Connection con=bd.conectar();
            
            if(con!=null){
                PreparedStatement ps;
                if(materia.getSerializacion().equals("Ninguna")){
                    System.out.println("null");
                    String query = "INSERT INTO materias (idMaterias,Nombre,Creditos,Nivel,Cupo,Area_Materias_idArea_Materias) VALUES (?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, materia.getId());
                    ps.setString(2, materia.getNombre());
                    ps.setFloat(3, materia.getCreditos());
                    ps.setInt(4, materia.getNivel());
                    ps.setInt(5, materia.getCupo());
                    ps.setInt(6, materia.getArea()); 
                }else{
                    System.out.println("no null "+materia.getSerializacion());
                    String query = "INSERT INTO materias (idMaterias,Nombre,Creditos,Nivel,Cupo,Area_Materias_idArea_Materias,Materia_anterior) VALUES (?,?,?,?,?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, materia.getId());
                    ps.setString(2, materia.getNombre());
                    ps.setFloat(3, materia.getCreditos());
                    ps.setInt(4, materia.getNivel());
                    ps.setInt(5, materia.getCupo());
                    ps.setInt(6, materia.getArea());
                    ps.setString(7, materia.getSerializacion()); 
                }
                ps.executeUpdate();
                agregado="true";
                ps.close();
            }
            bd.cerrar();
           } catch (SQLException e) {
            agregado="false";
            e.printStackTrace();
           }
        
        return agregado;
    }
    
    public static ArrayList<String> obtenerClavesMaterias(){
        ArrayList<String> claves = new ArrayList();
        
        BD bd = new BD();
        Connection con = bd.conectar();
        String query = "SELECT materias.idMaterias FROM saes.materias order by materias.idMaterias";
        
        if(con!=null){
            PreparedStatement ps;
            try {
                ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    String cve = rs.getString("idMaterias");
                    claves.add(cve);
                }
                bd.cerrar();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
        return claves;
    }
    
    public static boolean materiaRegistrada(BeanMateria materia){
        boolean repetido = false;
        
        try {
            BD bd=new BD();
            Connection con=bd.conectar();
            String query = "SELECT materias.idMaterias,materias.Nombre FROM saes.materias";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String cve = rs.getString("idMaterias");
                String nombre = rs.getString("Nombre");
                if(materia.getId().equals(cve)){
                    repetido = true;
                    break;
                }
                if(materia.getNombre().equals(nombre)){
                    repetido = true;
                    break;
                }
                    
            }
            bd.cerrar();
           } catch (SQLException e) {
            e.printStackTrace();
           }
        
        
        return repetido;
    }
}
