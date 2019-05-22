<?php
require 'functions/db_functions/db_class.php';

$db = new DB_class;

switch (true){

case (isset($_GET['agency_id'])):
	
	//Set up Variables
	$menue = 'menues/top_menue.php';
	$body = 'body/edit_agency.php';
	$message = '';
	
	$agency = $db -> view_single_record_from_view('yvs_job_search_agency where agency_id='.$_GET['agency_id']);
	
	include "layout/layout.php";

break;

case (isset($_POST['agency_id'])):
	
	
	
break;

}

?>