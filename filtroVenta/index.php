<?php include("conexion.php"); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Gain POS Assistant</title>

    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style_nav.css" rel="stylesheet">
    <script src="js/script.js"></script>

    <link href="style.css" rel="stylesheet"/>

    <style>
        .content {
            margin-top: 80px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <?php include("nav.php"); ?>
</nav>

<div class="content">
    <div class="container">

        <h2>Productos Vendidos</h2>
        <hr/>

        <form class="form-inline" method="get">
            <div class="form-group">

                <select name="filter1" class="form-control" onchange="form.submit()">
                    <option value="0">Filtros de Categorias</option>
                    <?php
                    $filter1 = (isset($_GET['filter1']) ? strtolower($_GET['filter1']) : NULL);

                    $group = mysqli_query($con, "SELECT id, name FROM product_categories");
                    while ($row = mysqli_fetch_assoc($group)) { ?>
                        <option value="<?php echo $row['id']; ?>" <?php if ($filter1 == $row['id']) {
                            echo 'selected';
                        } ?>><?php echo $row['name']; ?></option>
                    <?php } ?>
                </select>

                <select name="filter2" class="form-control" onchange="form.submit()">
                    <option value="0">Filtros de Marcas</option>
                    <?php
                    $filter2 = (isset($_GET['filter2']) ? strtolower($_GET['filter2']) : NULL);

                    $group = mysqli_query($con, "SELECT id, name FROM product_brands");
                    while ($row = mysqli_fetch_assoc($group)) { ?>
                        <option value="<?php echo $row['id']; ?>" <?php if ($filter2 == $row['id']) {
                            echo 'selected';
                        } ?>><?php echo $row['name']; ?></option>
                    <?php } ?>
                </select>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Rango de Fechas: <input id="Date_search" type="text" placeholder="Buscar por d&iacute;a"/><br>

            </div>
        </form>
        <hr/>

        <table width="100%" id="tabla" class="table table-striped table-bordered dt-responsive nowrap display">
            <thead>
            <tr>
                <th>Fecha</th>
                <th>Categoria</th>
                <th>Marca</th>
                <th>Producto Vendido</th>
                <th>Cantidad</th>
                <th>Total</th>
            </tr>
            <!--<td>Date</td>-->
            </thead>
            <tbody>
            </tbody>


            <!--<tbody>
                <tr>
                <td>03/03/2020</td>
                </tr>
                <tr>
                <td>04/12/2020</td>
                </tr>
                <tr>
                <td>03/22/2020</td>
                </tr>
                <tr>
                <td>03/11/2020</td>
                </tr>
                <tr>
                <td>03/10/2020</td>
                </tr>
                <tr>
                <td>04/1/2020</td>
                </tr>
            </tbody>-->
        </table>

    </div>
</div>

<script type="text/javascript">
    let minDateFilter = "";
    let maxDateFilter = "";
    let table;
    function transformObjectToArrayValues(record) {
        let newRecord = [];
        for (const key in record) {
            newRecord.push(record[key])
        }
        return newRecord;
    }

    $.fn.dataTable.ext.search.push(
        function (oSettings, aData, iDataIndex) {
            if (typeof aData._date == 'undefined') {
                aData._date = new Date(aData[0]).getTime();
            }
            if (minDateFilter && !isNaN(minDateFilter)) {
                if (aData._date < minDateFilter) {
                    return false;
                }
            }

            if (maxDateFilter && !isNaN(maxDateFilter)) {
                if (aData._date > maxDateFilter) {
                    return false;
                }
            }
            return true;
        }
    );
    $(document).ready(function () {
        $("#Date_search").val("");
        $.ajax({
            url: `api.php?filter1=<?php echo $filter1; ?>&filter2=<?php echo $filter2; ?>`, success: function (response) {
                let responseParsed = JSON.parse(response);
                let dataForDatatable = responseParsed.result.map((record) => {
                    return transformObjectToArrayValues(record);
                });
                table = $('#tabla').DataTable({
                    data: dataForDatatable,
                    deferRender: true,
                    "autoWidth": false,
                    "search": {
                        "regex": true,
                        "caseInsensitive": false,
                    },
                    "language": {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                    ,
                });
            }
        });
    });

    $("#Date_search").daterangepicker({
        "locale": {
            "format": "MM/DD/YYYY",
            "separator": " al ",
            "applyLabel": "Aplicar",
            "cancelLabel": "Cancelar",
            "fromLabel": "Desde",
            "toLabel": "Hasta",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": [
                "Do",
                "Lu",
                "Ma",
                "Mi",
                "Ju",
                "Vi",
                "Sa"
            ],
            "monthNames": [
                "Enero",
                "Febrero",
                "Marzo",
                "Abril",
                "Mayo",
                "Junio",
                "Julio",
                "Agosto",
                "Septiembre",
                "Octubre",
                "Noviembre",
                "Diciembre"
            ],
            "firstDay": 1
        },
        "opens": "center",
    }, function (start, end, label) {
        maxDateFilter = end;
        minDateFilter = start;
        table.draw('full-reset');
    });
</script>

</body>
</html>