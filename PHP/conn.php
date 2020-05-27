<?php

/************************************CONFIG****************************************/
//DATABSE DETAILS//
$DB_ADDRESS="localhost:3306";
$DB_USER="d2107_ddimport";
$DB_PASS="612538@Dc";
$DB_NAME="d21073ddim_danos";

$connect = new mysqli($DB_ADDRESS,$DB_USER,$DB_PASS,$DB_NAME);

if($connect){
	//echo "Connection Success";
}else{
	//echo "Connection Failed";
	exit();
}

?>