<?php
/*Datos de conexion a la base de datos*/
$db_host = "localhost:3306";
$db_user = "root"; //grupoc20_test -- grupoc20_admin
$db_pass = ""; //M@}[?g^~9V[T  -- 4dm1n1str4d0r
$db_name = "iframe"; //grupoc20_testpos  -- grupoc20_pos
 
$con = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
 
if(mysqli_connect_errno()){
	echo 'No se pudo conectar a la base de datos : '.mysqli_connect_error();
} else {
    //echo 'Listo';
}
?>