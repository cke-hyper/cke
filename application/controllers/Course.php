<?php

class Course extends CI_Controller
{
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'course_model', '', TRUE );
		$this->load->model ( 'teaches_1_model', '', TRUE );
		$this->load->model ( 'offer_model', '', TRUE );
	}
	
	
	function index(){
		echo 'index';
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course/get_courses
	 * return the json type of data
	 * */
	function get_courses(){
		$data ['rows'] = $this->course_model->get_all();
		/*show the arrow from database*/
		//print_r($data);
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course/get_course
	 * return the json type of data
	 * */
	function get_course($course_id = 1){
		$data ['rows'] = $this->course_model->get_course($course_id);
		//cardinality between courses and instructor
		$data ['instructor_cardinality'] = $this->teaches_1_model->get_instructors($course_id);
		//cardinality between courses and rooms
		/* course.belongs_to */
		//cardinality between courses and course_categories
		$data ['course_category_cardinality'] = $this->offer_model->get_course_categories($course_id);
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course/get_courses_alphabet
	 * return the courses order by alphabet
	 */
	function get_courses_alphabet(){
		$data['rows'] = $this->course_model->get_course_by_alphabet();
		print json_encode($data);
	}
	
	/*
	 * for the purpuse of test : base_url() + index.php/course/get_courses_level
	 * return the courses order by level
	 */
	function get_courses_level(){
		$data['rows'] = $this->course_model->get_course_by_level();
		print json_encode($data);
	}

}

?>
