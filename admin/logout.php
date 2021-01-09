<?php
session_start();
include "db.php";
include "function.php";
$no_hape = $_SESSION['username'];

$sql = "INSERT INTO log_tamu (tanggal, nomor_telp, status, halaman) VALUES ('$tanggal', '$no_hape', 'akses', 'logout')";
	$result = mysqli_query($con,$sql);

unset($_SESSION['username']);
session_destroy();
header("location: ".MAIN_URL."login.php");