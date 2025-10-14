package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://mysql-eventgear.alwaysdata.net:3306/eventgear_bd";
    private static final String USER = "eventgear";
    private static final String PASSWORD = "x7dKDGZgBx5Dn6d";
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Error cargando el driver MySQL", e);
        }
    }
}
