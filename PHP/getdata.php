<?php
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json; charset=utf-8");
header('Cache-Control: no-cache, must-revalidate');

include 'conn.php';
mysqli_set_charset($connect, "utf8");

$queryResult=$connect->query("SELECT * FROM Lista ORDER BY descripcion ASC LIMIT 25");

$result=array();

if($queryResult->num_rows > 0){
	while($fetchData=$queryResult->fetch_assoc()){
		$result[]=$fetchData;
	}

	echo json_encode($result,JSON_UNESCAPED_UNICODE);
		
}else{
	echo "Error";
}

$connect->close();
return;

?>