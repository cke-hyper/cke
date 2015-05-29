<?php
class Page extends CI_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'page_model', '', TRUE );
	}
	function index() {
		// echo 'index';
		$this->load->view ( 'test' );
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/instructor/get_instructors
	 * return the json type of data
	 */
	function get_page($page_content = "our_gym") {
		$data ['rows'] = $this->page_model->get_page ( $page_content );
		// $data ['cardinality'] = $this->teaches_1_model->get_all();
		foreach ( $this->page_model->get_page ( $page_content ) as $row ) {
			echo $row->page_content;
		}
	}
}
?>