<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MProduct extends CI_Model {

	private $table = 'product';
	private $tableStock = 'get_stock';

	function __construct()
	{
		parent::__construct();
	}

	public function getAll()
	{
		$stmt = $this->db->get($this->tableStock);
		return $stmt->result();
	}

	public function count()
	{
		$stmt = $this->db->count_all($this->table);
		return $stmt;
	}

	public function getById($where)
	{
		$stmt = $this->db->get_where($this->tableStock, $where);
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
