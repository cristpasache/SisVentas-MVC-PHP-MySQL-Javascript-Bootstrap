<?php 

require "../model/Categoria.php";

$cat = new Categoria();

switch ($_REQUEST["operador"]) {

	case "listar_categoria":

		$datos = $cat->ListarCategoria();
		if ($datos) {
			for ($i=0; $i < count($datos); $i++) { 
				$list[] = array(
					"op" 		  => ($datos[$i]['estado'] == 1) ? 
									'<div class="btn-group">
										<button class="btn btn-info dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="icon-gear"></i>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" data-toggle="modal" data-target="#editar_categoria" onclick="ObtenerCategoriaPorID('.$datos[$i]['categoria_id'].", 'editar'".');">
												<i class="icon-edit"></i> Editar
											</a>
											<a class="dropdown-item" onclick="ObtenerCategoriaPorID('.$datos[$i]['categoria_id'].", 'desactivar'".');">
												<i class="icon-trash"></i> Eliminar
											</a>
										</div>
									</div>' : 
									'<div class="btn-group">
										<button class="btn btn-info dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="icon-gear"></i>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" onclick="ObtenerCategoriaPorID('.$datos[$i]['categoria_id'].", 'activar'".');">
												<i class="icon-check"></i> Activar
											</a>
										</div>
									</div>',
					"id" 		  => $datos[$i]['categoria_id'],
					"nombre" 	  => $datos[$i]['nombre'],
					"descripcion" => $datos[$i]['descripcion'],
					"estado" 	  => ($datos[$i]['estado'] == 1) ? '<div class="tag tag-success">Activo</div>' : 
																   '<div class="tag tag-danger">Inactivo</div>'
				);
			}
			$resultados = array(
				"sEcho" 				=> 1,
				"iTotalRecords" 		=> count($list),
				"iTotalDisplayRecords"	=> count($list),
				"aaData"				=> $list
			);
		}
		echo json_encode($resultados);
	break;

	case "registrar_categoria":
		if (isset($_POST["nombre"], $_POST["descripcion"]) && !empty($_POST["nombre"]) && !empty($_POST["descripcion"])) {
			$nombre = $_POST["nombre"];
			$descripcion = $_POST["descripcion"];
			if ($cat->RegistrarCategoria($nombre, $descripcion)) {
				$response = "success";
			} else {
				$response = "error";
			}
		} else {
			$response = "requerid";
		}
		echo $response;
	break;

	case "obtener_categoria_por_id":
		if (isset($_POST["categoria_id"]) && !empty($_POST["categoria_id"])) {
			$data = $cat->ObtenerCategoriaPorID($_POST["categoria_id"]);
			if ($data) {
				$list[] = array(
					"id" 		  => $data['categoria_id'],
					"nombre" 	  => $data['nombre'],
					"descripcion" => $data['descripcion']
				);
				echo json_encode($list);
			}
		}
	break;

	case "editar_categoria":
		if (isset($_POST["nombre"], $_POST["descripcion"], $_POST["categoria_id"]) && !empty($_POST["nombre"]) && !empty($_POST["descripcion"]) && !empty($_POST["categoria_id"])) {
			$categoria_id = $_POST["categoria_id"];
			$nombre = $_POST["nombre"];
			$descripcion = $_POST["descripcion"];
			if ($cat->EditarCategoria($categoria_id, $nombre, $descripcion)) {
				$response = "success";
			} else {
				$response = "error";
			}
		} else {
			$response = "requerid";
		}
		echo $response;
	break;

	case "desactivar_categoria":
		if (isset($_POST["categoria_id"]) && !empty($_POST["categoria_id"])) {
			if ($cat->DesactivarCategoria($_POST["categoria_id"])) {
				$response = "success";
			} else {
				$response = "error";
			}
		} else {
			$response = "error";
		}
		echo $response;
	break;

	case "activar_categoria":
		if (isset($_POST["categoria_id"]) && !empty($_POST["categoria_id"])) {
			if ($cat->ActivarCategoria($_POST["categoria_id"])) {
				$response = "success";
			} else {
				$response = "error";
			}
		} else {
			$response = "error";
		}
		echo $response;
	break;
}

?>