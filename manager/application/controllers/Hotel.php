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
		$this->form_validation->set_rules('nama_belakang', 'Nama Belakang', 'required|trim');
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
			$nomor_telp = '62' . $this->input->post('nomor_telp', true);
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
		$this->form_validation->set_rules('nama_belakang', 'Nama Belakang', 'required|trim');
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
			$nomor_telp = '62' . $this->input->post('nomor_telp', true);
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

}