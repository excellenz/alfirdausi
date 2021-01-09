<?php
$con = mysqli_connect("localhost","root","","hotel") or die(mysql_error());

class database
{
	
	public function getDb()
	{
		$dbh = new PDO('mysql:host=localhost;dbname='.DB_DATABASENAME, DB_DATABASEUSER, DB_DATABASEPASS);
		return $dbh;
	}

	public function tampilMapel ($id)
	{
		# code...
		$hasil = $this->getDb()->query("SELECT * FROM mapel WHERE kode = '$id'");
		$result = $hasil->fetchAll();

		return $result;
	}

	public function tampilMateri($id)
	{
		$hasil = $this->getDb()->query("SELECT * FROM materi WHERE id = '$id'");
		$result = $hasil->fetchAll();

		return $result;
	}

	public function tampilMateribyMapel($kode)
	{
		$hasil = $this->getDb()->query("SELECT * FROM materi WHERE mapel_kode = '$kode'");
		$result = $hasil->fetchAll();

		return $result;
	}

	

}

?>