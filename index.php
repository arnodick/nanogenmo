<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...
	<?php
		echo "blub";
		echo shell_exec('whoami');
		$output = shell_exec('lua52 nanogenmo.lua blub borp');
	?>
	</p>
</BODY>
</HTML>