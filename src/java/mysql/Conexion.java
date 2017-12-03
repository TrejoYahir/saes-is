package mysql;
import java.sql.*;
import javax.swing.JOptionPane;
public class Conexion {
    Connection conexion = null;
    Statement comando = null;
    ResultSet registro;
 
    public Connection MySQLConnect() {
 
        try {
            //Driver JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String servidor = "jdbc:mysql://awsaes.cmfchautbgi7.us-east-1.rds.amazonaws.com/saes";
            String usuario = "aws_saes";
            String pass = "aws_pass";
//            String servidor = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_06209a6566df5df";
//            String usuario = "b0087e4ae1fe04";
//            String pass = "eac1da17";
            //Se inicia la conexión
            conexion = DriverManager.getConnection(servidor, usuario, pass);
 
        } catch (ClassNotFoundException ex) {
//            JOptionPane.showMessageDialog(null, ex, "Error en la conexión a la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex, "Error en la conexión a la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } catch (Exception ex) {
//            JOptionPane.showMessageDialog(null, ex, "Error en la conexión a la base de datos: " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conexion = null;
        } finally {
//            JOptionPane.showMessageDialog(null, "Conexión Exitosa");
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