<?php
/**
 * this class is used for room
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */

Class Room_model extends CI_Model
{
	//table name
	private $TABLENAME = 'room';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	/* *
	 * this function is to get all the rows of room table
	 * sql: select * from room
	 * return arrow of room table
	 * */
	public function get_all(){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$query = $this->db->get();
		return $query->result();
	}
	
	/*
	 * this function is to get specific row of room table
	 * sql: select * from room where room_id = $room_id
	 * return the row
	 */
	public function get_room($room_id){
		$this->db->select('*');
		$this->db->from($this->TABLENAME);
		$this->db->where('room_id', $room_id);
		$query = $this->db->get();
		return $query->result();
	}
	
}

?>