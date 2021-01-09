<?php

include "function.php";
include "db.php";

session_start();

if (!isset($_SESSION['username']))
{
	header("location: ".MAIN_URL."config.php");
}

else
{
	$content = "home.php";	

	$no_hape = $_SESSION['username'];
	$tanggal = time();

	$sql = "INSERT INTO log_tamu (tanggal, nomor_telp, status, halaman) VALUES ('$tanggal', '$no_hape', 'akses', 'home')";
	$result = mysqli_query($con,$sql);

	require "template.php";
}