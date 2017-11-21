<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...</p>
	<?php
		$protagonist = $_POST["protagonist"];
		$antagonist = $_POST["antagonist"];
		print($protagonist)
		print($antagonist)
		$output = shell_exec('lua52 nanogenmo.lua');
	?>
</BODY>
</HTML>