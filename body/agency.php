<table>
	<tr><td>
		<div style="position:relativ; float:left; padding:10px; margin-right:20px; 
					border-style: solid; border-width:1px; border-color: black;
					box-shadow: 10px 10px #C2C2C2;">
			
			<strong><?php echo $agency[1]; ?> </strong> 
			<br/>
			<a href="<?php echo $agency[3]; ?>"><?php echo $agency[3]; ?></a>
			<br/>
			<?php echo $agency[2]; ?>
			
		</div>
		
		<div style="position:relativ; float:left; padding:10px; " >
			
			<a href="">Edit Agency</a>
			
		</div>
	</td></tr>
</table>

<br />
<br />

<?php
foreach($agents as $agents){
	
	
	
}
?>

<!-- display positions -->

<?php

foreach ($positions as $position){
	
?>

<table border="1px">

	<tr>
    	<td><?php echo $position[0];?></td>
        
        <td>
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