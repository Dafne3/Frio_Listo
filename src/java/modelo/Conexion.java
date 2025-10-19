package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/Friolisto1?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "friouser";
    private static final String PASSWORD = "mipassword123";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // ✅ Método actual (puedes seguir usándolo donde quieras)
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ✅ Método extra para compatibilidad con el JSP que usa con.getConexion()
    public Connection getConexion() throws SQLException {
        return getConnection();
    }
}

