
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
              <li class="breadcrumb-item active">Blank Page</li>
            </ol>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
      <div class="row">
        <div class="col-lg-8">
          <?= $this->session->flashdata('message'); ?>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="card">
        <div class="card-body">
          <!-- Default box -->
          <div class="card mb-3 col-lg-8">
            <div class="row no-gutters">
              <div class="col-md-4">
                <img src="<?= base_url('assets/img/profile/') . $user['image']; ?>" class="card-img">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><?= $user['name']; ?></h5>
                  <p class="card-text"><?= $user['email']; ?></p>
                  <p class="card-text">
                    <small class="text-muted">Member since <?= date('d F Y', $user['date_created']); ?></small>
                    <br>
                    <small class="text-muted">Profile updated <?= date('d F Y H:i', $user['date_modified']) . ' WIB'; ?></small>
                  </p>
                  <p class="card-text"></p>
                </div>
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



