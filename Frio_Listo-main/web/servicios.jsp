<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Productos y Servicios - FrioListo</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Estilos personalizados -->
  <link rel="stylesheet" href="css/normalize.css"/>
  <link rel="stylesheet" href="css/servicios.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" />
</head>
<body>
  <header class="d-flex justify-content-between align-items-center p-3" style="background: linear-gradient(90deg, var(--primario), var(--secundario));">
    <h1 class="d-flex align-items-center text-white m-0">
      <img src="images/friolisto.png" alt="FrioListo logo" height="40" class="me-2"/>
      FrioListo
    </h1>
    <nav>
      <ul class="nav">
        <li class="nav-item"><a href="index.jsp" class="nav-link text-white">Inicio</a></li>
        <li class="nav-item"><a href="nosotros.jsp" class="nav-link text-white">Sobre nosotros</a></li>
        <li class="nav-item"><a href="servicios.jsp" class="nav-link active" style="color:#ffd166;">Productos y Servicios</a></li>
        <li class="nav-item"><a href="contacto.jsp" class="nav-link text-white">Contacto</a></li>
        <li class="nav-item"><a href="login.jsp" class="nav-link text-white">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <!-- Hero -->
  <section class="hero text-center text-white py-5" style="background: linear-gradient(135deg, var(--secundario), var(--primario));">
    <div class="container">
      <h2 class="fw-bold">¡Tus bebidas favoritas, frías y al instante!</h2>
      <p class="lead">Descubre la experiencia FrioListo: sabor, frescura y velocidad en cada entrega.</p>
      <button class="btn btn-light btn-lg mt-3 fw-bold" onclick="location.href='login.jsp'">
        Únete a la aventura FrioListo
      </button>
    </div>
  </section>

  <!-- Formulario de pedidos -->
  <section class="pedidos py-5">
    <div class="container">
      <h2 class="text-center mb-4">Haz tu Pedido Ahora</h2>
      <form id="formPedido" action="#" method="POST" class="bg-white p-4 rounded shadow mx-auto" style="max-width: 600px;">
        
        <div class="mb-3">
          <label for="nombre" class="form-label fw-bold">Nombre completo</label>
          <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Tu nombre" required />
        </div>

        <div class="mb-3">
          <label for="telefono" class="form-label fw-bold">Teléfono de contacto</label>
          <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="999 999 999" required />
        </div>

        <div class="mb-3">
          <label for="direccion" class="form-label fw-bold">Dirección de entrega</label>
          <textarea id="direccion" name="direccion" rows="3" class="form-control" placeholder="Ingresa tu dirección completa" required></textarea>
        </div>

        <div class="mb-3">
          <label for="producto" class="form-label fw-bold">Producto</label>
          <select id="producto" name="producto" class="form-select" required>
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
        </div>

        <div class="mb-3">
          <label for="comentarios" class="form-label fw-bold">Comentarios adicionales</label>
          <textarea id="comentarios" name="comentarios" rows="3" class="form-control" placeholder="¿Algo más que debamos saber?"></textarea>
        </div>

        <div class="d-grid">
          <button type="submit" class="btn text-white fw-bold" style="background: linear-gradient(135deg, var(--success, #2a9d8f), var(--primario));">
            Confirmar Pedido
          </button>
        </div>
      </form>
    </div>
  </section>

  <footer class="text-center py-4" style="background-color: var(--secundario); color: white;">
    <p class="mb-0">&copy; 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

  <div id="popoverConfirmacion" class="popover position-fixed top-0 end-0 m-4 shadow bg-white rounded p-3 d-none">
    <div class="popover-content text-success fw-bold">
      <p class="m-0">¡Tu pedido fue enviado correctamente!</p>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/servicios.js"></script>
</body>
</html>
