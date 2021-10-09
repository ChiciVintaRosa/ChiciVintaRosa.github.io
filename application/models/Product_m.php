<?php 

class Product_m extends CI_Model{

	public function get_data($table){
		return $this->db->get($table);
	}

	public function ambil_data($id){
		$this->db->where('nama',$id);
		return $this->db->get('dosen')->row();
	}

	public function insert_data($data,$table)
	{
		$this->db->insert($table,$data);
	}

	public function update_data($table, $data, $where){
		$this->db->update($table, $data, $where);
	}

	public function delete_data ($where, $table){
		$this->db->where($where);
		$this->db->delete($table);
	}
	public function detail_data ($id = null){
		
		$query = $this->db->get_where('pengumuman', array('id_pengumuman' => $id))->row();
		return $query;
	}

	public function cek_login()
	{
		$nidn  =set_value('nidn');
		$password  =set_value('password');

		$result    = $this->db->where('nidn',$nidn)
							  ->where('password',md5($password))
							  ->limit(1)
							  ->get('dosen');
		if($result->num_rows() > 0){
			return $result->row();
		}else{
			return FALSE;
		}
	}
}
 ?>