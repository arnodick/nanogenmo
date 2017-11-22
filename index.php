<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING</p>
	<p>...</p>
	<?php
		$protagonist = $_POST["protagonist"];
		$antagonist = $_POST["antagonist"];
		$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
		print($output);
	?>
</BODY>
</HTML>