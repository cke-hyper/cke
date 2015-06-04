<?php

/**
 * this class is used for schedule
 * add by mert
 * 2015-06-04
 */
Class Schedule_model extends CI_Model
{
    //table name
    private $TABLENAME = 'schedule';

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
		$query = $this->db->get();
		return $query->result();
	}
}

?>
