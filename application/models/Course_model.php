<?php

/**
 * this class is used for course
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */
Class Course_model extends CI_Model
{
    //table name
    private $TABLENAME = 'course';

    public function __construct()
    {
        parent::__construct();
    }

    /* *
     * this function is to get all the rows of course table
     * sql: select * from course
     * return arrow of course table
     * */
    public function get_all()
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        /* order by */
// 		$direction = 'desc'
// 		if (strlen($order) > 0)
// 		{
// 			$this->db->order_by($order, $direction); 	
// 		}
        /* offset */
        // 		$offset = 0;
        // 		$limit = 0;
// 		if ($limit > 0)
// 		{
// 			$this->db->limit($limit, $offset);
// 		}
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get specific row of course table
     * sql: select * from course where course_id = $course_id
     * return the row
     */
    public function get_course($course_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('course_id', $course_id);
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get specific row of course table
     * sql: select * from course where course_id = $course_id
     * return the row
     */
    public function get_courses($room_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('belongs_to', $room_id);
        $query = $this->db->get();
        return $query->result();
    }

}

?>