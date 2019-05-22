<?php

/*
reason for creating this class:
I've got a number of DB functions I use on almost every page
so it makes sence to gather them in one class 
this whould make it much easier to use them in development
*/

class DB_class
{
	
	public function db_connect_mysqli()
	{
	// connect to the database using the variables
	// $dbhost, $dbuser, $dbpass, $dbname
	
		$dbhost='localhost';
		$dbuser='root';
		$dbpass='set_your_own';
		$dbname='yvs_job_search';
		
		$db_connect=mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) or die ("Couldn't connect" . mysqli_error());
		
		return $db_connect;
		//mysqli_select_db($dbname, $db_connect) or die (mysqli_error());
		
	}
	
	 	
	
	public function call_stored_procedure($procedure, $required_variables)
	{
	/*
	$required_variables - accepts the values required by the called procedure
	in the form of a string. All string variable must be commented
	
	Example: 
	$required_variables = 'variable_1', 'variable_2';
	or
	$required_variables = "'".$variable_1."', '".$variable_2."'";
	*/
		
		$out_id = '@auto_out_'.time();
		$db_connect = $this -> db_connect_mysqli();
		
		$query = 'call '.$procedure.'('.$required_variables.', '.$out_id.');';
		
		$query2 = 'select '.$out_id.';';
		//echo $query.'<br /><br />'.$query2.'<br /><br />';
		
		$result = mysqli_query ($db_connect, $query) or die ("Procedure MySQL Error".mysqli_error($db_connect));
		$result = mysqli_query ($db_connect, $query2);
		
		$return = mysqli_fetch_row ($result);
		
		$return = $return[0];
		return $return;
	}
	
	
	
	public function view_all_from_view($view_and_conditions)
	{
	/*This function will select ALL the values from a 
	"view" created in the database, without any changes 
	to the order in which data is presented in the "view"
	the name of the view should be provided as a string.
	*/
	
	/*If you want to limit the results by certain comditions,
	just add those conditions after the name of the view 
	as you would in normal query.
	Example:
	$view_and_conditions = "view_name where id = 1"
	
	You DO NOT need to add a semicolon at the end of the string.
	*/
	
	/*The data is returned in a multidimensional array*/
	
		$db_connect = $this -> db_connect_mysqli();
		$return = array();
		
		$query = "select * from ".$view_and_conditions.";"; 
		
		//echo $query.'<br/>';
		 
		$search = mysqli_query($db_connect, $query) or die ("MySQL Error".mysqli_error($db_connect));
		
		while($result = mysqli_fetch_array ($search)){
			
			$return[] = $result;
			
		}
		
		return $return;
		
	}
	
	
	
	public function view_distinct_values_from_view($required_fields = '*', $view_and_conditions)
	{
	/*This function will select ALL the distinct values from 
	a "view" created in the database, without any changes 
	to the order in which data is presented in the "view"
	the name of the view should be provided as a string.
	*/
	
	/*If you want to limit the results by certain comditions,
	just add those conditions after the name of the view 
	as you would in normal query.
	Example:
	$view_and_conditions = "view_name where id = 1"
	
	You DO NOT need to add a semicolon at the end of the string.
	*/
	
	/*The data is returned in a multidimensional array*/
	
		$db_connect = $this -> db_connect_mysqli();
		$return = array();
		
		$query = "select distinct ".$required_fields." from ".$view_and_conditions.";"; 
		
		//echo $query.'<br/>';
		 
		$search = mysqli_query($db_connect, $query) or die ("MySQL Error".mysqli_error($db_connect));
		
		while($result = mysqli_fetch_array ($search)){
			
			$return[] = $result;
			
		}
		
		return $return;
		
	}
	
	
	
	function view_single_record_from_view($view_and_conditions){
	
	/*This function will select a single value from a 
	"view" created in the database, without any changes 
	to the order in which data is presented in the "view"
	the name of the view should be provided as a string.
	*/
	
	/*To ensure proper result you MUST put in the search
	conditions...
	Example:
	$view_and_conditions = "view_name where id = 1"
	
	You DO NOT need to add a semicolon at the end of the string.
	*/
	
	/*The data is returned in a numbered array*/
		
		$db_connect = $this -> db_connect_mysqli();
		
		$query = "select * from ".$view_and_conditions.";"; 
		
		//echo $query.'<br /><br />';
		 
		$search = mysqli_query($db_connect, $query) or die ("MySQL Error".mysqli_error($db_connect));
		
		$record = mysqli_fetch_row ($search);
		
		return $record;
		
	}

}


?>