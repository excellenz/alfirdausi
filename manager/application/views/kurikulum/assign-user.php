
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
			<div class="col-lg-6">

		  		<?= $this->session->flashdata('message'); ?>
		  		<h5><?= $member['name']; ?></h5>
		  		<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Group</th>
				      <th scope="col">Assign</th>
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
						<div class="form-check">
							<input class="form-check-group" type="checkbox" <?= check_assignment($member['id'], $g['id']); ?> data-member="<?= $member['id']; ?>" data-group="<?= $g['id']; ?>">
						</div>
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


