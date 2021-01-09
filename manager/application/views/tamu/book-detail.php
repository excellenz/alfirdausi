
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1><?= $title; ?></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active"><?= $title; ?></li>
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
            <?= $this->session->flashdata('message'); ?>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-sm-5">
                <?php if ($booking['status'] == 0) : ?>
                <div class="alert alert-warning" role="alert">Silahkan lakukan pembayaran maksimal 1 x 24 Jam dari tanggal booking.
                Silahkan transfer ke salah satu Bank berikut:
                <ul>
                  <b>
                    <li>Bank Mandiri : 1340005757280</li>
                    <li>Bank BCA : 2990250793</li>
                    <li>Bank BRI : 427601013095536</li>
                    <li>Bank Muamalat : 1320001779</li>
                    <li>Bank BNI : 0569599595</li>
                  </b>
                </ul>
                Semuanya atas nama <b>SUPENO</b>
                </div>
                <?php endif; ?>
                <table class="table col-sm table-striped table-hover">
                  <tbody>
                    <tr>
                      <th>Tanggal Pemesanan</th>
                      <td><?= date('d-M-Y', $booking['tgl_inv']); ?></td>
                    </tr>
                    <tr>
                      <th>Nomor Invoice</th>
                      <td><?= $booking['no_invoice']; ?></td>
                    </tr>
                    <tr>
                      <th>Nama Tamu</th>
                      <td><?= $booking['nama_depan'] . ' ' . $booking['nama_belakang']; ?></td>
                    </tr>
                    <tr>
                      <th>Nomor Kamar</th>
                      <td><?= $booking['nomor_kamar']; ?></td>
                    </tr>
                    <tr>
                      <th>Jumlah Tamu</th>
                      <td><?= $booking['jml_dewasa'] + $booking['jml_anak'] . ' orang'; ?></td>
                    </tr>
                    <tr>
                      <th>Check in</th>
                      <td><?= date('d-m-Y', $booking['tgl_c_in']); ?></td>
                    </tr>
                    <tr>
                      <th>Check out</th>
                      <td><?= date('d-m-Y', $booking['tgl_c_out']); ?></td>
                    </tr>
                    <tr>
                      <th>Biaya</th>
                      <td><?= rupiah($booking['biaya']); ?></td>
                    </tr>
                    <tr>
                      <th>Status Pembayaran</th>
                      <td>
                        <?php
                          if ($booking['status'] == 1) {
                            echo "<b>LUNAS</b>";
                          } elseif ($booking['status'] == 2) {
                            echo "<b>MENUNGGU VERIFIKASI";
                          } else {
                            echo "<b>BELUM BAYAR";
                          }
                        ?>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <?php if ($booking['status'] == 2) : ?>
              <div class="col-sm-5">
                <img src="<?= base_url('assets/img/buktitrf/') . $bukti['foto_trf']; ?>" class="img-thumbnail">
              </div>
              <?php endif; ?>
            </div>
          </div>
          <div class="box-footer">
            <a class="btn btn-secondary mb-3" href="<?= base_url('user/viewbook'); ?>">Kembali</a>
            <?php if ($booking['status'] == 0) : ?>
              <a class="btn btn-success mb-3" href="<?= base_url('user/konfbook/') . $booking['id_book']; ?>">Konfirmasi Transfer</a>
            <?php endif; ?>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script language="JavaScript" type="text/javascript">
  function verData(id){
    if (confirm("Verifikasi pembayaran tamu ini?")){
        window.location.href = '<?= base_url('layanan/verbook/'); ?>' + id;
    }
  }
</script>
