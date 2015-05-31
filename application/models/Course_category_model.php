<?php

/**
 * this class is used for course_category
 * table doing curd
 * add by yuxing
 * 2015-05-27
 */
Class Course_category_model extends CI_Model
{
    //table name
    private $TABLENAME = 'course_category';

    public function __construct()
    {
        parent::__construct();
    }

    /* *
     * this function is to get all the rows of course_category table
     * sql: select * from course_category
     * return arrow of course_category table
     * */
    public function get_all()
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get specific row of course_category table
     * sql: select * from course_category where course_category_id = $course_category_id
     * return the row
     */
    public function get_course_category($course_category_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('category_id', $course_category_id);
        $query = $this->db->get();
        return $query->result();
    }
}

?>