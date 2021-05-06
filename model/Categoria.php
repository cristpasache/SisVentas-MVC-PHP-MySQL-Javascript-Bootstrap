<?php 

	require "../config/Conexion.php";

	class Categoria {

		public $cnx;

		function __construct() {
			$this->cnx = Conexion::ConectarDB();
		}

		//FUNCION PARA LISTAR LOS DATOS DE LAS CATEGORIAS
		function ListarCategoria() {
			$query = "SELECT * FROM categoria";
			$result = $this->cnx->prepare($query);
			if ($result->execute()) {
				if ($result->rowCount() > 0) {
					while ($fila = $result->fetch(PDO::FETCH_ASSOC)) {
						$datos[] = $fila;
					}
					return $datos;
				}
			}
			return false;
		}

		//FUNCION PARA REGISTRAR UNA CATEGORIA
		function RegistrarCategoria($nombre, $descripcion) {
			$query = "INSERT INTO categoria (nombre, descripcion) VALUES (?, ?)";
			$result = $this->cnx->prepare($query);
			$result->bindParam(1, $nombre);
			$result->bindParam(2, $descripcion);
			if ($result->execute()) {
				return true;
			}
			return false;
		}

		//FUNCION PARA OBTENER UNA CATEGORIA POR ID
		function ObtenerCategoriaPorID($categoria_id) {
			$query = "SELECT * FROM categoria WHERE categoria_id = ? ";
			$result = $this->cnx->prepare($query);
			$result->bindParam(1, $categoria_id);
			if ($result->execute()) {
				return $result->fetch(PDO::FETCH_ASSOC);
			}
			return false;
		}

		//FUNCION PARA EDITAR UN REGISTRO
		function EditarCategoria($categoria_id, $nombre, $descripcion) {
			$query = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE categoria_id = ? ";
			$result = $this->cnx->prepare($query);
			$result->bindParam(1, $nombre);
			$result->bindParam(2, $descripcion);
			$result->bindParam(3, $categoria_id);
			if ($result->execute()) {
				return true;
			}
			return false;
		}

		//FUNCION PARA DESACTIVAR UN REGISTRO
		function DesactivarCategoria($categoria_id) {
			$query = "UPDATE categoria SET estado = 0 WHERE categoria_id = ? ";
			$result = $this->cnx->prepare($query);
			$result->bindParam(1, $categoria_id);
			if ($result->execute()) {
				return true;
			}
			return false;
		}

		//FUNCION PARA ACTIVAR UN REGISTRO
		function ActivarCategoria($categoria_id) {
			$query = "UPDATE categoria SET estado = 1 WHERE categoria_id = ? ";
			$result = $this->cnx->prepare($query);
			$result->bindParam(1, $categoria_id);
			if ($result->execute()) {
				return true;
			}
			return false;
		}
	}

?>