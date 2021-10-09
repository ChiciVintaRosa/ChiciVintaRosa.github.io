<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cart_model extends MY_Model 

{
    public $table = 'cart'; 

        // Ini akan diubah2 di controller Cart
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



/* End of file Cart_model.php */
