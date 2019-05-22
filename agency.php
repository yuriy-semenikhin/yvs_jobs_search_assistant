<?php
require 'functions/db_functions/db_class.php';

//echo $_POST['agents'];
//Set up Variables
$menue = 'menues/top_menue.php';
$body = 'body/agency.php';
$message = '';


	
$db = new db_class();

$agency = $db -> view_single_record_from_view('yvs_job_search_agency where agency_id='.$_GET['agency_id']);

$agents = $db -> view_all_from_view ('yvs_job_search_agent where agency_id='.$_GET['agency_id']);

$positions = $db -> view_all_from_view('view_short_application_info where agency_name="'.$agency['1'].'"');

include "layout/layout.php";

?>