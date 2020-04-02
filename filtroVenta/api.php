<?php
include("conexion.php");

function convert_from_latin1_to_utf8_recursively($dat)
{
    if (is_string($dat)) {
        return utf8_encode($dat);
    } elseif (is_array($dat)) {
        $ret = [];
        foreach ($dat as $i => $d) $ret[ $i ] = convert_from_latin1_to_utf8_recursively($d);

        return $ret;
    } elseif (is_object($dat)) {
        foreach ($dat as $i => $d) $dat->$i = convert_from_latin1_to_utf8_recursively($d);

        return $dat;
    } else {
        return $dat;
    }
}

$filter1 = (isset($_GET['filter1']) ? strtolower($_GET['filter1']) : NULL);
$filter2 = (isset($_GET['filter2']) ? strtolower($_GET['filter2']) : NULL);
$sql = null;
if ($filter1 || $filter2) {
    $sql = mysqli_query($con, "SELECT DATE_FORMAT(orders.date, '%m/%d/%Y') AS date, product_categories.name AS cate, product_brands.name AS marca, products.title, order_items.quantity, order_items.sub_total 
                    FROM products INNER JOIN product_categories ON product_categories.id = products.category_id 
                    INNER JOIN product_brands ON product_brands.id = products.brand_id 
                    INNER JOIN order_items ON order_items.product_id = products.id
                    INNER JOIN orders ON orders.id = order_items.order_id 
                    WHERE (products.category_id='$filter1' AND products.brand_id='$filter2')
                    AND (order_items.type = 'sales' OR orders.order_type = 'sales')");
} else {
    $sql = mysqli_query($con, "SELECT DATE_FORMAT(orders.date, '%m/%d/%Y') AS date, product_categories.name AS cate, product_brands.name AS marca, products.title, order_items.quantity, order_items.sub_total 
                    FROM products INNER JOIN product_categories ON product_categories.id = products.category_id 
                    INNER JOIN product_brands ON product_brands.id = products.brand_id 
                    INNER JOIN order_items ON order_items.product_id = products.id
                    INNER JOIN orders ON orders.id = order_items.order_id 
                    WHERE order_items.type = 'sales' OR orders.order_type = 'sales'");
}
$data = array();

while ($row = mysqli_fetch_assoc($sql)) {
    $data[] = $row;
}
$result = ['result' => $data, 'errors' => [], 'responseCode' => 200];
echo json_encode(convert_from_latin1_to_utf8_recursively($result));
