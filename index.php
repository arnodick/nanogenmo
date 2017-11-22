<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING</p>
	<p>...</p>
	<p><?php
		$protagonist = $_POST["protagonist"];
		$antagonist = $_POST["antagonist"];
		$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
		echo "Done!";
		echo "<pre>$output</pre>";
	?></p>
</BODY>
</HTML>