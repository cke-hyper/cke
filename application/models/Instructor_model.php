<?php

/**
 * this class is used for instructor
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */
Class Instructor_model extends CI_Model
{

	//table name
	private $TABLENAME = 'instructor';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	/* *
	 * this function is to get all the rows of instructor table
	 * sql: select * from instructor
	 * return arrow of instructor table
	 * */
	public function get_all($order="full_name", $direction="ASC"){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->order_by($order, $direction);
		$query = $this->db->get();
		return $query->result();
	}
	
	/* *
	 * this function is to get all the sepecific month rows of instructor table
	 * sql: select * from instructor where ins_of_month = 1;
	 * return arrow of instructor table
	 * */
	public function get_instructors_by_month($ins_of_month=1,$order="full_name", $direction="ASC"){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->where('ins_of_month', $ins_of_month);
		$this->db->order_by($order, $direction);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get specific row of instuctor table
	 * sql: select * from instructor where instructor_id = $instructor_id 
	 * return the row
	 */
	public function get_instructor($instructor_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->where('instructor_id', $instructor_id);
		$query = $this->db->get();
		return $query->result();
	}
	

}

?>
