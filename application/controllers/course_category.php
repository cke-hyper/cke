<?php
class Course_category extends CI_Controller
{

	function __construct() {
		parent::__construct ();
		$this->load->model ( 'course_category_model', '', TRUE );
		$this->load->model ( 'teaches_2_model', '', TRUE );
		$this->load->model ( 'offer_model', '', TRUE );
	}
	
	
	function index(){
		echo 'index';
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course_category/get_course_categories
	 * return the json type of data
	 * */
	function get_course_categories(){
		$data ['rows'] = $this->course_category_model->get_all();
		/*show the arrow from database*/
		//print_r($data);
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course_category/get_course_category
	 * return the json type of data
	 * */
	function get_course_category($course_category_id = 1){
		$data ['rows'] = $this->course_category_model->get_course_category($course_category_id);
		//cardinality between course_categoriy and instructor
		$data ['instrcutor_cardinality'] = $this->teaches_2_model->get_instructors($course_category_id);
		//cardinality between course_categoriy and courses
		$data ['course_cardinality'] = $this->offer_model->get_courses($course_category_id);
		print json_encode($data);
	}
	
}
?>