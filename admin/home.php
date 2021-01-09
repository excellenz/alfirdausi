<?php

$id = $_SESSION['id_tamu'];
?>

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Daftar Booking Kamar <?= $_SESSION['id_tamu']; ?></h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Daftar Booking Kamar</li>
        </ol>
      </div>
    </div>
  </div>
  <!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
  <div class="card">
    <div class="card-body">
      <div class="box-header">
        <a class="btn btn-info mb-3" href="#">Booking Kamar</a>
      </div>
      <div class="box-body">
        <table class="table table-striped table-hover table-responsive">
          <thead>
            <tr>
              <th>#</th>
              <th>Tanggal booking</th>
              <th>Nama tamu</th>
              <th>No. kamar</th>
              <th>Check in</th>
              <th>Biaya</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
              $sql = "SELECT * FROM hotel_booking, hotel_kamar, hotel_tamu WHERE hotel_kamar.id = hotel_booking.hotel_kamar_id AND hotel_booking.hotel_tamu_id = hotel_tamu.id AND hotel_booking.hotel_tamu_id = $id";
              $hasil = mysqli_query($con, $sql);
              // var_dump($hasil);
              while ($booking = mysqli_fetch_all($hasil)) {
                # code...
              
            ?>
            <tr>
              <td><?= $i; ?></td>
              <td><?= date('d-M-Y', $booking['tgl_inv']); ?></td>
              <td><?= $booking['nama_depan'] . ' ' . $booking['nama_belakang']; ?></td>
              <td><?= $booking['nomor_kamar']; ?></td>
              <td><?= date('d-m-Y', $booking['tgl_c_in']); ?></td>
              <td><?= $booking['biaya']; ?></td>
              <td>
                <?php if ($booking['status'] == 1) : ?>
                  <span class="btn btn-xs btn-success"><i class="fas fa-check"></i></span>
                <?php elseif ($booking['status'] == 2) : ?>
                  <span class="btn btn-xs btn-warning"><i class="far fa-circle text-white"></i></span>
                <?php else : ?>
                  <span class="btn btn-xs btn-danger"><i class="fas fa-times"></i></span>
                <?php endif; ?>
              </td>
              <td><!-- 
                <a href="<?= base_url('layanan/bookdetail/') . $booking['id_book']; ?>" class="badge badge-info">detail</a>
                <a href="javascript:hapusData(<?= $booking['id_book']; ?>)" class="badge badge-danger">hapus</a> -->
              </td>
            </tr>
            <?php
              $i++;
              }
              ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>
<!-- /.content -->