<?php

class dataSurat extends CI_Controller{


	 public function __construct()
    {
        parent::__construct();

        $role = $this->session->userdata('role');

        if ($role == 'mailparse_determine_best_xfer_encoding(fp)') {
            redirect(base_url('/'));
            return;
        }
    }

	  public function index($page = null)
	{
        $data['title']      = 'Admin: Produk';
        $data['content']    = $this->product->select(
                [
                    'product.id', 'product.title AS product_title', 'product.image', 'product.price', 'product.is_available',
                    'category.title AS category_title'
                ]
            )
            ->join('category')     // Query untuk mencari suatu data produk beserta kategorinya
            ->paginate($page)
            ->get();
        $data['total_rows'] = $this->product->count();
        $data['pagination'] = $this->product->makePagination(base_url('product'), 2, $data['total_rows']);
        $data['page']       = 'pages/product/index';

        $this->view($data);
    }
    
	public function tambahData()
	{
		$data['title'] = "Tambah Data surat";
		$data['surat'] =$this->Dosen_M->get_data('surat')->result();
		$id=$this->session->userdata('id_dosen');
		$data['surat'] = $this->db->query("SELECT *FROM dosen
		WHERE id_dosen='$id'")->result();
		$this->load->view('templates_dosen/header', $data);
		$this->load->view('templates_dosen/sidebar');
		$this->load->view('dosen/addsurat', $data);
		$this->load->view('templates_dosen/footer');
		
	}

	public function tambahDataAksi()
	{
			$this->_rules();

		if($this->form_validation->run() == FALSE) {
			$this->tambahData();
		}else{
			$id_dosen			= $this->input->post('id_dosen');
			$nama			= $this->input->post('nama');
			$perihal			= $this->input->post('perihal');
			$kpd			= $this->input->post('kpd');
			$tempat			= $this->input->post('tempat');
			$judul_proposal			= $this->input->post('judul_proposal');
			$tgl	= $this->input->post('tgl');
			$isi	= $this->input->post('isi');
			$jabatan	= $this->input->post('jabatan');
			$status = $this->input->post('status');
			$file			= $_FILES['file']['name'];
			if($file=''){}else{
				$config ['upload_path']	='./assets/surat';
				$config ['allowed_types'] ='*';
				$this->load->library('upload',$config);
				if(!$this->upload->do_upload('file')){
					echo "Photo gagal diupload!";
				}else{
					$file=$this->upload->data('file_name');
				}
			}

			$data = array(

				'id_dosen' 	=>$id_dosen,
				'nama'	=>$nama,
				'perihal' 	=>$perihal,
				'kpd' 	=>$kpd,
				'tempat' 	=>$tempat,
				'judul_proposal' 	=>$judul_proposal,
				'tgl' => $tgl,
				'isi' 	=>$isi,
				'jabatan'	=> $jabatan,
				'status'	=> $status,
				'file' 	=>$file,
			);
			
			$this->Dosen_M->insert_data($data,'surat');
			$this->session->set_flashdata('pesan', '<div class="alert alert-success alert-dismissible fade show" role="alert">
				<strong>Data surat 	 Berhasil ditambahkan</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						</div>');
			redirect('dosen/datasurat');
		}
	}

	public function updateData($id)
	{
		$where = array('id_surat' => $id);
		$data['surat'] =$this->Dosen_M->get_data('surat')->result();
		$data['surat'] = $this->db->query("SELECT * FROM surat WHERE id_surat='$id'")->result();
		$data['title'] = "Update Data Surat";
		$this->load->view('templates_dosen/header', $data);
		$this->load->view('templates_dosen/sidebar');
		$this->load->view('dosen/editsurat', $data);
		$this->load->view('templates_dosen/footer');
	}

	public function updateDataAksi()
	{
		$this->_rules();

		if($this->form_validation->run() == FALSE) {
			$this->updateData();
		}else{
			$id 	= $this->input->post('id_surat');
			$id_dosen			= $this->input->post('id_dosen');
			
			$nama			= $this->input->post('nama');
			$perihal			= $this->input->post('perihal');
			$kpd			= $this->input->post('kpd');
			$tempat			= $this->input->post('tempat');
			$judul_proposal			= $this->input->post('judul_proposal');
			$tgl	= $this->input->post('tgl');
			$isi = $this->input->post('isi');
			$jabatan = $this->input->post('jabatan');
			$status	= $this->input->post('status');
			$file			= $_FILES['file']['name'];
			if($file) {
				$config ['upload_path']	='./assets/surat';
				$config ['allowed_types'] ='pdf|word';
				$this->load->library('upload',$config);
				if($this->upload->do_upload('file')){
					$file=$this->upload->data('file_name');
					$this->db->set('file',$file); 
				}else{
					echo $this->upload->display_errors();
				}

}
			$data = array(
			
				'id_dosen' 	=>$id_dosen,
				'nama'	=>$nama,
				'perihal' 	=>$perihal,
				'kpd' 	=>$kpd,
				'tempat' 	=>$tempat,
				'judul_proposal' 	=>$judul_proposal,
				'tgl' => $tgl,
				'isi' 	=>$isi,
				'jabatan'	=>$jabatan,
				'status'	=> $status,
				'file' 	=>$file,
			);

			$where = array(
				'id_surat'	=> $id
			);

			$this->Dosen_M->update_data('surat',$data,$where);
			$this->session->set_flashdata('pesan', '<div class="alert alert-success alert-dismissible fade show" role="alert">
				<strong>Data surat Berhasil diUpdate!</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						</div>');
			redirect('dosen/datasurat');
		}
	}

public function _rules()
	{
		
		$this->form_validation->set_rules('tgl','Tanggal','required');
		$this->form_validation->set_rules('isi','Isi','required');
		$this->form_validation->set_rules('perihal','Perihal','required');
		
		
	}

	public function deleteData($id){
		$where = array('id_surat' => $id);
		$this->Dosen_M->delete_data($where, 'surat');
		$this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>Data surat Berhasil diHapus!</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
						</div>');
			redirect('dosen/datasurat');
	}
}


?>