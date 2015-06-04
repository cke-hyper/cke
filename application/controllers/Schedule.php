<?php

class Schedule extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('schedule_model', '', TRUE);
        $this->load->model('course_model', '', TRUE);
    }

    function index()
    {
        // echo 'index';
        $this->load->view('test');
    }

    /*
     * for the purpuse of test : base_url() + index.php/instructor/get_instructors
     * return the json type of data
     */
    function get_all()
    {
        $data ['rows'] = $this->schedule_model->get_all();
        $data ['cardinality'] = $this->course_model->get_all();
        print json_encode($data);
    }
}

?>