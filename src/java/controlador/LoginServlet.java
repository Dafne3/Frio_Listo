package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String correo = request.getParameter("correo");
        String pass = request.getParameter("clave"); // coincide con name del input

        try (Connection con = Conexion.getConnection()) {
            String sql = "SELECT * FROM usuarios WHERE correo=? AND pass=?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, correo);
                ps.setString(2, pass);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("idUsuario", rs.getInt("idUsuario"));
                    session.setAttribute("nombre", rs.getString("nombre"));
                    session.setAttribute("correo", rs.getString("correo"));

                    response.sendRedirect(request.getContextPath() + "/cliente-panel.jsp");
                } else {
                    request.setAttribute("errorLogin", "Usuario o contraseña incorrectos");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error en base de datos", e);
        }
    }
}
