<?php
session_start();
include('conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre_usuario = $_POST['Nombre'];
    $contrasena = $_POST['Clave'];

    $sql = "SELECT * FROM Usuarios WHERE Nombre = '$nombre_usuario' AND Clave = '$contrasena'";

    $resultado = $conexion->query($sql);

    if ($resultado->num_rows > 0) {
        $_SESSION['Nombre'] = $nombre_usuario;
        
        header("Location: CYBERSHOP.php");
    } else {
        print "Credenciales incorrectas";
    }
}
?>
<!DOCTYPE html>
<head>
<title> Inicio Sesion </title>
<style>
body {
background-color: lightblue;
font-family: Georgia;  
display: flex;
flex-direction: column;
justify-content: center;
align-items: center; 
}
.for1 {
padding: 2px;
margin: 2px;  
}
</style>
</head>
<body>
<h1> Introduzca sus creedenciales </h1>   
<form class="for1" method="POST" action="">
<h3>Usuario: <input type="text" name="Nombre"></h3>
<h3>Clave: <input type="password" name="Clave"></h3>
<input type="submit" value="Enviar">
</form>
</body>
</html>