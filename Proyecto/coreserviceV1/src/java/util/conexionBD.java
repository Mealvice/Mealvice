package util;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Rene
 */
public class conexionBD {
    private String driver, urlBD,BD, userBD, passwordBD;
    private Connection conexion;
    
    public conexionBD(){
        driver="com.mysql.jdbc.Driver";
        BD="coreservicesbd";
        userBD="root";
        passwordBD="";
        urlBD="jdbc:mysql://localhost:3306/"+BD;
        
        try {
            Class.forName(driver).newInstance();
            conexion = (Connection) DriverManager.getConnection(urlBD, userBD, passwordBD);
            System.out.println("Conexion Exitosa");

        } catch (Exception e) {
            System.out.println("Error al conectarse a la base de datos" + e.toString());
        
        }
        
    }
    
    public Connection obtenerConexion(){
        return conexion;
    }
    
    public Connection cerrarConexion() throws SQLException{
        conexion.close();
        conexion=null;
        return conexion;
    }
    public static void main(String[] args) {
        new conexionBD();
    }
}
