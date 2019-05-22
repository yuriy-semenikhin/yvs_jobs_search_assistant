<?php
require 'functions/db_functions/db_class.php';

$db = new DB_class;

$agent_id = $_POST['agent_id'];
$agent_name = $_POST['agent_name'];
$agent_email = $_POST['agent_email'];
$agent_phone = $_POST['agent_phone'];
$agent_mobile = $_POST['agent_mobile'];
$agency_id = $_POST['agency'];

$required_variables = $agent_id.", '".
					$agent_name."', '".
					$agent_email."', '".
					$agent_phone."', '".
					$agent_mobile."', ".
					$agency_id;

$db -> call_stored_procedure('procedure_edit_agent', $required_variables);

header ('Location:agent.php?agent_id='.$agent_id);

?>