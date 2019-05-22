<?php
require 'functions/db_functions/db_class.php';


//echo $_POST['agents'];
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/view_agents.php';
$message = '';

$db = new DB_class;

//Set up agents list
$az_Range = range('A', 'Z');
$agents = '';

foreach ($az_Range as $letter){
	
	$agents .= '<strong>'.$letter.'</strong>';
	$agents.= '<br/><br/>';
	
	$agents_list = $db -> view_all_from_view('view_agent_names 
							where agent_name like "'.$letter.'%"');
	
	foreach ($agents_list as $agent){
		
		$agents .= '<a href="agent.php?agent_id='.$agent[0].'">';
		$agents .= $agent[1];
		$agents .= '</a>';
		$agents .= '<br />';
		
	}
	
	$agents .= '<br/>';
	
}

//echo $agents;

include "layout/layout.php";

?>