    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author Diego EG
 */
public class Grupo {
    
    public static String agregarGrupo(BeanGrupo grupo){
        String agregado = "false";
        try{
            BD bd = new BD();
            Connection con = bd.conectar();
            String query = "INSERT INTO saes.grupo (Turno,Nivel,Numero,Nombre) VALUES (?,?,?,?)";
            if(con!=null){
                PreparedStatement ps;
                String nombre="";
                if(grupo.getTurno().equals("Matutino")){
                    nombre=grupo.getNivel()+"CM"+grupo.getNumero();
                }else{
                    nombre=grupo.getNivel()+"CV"+grupo.getNumero();
                }
                ps = con.prepareStatement(query);
                ps.setString(1, grupo.getTurno());
                ps.setInt(2, grupo.getNivel());
                ps.setInt(3, grupo.getNumero());
                ps.setString(4,nombre);
                ps.executeUpdate();
                agregado="true";
                ps.close();
            }
            bd.cerrar();
        }catch(Exception e){
             e.printStackTrace();
        }
        return agregado;
    }
    
    public static boolean contieneRegistro(String turnoO, int nivelO, int numeroO){
        boolean contiene = false;
        try{
            BD bd = new BD();
            Connection c = bd.conectar();
            String query = "SELECT * FROM saes.grupo";
            if(c!=null){
                Statement st;
                st = c.createStatement();
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next()){
                    String turno = rs.getString("Turno");
                    int nivel = rs.getInt("Nivel");
                    int numero = rs.getInt("Numero");
                    
                    if(turno.trim().equals(turnoO) && numero==numeroO && nivel== nivelO ){
                        contiene = true;
                        break;
                    }
                }
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return contiene;
    }
}
