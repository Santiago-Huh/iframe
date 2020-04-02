<?php
include('login.php'); // Includes Login Script

if(isset($_SESSION['login_user_sys'])){
header("location: principal.php");
}
//echo password_hash("Sierra117", PASSWORD_DEFAULT)."\n";
/*include("config/db.php");
include("config/conexion.php");
$sql = mysqli_query($con, "SELECT password FROM users WHERE email = 'jafetgonzalez117@gmail.com'");
$row = mysqli_fetch_assoc($sql);
echo $row['password'];
$sql1 = "SELECT email, password FROM users WHERE password='".$row['password']."';";
$query=mysqli_query($con,$sql1);
$r = mysqli_fetch_assoc($query);
echo $r['email'];*/
#echo $r['password'];

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Iniciar sesión</title>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Flat Login Form Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Signika:400,600' rel='stylesheet' type='text/css'>
<!--google fonts-->
</head>
<body>
    <!--header start here-->
    <h1>Inicio de sesi&oacute;n para aumentos</h1>
    <div class="header agile">
        <div class="wrap">
            <div class="login-main wthree">
                <div class="login">
                <h3>Inicie sesión</h3>
                <form action="#" method="post">
                    <input type="text" placeholder="Correo electrónico" required="" name="username" required>
                    <input type="password" placeholder="Contraseña" name="password" required>
                    <input name="submit" type="submit" value="Ingresar">
                    <a href="../filtroVenta" class="btn btn-primary btn-sm float-right">Regresar</a>
                </form>
                <div class="clear"> </div>
                    <span><?php echo $error; ?></span>
                </div>
                
                
            </div>
        </div>
    </div>
    <!--header end here-->
    <!--copy rights end here-->
    <div class="copy-rights w3l">		 	
        <p>© <?php echo date("Y");?> <a href="#" target="_blank">Sistemas Web</a>  Todos los derechos reservados | Diseñado por  <a href="#" target="_blank">Administrapp</a> </p>		 	
    </div>
    <!--copyrights start here-->

</body>
</html>