
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
          <div class="box">
            <form action="<?= base_url('hotel/edittamu'); ?>/<?= $tamu['id']; ?>" method="post">
              <div class="box-header col-sm-6">
                <?php if (validation_errors()) : ?>
                <div class="alert alert-danger" role="alert">
                  <?= validation_errors(); ?>
                </div>
                <?php endif; ?>
              </div>
              <div class="box-body">
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label>Nama Tamu</label>
                      <div class="row">
                        <div class="col-sm-3">
                          <select class="form-control" name="prefix">
                            <option value="Mr">Mr</option>
                            <option value="Ms">Ms</option>
                            <option value="Mrs">Mrs</option>
                          </select>
                        </div>
                        <div class="col-sm-4">
                          <input class="form-control" name="nama_depan" placeholder="Nama Depan" value="<?= $tamu['nama_depan']; ?>" >
                        </div>
                        <div class="col-sm-4">
                          <input class="form-control" name="nama_belakang" placeholder="Nama Belakang" value="<?= $tamu['nama_belakang']; ?>" >
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Identitas</label>
                      <div class="row">
                        <div class="col-sm-3">
                          <select class="form-control" name="tipe_identitas">
                            <option value="KTP">KTP</option>
                            <option value="KTP">SIM</option>
                            <option value="KTP">PASSPORT</option>
                          </select>
                        </div>
                        <div class="col-sm-6">
                          <input class="form-control" name="nomor_identitas" placeholder="Nomor Identitas" value="<?= $tamu['nomor_identitas']; ?>" >
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Warga Negara</label>
                      <div class="row">
                        <div class="col-sm-4">
                          <input class="form-control" name="warga_negara" value="<?= $tamu['warga_negara']; ?>">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-5">
                    <div class="form-group">
                      <label>Alamat</label>
                      <div class="row">
                        <div class="col-sm-6">
                          <input class="form-control" name="alamat_provinsi" placeholder="Provinsi" value="<?= $tamu['alamat_provinsi']; ?>">
                        </div>
                        <div class="col-sm-6">
                          <input class="form-control" name="alamat_kabupaten" placeholder="Kabupaten / Kota" value="<?= $tamu['alamat_kabupaten']; ?>">
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <textarea class="form-control" name="alamat_jalan" placeholder="Nama Jalan / Desa / Kelurahan"><?= $tamu['alamat_jalan']; ?></textarea>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-6">
                          <label>No. Whatsapp (Tidak diawali 0)</label>
                          <input class="form-control" name="nomor_telp" placeholder="Misal: 8123456789" value="<?= $tamu['nomor_telp']; ?>">
                        </div>
                        <div class="col-sm-6">
                          <label>Email(Opsional)</label>
                          <input class="form-control" name="email" value="<?= $tamu['email']; ?>">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <button class="btn btn-success" type="submit" name="tamu-add">Update</button>
                <a class="btn btn-warning" href="<?= base_url('hotel/tamu'); ?>">Batal</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
