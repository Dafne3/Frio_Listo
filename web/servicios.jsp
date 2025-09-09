<%-- 
    Document   : servicios
    Created on : 9 set. 2025, 12:02:30 a. m.
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Productos y Servicios - FrioListo</title>
  <link rel="stylesheet" href="css/normalize.css"/>
  <link rel="stylesheet" href="css/servicios.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" />
</head>
<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo logo"> FrioListo</h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="nosotros.jsp">Sobre nosotros</a></li>
        <li><a href="servicios.jsp" class="active">Productos y Servicios</a></li>
        <li><a href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <section class="hero">
    <h2>¡Tus bebidas favoritas, frías y al instante!</h2>
    <p>Descubre la experiencia FrioListo: sabor, frescura y velocidad en cada entrega.</p>
    <button onclick="location.href='login.jsp'">Únete a la aventura FrioListo</button>
  </section>

  <section class="pedidos">
    <h2>Haz tu Pedido Ahora</h2>
    <form id="formPedido" action="#" method="POST">
      <label for="nombre">Nombre completo</label>
      <input type="text" id="nombre" name="nombre" placeholder="Tu nombre" required />

      <label for="telefono">Teléfono de contacto</label>
      <input type="tel" id="telefono" name="telefono" placeholder="999 999 999" required />

      <label for="direccion">Dirección de entrega</label>
      <textarea id="direccion" name="direccion" rows="3" placeholder="Ingresa tu dirección completa" required></textarea>

      <label for="producto">Producto</label>
      <select id="producto" name="producto" required>
        <option value="">-- Selecciona un producto --</option>
        <option value="agua_mineral">Agua mineral</option>
        <option value="agua_con_gas">Agua con gas</option>
        <option value="agua_purificada">Agua purificada</option>
        <option value="agua_saborizada">Agua saborizada</option>
        <option value="agua_de_coco">Agua de coco</option>
        <option value="cola">Cola</option>
        <option value="gaseosa_naranja">Gaseosa de naranja</option>
        <option value="gaseosa_limon">Gaseosa de limón</option>
        <option value="gaseosa_uva">Gaseosa de uva</option>
        <option value="gaseosa_manzana">Gaseosa de manzana</option>
        <option value="tonica">Agua tónica</option>
        <option value="ginger_ale">Ginger Ale</option>
        <option value="bebida_energetica">Bebida energizante</option>
        <option value="jugo_natural">Jugo natural frío</option>
        <option value="jugo_naranja">Jugo de naranja</option>
        <option value="jugo_mango">Jugo de mango</option>
        <option value="jugo_pina">Jugo de piña</option>
        <option value="cerveza">Cerveza</option>
        <option value="vino_tinto">Vino tinto</option>
        <option value="vino_blanco">Vino blanco</option>
        <option value="whisky">Whisky</option>
        <option value="ron">Ron</option>
        <option value="tequila">Tequila</option>
        <option value="vodka">Vodka</option>
        <option value="coctel_mojito">Cóctel Mojito</option>
        <option value="coctel_margarita">Cóctel Margarita</option>
        <option value="coctel_caipirinha">Cóctel Caipirinha</option>
      </select>

      <label for="comentarios">Comentarios adicionales</label>
      <textarea id="comentarios" name="comentarios" rows="3" placeholder="¿Algo más que debamos saber?"></textarea>

      <button type="submit">Confirmar Pedido</button>
    </form>
  </section>

  <footer>
    <p>&copy; 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>
  
  <div id="popoverConfirmacion" class="popover">
    <div class="popover-content">
      <p>¡Tu pedido fue enviado correctamente!</p>
    </div>
  </div>

  <script src="js/servicios.js"></script>
</body>
</html>

