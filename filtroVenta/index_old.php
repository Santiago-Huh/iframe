<?php include("conexion.php"); ?>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gain POS Assistant</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
    <script type="text/javascript" src="DataTables/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>

    <script src="http://code.jquery.com/jquery-2.0.3.min.js" data-semver="2.0.3" data-require="jquery"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/jquery.dataTables_themeroller.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link data-require="jqueryui@*" data-semver="1.10.0" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/css/smoothness/jquery-ui-1.10.0.custom.min.css" />
    <script data-require="jqueryui@*" data-semver="1.10.0" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/jquery.dataTables.js" data-semver="1.9.4" data-require="datatables@*"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style_nav.css" rel="stylesheet">
    <script src="js/script.js"></script>

    <link href="style.css" rel="stylesheet" />

    <!--<link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/style_nav.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
	  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>-->
  
    <!--<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
  
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>-->

    <!--<script src="http://code.jquery.com/jquery-2.0.3.min.js" data-semver="2.0.3" data-require="jquery"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/jquery.dataTables_themeroller.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/jquery.dataTables.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/demo_table_jui.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/demo_table.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/css/demo_page.css" rel="stylesheet" data-semver="1.9.4" data-require="datatables@*" />
    <link data-require="jqueryui@*" data-semver="1.10.0" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/css/smoothness/jquery-ui-1.10.0.custom.min.css" />
    <script data-require="jqueryui@*" data-semver="1.10.0" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.0/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/jquery.dataTables.js" data-semver="1.9.4" data-require="datatables@*"></script>
    <link href="style.css" rel="stylesheet" />
    <script src="js/script.js"></script>-->

    <style>
      .content{
        margin-top: 80px;
      }
    </style>

  </head>

  <body>

    <nav class="navbar navbar-default navbar-fixed-top">
      <?php include("nav.php"); ?>
    </nav>

    <div class="container">
      <div class="content">

      <h2>Productos Vendidos</h2>
      <hr />

      

      <form class="form-inline" method="get">
			  <div class="form-group">

				<select name="filter1" class="form-control" onchange="form.submit()">
					<option value="0">Filtros de Categorias</option>
          <?php 
            $filter1 = (isset($_GET['filter1']) ? strtolower($_GET['filter1']) : NULL);

            $group = mysqli_query($con, "SELECT id, name FROM product_categories");
            while($row = mysqli_fetch_assoc($group)){ ?>
            <option value="<?php echo $row['id']; ?>" <?php if($filter1 == $row['id']){ echo 'selected'; } ?>><?php echo $row['name']; ?></option>
          <?php } ?>
				</select>

        <select name="filter2" class="form-control" onchange="form.submit()">
					<option value="0">Filtros de Marcas</option>
          <?php 
            $filter2 = (isset($_GET['filter2']) ? strtolower($_GET['filter2']) : NULL);

            $group = mysqli_query($con, "SELECT id, name FROM product_brands");
            while($row = mysqli_fetch_assoc($group)){ ?>
            <option value="<?php echo $row['id']; ?>" <?php if($filter2 == $row['id']){ echo 'selected'; } ?>><?php echo $row['name']; ?></option>
          <?php } ?>
				</select>

        <!--<select name="filter3" class="form-control" onchange="form.submit()">
					<option value="0">Filtros de Grupos</option>
          <?php 
            //$filter3 = (isset($_GET['filter3']) ? strtolower($_GET['filter3']) : NULL);

            //$group = mysqli_query($con, "SELECT id, name FROM product_groups");
            //while($row = mysqli_fetch_assoc($group)){ ?>
            <option value="<?php //echo $row['id']; ?>" <?php //if($filter3 == $row['id']){ echo 'selected'; } ?>><?php //echo $row['name']; ?></option>
          <?php //} ?>
				</select>-->

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span id="date-label-from" class="date-label">De: </span><input class="date_range_filter date" type="text" id="datepicker_from" />
        <span id="date-label-to" class="date-label">Hasta:<input class="date_range_filter date" type="text" id="datepicker_to" />

			  </div>
		  </form>
    <hr />

    <table width="100%" class="table table-striped table-bordered dt-responsive nowrap display" id="grid">
        <thead>
          <tr>
          <th>Fecha</th>
          <th>Categoria</th>
          <th>Marca</th>
          <th>Producto Vendido</th>
          <th>Cantidad</th>
          <th>Total</th>
          </tr>
        </thead>

        <?php 
          if($filter1 || $filter2){
            $sql = mysqli_query($con, "SELECT DATE_FORMAT(orders.date, '%m/%d/%Y') AS date, product_categories.name AS cate, product_brands.name AS marca, products.title, order_items.quantity, order_items.sub_total 
            FROM products INNER JOIN product_categories ON product_categories.id = products.category_id 
            INNER JOIN product_brands ON product_brands.id = products.brand_id 
            INNER JOIN order_items ON order_items.product_id = products.id
            INNER JOIN orders ON orders.id = order_items.order_id 
            WHERE (products.category_id='$filter1' OR products.brand_id='$filter2')
            AND (order_items.type = 'sales' OR orders.order_type = 'sales')");
          }else{
            $sql = mysqli_query($con, "SELECT DATE_FORMAT(orders.date, '%m/%d/%Y') AS date, product_categories.name AS cate, product_brands.name AS marca, products.title, order_items.quantity, order_items.sub_total 
            FROM products INNER JOIN product_categories ON product_categories.id = products.category_id 
            INNER JOIN product_brands ON product_brands.id = products.brand_id 
            INNER JOIN order_items ON order_items.product_id = products.id
            INNER JOIN orders ON orders.id = order_items.order_id 
            WHERE order_items.type = 'sales' OR orders.order_type = 'sales'");
          }
          #$no = 1;
          while($row = mysqli_fetch_assoc($sql)){
            echo '
                <tbody>
                  <tr>
                    <td>'.$row['date'].'</td>
                    <td>'.$row['cate'].'</td>
                    <td>'.$row['marca'].'</td>
                    <td>'.$row['title'].'</td>
                    <td>'.$row['quantity'].'</td>
                    <td>'.$row['sub_total'].'</td>
                  </tr>
                </tbody>
            ';
            #$no++;
          }
        ?>

        <!--<tbody>
          <tr>
            <td>03/03/2020</td>
            <td>5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>-->
      </table>

      </div>
    </div>

    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#grid').DataTable();
        });
    </script>
  </body>

</html>