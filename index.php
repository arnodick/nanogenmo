<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...</p>
	<?php
		$output = shell_exec('lua52 luaprojects/nanogenmo/nanogenmo.lua blub borp');
		if (is_null($output))
		{
			echo "no";
		}
		else
		{
			echo $output;
		}
	?>
</BODY>
</HTML>