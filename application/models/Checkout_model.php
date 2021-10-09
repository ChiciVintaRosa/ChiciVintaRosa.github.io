<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Checkout_model extends MY_Model 
{
    public $table = 'orders';   // Ini akan diubah2 di controller Checkout

    public function getDefaultValues()
    {
        return [
            'name'      => '',
            'address'   => '',
            'phone'     => '',
            'status'    => ''
        ];
    }

    public function getValidationRules()
    {
        $validationRules = [
            [
                'field' => 'name',
                'label' => 'Nama',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'address',
                'label' => 'Alamat',
                'rules' => 'trim|required'
            ],
            [
                'field' => 'phone',
                'label' => 'Telepon',
                'rules' => 'trim|required|max_length[15]'
            ]
        ];

        return $validationRules;
    }
     public function total()
{
   $this->db->select_sum('subtotal');
   $query = $this->db->get('cart');
   if($query->num_rows()>0)
   {
     return $query->row()->subtotal;
   }
   else
   {
     return 0;
   }
}
}


/* End of file Checkout_model.php */
