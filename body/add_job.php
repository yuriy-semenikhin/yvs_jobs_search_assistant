<script>

	function unhide_elements(elementname)
	{
		
		document.getElementById(elementname).style.visibility="visible";
		
	}

</script>



<form action="add_job.php" method="post">

Agency: 
<?php

dropdown_list('agency', $default_agencies_drop_down, $agencies);

?>

<input name="submit" type="submit" value="Select" />

<a onclick="unhide_elements('new_agency');">Add New Agency</a>

</form>

<form style="visibility:collapse;" name="new_agency" id="new_agency" action="add_job.php" method="post">

	<table>
    	
        <tr>
            <td width="150px">Agency Name:</td>
            <td> <input name="new_agency_name" type="text" id="new_agency_name" size="80" maxlength="250" /> </td> 
        </tr>
        
        <tr>
        	<td>Agency Site:</td>
            <td><input name="agency_site" type="text" id="agency_site" size="80" maxlength="200" /></td>
        </tr>
        
        <tr>
        	<td>Default Phone:</td>
            <td><input name="default_phone" type="text" id="default_phone" size="25" maxlength="25" /></td>
        </tr>
        
    </table>
    
    <input name="submit" type="submit" value="submit" />

</form>



<form <?php echo $hide_agent_form; ?> action="add_job.php" method="post">

Agents: 
<?php

dropdown_list('agents', $default_agent_drop_down, $agents);

?>

<input hidden name="agency" id="agency" value="<?php echo $agency_id;?>" />

<input name="submit" type="submit" value="submit" />

<a onclick="unhide_elements('new_agent');">Add New Agent</a>

</form>

<form style="visibility:collapse;"  name="new_agent" id="new_agent" action="add_job.php" method="post">

	<table>
    	
        <tr>
            <td width="150px">Agent Name:</td>
            <td> <input name="new_agent_name" type="text" id="new_agent_name" size="80" maxlength="250" /> </td> 
        </tr>
        
        <tr>
        	<td>Email:</td>
            <td><input name="email" type="text" id="email" size="80" maxlength="200" /></td>
        </tr>
        
        <tr>
        	<td>Phone:</td>
            <td><input name="phone" type="text" id="phone" size="25" maxlength="25" /></td>
        </tr>
        
        <tr>
        	<td>Mobile:</td>
            <td><input name="mobile" type="text" id="mobile" size="25" maxlength="25" /></td>
        </tr>
        
    </table>
    
    <input hidden name="agency" id="agency" value="<?php echo $agency_id;?>" />
    
    <input name="submit" type="submit" value="submit" />	

</form>



<form <?php echo $hide_postion_form; ?> name="position_details" id="position_details" action="add_job.php" method="post">
	<table>
    	
        <tr>
        	<td>Position Progress:</td>
            <td>
			<?php

				dropdown_list('position_progress', $default_drop_down = array('',''), $progress_type);
			
			?>
            </td>
        </tr>
        
        <tr>
        	<td>Job Refference:</td>
            <td><input name="job_refference" id="job_refference" type="text" size="25" maxlength="250"/></td>
        </tr>
        
        <tr>
        	<td>Position Name:</td>
            <td><input name="position_name" id="position_name" type="text" size="50" maxlength="250"/></td>
        </tr>
        
        <tr>
        	<td>Position Type:</td>
            <td>
			<?php

				dropdown_list('position_type', $default_drop_down = array('',''), $position_types);
			
			?>
            </td>
        </tr>
        
        <tr>
        	<td>Proposed Wage:</td>
            <td>
            <input name="wage" id="wage" type="text" size="25" maxlength="50"/>
            <?php

				dropdown_list('wage_type', $default_drop_down = array('',''), $wage_type);
			
			?>
            </td>
        </tr>
        
        <tr>
        	<td>Location: </td>
            <td><input name="location" id="location" type="text" size="50" maxlength="250"/></td>
        </tr>
        
        <tr>
        	<td>Position Description:</td>
            <td><textarea name="job_description" id="job_description" cols="70" rows="30"></textarea></td>
        </tr>
        
    </table>
    
    <input hidden name="agency_id" id="agency_id" value="<?php echo $agency_id;?>" />
    
    <input hidden name="agent_id" id="agent_id" value="<?php echo $agent_id;?>" />
    
    <input name="submit" type="submit" value="submit" />
    
</form>
