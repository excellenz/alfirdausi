<?php

require "db.php";

$input = '62' . substr($_POST['nomor_telp'], 1);
$no_hape = htmlspecialchars($input);
$sql = "SELECT * FROM hotel_tamu WHERE nomor_telp = '$no_hape'";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
$count = mysqli_num_rows($result);


if ($count == 1) {
	$id_tamu = $row['id'];
	$content = "home.php";
} else {
	$content = "NOPE";
}

require "template.php";