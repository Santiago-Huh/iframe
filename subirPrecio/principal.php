<?php
include("conexion.php");
include('session.php');
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gain POS Assistant</title>

    <!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <!--<link href="css/style_nav.css" rel="stylesheet">-->
    <link href="css/style_side.css" rel="stylesheet">
    <link rel="stylesheet" href="../fontawesome/css/all.css">

    <!--<style>
		.content {
            margin-top: 80px;
		}
	</style>-->
</head>
<body>
    
    <!--<nav class="navbar navbar-default navbar-fixed-top">
        <?php #include('./navs/nav.php'); ?>
    </nav>-->
    <nav class="navbar navbar-inverse" style="display: unset;
position: fixed; top: 0; bottom: 0; background: #2d2f3e; width: 10rem; overflow-y: auto; overflow-x: hidden; animation: sidebar-slide-right 0.8s; z-index: 1030; font-weight: 300;">
    <?php include("./sidebars/sidebar.php"); ?>
</nav>

    <div class="content" style="margin-top: 80px; float: right;">
    <div class="pestañas"> 
        <a href="../filtroVenta">
            <button class="pestaña" style="font-size: 20px; border: none; width: 200px; padding: 10px; border-top-left-radius: 10px;">Lista de productos</button>
        </a>
        <a href="../subirPrecio">
        <button class="pestaña" style="width:250px; border: none; background-color: #2d2f3e2e; color: #535561;">Aumento por Venta</button>
        </a>
        <a href="../subirPrecio/compra.php">
        <button class="pestaña" style="width:250px; border-top-right-radius: 10px;">Aumento por Compra</button>
        </a>
    </div>
        <div class="container" style="font-family: 'Raleway', sans-serif; background: #ffffff;

box-shadow: 0 1px 15px 1px rgba(60, 55, 68, 0.15);">
        <h2>Lista de grupos (Venta)</h2><h3>Bienvenid@ <i><?php echo $login_session; ?></i></h3>
        <hr />
        <div class="clear"> </div>
			<h4><a href="logout.php"> Cerrar sesión</a></h4>
		</div>

        <?php
        if(isset($_GET['aksi']) == 'delete'){
            $nik = mysqli_real_escape_string($con,(strip_tags($_GET["nik"],ENT_QUOTES)));
            $cek = mysqli_query($con, "SELECT * FROM product_groups WHERE id='$nik'");
            if(mysqli_num_rows($cek) == 0){
                echo '<div class="alert alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> No se encontraron datos.</div>';
            }else{
                echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> Error, no se pudo eliminar los datos.</div>';
            }
        }
        ?>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Accion</th>
                </tr>
                <?php
                $sql = mysqli_query($con, "SELECT * FROM product_groups");
                if(mysqli_num_rows($sql) == 0){
                    echo '<tr><td colspan="8">No hay datos.</td></tr>';
                }else{
                    $no = 1;
                    while($row = mysqli_fetch_assoc($sql)){ ?>
                    <tr>
                        <td><?php echo $no; ?></td>
                        <td><?php echo $row['name']; ?></td>
                        <td>
                        <a href="edit.php?nik=<?php echo $row['id']; ?>" title="Editar datos" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                        </td>
                    </tr>
                <?php
                        $no++;
                    }
                }
                ?>
            </table>
        </div>

        </div>
    </div>

</body>
</html>