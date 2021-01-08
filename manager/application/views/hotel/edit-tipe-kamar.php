
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
            <form enctype="multipart/form-data" action="<?= base_url('hotel/edittipekamar/') . $tipe['id']; ?>" method="post">
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
                      <div class="row">
                        <div class="col-sm-4">
                          <label>Tipe Kamar</label>
                          <input class="form-control" name="tipe" value="<?= $tipe['tipe']; ?>">
                        </div>
                        <div class="col-sm-4">
                          <label>Harga</label>
                          <input class="form-control" name="harga" value="<?= $tipe['harga']; ?>">
                        </div>
                        <div class="col-sm-4">
                          <label>Lokasi</label>
                          <select class="form-control" name="hk">
                            <option value="<?= $tipe['hk']; ?>"><?= $tipe['hk'] == 0 ? 'Luar Area HK' : 'Dalam Area HK'; ?></option>
                            <option value="0">Luar Area HK</option>
                            <option value="1">Dalam Area HK</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Detail Fasilitas</label>
                      <textarea class="ckeditor" id="ckeditor" name="detail"><?= $tipe['detail']; ?></textarea>
                    </div>
                    <div class="form-group">
                      <img src="<?= base_url('assets/img/kamar/') . $tipe['gambar']; ?>" class="img-thumbnail">
                    </div>
                    <div class="form-group">
                      <label>Upload Gambar</label>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="image" name="image">
                        <label class="custom-file-label" for="image">Choose file</label>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Link Video</label>
                      <textarea class="form-control" name="video"><?= $tipe['video']; ?></textarea>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <button class="btn btn-success" type="submit" name="tipe-add">Update</button>
                <a class="btn btn-warning" href="<?= base_url('hotel/tipekamar'); ?>">Batal</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
