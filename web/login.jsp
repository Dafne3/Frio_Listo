<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Bienvenido a FrioListo</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- CSS personalizado -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/login.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo Logo"> FrioListo </h1>
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
      <h2>Accede a tu cuenta</h2>

      <form id="loginForm">
        <!-- Correo -->
        <div class="mb-3">
          <label for="usuario">Correo electrónico:</label>
          <input type="email" id="usuario" name="usuario" placeholder="Ej: admin@mail.com" class="form-control" required>
          <div class="input-help">
            Ingresa tu correo electrónico. Ej: <strong>admin@mail.com</strong>
          </div>
        </div>

        <!-- Contraseña -->
        <div class="mb-3">
          <label for="contraseña">Contraseña:</label>
          <input type="password" id="contraseña" name="contraseña" class="form-control" required>
          <div class="toggle-password">
            <input type="checkbox" id="verPass" class="form-check-input" />
            <label for="verPass" class="form-check-label">Mostrar contraseña</label>
          </div>
        </div>

        <!-- Botón -->
        <button type="submit" class="btn w-100">Iniciar sesión</button>

        <!-- Registro -->
        <div class="register">
          ¿Aún no tienes cuenta? <a href="registro.jsp">Regístrate ahora</a>
        </div>
      </form>
    </section>
  </main>

  <footer>
    &copy; 2025 FrioListo. Todos los derechos reservados.
  </footer>

  <!-- Popover personalizado -->
  <div id="popover" class="popover oculto">
    <p id="popoverMensaje" style="margin: 0;"></p>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/login.js"></script>
</body>
</html>
