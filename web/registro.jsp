<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registro en FrioListo</title>
  <link rel="stylesheet" href="css/normalize.css" />
  <link rel="stylesheet" href="css/registro.css" />
</head>

<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo Logo"> FrioListo</h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="nosotros.jsp">Sobre nosotros</a></li>
        <li><a href="servicios.jsp">Productos y Servicios</a></li>
        <li><a href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section>
      <h2>Crea una cuenta</h2>
      <form id="registroForm" action="#">
        <!-- Rol -->
        <label>Rol de usuario:</label>
        <div class="roles">
          <label><input type="radio" name="rol" value="administrador" required> Administrador</label>
          <label><input type="radio" name="rol" value="cliente" required> Cliente</label>
        </div>

        <!-- Nombres -->
        <label for="nombres">Nombres:</label>
        <input type="text" id="nombres" name="nombres" placeholder="Ej: Juan Carlos" required>

        <!-- Apellidos -->
        <label for="apellidos">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" placeholder="Ej: Pérez Gómez" required>

        <!-- Sexo -->
        <label>Sexo:</label>
        <div class="sexo-group">
          <label class="sexo-option">
            <input type="radio" name="sexo" value="masculino" required>
            <span>Masculino</span>
          </label>
          <label class="sexo-option">
            <input type="radio" name="sexo" value="femenino">
            <span>Femenino</span>
          </label>
          <label class="sexo-option">
            <input type="radio" name="sexo" value="otro">
            <span>Otro</span>
          </label>
        </div>

        <!-- Teléfono -->
        <label for="telefono">Teléfono:</label>
        <div class="telefono-container">
          <span class="telefono-icon">📞</span>
          <input type="tel" id="telefono" name="telefono" placeholder="Ej: 987654321" required>
        </div>

        <!-- Correo -->
        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" placeholder="ejemplo@correo.com" required>

        <!-- Contraseña -->
        <label for="contraseña">Contraseña:</label>
        <input type="password" id="contraseña" name="contraseña" required>
        <div class="toggle-password">
          <input type="checkbox" id="verPass" />
          <label for="verPass">Mostrar contraseña</label>
        </div>

        <!-- Confirmar contraseña -->
        <label for="confContraseña">Confirmar contraseña:</label>
        <input type="password" id="confContraseña" name="confContraseña" required>
        <div id="mensajeConf" class="mensaje-error"></div>

        <button type="submit">Registrarse</button>
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

  <script src="js/registro.js"></script>
</body>
</html>
