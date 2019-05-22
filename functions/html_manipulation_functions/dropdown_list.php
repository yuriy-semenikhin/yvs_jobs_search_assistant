<?php 
/*
This function will display the values for the dropdown lists

The values must be supplied in the form of :
$values(multidimensional array) 
with multiple arrays of 2 values
1st - value of the field
2nd - the text to be displayed to the user

It can be inserted into any form field of the "select" type
*/

function dropdown_list($name, $default_values=array(), $values=array()){
	
	echo '<select name="'.$name.'" id="'.$name.'">';
	
	echo '<option value="'.$default_values[0].'">'.$default_values[1].'</option>';
	
	foreach($values as $value){
		
		echo '<option value="'.$value[0].'">'.$value[1].'</option>';
		
	}
	
	echo'</select>';

}
?>
