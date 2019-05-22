<?php
require 'functions/db_functions/db_class.php';
require 'functions/html_manipulation_functions/dropdown_list.php';

//echo $_POST['agents'];
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/position.php';
$message = '';

$db = new DB_class();

if (isset($_GET['position_id'])){
	
	$position_id = $_GET['position_id'];
	
}

else{
	
	$position_id = $_POST['position_id'];
	
}

switch (true){
	
case (isset($_POST['comment'])):
	
	$new_comment = $db ->call_stored_procedure('procedure_add_new_comment',"'".addslashes($_POST['comment'])."', ".$position_id.", 'Application'");
	
break;
	
}

$view_details = 'view_full_application_info where application_id = '.$position_id;
$position_info = $db -> view_single_record_from_view($view_details);

$agents = $db -> view_all_from_view('view_agent_names where agency_id='.$position_info[12]);

$position_types = $db -> view_all_from_view('yvs_job_search_application_type');
$wage_type = $db -> view_all_from_view('yvs_job_search_wage_type');
$progress_type = $db -> view_all_from_view('yvs_job_search_application_progress');



$comments = $db -> view_all_from_view('view_application_comments where application_id = '.$position_id.' order by comment_id desc');

include "layout/layout.php";
?>