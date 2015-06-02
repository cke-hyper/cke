<?php

/**
 * this class is used for instructor
 * table doing curd
 * add by yuxing
 * 2015-05-29
 */
Class Page_model extends CI_Model
{
    //table name
    private $TABLENAME = 'page';

    public function __construct()
    {
        parent::__construct();
    }

    /* *
     * this function is to get all the rows of instructor table
     * sql: select * from instructor
     * return arrow of instructor table
     * */
    public function get_all()
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $query = $this->db->get();
        return $query->result();
    }

    /*
     * this function is to get specific page
     * sql: select * from page where page_name = $page_name
     * return the row
     */
    public function get_page($page_id)
    {
        $this->db->select('*');
        $this->db->from($this->TABLENAME);
        $this->db->where('page_id', $page_id);
        $query = $this->db->get();
        return $query->result();
    }

}

?>