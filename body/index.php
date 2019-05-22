<form action="index.php" method='post'>
	
	<input type='text' name='search' id='search' size="80" maxlength="250">
	<input type='Submit' name='Submit' id='Submit' value='Search'>
</form>
<br/>
<br/>
<?php

foreach ($positions as $position){
	
?>

<table border="1px">

	<tr>
    	<td><?php echo $position[0];?></td>
        
        <td width="700px">
        	<table width="700px" border="1px">
            <tr>
            <td><?php echo $position[1];?></td>
            <td><?php echo $position[2];?></td>
            <td><a href="agency.php?agency_id=<?php echo $position[6];?>"><?php echo $position[3];?></a></td>
            <td><a href="agent.php?agent_id=<?php echo $position[7];?>"><?php echo $position[4];?></a></td>
            </tr>
            </table>
            <?php echo $position[5];?>
            
        </td>
        
        <td><a href="position.php?position_id=<?php echo $position[0];?>">View Position</a></td>
    </tr>

</table>
<br />
<?php
	
}

?>