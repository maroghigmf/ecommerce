<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MMutasiStock extends CI_Model {

	private $table = 'mutasi_stock';
	private $tableCart = 'get_cart';

	function __construct()
	{
		parent::__construct();
	}

	public function getAll()
	{
		$stmt = $this->db->get($this->table);
		return $stmt->result();
	}

	public function createCart($code, $jumlah)
	{
		$stmt = $this->db->query("CALL create_cart('".$code."', '".$jumlah."')");
    mysqli_next_result( $this->db->conn_id );
		return $stmt->row();
	}

	public function countCart($where)
	{
		$stmt = $this->db->get_where($this->table, $where);
		return $stmt->num_rows();
	}

	public function getById($where)
	{
		$stmt = $this->db->get_where($this->table, $where);
		return $stmt->result();
	}
	
	public function getCart()
	{
		$stmt = $this->db->get($this->tableCart);
		return $stmt->result();
	}

	public function insert($data)
	{
		$stmt = $this->db->insert($this->table, $data);
		return $stmt;
	}

	public function update($data, $where)
	{
		$this->db->where($where);
		$this->db->update($this->table, $data);
	}

	public function delete($where)
	{
		$this->db->where($where);
		$this->db->delete($this->table);
	}
}
