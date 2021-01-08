
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
            <form action="<?= base_url('hotel/editkamar/') . $kamar['id']; ?>" method="post">
              <div class="box-header col-sm-6">
                <?php if (validation_errors()) : ?>
                <div class="alert alert-danger" role="alert">
                  <?= validation_errors(); ?>
                </div>
                <?php endif; ?>
              </div>
              <div class="box-body">
                <div class="row">
                  <div class="col-sm-4">
                    <div class="form-group">
                      <label>Tipe Kamar</label>
                      <select class="form-control" name="tipe_kamar_id">
                        <option value="<?= $kamar['tipe_kamar_id']; ?>"><?= $kamar['tipe']; ?></option>
                        <?php foreach ($tipe as $t) : ?>
                          <option value="<?= $t['id']; ?>"><?= $t['tipe']; ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Nomor Kamar</label>
                      <input class="form-control" name="nomor_kamar" placeholder="Nomor Kamar" value="<?= $kamar['nomor_kamar']; ?>" />
                    </div>
                    <div class="form-group">
                      <label>Status</label>
                      <select class="form-control" name="status">
                        <?php 
                          if ($kamar['status'] == 0 ) {
                            $status_kamar  = 'Terisi';
                          } elseif ($kamar['status'] == 1) {
                            $status_kamar = 'Kosong';
                          } else {
                            $status_kamar = 'Kotor';
                          }

                          echo '<option value="' . $status['kamar'] . '">' . $status_kamar . '</option>';
                        ?>
                        <option value="1">Kosong</option>
                        <option value="0">Terisi</option>
                        <option value="2">Kotor</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <button class="btn btn-success" type="submit" name="tamu-add">Update</button>
                <a class="btn btn-warning" href="<?= base_url('hotel/kamar'); ?>">Batal</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
