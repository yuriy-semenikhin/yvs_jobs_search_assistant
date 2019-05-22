<?php
require 'functions/db_functions/db_class.php';

//echo $_POST['agents'];
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/view_agencies.php';
$message = '';


	
$db = new db_class();

//Set up agencies list
$azRange = range('A', 'Z');

$agency_list = '';

foreach ($azRange as $letter){
	
	$agency_list .= '<strong>'.$letter.'</strong> <br />';
	$agency_list .= '<table border="1px">';
	$agency_list .= '<tr>';
	
	$agencies = $db -> view_all_from_view('view_agency_last_update where agency_name like "'.$letter.'%"');
	
	$count = 0;
	
	foreach ($agencies as $agency){
		
		$count ++;
		
		$agency_list .= '<td width="300px">';
		$agency_list .= '<a href="agency.php?agency_id='.$agency[0].'">';
		$agency_list .= $agency[1];
		$agency_list .= '</a>';
		$agency_list .= '<br>';
		$agency_list .= $agency[2];
		$agency_list .= '<ul>';
		
		$agents = $db -> view_all_from_view('view_agent_names where agency_id = '.$agency[0]);
		
		foreach ($agents as $agent){
			
			$agency_list .= '<li><a href="agent.php?agent_id='.$agent[0].'">'.$agent[1].'</a></li>';
			
		}
		
		$agency_list .= '</ul>';
		$agency_list .= '<br>';
		$agency_list .= $agency[3];
		$agency_list .= '</td>';
		
		if ($count == 3){
			
			$agency_list .= '</tr>';
			$agency_list .= '<tr>';
			
			$count = 0;
			
		}
		
	}
	
	$agency_list .= '</tr>';
	$agency_list .= '</table>
		<br/>';
	
}
//agencies list done
	
include "layout/layout.php";	

?>