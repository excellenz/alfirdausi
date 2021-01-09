

<div class="register-box">
  <div class="register-logo">
    <b>Al Firdausi</b>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new membership</p>
      <?= $this->session->flashdata('message'); ?>
      <form action="<?= base_url('tamu/auth/registration'); ?>" method="post">
        <div class="input-group mb-3">
          <select class="form-control" name="prefix">
            <option value="Mr">Tuan</option>
            <option value="Ms">Nona</option>
            <option value="Mrs">Nyonya</option>
          </select>
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="name" name="name" placeholder="Nama Depan" value="<?= set_value('name'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="name" name="nama_belakang" placeholder="Nama Belakang" value="<?= set_value('nama_belakang'); ?>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="email" name="email" placeholder="No Handphone (WA)" value="<?= set_value('email'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <?= form_error('nomor_identitas', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="hidden" class="form-control" name="tipe_identitas" value="KTP" />
          <input type="hidden" class="form-control" name="warga_negara" value="WNI" />
          <input type="text" class="form-control" id="nomor_identitas" name="nomor_identitas" placeholder="Nomor KTP" value="<?= set_value('nomor_identitas'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <?= form_error('alamat_provinsi', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="alamat_provinsi" name="alamat_provinsi" placeholder="Provinsi" value="<?= set_value('alamat_provinsi'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <?= form_error('alamat_kabupaten', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="alamat_kabupaten" name="alamat_kabupaten" placeholder="Kabupaten" value="<?= set_value('alamat_kabupaten'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <?= form_error('alamat_jalan', '<small class="text-danger pl-3">', '</small>'); ?>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="alamat_jalan" name="alamat_jalan" placeholder="Desa/Kelurahan dan Kecamatan" value="<?= set_value('alamat_jalan'); ?>" required />
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" id="email_tamu" name="email_tamu" placeholder="Email (opsional)" value="<?= set_value('email_tamu'); ?>" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-4">
            <input type="hidden" class="form-control" name="password" value="12345" />
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <br />
      <!-- <p class="text-center">
        <a href="<?= base_url('tamu/auth'); ?>" class="text-center">Batal registrasi</a>
      </p> -->
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
