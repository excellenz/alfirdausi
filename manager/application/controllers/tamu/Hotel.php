<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hotel extends CI_Controller 
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
	}

	public function index()
	{
		$data['title'] = 'Hotel Dashboard';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/index', $data);
		$this->load->view('templates/footer');
	}

	public function tamu()
	{
		$data['title'] = 'Daftar Tamu';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['tamu'] = $this->db->get('hotel_tamu')->result_array();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/tamu', $data);
		$this->load->view('templates/footer');
	}

	public function tambahTamu()
	{
		$data['title'] = 'Tambah Tamu Baru';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->form_validation->set_rules('nama_depan', 'Nama Depan', 'required|trim');
		$this->form_validation->set_rules('nomor_identitas', 'Nomor Identitas', 'required|trim');
		$this->form_validation->set_rules('warga_negara', 'Warga Negara', 'required|trim');
		$this->form_validation->set_rules('alamat_provinsi', 'Provinsi', 'required|trim');
		$this->form_validation->set_rules('alamat_kabupaten', 'Kabupaten / Kota', 'required|trim');
		$this->form_validation->set_rules('alamat_jalan', 'Alamat lengkap', 'required|trim');
		$this->form_validation->set_rules('nomor_telp', 'Nomor HP', 'required|trim|numeric');

		if( $this->form_validation->run() == false ) {
		
			$this->load->view('templates/header', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('hotel/tambah-tamu', $data);
			$this->load->view('templates/footer');
		
		} else {
			$nomor_telp = '62' . substr($this->input->post('nomor_telp', true),1);
			$data = [
						'prefix' => $this->input->post('prefix'),
						'nama_depan' => $this->input->post('nama_depan'),
						'nama_belakang' => $this->input->post('nama_belakang'),
						'tipe_identitas' => $this->input->post('tipe_identitas'),
						'nomor_identitas' => $this->input->post('nomor_identitas'),
						'warga_negara' => $this->input->post('warga_negara'),
						'alamat_jalan' => $this->input->post('alamat_jalan'),
						'alamat_kabupaten' => $this->input->post('alamat_kabupaten'),
						'alamat_provinsi' => $this->input->post('alamat_provinsi'),
						'nomor_telp' => htmlspecialchars($nomor_telp),
						'email' => htmlspecialchars($this->input->post('email', true))
			];

			$this->db->insert('hotel_tamu', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Registrasi tamu berhasil. Data sudah ditambahkan.</div>');
			redirect('hotel/tamu');
		}
	}

	public function editTamu($id)
	{
		$data['title'] = 'Edit Data Tamu';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['tamu'] = $this->db->get_where('hotel_tamu', ['id' => $id])->row_array();

		$this->form_validation->set_rules('nama_depan', 'Nama Depan', 'required|trim');
		$this->form_validation->set_rules('nomor_identitas', 'Nomor Identitas', 'required|trim');
		$this->form_validation->set_rules('warga_negara', 'Warga Negara', 'required|trim');
		$this->form_validation->set_rules('alamat_provinsi', 'Provinsi', 'required|trim');
		$this->form_validation->set_rules('alamat_kabupaten', 'Kabupaten / Kota', 'required|trim');
		$this->form_validation->set_rules('alamat_jalan', 'Alamat lengkap', 'required|trim');
		$this->form_validation->set_rules('nomor_telp', 'Nomor HP', 'required|trim|numeric');

		if( $this->form_validation->run() == false ) {
		
			$this->load->view('templates/header', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('hotel/edit-tamu', $data);
			$this->load->view('templates/footer');
		
		} else {
			$nomor_telp = '62' . substr($this->input->post('nomor_telp', true),1);
			$data = [
						'prefix' => $this->input->post('prefix'),
						'nama_depan' => $this->input->post('nama_depan'),
						'nama_belakang' => $this->input->post('nama_belakang'),
						'tipe_identitas' => $this->input->post('tipe_identitas'),
						'nomor_identitas' => $this->input->post('nomor_identitas'),
						'warga_negara' => $this->input->post('warga_negara'),
						'alamat_jalan' => $this->input->post('alamat_jalan'),
						'alamat_kabupaten' => $this->input->post('alamat_kabupaten'),
						'alamat_provinsi' => $this->input->post('alamat_provinsi'),
						'nomor_telp' => htmlspecialchars($nomor_telp),
						'email' => htmlspecialchars($this->input->post('email', true))
			];

			$this->db->where('id', $id);
			$this->db->update('hotel_tamu', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Data berhasil diubah.</div>');
			redirect('hotel/tamu');
		}
	}

	public function hapusTamu($id)
	{
		
		$this->db->delete('hotel_tamu', ['id' => $id]);
		$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Data berhasil dihapus!</div>');
		redirect('hotel/tamu');
	}

	public function kamar()
	{
		$data['title'] = 'Daftar Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->db->select('*');
		$this->db->from('hotel_tipe_kamar');
		$this->db->join('hotel_kamar', 'hotel_kamar.tipe_kamar_id = hotel_tipe_kamar.id');
		$data['kamar'] = $this->db->get()->result_array();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/kamar', $data);
		$this->load->view('templates/footer');
	}

	public function tambahkamar()
	{
		$data['title'] = 'Tambah Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
		$data['tipe'] = $this->db->get('hotel_tipe_kamar')->result_array();

		$this->form_validation->set_rules('tipe_kamar_id', 'Tipe Kamar', 'required|trim');
		$this->form_validation->set_rules('nomor_kamar', 'Nomor Kamar', 'required|trim');
		$this->form_validation->set_rules('status', 'Status', 'required|trim');

		if ($this->form_validation->run() == false) {
		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/tambah-kamar', $data);
		$this->load->view('templates/footer');			
		} else {
			$data = [
					'tipe_kamar_id' => $this->input->post('tipe_kamar_id'),
					'nomor_kamar' => $this->input->post('nomor_kamar'),
					'status' => $this->input->post('status')
			];

			$this->db->insert('hotel_kamar', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Data berhasil ditambahkan.</div>');
			redirect('hotel/kamar');
		}

	}

	public function editkamar($id)
	{
		$data['title'] = 'Update Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['tipe'] = $this->db->get('hotel_tipe_kamar')->result_array();

		$this->db->select('*');
		$this->db->from('hotel_tipe_kamar');
		$this->db->join('hotel_kamar', 'hotel_kamar.tipe_kamar_id = hotel_tipe_kamar.id');
		$this->db->where('hotel_kamar.id', $id);
		$data['kamar'] = $this->db->get()->row_array();

		$this->form_validation->set_rules('tipe_kamar_id', 'Tipe Kamar', 'required|trim');
		$this->form_validation->set_rules('nomor_kamar', 'Nomor Kamar', 'required|trim');
		$this->form_validation->set_rules('status', 'Status', 'required|trim');

		if ($this->form_validation->run() == false) {
		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/edit-kamar', $data);
		$this->load->view('templates/footer');			
		} else {
			$data = [
					'tipe_kamar_id' => $this->input->post('tipe_kamar_id'),
					'nomor_kamar' => $this->input->post('nomor_kamar'),
					'status' => $this->input->post('status')
			];

			$this->db->where('id', $id);
			$this->db->update('hotel_kamar', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Data berhasil diperbaharui.</div>');
			redirect('hotel/kamar');
		}

	}

	public function tipeKamar()
	{
		$data['title'] = 'Tipe Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['tipe'] = $this->db->get('hotel_tipe_kamar')->result_array();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('hotel/tipe-kamar', $data);
		$this->load->view('templates/footer');
	}

	public function tambahTipekamar()
	{
		$data['title'] = 'Tambah Tipe Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->form_validation->set_rules('tipe', 'Tipe Kamar', 'required|trim');
		$this->form_validation->set_rules('harga', 'Harga', 'required|trim');
		$this->form_validation->set_rules('video', 'Link Video', 'required|trim');
		$this->form_validation->set_rules('image', '','callback_file_check');
		
		if ( $this->form_validation->run() == false ) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('hotel/tambah-tipe-kamar', $data);
			$this->load->view('templates/footer');
		} else {
			$upload_file = $_FILES['image']['name'];

			if ($upload_file) {
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']      = '4096';
				$config['upload_path']   = './assets/img/kamar/';

				$this->load->library('upload', $config);

				if ($this->upload->do_upload('image')) {
					$gambar = $this->upload->data('file_name');
				} else {
					echo $this->upload->display_errors();
				}
			}

			$data = [
				'tipe' => $this->input->post('tipe'),
				'hk' => $this->input->post('hk'),
				'detail' => $this->input->post('detail'),
				'harga' => $this->input->post('harga'),
				'gambar' => $gambar,
				'video' => $this->input->post('video')
			];

			$this->db->insert('hotel_tipe_kamar', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Tipe kamar berhasi ditambahkan.</div>');
			redirect("hotel/tipekamar");
		}
	}

	public function editTipekamar($id)
	{
		$data['title'] = 'Edit Tipe Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$data['tipe'] = $this->db->get_where('hotel_tipe_kamar', ['id' => $id])->row_array();

		$this->form_validation->set_rules('tipe', 'Tipe Kamar', 'required|trim');
		$this->form_validation->set_rules('harga', 'Harga', 'required|trim');
		$this->form_validation->set_rules('video', 'Link Video', 'required|trim');
		// $this->form_validation->set_rules('image', '','callback_file_check');
		
		if ( $this->form_validation->run() == false ) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('hotel/edit-tipe-kamar', $data);
			$this->load->view('templates/footer');
		} else {
			$upload_file = $_FILES['image']['name'];

			if ($upload_file != "") {
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']      = '4096';
				$config['upload_path']   = './assets/img/kamar/';

				$this->load->library('upload', $config);

				if ($this->upload->do_upload('image')) {
					$gambar_lama = $data['tipe']['gambar'];
					unlink(FCPATH . 'assets/img/kamar/' . $gambar_lama);
					$gambar = $this->upload->data('file_name');
				} else {
					echo $this->upload->display_errors();
				}
			} else {
				$gambar = $data['tipe']['gambar'];
			}

			$data = [
				'tipe' => $this->input->post('tipe'),
				'hk' => $this->input->post('hk'),
				'detail' => $this->input->post('detail'),
				'harga' => $this->input->post('harga'),
				'gambar' => $gambar,
				'video' => $this->input->post('video')
			];

			$this->db->where('id', $id);
			$this->db->update('hotel_tipe_kamar', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Data berhasil diperbaharui.</div>');
			redirect("hotel/tipekamar");
		}
	}

	public function file_check()
	{
        $allowed_type_file = array('image/gif', 'image/jpeg', 'image/png');
        $mime = get_mime_by_extension($_FILES['image']['name']);

        if (isset($_FILES['image']['name']) && $_FILES['image']['name'] != "") {
            if (in_array($mime, $allowed_type_file)) {
                if ($_FILES['image']['size'] > 2048000) {
                    $this->form_validation->set_message('file_check', 'Ukuran file terlalu besar! Pastikan kurang dari 2MB!');
                    return FALSE;
                } else {
                return TRUE;                    
                }
            } else {
                $this->form_validation->set_message('file_check', 'Jenis file tidak diizinkan!');
                return FALSE;
            }
        } else {
            $this->form_validation->set_message('file_check', 'Pilih file untuk diupload!');
                return FALSE;
        }
    }

    public function fileedit_check()
	{
        $allowed_type_file = array('image/gif', 'image/jpeg', 'image/png');
        $mime = get_mime_by_extension($_FILES['image']['name']);
       
        if (in_array($mime, $allowed_type_file)) {
            if ($_FILES['image']['size'] > 2048000) {
                $this->form_validation->set_message('file_check', 'Ukuran file terlalu besar! Pastikan kurang dari 2MB!');
                return FALSE;
            } else {
            return TRUE;                    
            }
        } else {
            $this->form_validation->set_message('file_check', 'Jenis file tidak diizinkan!');
            return FALSE;
        }
        
    }

}