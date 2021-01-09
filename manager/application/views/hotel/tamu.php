
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
            <a href="<?= base_url('hotel/tambahtamu'); ?>" class="btn btn-info mb-3">Tambah Tamu Baru</a>
          </div>
          <div class="box-body">
            <table class="table table-striped table-hover table-responsive">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nama Tamu</th>
                  <th>Alamat</th>
                  <th>Warga Negara</th>
                  <th>Nomor Handphone</th>
                  <th>Email</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                  $i= 1;
                  foreach ($tamu as $t) : 
                ?>
                <tr>
                  <th scope="row"><?= $i; ?></th>
                  <td><?= $t['prefix'] . ". ". $t['nama_depan'] . " " . $t['nama_belakang']; ?></td>
                  <td><?= $t['alamat_kabupaten']; ?></td>
                  <td><?= $t['warga_negara']; ?></td>
                  <td><?= $t['nomor_telp']; ?></td>
                  <td><?= $t['email']; ?></td>
                  <td>
                    <a href="edittamu/<?= $t['id']; ?>" class="badge badge-success">edit</a>
                    <a href="javascript:hapusData(<?= $t['nomor_telp']; ?>)" class="badge badge-danger">delete</a>
                  </td>
                </tr>
                <?php
                  $i++; 
                  endforeach;
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<script language="JavaScript" type="text/javascript">
  function hapusData(id){
    if (confirm("Apakah anda yakin akan menghapus data ini?")){
        window.location.href = 'hapustamu/' + id;
    }
  }
</script>

