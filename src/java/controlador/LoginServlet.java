package controlador;
import modelo.Conexion;
import modelo.Cliente;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        try (Connection con = Conexion.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Cliente WHERE correo=? AND password=?");
            ps.setString(1, correo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Cliente c = new Cliente(rs.getInt("id_cliente"), rs.getString("nombre"), correo, password);
                request.getSession().setAttribute("cliente", c);
                response.sendRedirect(request.getContextPath() + "/cliente-panel.jsp");
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Error en base de datos", e);
        }
    }
}
