<?php $nomor_invoice='INV-'.date('Ymd').'-'.date('Hi'); ?>
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
            <h3 class="box-title">KAMAR NOMOR : <b><?= $kamar['nomor_kamar']; ?></b></h3>
            <h3 class="box-title">KAMAR ID : <b><?= $kamar['id']; ?></b></h3>
          </div>
          <form action="<?= base_url('layanan/book/') . $kamar['id']; ?>" method="post">
            <div class="box-body">
              <div class="row">
                <div class="col-sm-3">
                  <div class="form-group">
                    <label># INVOICE</label>
                    <input class="form-control" name="nomor_invoice" value="<?php echo $nomor_invoice; ?>" readonly/>
                  </div>
                  <div class="alert alert-info">
                    <h4>Tipe Kamar : <?= $kamar['tipe']; ?></h4>
                    <ul class="list-unstyled">
                      <li>Harga / Malam : <b>Rp <?= rupiah($kamar['harga']); ?></b></li>
                      <li>Lokasi : <b><?= $kamar['hk'] == 0 ? 'Luar Area Husnul Khotimah' : 'Dalam Area Husnul Khotimah'; ?></b></li>
                    </ul>
                  </div>
                </div>
                <div class="col-sm-3">
                  <div class="form-group">
                    <label>Nama Tamu</label>
                    <select class="form-control nama_tamu" name="id_tamu">
                      <option selected="0">--Pilih--</option>
                      <?php foreach($tamu as $tamu) { ?>
                      <option value="<?php echo $tamu['id']; ?>">
                        <?php echo $tamu['prefix'].'. '.$tamu['nama_depan'].'&nbsp;'.$tamu['nama_belakang']; ?>
                      </option>
                      <?php } ?>
                    </select>
                  </div>
                  <div class="well">
                    <a href="#"><b>Klik disini</b></a> jika nama tamu yang dimaksud tidak ditemukan untuk ditambah pada daftar buku tamu.
                  </div>
                </div>
                <div class="col-sm-5">
                  <div class="form-group">
                    <label>Jumlah Tamu</label>
                    <div class="row">
                      <div class="col-sm-6">
                        <select class="form-control" name="jumlah_dewasa">
                          <option value="0">- Dewasa -</option>
                          <option value="1">1 Orang</option>
                          <option value="2">2 Orang</option>
                          <option value="3">3 Orang</option>
                          <option value="4">4 Orang</option>
                          <option value="5">5 Orang</option>
                        </select>
                      </div>
                      <div class="col-sm-6">
                        <select class="form-control" name="jumlah_anak">
                          <option value="0">- Anak-anak -</option>
                          <option value="1">1 Orang</option>
                          <option value="2">2 Orang</option>
                          <option value="3">3 Orang</option>
                          <option value="4">4 Orang</option>
                          <option value="5">5 Orang</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Tanggal / Waktu Check-In</label>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="input-group date" id="reservationdate" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" name="tgl_cin" data-date-format="yyyy-mm-dd" />
                            <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <input class="form-control" name="waktu_checkin" value="14:00" readonly />
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Tanggal / Waktu Check-Out</label>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="input-group date" id="checkoutdate" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#checkoutdate" id="tgl_cout" name="tgl_cout" data-date-format="yyyy-mm-dd" />
                            <div class="input-group-append" data-target="#checkoutdate" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <input class="form-control" name="waktu_checkout" value="12:00" readonly />
                      </div>
                    </div>
                  </div>
                  <!-- <div class="form-group">
                    <label>Jumlah Deposit (Rp)</label>
                    <input class="form-control" name="deposit" required />
                  </div> -->
                </div>
              </div>
            </div>
            <div class="box-footer">
              <input type="hidden" name="id_kamar" value="<?php echo $kamar['id']; ?>" />
              <input type="hidden" name="harga" value="<?php echo $kamar['harga']; ?>" />
              <button class="btn btn-success" type="submit" name="checkin">Check In</button>
              <a class="btn btn-warning" href="<?= base_url('layanan'); ?>">Batal</a>
            </div>
          </form>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
