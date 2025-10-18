<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- se agrega jstl core para manejo condicional -->
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro - FrioListo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
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

  <!-- ALERTA FLOTANTE (error registro) -->
  <!-- usando jstl para verificar si existe el error -->
  <c:if test="${not empty errorRegistro}">
    <div id="alertaError" 
         class="position-fixed top-0 end-0 m-3 alert alert-danger d-flex align-items-center shadow" 
         style="z-index:9999; border-radius:12px; min-width:280px;">
         
      <!-- Icono de error -->
      <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" 
           class="bi bi-x-circle-fill me-2 text-danger" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.646 4.646a.5.5 
                 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 
                 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 
                 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 
                 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 
                 0 0 1 0-.708z"/>
      </svg>

      <!-- Texto -->
      <div>
        ${errorRegistro}
      </div>
    </div>

    <script>
      // animación flotante para el error
      const alertaErr = document.getElementById("alertaError");
      alertaErr.style.opacity = 0;
      alertaErr.style.transform = "translateX(100px)";
      setTimeout(() => {
        alertaErr.style.transition = "all 0.5s ease";
        alertaErr.style.opacity = 1;
        alertaErr.style.transform = "translateX(0)";
      }, 100);

      // desaparece solo
      setTimeout(() => {
        alertaErr.style.transition = "all 0.5s ease";
        alertaErr.style.opacity = 0;
        alertaErr.style.transform = "translateX(100px)";
        setTimeout(() => alertaErr.remove(), 500);
      }, 4000);
    </script>
  </c:if>

  <!-- CONTENEDOR DEL FORM -->
  <div class="container d-flex justify-content-center align-items-center py-5">
    <div class="row justify-content-center w-100">
      <div class="col-11 col-sm-9 col-md-7 col-lg-6 col-xl-5">
        <div class="card shadow-lg p-4 rounded-4 my-5">

          <!-- Logo + título -->
          <div class="text-center mb-3">
            <img src="images/friolisto.png" alt="FrioListo" width="70" height="70" class="mb-2">
            <h3 class="fw-bold" style="color:#005f73;">Crea tu cuenta</h3>
            <p class="text-muted mb-0">Completa los datos para registrarte en FrioListo</p>
          </div>

          <!-- Formulario -->
          <form action="RegistroServlet" method="post">
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
