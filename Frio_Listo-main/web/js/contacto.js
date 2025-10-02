document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('contactForm');
  const mensajeExito = document.getElementById('mensaje-exito');
  const popover = document.getElementById('popover');
  const contenidoPopover = document.getElementById('contenido-popover');
  const cerrarPopover = document.getElementById('cerrarPopover');

  form.addEventListener('submit', (e) => {
    // Validaciones antes de enviar al servidor
    const nombre = form.nombre.value.trim();
    const email = form.email.value.trim();
    const telefono = form.telefono.value.trim();
    const asunto = form.asunto.value.trim();
    const mensaje = form.mensaje.value.trim();

    const emailValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

    if (nombre.length < 3) {
      alert('El nombre debe tener al menos 3 caracteres.');
      form.nombre.focus();
      e.preventDefault();
      return;
    }

    if (!emailValido) {
      alert('Ingresa un correo electrónico válido.');
      form.email.focus();
      e.preventDefault();
      return;
    }

    if (mensaje.length < 10) {
      alert('El mensaje debe tener al menos 10 caracteres.');
      form.mensaje.focus();
      e.preventDefault();
      return;
    }

    // ✅ Mostrar popover antes de enviar
    contenidoPopover.innerHTML = `
      <p style="font-weight: bold; font-size: 1.1rem; color: #003366; margin-bottom: 10px;">
        ✅ Datos listos para enviar
      </p>
      <img src="/friolisto/img/ingreso.gif" alt="Icono contacto" style="width: 100px; margin-bottom: 10px;">
      <p><strong>Nombre:</strong> ${nombre}</p>
      <p><strong>Correo:</strong> ${email}</p>
      <p><strong>Teléfono:</strong> ${telefono}</p>
      <p><strong>Asunto:</strong> ${asunto}</p>
      <p><strong>Mensaje:</strong> ${mensaje}</p>
    `;

    popover.style.display = 'flex';
    setTimeout(() => {
      popover.style.opacity = '1';
      popover.style.pointerEvents = 'auto';
    }, 10);

    mensajeExito.style.display = 'block';

    // 🔹 Si quieres que SOLO muestre popover y NO envíe al servidor, descomenta la línea siguiente:
    // e.preventDefault();
  });

  cerrarPopover.addEventListener('click', () => {
    popover.style.opacity = '0';
    popover.style.pointerEvents = 'none';
    setTimeout(() => {
      popover.style.display = 'none';
    }, 300);
  });

  window.addEventListener('click', (e) => {
    if (e.target === popover) {
      popover.style.opacity = '0';
      popover.style.pointerEvents = 'none';
      setTimeout(() => {
        popover.style.display = 'none';
      }, 300);
    }
  });
});



