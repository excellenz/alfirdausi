
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
            <a class="btn btn-info mb-3" href="<?= base_url('hotel/tambahkamar') ?>">Tambah Kamar</a>
          </div>
          <div class="box-body">
            <table class="table table-striped table-hover table-responsive">
              <thead>
                <tr>
                  <th>Tipe Kamar</th>
                  <th>No. Kamar</th>
                  <th>Harga / Malam</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($kamar as $k) : ?>
                <tr>
                  <td><?= $k['tipe']; ?></td>
                  <td><?= $k['nomor_kamar']; ?></td>
                  <td><?= $k['harga']; ?></td>
                  <td>
                    <?php
                      if ($k['status'] == 0) {
                        echo "<b><text class='text-success'>TERISI</text></b>";
                      } elseif ($k['status'] == 1) {
                        echo "<b><text class='text-primary'>KOSONG</text></b>";
                      } else {
                        echo "<b><text class='text-danger'>KOTOR</text></b>";
                      }
                      ; ?>
                  </td>
                  <td>
                    <a href="editkamar/<?= $k['id']; ?>" class="btn btn-xs btn-info">Update</a>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
