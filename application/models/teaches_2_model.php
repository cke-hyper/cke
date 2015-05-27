<?php
/**
 * this class is used for teaches_2
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */

Class Teaches_2_model extends CI_Model
{
	//table name
	private $TABLENAME = 'teaches_2';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	/* *
	 * this function is to get all the rows of teaches_2 table
	 * sql: select * from teaches_2
	 * return arrow of teaches_2 table
	 * */
	public function get_all(){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get the ids of category belongs to specific instructor
	 * sql: select * from teacher_2 where instructor_id = $instructor_id
	 * return the rows
	 */
	public function get_course_categories($instructor_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->where('instructor_id', $instructor_id);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get the ids of instructor belongs to specific category_id
	 * sql: select * from teacher_2 where category_id = $category_id
	 * return the rows
	 */
	public function get_instructors($category_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->where('category_id', $category_id);
		$query = $this->db->get();
		return $query->result();
	}

	
}

?>