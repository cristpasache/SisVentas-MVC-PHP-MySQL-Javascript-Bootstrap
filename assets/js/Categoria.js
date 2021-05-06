var table;

init();

//FUNCION QUE SE EJECUTARA AL INICIO
function init() {
	LlenarTablaCategoria();
}

//FUNCION PARA LLENAR LA TABLA CATEGORIA
function LlenarTablaCategoria() {
	table = $('#table_categoria').DataTable({
		pageLength: 10,
		responsive: true,
		processing: true,
		ajax: "../controller/CategoriaController.php?operador=listar_categoria",
		columns: [
			{ data: 'op' },
			{ data: 'id' },
			{ data: 'nombre' },
			{ data: 'descripcion' },
			{ data: 'estado' }
		]
	});
}

//FUNCION PARA REGISTRAR UNA CATEGORIA
function RegistrarCategoria() {
	nombre = $('#nombre_cat').val();
	descripcion = $('#descripcion_cat').val();
	parametros = { "nombre":nombre, "descripcion":descripcion }
	$.ajax({
		data:parametros,
		url:'../controller/CategoriaController.php?operador=registrar_categoria',
		type:'POST',
		beforeSend:function(){},
		success:function(response) {
			if (response == "success") {
				table.ajax.reload();
				LimpiarControles();
				$('#nueva_categoria').modal('hide');
				toastr.success("Se guardo correctamente los datos", "Registro exitoso!");
			} else if (response == "requerid") {
				toastr.info("Complete todos los datos requeridos por favor", "Campos incompletos!");
			} else {
				toastr.error("Comuniquese con su proveedor", "Error!");
			}
		}
	})
}

//FUNCION PARA LIMPIAR LOS CONTROLES
function LimpiarControles() {
	$('#nombre_cat').val('');
	$('#descripcion_cat').val('');
}

//FUNCION PARA OBTENER UNA CATEGORIA POR ID
function ObtenerCategoriaPorID(categoria_id, op) {
	$.ajax({
		data: { "categoria_id":categoria_id },
		url:'../controller/CategoriaController.php?operador=obtener_categoria_por_id',
		type:'POST',
		beforeSend:function(){},
		success:function(response) {
			data = $.parseJSON(response);
			if (data.length > 0) {
				if (op == "editar") {
					$('#codigo_cat_editar').val(data[0]['id']);
					$('#nombre_cat_editar').val(data[0]['nombre']);
					$('#descripcion_cat_editar').val(data[0]['descripcion']);
				} else if (op == "desactivar") {
					Alerta_Desactivar(data[0]['id'], data[0]['nombre']);
				} else if (op == "activar") {
					Alerta_Activar(data[0]['id'], data[0]['nombre']);
				}
			}
		}
	})
}

//FUNCION PARA EDITAR UNA CATEGORIA
function EditarCategoria() {
	categoria_id = $('#codigo_cat_editar').val();
	nombre = $('#nombre_cat_editar').val();
	descripcion = $('#descripcion_cat_editar').val();
	parametros = { "categoria_id":categoria_id, "nombre":nombre, "descripcion":descripcion }
	$.ajax({
		data:parametros,
		url:'../controller/CategoriaController.php?operador=editar_categoria',
		type:'POST',
		beforeSend:function(){},
		success:function(response) {
			if (response == "success") {
				table.ajax.reload();
				LimpiarControles();
				$('#editar_categoria').modal('hide');
				toastr.success("Se guardo correctamente los datos", "Actualización exitosa!");
			} else if (response == "requerid") {
				toastr.info("Complete todos los datos requeridos por favor", "Campos incompletos!");
			} else {
				toastr.error("Comuniquese con su proveedor", "Error!");
			}
		}
	})
}

//FUNCION PARA DESACTIVAR UNA CATEGORIA
function DesactivarCategoria(categoria_id, nombre) {
	$.ajax({
		data: { "categoria_id":categoria_id },
		url:'../controller/CategoriaController.php?operador=desactivar_categoria',
		type:'POST',
		beforeSend:function(){},
		success:function(response) {
			if (response == "success") {
				table.ajax.reload();
				Swal.fire({
			    	title: 'Desactivado!',
			    	html: "La categoría: <h5>" + nombre + "</h5> fue desactivada correctamente!",
			    	type: 'success'
			    })
			} else {
				toastr.error("Comuniquese con su proveedor", "Error!");
			}
		}
	})
}

function Alerta_Desactivar(categoria_id, nombre) {
	Swal.fire({
	 	title: 'Estas seguro de desactivar?',
	 	html: "No podrás usar la categoría: <h5>" + nombre + "!</h5>",
	 	icon: 'warning',
	 	showCancelButton: true,
	 	confirmButtonColor: '#3085d6',
	 	cancelButtonColor: '#d33',
	 	confirmButtonText: 'Sí, desactivalo!'
	}).then((result) => {
  		if (result.value) {
      		DesactivarCategoria(categoria_id, nombre);
    	}
	})
}

//FUNCION PARA ACTIVAR UNA CATEGORIA
function ActivarCategoria(categoria_id, nombre) {
	$.ajax({
		data: { "categoria_id":categoria_id },
		url:'../controller/CategoriaController.php?operador=activar_categoria',
		type:'POST',
		beforeSend:function(){},
		success:function(response) {
			if (response == "success") {
				table.ajax.reload();
				Swal.fire({
			    	title: 'Activado!',
			    	html: "La categoría: <h5>" + nombre + "</h5> fue activada correctamente!",
			    	type: 'success'
			    })
			} else {
				toastr.error("Comuniquese con su proveedor", "Error!");
			}
		}
	})
}

function Alerta_Activar(categoria_id, nombre) {
	Swal.fire({
	 	title: 'Estas seguro de activar?',
	 	html: "Podrás usar la categoría: <h5>" + nombre + "!</h5>",
	 	icon: 'warning',
	 	showCancelButton: true,
	 	confirmButtonColor: '#3085d6',
	 	cancelButtonColor: '#d33',
	 	confirmButtonText: 'Sí, Activalo!'
	}).then((result) => {
  		if (result.value) {
      		ActivarCategoria(categoria_id, nombre);
    	}
	})
}