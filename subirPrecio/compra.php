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
	<link href="css/style_nav.css" rel="stylesheet">

    <style>
		.content {
            margin-top: 80px;
		}
	</style>
</head>
<body>
    
    <nav class="navbar navbar-default navbar-fixed-top">
        <?php include('./navs/nav-compra.php'); ?>
    </nav>

    <div class="container">
        <div class="content" style="font-family: 'Raleway', sans-serif;">
        <h2>Lista de grupos (Compra)</h2>
        <hr />

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
                        <a href="edit-compra.php?nik=<?php echo $row['id']; ?>" title="Editar datos" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
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