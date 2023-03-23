<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('MOrder', 'order');
	}

	public function insert()
	{
    $insert = $this->order->checkout($this->input->post('order_id'), $this->input->post('pmo_code'));
    echo $insert;
	}
}
