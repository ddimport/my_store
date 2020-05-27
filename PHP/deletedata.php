<?php
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json; charset=utf-8");

include 'conn.php';
mysqli_set_charset($connect, "utf8");

$it_id          = $_POST['it_id'];

$connect->query("DELETE FROM Lista WHERE id=". $it_id);

$connect->close();
return;

?>