<?php
require 'functions/db_functions/db_class.php';
require 'functions/html_manipulation_functions/dropdown_list.php';

$db = new DB_class();

	$position_id = addslashes($_POST['position_id']);
	$agency_id = addslashes($_POST['agency_id']);
	$agent_id = addslashes($_POST['agent_id']);
	$type_id = addslashes($_POST['position_type']);
	$progress_id = addslashes($_POST['progress_id']);
	$wage = addslashes($_POST['wage']);
	$wage_id = addslashes($_POST['wage_type']);
	$position_name = addslashes($_POST['position_name']);
	$position_location = addslashes($_POST['location']);
	$agency_refference = addslashes($_POST['job_refference']);
	$job_description = addslashes($_POST['job_description']);
		
	$required_variables = $position_id.", ".
		$agency_id.", ".
		$agent_id.", ".
		$type_id.", ".
		$progress_id.", '".
		addslashes($wage)."', ".
		$wage_id.", '".
		$position_name."', '".
		$position_location."', '".
		$agency_refference."', '".
		$job_description ."'";
	/*						
	echo $wage .'<br/><pre>';
	print_r($_POST);
	echo '</pre>';
	*/
	
	$update_position = $db ->call_stored_procedure('procedure_edit_position', $required_variables);
	
	header ('Location:position.php?position_id='.$position_id);

?>