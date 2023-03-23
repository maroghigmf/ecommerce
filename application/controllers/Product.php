<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('MProduct', 'product');
    $this->load->model('MMutasiStock', 'mutasiStock');
	}

	public function getById($id)
	{
    $where = array(
			'pcode' => $id
		);
		$data = $this->product->getById($where);
    echo json_encode($data);
	}

  public function cart()
  {
    if ($this->input->post()) 
    {
      $orderID = $this->mutasiStock->createCart($this->input->post('pcode'), $this->input->post('jumlah'));
      if($orderID->status == 1) {
        $where = array(
          'pcode' => $orderID->pcode,
          'order_id' => $orderID->order_id,
          'type_mutasi' => 'I',
        );
        $data = array(
          'tgl_mutasi' => $orderID->tgl_mutasi,
          'pcode' => $orderID->pcode,
          'order_id' => $orderID->order_id,
          'type_mutasi' => $orderID->type_mutasi,
          'jumlah' => $orderID->jumlah
        );
        $this->mutasiStock->update($data, $where);
      }else{
        $data = array(
          'tgl_mutasi' => $orderID->tgl_mutasi,
          'pcode' => $orderID->pcode,
          'order_id' => $orderID->order_id,
          'type_mutasi' => $orderID->type_mutasi,
          'jumlah' => $orderID->jumlah
        );
        $this->mutasiStock->insert($data);
      }
    }
  }

  public function notif()
  {
    $where = array(
			'type_mutasi' => 'I'
		);
    $notif = $this->mutasiStock->countCart($where);
    echo $notif;
  }
  
  public function getCart()
  {
    $cart = $this->mutasiStock->getCart();
    echo json_encode($cart);
  }

  public function deleteCart($id)
  {
    $where = array(
			'order_id' => $id
		);
		$this->mutasiStock->delete($where);
  }
}
