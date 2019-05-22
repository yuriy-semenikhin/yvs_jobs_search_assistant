<?php
require 'functions/db_functions/db_class.php';
require 'functions/html_manipulation_functions/dropdown_list.php';

//echo addslashes($_POST['agents']);
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/add_job.php';
$message = '';

$agency_id = 0;
$default_agencies_drop_down = array('','');
$default_agent_drop_down = array('','');
$hide_agent_form = 'hidden';
$hide_postion_form = 'hidden';


$db = new DB_class();



$agencies = $db -> view_all_from_view('view_agency_names');
$position_types = $db -> view_all_from_view('yvs_job_search_application_type');
$wage_type = $db -> view_all_from_view('yvs_job_search_wage_type');
$progress_type = $db -> view_all_from_view('yvs_job_search_application_progress');



//respond to events

switch(true){
	
	case(isset($_POST['new_agency_name'])):
		
	//a new agency has been submited	
		
		$procedure = 'procedure_add_new_agency';
		
		$required_variables = "'".addslashes($_POST['new_agency_name'])."', '".addslashes($_POST['default_phone'])."', '".addslashes($_POST['agency_site'])."'";
		
		$agency_id = $db -> call_stored_procedure($procedure, $required_variables);
		
		$view_and_conditions = 'view_agency_names where agency_id='.$agency_id;
		
		$default_agencies_drop_down = $db -> view_single_record_from_view($view_and_conditions);
		
	break;
	
	case((isset($_POST['agency'])) && (!isset($_POST['new_agent_name'])) && (!isset($_POST['agents']))):
		
	//an agency has been selected from the dropdown list	
		
		$agency_id = addslashes($_POST['agency']);
		
		$view_and_conditions = 'view_agency_names where agency_id='.$agency_id;
		
		$default_agencies_drop_down = $db -> view_single_record_from_view($view_and_conditions);
		
		$hide_agent_form = '';
		
		$agents = $db -> view_all_from_view('view_agent_names where agency_id='.$agency_id);
		
	break;
	
	case (isset($_POST['new_agent_name'])):
		
	//a new agent has been added to the agency	
		
		//set up agency data
		$agency_id = addslashes($_POST['agency']);
		
		$view_and_conditions = 'view_agency_names where agency_id='.$agency_id;
		
		$default_agencies_drop_down = $db -> view_single_record_from_view($view_and_conditions);
		
		$hide_agent_form = '';
		
		
		//set up agent data
		$procedure = 'procedure_add_new_agent';
		
		$required_variables = "'".addslashes($_POST['new_agent_name'])."', '".addslashes($_POST['email'])."', 
					'".addslashes($_POST['phone'])."', '".addslashes($_POST['mobile'])."', ".$agency_id;
		
		$agent_id = $db -> call_stored_procedure($procedure, $required_variables);
		
		$default_agent_drop_down = $db -> view_single_record_from_view('view_agent_names where 
				agent_name = "'.addslashes($_POST['new_agent_name']).'" and agency_id='.$agency_id);
		
		$agents = $db -> view_all_from_view('view_agent_names where agency_id='.$agency_id);
				
		
		//unhide position details form
		$hide_postion_form = '';
		
	break;
	
	case (isset($_POST['agents'])):
		
	//an agent has been selected from agents drop down list	
		
		//set up agency data
		$agency_id = addslashes($_POST['agency']);
		$agent_id = addslashes($_POST['agents']);
		
		$view_and_conditions = 'view_agency_names where agency_id='.$agency_id;
		
		$default_agencies_drop_down = $db -> view_single_record_from_view($view_and_conditions);
		
		$hide_agent_form = '';
		
		
		//set up agent data
		$default_agent_drop_down = $db -> view_single_record_from_view('view_agent_names where 
				agent_id = '.addslashes($_POST['agents']));
		
		$agents = $db -> view_all_from_view('view_agent_names where agency_id='.$agency_id);
		
		//unhide position details form
		$hide_postion_form = '';
		
	break;
	
	case (isset($_POST['agency_id'])):
		
	//new application details have been submited	
		
		$agency_id = addslashes($_POST['agency_id']);
		$agent_id = addslashes($_POST['agent_id']);
		$type_id = addslashes($_POST['position_type']);
		$progress_id = addslashes($_POST['position_progress']);
		$wage = addslashes($_POST['wage']);
		$wage_id = addslashes($_POST['wage_type']);
		$position_name = addslashes($_POST['position_name']);
		$position_location = addslashes($_POST['location']);
		$agency_refference = addslashes($_POST['job_refference']);
		$job_description = addslashes($_POST['job_description']);
		
		$required_variables = $agency_id.", ".
			$agent_id.", ".
			$type_id.", ".
			$progress_id.", '".
			$wage."', ".
			$wage_id.", '".
			$position_name."', '".
			$position_location."', '".
			$agency_refference."', '".
			$job_description ."'";
		
		$procedure = 'procedure_add_new_position';
		
		$position_id = $db -> call_stored_procedure($procedure, $required_variables);
		
		header ('Location:position.php?position_id='.$position_id);

	break;
	
}

include "layout/layout.php";

?>
