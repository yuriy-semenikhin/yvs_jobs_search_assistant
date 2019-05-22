<?php
require 'functions/db_functions/db_class.php';
require 'functions/html_manipulation_functions/dropdown_list.php';


//echo $_POST['agents'];
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/agent.php';
$message = '';

$agent_id = $_GET['agent_id'];

$db = new DB_class;

$agent_details = $db -> view_single_record_from_view('view_single_agent_info 
							where agent_id = "'.$agent_id.'"');
$agency_list = $db -> view_all_from_view('view_agency_names');

							
include "layout/layout.php";

//print_r($agent_details);
							
?>