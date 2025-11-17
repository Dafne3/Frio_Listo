package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import modelo.Producto;

@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {

     // Aquí simplemente creo una lista de productos en memoria
    // (luego ya esto se reemplazará por la base de datos)
    private List<Producto> obtenerProductos() {
        List<Producto> lista = new ArrayList<>();

        lista.add(new Producto(1, "Coca Cola 500ml", 4.50, 20));
        lista.add(new Producto(2, "Inca Kola 500ml", 4.50, 20));
        lista.add(new Producto(3, "Sprite 500ml", 4.50, 20));
        lista.add(new Producto(4, "Fanta Uva 500ml", 4.50, 20));
        lista.add(new Producto(5, "Guaraná 500ml", 4.00, 15));
        lista.add(new Producto(6, "Fanta 500ml", 4.50, 20));
        lista.add(new Producto(7, "Pepsi 500ml", 4.50, 20));
        lista.add(new Producto(8, "Fanta Naranja 500ml", 4.50, 20));
        lista.add(new Producto(9, "Coca Cola 1L", 6.50, 20));
        lista.add(new Producto(10, "Inca Kola 1L", 6.50, 20));
        lista.add(new Producto(11, "Guaraná 1L", 6.00, 20));
        lista.add(new Producto(12, "Sprite 1L", 6.50, 20));

        return lista;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("seleccionar".equals(accion)) {
            //  Aquí agarro el id que viene del botón de productos.jsp
            int id = Integer.parseInt(request.getParameter("id"));

            // obtengo la lista de productos simulada
            List<Producto> lista = obtenerProductos();

            // busco el producto por su id
            Producto productoEncontrado = null;
            for (Producto p : lista) {
                if (p.getId() == id) {
                    productoEncontrado = p;
                    break;
                }
            }

            // lo mando al JSP del comprobante
            request.setAttribute("producto", productoEncontrado);
            request.getRequestDispatcher("pedido.jsp").forward(request, response);
            return;
        }

        // si no viene ninguna acción, mando a productos.jsp
        request.getRequestDispatcher("productos.jsp").forward(request, response);
    }
}
