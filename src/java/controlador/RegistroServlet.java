package controlador;
import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        try (Connection con = Conexion.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO Cliente (nombre, correo, password) VALUES (?, ?, ?)");
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, password);
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error registrando cliente", e);
        }
    }
}
