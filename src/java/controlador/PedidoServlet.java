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

    // ahora usamos los productos REALES del proyecto
    private List<Producto> obtenerProductos() {

        List<Producto> lista = new ArrayList<>();

        // productos reales con sus precios y nombres EXACTOS de productos.jsp
        lista.add(new Producto(1, "Coca-Cola 500ml", 2.80, 20));
        lista.add(new Producto(2, "Inca Kola 500ml", 2.80, 20));
        lista.add(new Producto(3, "Agua 600ml", 1.60, 20));
        lista.add(new Producto(4, "Red Bull 250ml", 6.50, 20));
        lista.add(new Producto(5, "Sprite 500ml", 2.50, 20));
        lista.add(new Producto(6, "Fanta 500ml", 2.50, 20));
        lista.add(new Producto(7, "Pepsi 500ml", 2.20, 20));
        lista.add(new Producto(8, "Guaraná 500ml", 2.50, 15));
        lista.add(new Producto(9, "7Up 500ml", 2.00, 20));
        lista.add(new Producto(10, "Gatorade 500ml", 2.50, 20));
        lista.add(new Producto(11, "Powerade 600ml", 2.30, 20));
        lista.add(new Producto(12, "Té Helado 500ml", 2.10, 20));

        return lista;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // esto reemplaza a lo que hacía antes: ahora solo manejamos "seleccionar"
        String accion = request.getParameter("accion");

        if ("seleccionar".equals(accion)) {

            // agarro el id que viene desde productos.jsp
            int id = Integer.parseInt(request.getParameter("id"));

            // obtenemos los productos reales
            List<Producto> lista = obtenerProductos();

            // buscamos el producto por id
            Producto productoEncontrado = null;

            for (Producto p : lista) {
                if (p.getId() == id) {
                    productoEncontrado = p;
                    break;
                }
            }

            // enviamos el producto al comprobante (pedido.jsp)
            request.setAttribute("producto", productoEncontrado);

            // esto reemplaza a lo que hacía antes: ahora si o si abrimos pedido.jsp
            request.getRequestDispatcher("pedido.jsp").forward(request, response);
            return;
        }

        // si no llega ninguna acción, volvemos a productos.jsp
        request.getRequestDispatcher("productos.jsp").forward(request, response);
    }
}
