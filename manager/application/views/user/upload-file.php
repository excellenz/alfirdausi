
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1><?= $title; ?></h1>
            <h5>Kelas : <?= $group['name']; ?></h5>
            <a href="<?= base_url('user/uploadform/'). $group['id']; ?>" class="btn btn-sm btn-primary mb-3">Upload Raport</a>
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
      <div class="row">
	    <div class="col-lg">
			<?= $this->session->flashdata('message'); ?>
			<?= form_error('file', '<div class="alert alert-danger" role="alert">', '</div>'); ?>
		</div>
	  </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="card">
        <div class="card-body">
          <div class="col-lg">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Nama Santri</th>
			      <th scope="col">Nama File</th>
			      <th scope="col">Jenis Raport</th>
			      <th scope="col">Tanggal Upload</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<?php
			  		$i = 1;
			  		foreach ($file as $f) :
			  	?>
			    <tr>
			      <th scope="row"><?= $i; ?></th>
			      <td><?= $f['full_name']; ?></td>
			      <td><?= $f['name']; ?></td>
			      <td><?= $f['file_type'] == 'k' ? 'Kemenag' : 'Pondok' ; ?></td>
			      <td><?= date("d-m-Y", $f['date']); ?></td>
			      <td>
			      		<a href="<?= base_url('assets/files/raport/') . $f['name']; ?>" class="badge badge-success">download</a>
			      		<a href="javascript:hapusData(<?= $f['id']; ?>)" class="badge badge-danger">delete</a>
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
		  	window.location.href = "<?= base_url('user/hapusfile/'); ?>" + id;
		}
	}
</script>


