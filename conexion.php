<?php
$servidor = "localhost";
$usuario = "root";
$contrasena = "";
$base_de_datos = "CYBERSHOP";
$puerto = 3307;

$conexion = new mysqli($servidor, $usuario, $contrasena, $base_de_datos, $puerto);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

?>