<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Bienvenido a FrioListo</title>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/login.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo Logo"> FrioListo </h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

<main>
  <section>
    <h2>Accede a tu cuenta</h2>
    <form id="loginForm">
      <label for="usuario">Correo electrónico:</label>
      <input type="email" id="usuario" name="usuario" placeholder="Ej: admin@mail.com" required>
      <div class="input-help" id="ayudaUsuario">
        Ingresa tu correo electrónico. Ej: <strong>admin@mail.com</strong>
      </div>

      <label for="contraseña">Contraseña:</label>
      <input type="password" id="contraseña" name="contraseña" required>
      <div class="toggle-password">
        <input type="checkbox" id="verPass" />
        <label for="verPass">Mostrar contraseña</label>
      </div>

      <button type="submit">Iniciar sesión</button>

      <div class="register">
        ¿Aún no tienes cuenta? <a href="registro.jsp">Regístrate ahora</a>
      </div>
    </form>
  </section>
</main>

  <footer>
    &copy; 2025 FrioListo. Todos los derechos reservados.
  </footer>

  <div id="popover" class="popover oculto">
    <p id="popoverMensaje" style="margin: 0;"></p>
  </div>

<script src="js/login.js"></script>
</body>
</html>
