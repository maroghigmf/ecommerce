<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MOrder extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	public function checkout($order_id, $pmo_code)
	{
		$stmt = $this->db->query("CALL checkout('".$order_id."', '".$pmo_code."')");
    mysqli_next_result( $this->db->conn_id );
		return $stmt;
	}
}
