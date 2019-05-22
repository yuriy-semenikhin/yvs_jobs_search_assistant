
<form id="position_details" method="post" action="edit_position.php" name="position_details">

Agency: <a href="agency.php?agency_id=<?php echo $position_info[12]; ?>"><?php echo $position_info[13]; ?></a>
<br />
<?php echo $position_info[15]; ?>

<input hidden name="agency_id" id="agency_id" value="<?php echo $position_info[12]; ?>"/>
<br />
<br />
Agent:

<table>
	<tr>
    	<td></td>
        <td><?php dropdown_list('agent_id', $default_values=array($position_info[16], $position_info[17]), 
				$agents); ?></td>
    </tr>
    
    <tr>
    	<td>email:</td>
        <td><?php echo $position_info[18]; ?></td>
    </tr>
    
    <tr>
    	<td>Default Phone:</td>
        <td><?php echo $position_info[14]; ?></td>
    </tr>
    
    <tr>
    	<td>Personal Phone:</td>
        <td><?php echo $position_info[19]; ?></td>
    </tr>
    
    <tr>
    	<td>Mobile:</td>
        <td><?php echo $position_info[20]; ?></td>
    </tr>
    
    <tr>
    	<td></td>
        <td></td>
    </tr>
</table>

Position Details:

<table>
	
    <tr>
    	<td>Progress:</td>
        <td><?php dropdown_list('progress_id', $default_values=array($position_info[1], $position_info[2]), 
				$progress_type); ?></td>
    </tr>
    
    <tr>
    	<td>Position Type:</td>
        <td><?php dropdown_list('position_type', $default_values=array($position_info[3], $position_info[4]), 
				$position_types); ?></td>
    </tr>
    
    <tr>
    	<td>Wage:</td>
        <td><input name="wage" value='<?php echo $position_info[5];?>' id="wage" type="text" size="25" maxlength="50" />
			<?php dropdown_list('wage_type', $default_values=array($position_info[6], $position_info[7]), 
				$wage_type); ?></td>
    </tr>
    
    <tr>
        	<td>Job Refference:</td>
            <td><input name="job_refference" id="job_refference" type="text" size="25" maxlength="250" value="<?php echo $position_info[9];?>"/></td>
        </tr>
        
        <tr>
        	<td>Position Name:</td>
            <td><input name="position_name" id="position_name" type="text" size="50" maxlength="250" value="<?php echo $position_info[8];?>"/></td>
        </tr>
    
    <tr>
        	<td>Location: </td>
            <td><input name="location" id="location" type="text" size="50" maxlength="250" value="<?php echo $position_info[10];?>"/></td>
        </tr>
        
        <tr>
        	<td>Position Description:</td>
            <td><textarea name="job_description" id="job_description" cols="70" rows="30"><?php echo $position_info[11];?></textarea></td>
        </tr>
        
    
</table>

<input hidden name="position_id" id="position_id" value="<?php echo $position_info[0]; ?>"/>

<input hidden name="position_update" id="position_update" value="position_update"/>

<input name="submit" type="submit" value="Update Position Details" />

</form>


<form method="post" action="position.php" >
	Add Comment in regards to application progress:
    <br />
	<textarea name="comment" id="comment" cols="70" rows="3" value='Enter new comment'> </textarea>
    
    <input hidden name="position_id" id="position_id" value="<?php echo $position_info[0]; ?>"/>
    
    <input name="submit" type="submit" value="submit" />
</form>


<!--disaplay cooments if any exist-->
<?php

if ($comments != NULL){
	
?>

<table>

<?php

foreach ($comments as $comment){

?>

	<tr>
    	<td><?php echo $comment[3];?></td>
    	<td><?php echo $comment[2];?></td>
    </tr>

<?php

}

?>


</table>

<?php	
	
}

?>