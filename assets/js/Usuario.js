function ValidarUsuario() {
	correo = $('#user_correo').val();
	clave = $('#user_clave').val();
	parametros = { "correo":correo, "clave":clave }
	$.ajax({
		data:parametros,
		type:'POST',
		url:'controller/UsuarioController.php?operador=validar_usuario',
		beforeSend:function(){},
		success:function(response) {
		  	if (response == "success") {
		  		let timerInterval
        		Swal.fire({
          			title: 'BIENVENIDO AL SISTEMA!',
          			html: 'Usted será redireccionado en <b></b> milisegundos.',
          			timer: 2000,
          			timerProgressBar: true,
          			onBeforeOpen: () => {
            			Swal.showLoading()
            			timerInterval = setInterval(() => {
              				const content = Swal.getContent()
              				if (content) {
                				const b = content.querySelector('b')
                				if (b) {
                  					b.textContent = Swal.getTimerLeft()
                				}
              				}
            			}, 100)
          			},
          			onClose: () => {
            			clearInterval(timerInterval)
          			}
        		}).then((result) => {
          			if (result.dismiss === Swal.DismissReason.timer) {
            			location.href = "pages/index.php";
          			}
        		})
		  	} else if (response == "notfound") {
		  		Limpiar();
		  		return Swal.fire("Mensaje de error", "Las credenciales no son correctas", "error");
		  	} else if (response == "requerid") {
		  		$("#user_correo").focus();
		  		return Swal.fire("Mensaje de advertencia", "Llene los campos vacios", "warning");
		  	}
		}
	})
}

function Limpiar() {
	$('#user_correo').val("");
	$('#user_clave').val("");
	$("#user_correo").focus();
}