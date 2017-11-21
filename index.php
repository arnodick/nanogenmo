<!DOCTYPE html>
<HTML>
<BODY>
	<form>
		Protagonist:<br>
		<input type="text" name="protagonist"><br>
		Antagonist:<br>
		<input type="text" name="antagonist">
	</form> 
	<p>GENERATING...</p>
	<?php
		$output = shell_exec('lua52 nanogenmo.lua');
	?>
</BODY>
</HTML>