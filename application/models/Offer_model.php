<?php

/**
 * this class is used for offer
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */
Class Offer_model extends CI_Model
{

	//table name
	private $TABLENAME = 'offer';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	/* *
	 * this function is to get all the rows of teaches_1 table
	 * sql: select * from teaches_1
	 * return arrow of teaches_1 table
	 * */
	public function get_all(){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get the ids of courses belongs to specific course_categories
	 * sql: select * from teacher1 where instructor_id = $instructor_id
	 * return the rows
	 */
	public function get_courses($course_category_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->join('course',"course.course_id = $this->TABLENAME.course_id");
		$this->db->where('category_id', $course_category_id);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get the ids of course_categories belongs to specific course
	 * sql: select * from teacher_1 where course_id = $course_id
	 * return the rows
	 */
	public function get_course_categories($course_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->join('course_category', "course_category.category_id = $this->TABLENAME.category_id");
		$this->db->where('course_id', $course_id);
		$query = $this->db->get();
		return $query->result();
	}



}

?>
