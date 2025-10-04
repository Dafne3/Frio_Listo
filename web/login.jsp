<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ✅ Alerta de registro exitoso -->
<% if (request.getAttribute("exitoRegistro") != null) { %>
<div id="alertaExito" 
     class="position-fixed top-0 end-0 m-3 alert alert-success d-flex align-items-center shadow" 
     style="z-index:9999; border-radius:12px; min-width:280px;">

  <!-- Icono -->
  <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" 
       class="bi bi-check-circle-fill me-2 text-success" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.97 11.03a.75.75 
             0 0 0 1.08.022l3.992-3.992a.75.75 
             0 0 0-1.06-1.06L7.477 9.417 5.383 7.323a.75.75 
             0 0 0-1.06 1.06l2.647 2.647z"/>
  </svg>
  <div><%= request.getAttribute("exitoRegistro") %></div>
</div>
<script>
  const alertaEx = document.getElementById("alertaExito");
  alertaEx.style.opacity = 0;
  alertaEx.style.transform = "translateX(100px)";
  setTimeout(() => {
    alertaEx.style.transition = "all 0.5s ease";
    alertaEx.style.opacity = 1;
    alertaEx.style.transform = "translateX(0)";
  }, 100);
  setTimeout(() => {
    alertaEx.style.transition = "all 0.5s ease";
    alertaEx.style.opacity = 0;
    alertaEx.style.transform = "translateX(100px)";
    setTimeout(() => alertaEx.remove(), 500);
  }, 4000);
</script>
<% } %>

<!-- ❌ Alerta de error login -->
<% if (request.getAttribute("errorLogin") != null) { %>
<div id="alertaError" 
     class="position-fixed top-0 end-0 m-3 alert alert-danger d-flex align-items-center shadow" 
     style="z-index:9999; border-radius:12px; min-width:280px;">

  <!-- Icono -->
  <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" 
       class="bi bi-x-circle-fill me-2 text-danger" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.646 4.646a.5.5 
             0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 
             0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 
             0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 
             0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 
             0 0 1 0-.708z"/>
  </svg>
  <div><%= request.getAttribute("errorLogin") %></div>
</div>
<script>
  const alertaErr = document.getElementById("alertaError");
  alertaErr.style.opacity = 0;
  alertaErr.style.transform = "translateX(100px)";
  setTimeout(() => {
    alertaErr.style.transition = "all 0.5s ease";
    alertaErr.style.opacity = 1;
    alertaErr.style.transform = "translateX(0)";
  }, 100);
  setTimeout(() => {
    alertaErr.style.transition = "all 0.5s ease";
    alertaErr.style.opacity = 0;
    alertaErr.style.transform = "translateX(100px)";
    setTimeout(() => alertaErr.remove(), 500);
  }, 4000);
</script>
<% } %>




<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login - FrioListo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .form-control:focus {
      border-color: #22a593;
      box-shadow: 0 0 8px rgba(34, 165, 147, 0.6);
      transition: all 0.3s ease-in-out;
    }
    .alerta {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 10;
    padding: 10px;
    border-radius: 5px;
    background: #f44336;
    color: #fff;
    display: none;
}

  </style>
</head>
<body style="background-color:#f8fbfd;">

  <!-- Contenedor principal -->
  <div class="container min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row justify-content-center w-100">
      <div class="col-11 col-sm-9 col-md-7 col-lg-5 col-xl-4">

        <!-- Tarjeta login -->
        <div class="card shadow-lg p-4 rounded-4 my-4">

          <!-- Logo + título -->
          <div class="text-center mb-3">
            <img src="images/friolisto.png" alt="FrioListo" width="70" height="70" class="mb-2">
            <h3 class="fw-bold" style="color:#005f73;">Accede a tu cuenta</h3>
            <p class="text-muted mb-0">Bienvenido de nuevo, ingresa tus credenciales</p>
          </div>

          <!-- Formulario login -->
          <form action="procesarLogin.jsp" method="post">
            <div class="mb-3">
              <label for="correo" class="form-label fw-bold">Correo electrónico</label>
              <input type="email" class="form-control" id="correo" name="correo" placeholder="Ej: admin@mail.com" required>
            </div>

            <div class="mb-3">
              <label for="clave" class="form-label fw-bold">Contraseña</label>
              <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingresa tu contraseña" required>
            </div>

            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="mostrarClave" onclick="togglePassword()">
              <label class="form-check-label" for="mostrarClave">Mostrar contraseña</label>
            </div>

            <div class="d-grid">
              <button type="submit" class="btn fw-bold" style="background-color:#22a593; color:white;">
                Iniciar sesión
              </button>
            </div>
              <!-- Enlace a registro -->
          <div class="text-center mt-4">
            <p class="mb-0">¿No tienes cuenta? 
              <a href="registro.jsp" style="color:#22a593; font-weight:bold; text-decoration:none;">Regístrate aquí</a>
            </p>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Scripts -->
  <script>
    function togglePassword() {
      const clave = document.getElementById("clave");
      clave.type = clave.type === "password" ? "text" : "password";
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
