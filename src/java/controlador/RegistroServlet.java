package controlador;

import modelo.Conexion;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Para evitar problemas con acentos

        String nombre = request.getParameter("nombres");       // coincide con tu JSP
        String apellido = request.getParameter("apellidos");   // coincide con tu JSP
        String sexo = request.getParameter("sexo");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String pass = request.getParameter("clave");           // coincide con tu JSP
        String confirmarPass = request.getParameter("confirmarClave");

        if (nombre == null || nombre.isEmpty() ||
            apellido == null || apellido.isEmpty() ||
            correo == null || correo.isEmpty() ||
            pass == null || pass.isEmpty() ||
            sexo == null || sexo.isEmpty() ||
            telefono == null || telefono.isEmpty()) {
            request.setAttribute("errorRegistro", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        if (!pass.equals(confirmarPass)) {
            request.setAttribute("errorRegistro", "Las contraseñas no coinciden.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        try (Connection con = Conexion.getConnection()) {
            // Verificar si ya existe el correo
            String checkQuery = "SELECT * FROM usuarios WHERE correo = ?";
            try (PreparedStatement psCheck = con.prepareStatement(checkQuery)) {
                psCheck.setString(1, correo);
                ResultSet rs = psCheck.executeQuery();
                if (rs.next()) {
                    request.setAttribute("errorRegistro", "Este correo ya está registrado.");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                    return;
                }
            }

            // Insertar usuario
            String insertQuery = "INSERT INTO usuarios (idRol, nombre, apellido, sexo, telefono, correo, pass) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement psInsert = con.prepareStatement(insertQuery)) {
                psInsert.setInt(1, 2);  // Rol usuario normal
                psInsert.setString(2, nombre);
                psInsert.setString(3, apellido);
                psInsert.setString(4, sexo);
                psInsert.setString(5, telefono);
                psInsert.setString(6, correo);
                psInsert.setString(7, pass);

                int filas = psInsert.executeUpdate();
                if (filas > 0) {
                    request.setAttribute("exitoRegistro", "Cuenta creada correctamente. Ahora inicia sesión.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorRegistro", "Hubo un error al registrar. Intenta nuevamente.");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                }
            }

        } catch (SQLException e) {
            throw new ServletException("Error registrando cliente", e);
        }
    }
}

