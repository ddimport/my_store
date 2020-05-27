<?php
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json; charset=utf-8");

include 'conn.php';
mysqli_set_charset($connect, "utf8");

$it_barcode     = $_POST['it_barcode'];
$it_descripcion = $_POST['it_descripcion'];
$it_costo       = $_POST['it_costo'];
$it_price       = $_POST['it_price'];
$it_rack        = $_POST['it_rack'];
$it_picture     = $_POST['it_picture'];
$it_package     = $_POST['it_package'];
$it_parent      = $_POST['it_parent'];

$connect->query("INSERT INTO Lista 
				(barcode, descripcion, costo, price, 
				puesto, imagen, paqueto, parentBarcode) 
				VALUES ('".$it_barcode."','".$it_descripcion."',
						'".$it_costo."','".$it_price."',
						'".$it_rack."','".$it_picture."',
						'".$it_package."','".$it_parent."')");


$connect->close();
return;

?>