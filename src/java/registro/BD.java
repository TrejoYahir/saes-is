package registro;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Diego EG
 */
public class BD {
    Connection conexion = null;
    
    public Connection conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String servidor = "jdbc:mysql://awsaes.cmfchautbgi7.us-east-1.rds.amazonaws.com/saes";
            String usuario = "aws_saes";
            String pass = "aws_pass";
//            String servidor = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_06209a6566df5df";
//            String usuario = "b0087e4ae1fe04";
//            String pass = "eac1da17";
            conexion = (Connection) DriverManager.getConnection(servidor, usuario, pass);
            System.out.println("Conexion extiosa con la base de datos");
 
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, ex, "Error en el driver al conectar con la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex, "Error sql al conectrar con la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex, "Error durante la conexion a la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } finally {
            return conexion;
        }
    }
    
    public void cerrar(){
        try {
            conexion.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex, "Error sql al conectrar con la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
        }
    }
}
