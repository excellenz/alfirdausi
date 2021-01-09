
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
			<div class="col-sm-6">
			<form enctype="multipart/form-data" action="<?= base_url('user/konfbook/'). $booking['id_book']; ?>" method="POST">
				<div class="form-group row">
					<label for="email" class="col-sm-4 col-form-label">Nomor Invoice</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="email" name="email" value="<?= $booking['no_invoice']; ?>" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-4 col-form-label">Nama Tamu</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="name" name="name" value="<?= $user['name']; ?>">
						<?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
					</div>
				</div>
				<div class="form-group row">
					<label for="image" class="col-sm-4 col-form-label">Upload Bukti Transfer</label>
					<div class="col-sm-8">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="image" name="image">
							<label class="custom-file-label" for="image">Choose file</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-info">Upload</button>
					</div>
				</div>
			</form>
			</div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


