<?php
session_start(); // Iniciando sesion
$error=''; // Variable para almacenar el mensaje de error
if (isset($_POST['submit'])) {
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "Username or Password is invalid";
}
else
{
// Define $username y $password
$username=$_POST['username'];
//$password=$_POST['password'];
// Estableciendo la conexion a la base de datos
include("config/db.php");//Contienen las variables, el servidor, usuario, contraseña y nombre  de la base de datos
include("config/conexion.php");//Contiene de conexion a la base de datos
$consult = mysqli_query($con, "SELECT password FROM users WHERE email = '" . $username . "'");
$row = mysqli_fetch_assoc($consult);
#echo $row['password'];

// Para proteger de Inyecciones SQL 
$username    = mysqli_real_escape_string($con,(strip_tags($username,ENT_QUOTES)));
//$password =  sha1($password);//Algoritmo de encriptacion de la contraseña http://php.net/manual/es/function.sha1.php

#$sql = "SELECT email, password FROM users WHERE email = '" . $username . "' and password='".$row['password']."';";
$sql = "SELECT roles.title, users.email, users.password FROM users INNER JOIN roles ON roles.id = users.role_id
WHERE email = '" . $username . "' and password='".$row['password']."' AND roles.title = 'Administrador';";
$query=mysqli_query($con,$sql);
$res = mysqli_fetch_assoc($query);
$n = $res['title'];
$counter=mysqli_num_rows($query);
if ($counter==1||$n=="Administrador"){
		$_SESSION['login_user_sys']=$username; // Iniciando la sesion
		header("location: profile.php"); // Redireccionando a la pagina profile.php
	
	
} else {
$error = "El correo electrónico y/o contraseña es inválida o no es una cuenta de Administrador.";	
}
}
}
?>