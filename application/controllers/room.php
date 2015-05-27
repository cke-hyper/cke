<?php
class Room extends CI_Controller
{

	function __construct() {
		parent::__construct ();
		$this->load->model ( 'room_model', '', TRUE );
		$this->load->model ( 'course_model', '', TRUE );
	}
	
	
	function index(){
		echo 'index';
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/room/get_rooms
	 * return the json type of data
	 * */
	function get_rooms(){
		$data ['rows'] = $this->room_model->get_all();
		/*show the arrow from database*/
		//print_r($data);
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/room/get_room
	 * return the json type of data
	 * */
	function get_room($room_id = 1){
		$data ['rows'] = $this->room_model->get_room($room_id);
		//cardinality between room and course
		$data ['course_cardinality'] = $this->course_model->get_courses($room_id);
		print json_encode($data);
	}
}
?>