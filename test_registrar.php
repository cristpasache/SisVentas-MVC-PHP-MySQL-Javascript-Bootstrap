<?php 

require "./model/Usuario.php";

$usuario = new Usuario();

$n_documento = "45285767";
$nombre = "Cristhian";
$apellidos = "Pasache Rivas";
$correo = "cristpasache@gmail.com";
$clave = "P15c02016W";

if ($usuario->RegistrarUsuario($n_documento, $nombre, $apellidos, $correo, $clave)) {
	echo "registro exitoso";
} else {
	echo "Error D:";
}

 ?>