<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...</p>
	<?php
		$output = shell_exec('lua52 nanogenmo.lua blub borp');
		echo $output;
	?>
</BODY>
</HTML>