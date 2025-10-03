<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro - FrioListo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Responsive -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    /* Efecto al enfocar inputs */
    .form-control:focus {
      border-color: #22a593;
      box-shadow: 0 0 8px rgba(34, 165, 147, 0.6);
      transition: all 0.3s ease-in-out;
    }
  </style>
</head>
<body style="background-color:#f8fbfd;">

  <div class="container d-flex justify-content-center align-items-center py-5">
    <div class="row justify-content-center w-100">
      <div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5">
        <!-- Card con margen superior e inferior -->
        <div class="card shadow-lg p-4 rounded-4 my-5">
          
          <!-- Logo + título -->
          <div class="text-center mb-3">
            <img src="images/friolisto.png" alt="FrioListo" width="70" height="70" class="mb-2">
            <h3 class="fw-bold" style="color:#005f73;">Crea tu cuenta</h3>
            <p class="text-muted mb-0">Completa los datos para registrarte en FrioListo</p>
          </div>

          <!-- Formulario -->
          <form action="procesarRegistro.jsp" method="post">
            <!-- Nombres -->
            <div class="mb-3">
              <label for="nombres" class="form-label fw-bold">Nombres</label>
              <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Ej: Juan Carlos" required>
            </div>

            <!-- Apellidos -->
            <div class="mb-3">
              <label for="apellidos" class="form-label fw-bold">Apellidos</label>
              <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ej: Pérez Gómez" required>
            </div>

            <!-- Sexo -->
            <div class="mb-3">
              <label class="form-label fw-bold">Sexo</label>
              <div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="sexo" id="sexoM" value="Masculino" required>
                  <label class="form-check-label" for="sexoM">Masculino</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="sexo" id="sexoF" value="Femenino">
                  <label class="form-check-label" for="sexoF">Femenino</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="sexo" id="sexoO" value="Otro">
                  <label class="form-check-label" for="sexoO">Otro</label>
                </div>
              </div>
            </div>

            <!-- Teléfono -->
            <div class="mb-3">
              <label for="telefono" class="form-label fw-bold">Teléfono</label>
              <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Ej: 987654321" required>
            </div>

            <!-- Correo -->
            <div class="mb-3">
              <label for="correo" class="form-label fw-bold">Correo electrónico</label>
              <input type="email" class="form-control" id="correo" name="correo" placeholder="ejemplo@correo.com" required>
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
              <label for="clave" class="form-label fw-bold">Contraseña</label>
              <input type="password" class="form-control" id="clave" name="clave" placeholder="Crea una contraseña" required>
            </div>

            <!-- Confirmar contraseña -->
            <div class="mb-3">
              <label for="confirmarClave" class="form-label fw-bold">Confirmar contraseña</label>
              <input type="password" class="form-control" id="confirmarClave" name="confirmarClave" placeholder="Repite la contraseña" required>
            </div>

            <!-- Mostrar contraseña -->
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="mostrarClave" onclick="togglePassword()">
              <label class="form-check-label" for="mostrarClave">Mostrar contraseña</label>
            </div>

            <!-- Botón -->
            <div class="d-grid">
              <button type="submit" class="btn fw-bold" style="background-color:#22a593; color:white;">Registrarse</button>
            </div>
          </form>

          <!-- Link login -->
          <div class="text-center mt-4">
            <p class="mb-0">¿Ya tienes cuenta? 
              <a href="login.jsp" style="color:#22a593; font-weight:bold; text-decoration:none;">Inicia sesión</a>
            </p>
          </div>

        </div>
      </div>
    </div>
  </div>

  <script>
    function togglePassword() {
      const clave = document.getElementById("clave");
      const confirmar = document.getElementById("confirmarClave");
      const check = document.getElementById("mostrarClave");
      clave.type = check.checked ? "text" : "password";
      confirmar.type = check.checked ? "text" : "password";
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
