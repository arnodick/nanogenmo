<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...</p>
	<?php
		$protagonist = $_POST["protagonist"];
		$antagonist = $_POST["antagonist"];
		$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
	?>
</BODY>
</HTML>