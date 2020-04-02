<?php
include("conexion.php");
include('session.php');
?>
<!DOCTYPE html>
<html lang="es">
<head><meta http-equiv="Content-Type" content="text/html; charset=gb18030">
<!--
Project      : Datos de empleados con PHP, MySQLi y Bootstrap CRUD  (Create, read, Update, Delete) 
Author		 : Santiago Huh
Website		 : 
Blog         : 
Email	 	 : ayrancan619@gmail.com
-->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gain POS Assistant</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-datepicker.css" rel="stylesheet">
	<link href="css/style_nav.css" rel="stylesheet">
	<style>
		.content {
			margin-top: 80px;
		}
	</style>
	
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<?php include("./navs/nav-edit-c.php");?>
	</nav>
	<div class="container">
		<div class="content" style="font-family: 'Raleway', sans-serif;">
			<?php
			// escaping, additionally removing everything that could be (html/javascript-) code
			// , cate.name as category_id, marca.name as brand_id
			/**
			 * INNER JOIN product_categories AS cate ON cate.id = pro.category_id
			* INNER JOIN product_brands AS marca ON marca.id = pro.brand_id
			 */
			$nik = mysqli_real_escape_string($con,(strip_tags($_GET["nik"],ENT_QUOTES)));
			$sql = mysqli_query($con, "SELECT pro.id, pro.title, grupo.name as group_id, pre.purchase_price as precio
			FROM  products AS pro 
            INNER JOIN product_variants AS pre ON pre.product_id = pro.id
			INNER JOIN product_groups AS grupo ON grupo.id = pro.group_id WHERE pro.group_id='$nik'"); 
			// SELECT * FROM product_groups WHERE id='$nik'
			if(mysqli_num_rows($sql) == 0){
				header("Location: index.php");
			}else{
				$row = mysqli_fetch_assoc($sql);
			}
			if(isset($_POST['save'])){
				$aumento		     = mysqli_real_escape_string($con,(strip_tags($_POST["aumento"],ENT_QUOTES)));
				/*$conver = $aumento / 100;
				$valor1 = $conver * $row['precio'];
				$valor2 = $valor1 + $row['precio'];
                $data2 = bcdiv($valor2, '1', 2);*/
				
				$update = mysqli_query($con, "UPDATE product_variants 
												INNER JOIN products ON products.id = product_variants.product_id 
												INNER JOIN product_groups ON product_groups.id = products.group_id 
												SET product_variants.purchase_price = 
												ROUND(('$aumento'/100 * product_variants.purchase_price) + product_variants.purchase_price)
												WHERE products.group_id = '$nik'") or die(mysqli_error());
				//UPDATE empleados SET nombres='$nombres', lugar_nacimiento='$lugar_nacimiento', fecha_nacimiento='$fecha_nacimiento', direccion='$direccion', telefono='$telefono', puesto='$puesto', estado='$estado' WHERE codigo='$nik'
				if($update){
					header("Location: edit-compra.php?nik=".$nik."&pesan=sukses");
				}else{
					echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Error, no se pudo guardar los datos.</div>';
				}
			}
			
			if(isset($_GET['pesan']) == 'sukses'){
				echo '<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>El aumento han sido efectuado con éxito.</div>';
			}
			?>
			<h2> <a  href="compra.php">Lista de Grupos</a> &raquo; Grupo <?php echo $row ['group_id']; ?> &raquo; Lista de productos</h2>
			<hr />

			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
					<label class="col-sm-3 control-label">Ingresar porcentaje a aumentar : </label>
					<div class="col-sm-1">
						<input type="number" name="aumento" value="<?php //echo $row ['precio']; ?>" class="form-control" placeholder="%" required>
					</div>
					<label class="col-sm-5 control-label"></label>
					<div class="col-sm-6">
						<input type="submit" name="save" class="btn btn-sm btn-primary" value="Aumentar porcentaje" style="background-color: #535561; border-style: none; padding: 10px; font-size: 15px;">
						<a href="compra.php" class="btn btn-sm btn-danger" style="border-style: none;padding: 10px;font-size: 15px;">Cancelar</a>
					</div>
				</div>
				<!--<div class="form-group">
					<label class="col-sm-5 control-label">&nbsp;</label>
					<div class="col-sm-6">
						<input type="submit" name="save" class="btn btn-sm btn-primary" value="Efectuar IVA">
						<a href="index.php" class="btn btn-sm btn-danger">Cancelar</a>
					</div>
				</div>-->
			</form>
			<hr />
			
			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<tr>
						<th>#</th>
						<th>Titulo</th>
						<!--<th>Descripción</th>
						<th>Categoria</th>
						<th>Marca</th>-->
						<th>Grupo</th>
						<th>Precio Compra</th>
						<!--<th>Cargo</th>
						<th>Estado</th>
						<th>Acciones</th>-->
					</tr>
					<?php
						$sql = mysqli_query($con, "SELECT pro.id, pro.title, grupo.name as group_id, pre.purchase_price as precio
						FROM  products AS pro
						INNER JOIN product_variants AS pre ON pre.product_id = pro.id
						INNER JOIN product_groups AS grupo ON grupo.id = pro.group_id WHERE pro.group_id='$nik'");  
						//SELECT * FROM empleados WHERE estado='$filter' ORDER BY codigo ASC
					if(mysqli_num_rows($sql) == 0){
						echo '<tr><td colspan="8">No hay datos.</td></tr>';
					}else{
						$no = 1;
						while($row = mysqli_fetch_assoc($sql)){
							echo '
							<tr>
								<td>'.$no.'</td>
								<td>'.$row['title'].'</td>
								<td>'.$row['group_id'].'</td>
								<td>$'.$row['precio'].'</td>
							</tr>';
							$no++;
						}
					}
					?>
				</table>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>


	<script type="text/javascript">
		function IVA(){
			let valor1 = Number(document.getElementById('valor1').value);

			let mul = valor1;

			document.getElementById('valor2').value = mul;
		}
	</script>
</body>
</html>