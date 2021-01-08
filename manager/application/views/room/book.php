
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
          <div class="row">
            <?php foreach ($kamar as $k) : ?>
            <div class="col-sm-3">
              <div class="small-box bg-green">
                <div class="inner">
                  <h3><?= $k['nomor_kamar']; ?></h3>
                  <p><?= rupiah($k['harga']); ?></p>
                </div>
                <div class="icon">
                  <i class="fa fa-bed"></i>
                </div>
                <a class="small-box-footer" href="addbook/<?= $k['id']; ?>">Pilih Kamar</a>
              </div>
            </div>
            <?php endforeach; ?>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
