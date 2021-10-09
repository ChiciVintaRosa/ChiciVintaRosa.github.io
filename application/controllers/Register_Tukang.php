<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Register_Tukang extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        
        $is_login = $this->session->userdata('is_login');
        
        if ($is_login) {
            redirect(base_url());   // Jika sudah login, redirect ke home
            return;
        }
    }

    public function index()
    {
        $this->form_validation->set_rules('name','Nama','required');
        $this->form_validation->set_rules('email','Email','required');
        $this->form_validation->set_rules('password1','Password','required|matches[password2]');
        $this->form_validation->set_rules('password2','Password','required|matches[password1]');

        if($this->form_validation->run() == FALSE) {
             $data['page'] = 'pages/auth/register_tukang';

            $this->view($data);
        }else{
            $data = array(
                'id' =>'',
                'name' =>$this->input->post('name'),
                'email' =>$this->input->post('email'),
                'password' =>hashEncrypt($this->input->post('password1')),
                'role'  => 'tukang',
                'is_active' => 1            
        
        );
        $this->db->insert('user',$data);
        $this->session->set_flashdata('success', 'Berhasil melakukan registrasi');
            redirect(base_url());
         redirect(base_url()); 
       }
        }
    }
