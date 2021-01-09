<?php

include "function.php";
include "db.php";

$input = '62' . substr($_POST['nomor_telp'], 1);
$no_hape = htmlspecialchars($input);


if (!isset($no_hape))
{
	header("location: ".MAIN_URL."login.php");
}
elseif (empty($no_hape))
{
	header("location: ".MAIN_URL."login.php");
}

else

{
	
	$sql = "SELECT * FROM hotel_tamu WHERE nomor_telp = '$no_hape'";
	$result = mysqli_query($con,$sql);
	$data = mysqli_fetch_array($result,MYSQLI_ASSOC);
	$count = mysqli_num_rows($result);


	if ($count == 1)
	{
		
			$id_tamu = $data['id'];
			$nama = $data['nama_depan'];
			$no_hape = $data['nomor_telp'];

			$sql2 = "INSERT INTO log_tamu (tanggal, nomor_telp, status, halaman) VALUES ('$tanggal', '$no_hape', 'akses', 'home')";
			$result = mysqli_query($con,$sql);

			session_start();
			$_SESSION['username'] = $no_hape;
			$_SESSION['id_tamu'] = $id_tamu;
			header("location: ".MAIN_URL."index.php");
	}
	else
	{
		header("location: ".MAIN_URL."login.php");
	}
}
