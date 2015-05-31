<?php

/**
 * this class is used for teaches_1
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */
Class Teaches_1_model extends CI_Model
{
    //table name
    private $TABLENAME = 'teaches_1';

    public function __construct()
    {
        parent::__construct();
    }

    /* *
     * this function is to get all the rows of teaches_1 table
     * sql: select * from teaches_1
     * return arrow of teaches_1 table
     * */
    public function get_all()
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get the ids of courses belongs to specific instructor
     * sql: select * from teacher1 where instructor_id = $instructor_id
     * return the rows
     */
    public function get_courses($instructor_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('instructor_id', $instructor_id);
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get the ids of instructors belongs to specific courses
     * sql: select * from teacher1 where course_id = $course_id
     * return the rows
     */
    public function get_instructors($course_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('course_id', $course_id);
        $query = $this->db->get();
        return $query->result();
    }


}

?>