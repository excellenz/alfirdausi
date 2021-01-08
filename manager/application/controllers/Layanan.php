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

		$this->load->view('templates/header', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('room/book', $data);
		$this->load->view('templates/footer');
	}

}