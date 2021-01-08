<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Layanan extends CI_Controller 
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
	}

	public function index()
	{
		$data['title'] = 'Booking Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->db->select('*');
		$this->db->from('hotel_tipe_kamar');
		$this->db->join('hotel_kamar', 'hotel_kamar.tipe_kamar_id = hotel_tipe_kamar.id');
		$this->db->where('hotel_kamar.status', 1);
		$this->db->order_by('hotel_kamar.tipe_kamar_id', 'ASC');
		$data['kamar'] = $this->db->get()->result_array();

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('room/index', $data);
		$this->load->view('templates/footer');
	}

	public function book($id)
	{
		$data['title'] = 'Booking Kamar';
		$data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

		$this->db->select('*');
		$this->db->from('hotel_tipe_kamar');
		$this->db->join('hotel_kamar', 'hotel_kamar.tipe_kamar_id = hotel_tipe_kamar.id');
		$this->db->where('hotel_kamar.id', $id);
		$data['kamar'] = $this->db->get()->row_array();
		$data['tamu'] = $this->db->get('hotel_tamu')->result_array();

		$this->form_validation->set_rules('tgl_cin', 'Tanggal Check in', 'required|trim');
		$this->form_validation->set_rules('tgl_cout', 'Tanggal Check out', 'required|trim');

		if ($this->form_validation->run() == false) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('room/book', $data);
			$this->load->view('templates/footer');
		} else {
			$c_in = strtotime($this->input->post('tgl_cin'));
			$c_out = strtotime($this->input->post('tgl_cout'));
			$selisih = ($c_out - $c_in)/86400;
			$harga = $this->input->post('harga');
			$biaya = $selisih * $harga;
			$data = [
				'tgl_inv' => time(),
				'no_invoice' => $this->input->post('nomor_invoice'),
				'hotel_tamu_id' => $this->input->post('id_tamu'),
				'hotel_kamar_id' => $this->input->post('id_kamar'),
				'jml_dewasa' => $this->input->post('jumlah_dewasa'),
				'jml_anak' => $this->input->post('jumlah_anak'),
				'tgl_c_in' => $c_in,
				'tgl_c_out' => $c_out,
				'biaya' => $biaya,
				'status' => 1,
			];

			$this->db->insert('hotel_booking', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Data berhasil ditambahkan.</div>');
			redirect('layanan');
		}

	}

}