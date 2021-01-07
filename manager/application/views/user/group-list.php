
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
          <div class="col-lg-8">

	  		<?= $this->session->flashdata('message'); ?>

	  		<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Group</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<?php
			  		$i = 1;
			  		foreach ($group as $g) :
			  	?>
			    <tr>
			      <th scope="row"><?= $i; ?></th>
			      <td><?= $g['name']; ?></td>
			      <td>
			      		<a href="upload/<?= $g['id']; ?>" class="badge badge-success">upload</a>
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




