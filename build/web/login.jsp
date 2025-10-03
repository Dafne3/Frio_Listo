<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login - FrioListo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- importante para responsive -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    /* Efecto inputs */
    .form-control:focus {
      border-color: #22a593;
      box-shadow: 0 0 8px rgba(34, 165, 147, 0.6);
      transition: all 0.3s ease-in-out;
    }
  </style>
</head>
<body style="background-color:#f8fbfd;">

  <!-- Contenedor responsive -->
  <div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row justify-content-center w-100">
      <div class="col-11 col-sm-9 col-md-7 col-lg-5 col-xl-4">
        
        <!-- Card -->
        <div class="card shadow-lg p-4 rounded-4 my-4">
          
          <!-- Logo + título -->
          <div class="text-center mb-3">
            <img src="images/friolisto.png" alt="FrioListo" width="70" height="70" class="mb-2">
            <h3 class="fw-bold" style="color:#005f73;">Accede a tu cuenta</h3>
            <p class="text-muted mb-0">Bienvenido de nuevo, ingresa tus credenciales</p>
          </div>

          <!-- Formulario -->
          <form action="procesarLogin.jsp" method="post">
            
            <!-- Correo -->
            <div class="mb-3">
              <label for="correo" class="form-label fw-bold">Correo electrónico</label>
              <input type="email" class="form-control" id="correo" name="correo" 
                     placeholder="Ej: admin@mail.com" required>
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
              <label for="clave" class="form-label fw-bold">Contraseña</label>
              <input type="password" class="form-control" id="clave" name="clave" 
                     placeholder="Ingresa tu contraseña" required>
            </div>

            <!-- Mostrar contraseña -->
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="mostrarClave" onclick="togglePassword()">
              <label class="form-check-label" for="mostrarClave">Mostrar contraseña</label>
            </div>

            <!-- Botón -->
            <div class="d-grid">
              <button type="submit" class="btn fw-bold" style="background-color:#22a593; color:white;">
                Iniciar sesión
              </button>
            </div>
          </form>

          <!-- Registro -->
          <div class="text-center mt-4">
            <p class="mb-0">¿No tienes cuenta? 
              <a href="registro.jsp" style="color:#22a593; font-weight:bold; text-decoration:none;">Regístrate aquí</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    function togglePassword() {
      const clave = document.getElementById("clave");
      clave.type = clave.type === "password" ? "text" : "password";
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

