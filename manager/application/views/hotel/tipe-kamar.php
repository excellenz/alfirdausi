
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
            <a class="btn btn-info mb-3" href="<?= base_url('hotel/tambahtipekamar'); ?>">Tambah Tipe Kamar</a>
          </div>
          <div class="box-body">
            <table class="table table-striped table-hover table-responsive">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Tipe Kamar</th>
                  <th>Lokasi</th>
                  <th>Fasilitas</th>
                  <th>Harga</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                  $i = 1;
                  foreach ($tipe as $tp) :
                ?>
                <tr>
                  <td><?= $i; ?></td>
                  <td><?= $tp['tipe']; ?></td>
                  <td><?= $tp['hk'] == 0 ? 'Luar Area Husnul Khotimah' : 'Dalam Area Husnul Khotimah'; ?></td>
                  <td><?= $tp['detail']; ?></td>
                  <td><?= $tp['harga']; ?></td>
                  <td>
                    <a href="<?= base_url('hotel/edittipekamar/') . $tp['id']; ?>" class="badge badge-success">Update</a>
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
