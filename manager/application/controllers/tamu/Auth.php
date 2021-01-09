<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller 
{
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}


	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}

		$this->form_validation->set_rules('email', 'No HP', 'required|trim');
		$this->form_validation->set_rules('password', 'Password', 'required|trim');
		if ( $this->form_validation->run() == false) {
			$data['title'] = 'Login Page';
			$this->load->view('templates/auth_header', $data);
			$this->load->view('tamu/login');
			$this->load->view('templates/auth_footer');
		} else{
			$this->_login();
		}
	}

	private function _login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();
		
		// jika usernya ada
		if ( $user ) {
			# code...
			// jika usernya aktif
			if ( $user['is_active'] == 1) {
				# code...
				if (password_verify($password, $user['password'])) {
					# code...
					$data = [
						'email' => $user['email'],
						'role_id' => $user['role_id']
					];
					$this->session->set_userdata($data);
					redirect('user');
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> Wrong password!</div>');
			redirect('tamu/auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> This email has not been activated!</div>');
			redirect('tamu/auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Silakan lakukan registrasi.</div>');
			redirect('tamu/auth/registration');
		}
	}

	public function registration()
	{
		if ($this->session->userdata('email')) {
			redirect('tamu/user');
		}

		$this->form_validation->set_rules('name', 'Nama Depan', 'required|trim');
		$this->form_validation->set_rules('nomor_identitas', 'No KTP', 'required|trim');
		$this->form_validation->set_rules('alamat_provinsi', 'Provinsi', 'required|trim');
		$this->form_validation->set_rules('alamat_kabupaten', 'Kabupaten', 'required|trim');
		$this->form_validation->set_rules('alamat_jalan', 'Kelurahan', 'required|trim');
		$this->form_validation->set_rules('email', 'No HP', 'required|trim|is_unique[user.email]', [
			'is_unique' => "Nomor telah terdaftar!"
		]);

		if( $this->form_validation->run() == false ) {
		$data['title'] = 'Al Firdausi | Reservasi';
		$this->load->view('templates/auth_header', $data);
		$this->load->view('tamu/registration');
		$this->load->view('templates/auth_footer');
		} else {
			$email = $this->input->post('email');
			$data = [
				'name' => htmlspecialchars($this->input->post('name', true)),
				'email' => htmlspecialchars($email),
				'image' => 'default.jpg',
				'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
				'role_id' => 3,
				'is_active' => 1,
				'date_created' => time(),
				'date_modified' => time()
			];

			$nomor_telp = '62' . substr($this->input->post('email', true),1);
			$data2 = [
						'prefix' => $this->input->post('prefix'),
						'nama_depan' => $this->input->post('name'),
						'nama_belakang' => $this->input->post('nama_belakang'),
						'tipe_identitas' => $this->input->post('tipe_identitas'),
						'nomor_identitas' => $this->input->post('nomor_identitas'),
						'warga_negara' => $this->input->post('warga_negara'),
						'alamat_jalan' => $this->input->post('alamat_jalan'),
						'alamat_kabupaten' => $this->input->post('alamat_kabupaten'),
						'alamat_provinsi' => $this->input->post('alamat_provinsi'),
						'nomor_telp' => htmlspecialchars($nomor_telp),
						'email' => htmlspecialchars($this->input->post('email_tamu', true))
			];

			// siapkan token
			// $token = base64_encode(random_bytes(32));
			// $user_token = [
			// 		'email' => $email,
			// 		'token' => $token,
			// 		'date_created' => time()
			// ];

			// $this->db->insert('user', $data);
			// $this->db->insert('user_token', $user_token);

			// $this->_sendEmail($token, 'verify');
			$this->db->insert('user', $data);
			$this->db->insert('hotel_tamu', $data2);

			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Registrasi berhasil. Silakan masukkan No HP.</div>');
			redirect('tamu/auth');
		}
	}

	private function _sendEmail($token, $type)
	{
		$config = [
			'protocol' 	=> 'smtp',
			'smtp_host' => 'ssl://smtp.googlemail.com',
			'smtp_user' => 'teamexcellenz@gmail.com',
			'smtp_pass' => 'h4k4n3kunXXX',
			'smtp_port' => 465,
			'mailtype' => 'html',
			'charset'   => 'utf-8',
			'newline'   => "\r\n"
		];

		$this->load->library('email', $config);
		$this->email->initialize($config);

		$this->email->from('teamexcellenz@gmail.com', 'Excellenz Team');
		$this->email->to($this->input->post('email'));

		if($type == 'verify') {	
		$this->email->subject('Account Verification');
		$this->email->message('Click this link to verify your account : <a href="'. base_url(). 'auth/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) .'">Activate</a>');
		}

		if($this->email->send()){
			return true;
		} else {
			echo $this->email->print_debugger();
			die;
		}
	}

	public function verify()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();

		if($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if($user_token) {
				if(time() - $user_token['date_created'] < (60*60*24)) {
					$this->db->set('is_active', 1);
					$this->db->where('email', $email);
					$this->db->update('user');

					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">'. $email .' has been activated! Please login.</div>');
					redirect('auth');
				} else {
					$this->db->delete('user', ['email' => $email]);
					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Token expired.</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Token invalid.</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Email invalid.</div>');
			redirect('auth');
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');


		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">You have been logged out!</div>');
			redirect('auth');
	}

	public function blocked()
	{
		$this->load->view('auth/blocked');
	}
}