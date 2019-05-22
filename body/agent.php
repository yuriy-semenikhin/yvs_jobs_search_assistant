
<p><strong>Agent Details</strong></p> 

<form id="agent_details" method = "POST" action = "edit_agent.php" >

<table>
	
	<tr>
		<td>
			<strong>Name : </strong>
		</td>
		<td><input name="agent_name" type="text" id="agent_name" size="50" maxlength="250" value="<?php echo $agent_details[1]; ?>"/></td>
	</tr>
	
	<tr>
		<td>
			<strong>E-mail : </strong>
		</td>
		<td><input name="agent_email" type="text" id="agent_email" size="50" maxlength="250" value="<?php echo $agent_details[2]; ?>" /></td>
	</tr>
	
	<tr>
		<td>
			<strong>Phone : </strong>
		</td>
		<td><input name="agent_phone" type="text" id="agent_phone" size="50" maxlength="250" value="<?php echo $agent_details[3]; ?>" /></td>
	</tr>
	
	<tr>
		<td>
			<strong>Mobile : </strong>
		</td>
		<td><input name="agent_mobile" type="text" id="agent_mobile" size="50" maxlength="250" value="<?php echo $agent_details[4]; ?>" /> </td>
	</tr>
	
	<tr>
		<td><br /><br /></td>
		
	</tr>
	
	<tr>
		<td>
			<strong>Agency Name : </strong>
		</td>
		<td><?php dropdown_list('agency', $default_values=array($agent_details[5], $agent_details[6]), 
				$agency_list); ?>
			<a href="agency.php?agency_id=<?php echo $agent_details[5]; ?>">View Agency</a>
		</td>
	</tr>
	
	<tr>
		<td>
			<strong>Agency Phone : </strong>
		</td>
		<td><?php echo $agent_details[7]; ?></td>
	</tr>
	
</table>

<input name="agent_id" type="hidden" id="agent_id" value="<?php echo $agent_details[0]; ?>" />
<br />
<br />
<input name="submit" type="submit" value="Update Agent Details" />

</form>