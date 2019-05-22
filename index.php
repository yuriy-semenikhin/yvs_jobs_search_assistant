<?php
require 'functions/db_functions/db_class.php';

$menue = 'menues/top_menue.php';
$body = 'body/index.php';
$message = '';

$db = new DB_class();

$positions = array();


switch(true){
	
	case (isset($_POST['search'])):
		
		$search_conditions = 'view_full_application_info
							where
							position_name  like "%'.addslashes($_POST['search']) .'%"
							or
							agency_refference  like "%'.addslashes($_POST['search']) .'%"
							or
							position_location  like "%'.addslashes($_POST['search']) .'%"
							or
							agency_name  like "%'.addslashes($_POST['search']) .'%"
							or
							default_number  like "%'.addslashes($_POST['search']) .'%"
							or
							agent_name  like "%'.addslashes($_POST['search']) .'%"
							or
							agent_email  like "%'.addslashes($_POST['search']) .'%"
							or
							agent_phone  like "%'.addslashes($_POST['search']) .'%"
							or
							agent_mobile  like "%'.addslashes($_POST['search']) .'%"
							
							order by application_id desc
							';
		
		$position_ids = $db -> view_distinct_values_from_view('application_id',$search_conditions);
		
		foreach ($position_ids as $id){
		
			$positions[] = $db -> view_single_record_from_view('view_short_application_info where application_id = '.$id[0]);
		
		}
		
	break;
	
	default:
		
		$positions = $db -> view_all_from_view('view_short_application_info');
		
	break;
	
}


include "layout/layout.php";
?>