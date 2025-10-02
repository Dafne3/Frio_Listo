<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registro en FrioListo</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- CSS personalizado -->
  <link rel="stylesheet" href="css/normalize.css" />
  <link rel="stylesheet" href="css/registro.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
</head>

<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo Logo"> FrioListo</h1>
    <nav>
      <ul class="nav justify-content-center flex-wrap">
        <li class="nav-item"><a class="nav-link fw-semibold text-white" href="index.jsp">Inicio</a></li>
        <li class="nav-item"><a class="nav-link fw-semibold text-white" href="nosotros.jsp">Sobre nosotros</a></li>
        <li class="nav-item"><a class="nav-link fw-semibold text-white" href="servicios.jsp">Productos y Servicios</a></li>
        <li class="nav-item"><a class="nav-link fw-semibold text-white" href="contacto.jsp">Contacto</a></li>
        <li class="nav-item"><a class="btn btn-light ms-2" href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <main class="d-flex justify-content-center align-items-center flex-grow-1">
    <section class="shadow-lg">
      <h2>Crea una cuenta</h2>
      <form id="registroForm" action="#">
        <!-- Rol -->
        <div class="mb-3">
          <label class="form-label">Rol de usuario:</label>
          <div class="d-flex gap-3 flex-wrap">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="rol" value="administrador" id="rolAdmin" required>
              <label class="form-check-label" for="rolAdmin">Administrador</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="rol" value="cliente" id="rolCliente" required>
              <label class="form-check-label" for="rolCliente">Cliente</label>
            </div>
          </div>
        </div>

        <!-- Nombres -->
        <div class="mb-3">
          <label for="nombres" class="form-label">Nombres:</label>
          <input type="text" id="nombres" name="nombres" placeholder="Ej: Juan Carlos" class="form-control" required>
        </div>

        <!-- Apellidos -->
        <div class="mb-3">
          <label for="apellidos" class="form-label">Apellidos:</label>
          <input type="text" id="apellidos" name="apellidos" placeholder="Ej: Pérez Gómez" class="form-control" required>
        </div>

        <!-- Sexo -->
        <div class="mb-3">
          <label class="form-label">Sexo:</label>
          <div class="d-flex gap-3 flex-wrap">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="sexo" value="masculino" id="sexoMasculino" required>
              <label class="form-check-label" for="sexoMasculino">Masculino</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="sexo" value="femenino" id="sexoFemenino">
              <label class="form-check-label" for="sexoFemenino">Femenino</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="sexo" value="otro" id="sexoOtro">
              <label class="form-check-label" for="sexoOtro">Otro</label>
            </div>
          </div>
        </div>

        <!-- Teléfono -->
        <div class="mb-3 telefono-container">
          <label for="telefono" class="form-label">Teléfono:</label>
          <span class="telefono-icon"></span>
          <input type="tel" id="telefono" name="telefono" placeholder="Ej: 987654321" class="form-control" required>
        </div>

        <!-- Correo -->
        <div class="mb-3">
          <label for="email" class="form-label">Correo electrónico:</label>
          <input type="email" id="email" name="email" placeholder="ejemplo@correo.com" class="form-control" required>
        </div>

        <!-- Contraseña -->
        <div class="mb-3">
          <label for="contraseña" class="form-label">Contraseña:</label>
          <input type="password" id="contraseña" name="contraseña" class="form-control" required>
          <div class="toggle-password mt-2">
            <input type="checkbox" id="verPass" class="form-check-input">
            <label for="verPass" class="form-check-label">Mostrar contraseña</label>
          </div>
        </div>

        <!-- Confirmar contraseña -->
        <div class="mb-3">
          <label for="confContraseña" class="form-label">Confirmar contraseña:</label>
          <input type="password" id="confContraseña" name="confContraseña" class="form-control" required>
          <div id="mensajeConf" class="mensaje-error"></div>
        </div>

        <!-- Botón -->
        <button type="submit" class="btn w-100">Registrarse</button>

        <!-- Login -->
        <div class="login-link">
          ¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión aquí</a>
        </div>
      </form>
    </section>
  </main>

  <footer>
    &copy; 2025 FrioListo. Todos los derechos reservados.
  </footer>

  <!-- Popover registro -->
  <div id="popoverRegistro" class="popover-registro">
    <button id="cerrarPopoverRegistro" class="cerrar-popover">&times;</button>
    <p><strong>✅ Registro exitoso. ¡Bienvenido!</strong></p>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/registro.js"></script>
</body>
</html>
