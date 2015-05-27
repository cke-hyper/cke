<?php
class Instructor extends CI_Controller
{

	function __construct() {
		parent::__construct ();
		$this->load->model ( 'instructor_model', '', TRUE );
		$this->load->model ( 'teaches_1_model', '', TRUE );
		$this->load->model ( 'teaches_2_model', '', TRUE );
	}
	
	
	function index(){
		echo 'index';
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/instructor/get_instructors
	 * return the json type of data
	 * */
	function get_instructors(){
		$data ['rows'] = $this->instructor_model->get_all();
		//$data ['cardinality'] = $this->teaches_1_model->get_all();
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/instructor/get_instructor
	 * return the json type of data
	 * */
	function get_instructor($instructor_id = 1){
		$data ['rows'] = $this->instructor_model->get_instructor($instructor_id);
		//cardinality between instructor and courses
		$data ['course_cardinality'] = $this->teaches_1_model->get_courses($instructor_id);
		//cardinality between instructor and course_categories
		$data['course_categories_cardinality'] = $this->teaches_2_model->get_course_categories($instructor_id);
		print json_encode($data);
	}
	
	
	
}
?>