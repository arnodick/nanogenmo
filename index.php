<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING...</p>
	<?php
		//$output = shell_exec('lua52 /home/public/luaprojects/nanogenmo/nanogenmo.lua blub borp');
		//$output = shell_exec('lua52 /home/public/luaprojects/nanogenmo/n.lua');
	$output = shell_exec('lua52 n.lua');
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