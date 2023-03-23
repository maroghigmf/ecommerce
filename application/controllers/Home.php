<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends CI_Controller  {

    function __construct()
	{
		parent::__construct();
		$this->load->model('MProduct', 'product');
	}

    public function index()
    {
        $data['getProduct'] = $this->product->getAll();
        $this->load->view('home/index', $data);
    }
}