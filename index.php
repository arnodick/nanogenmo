<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING</p>
	<p>...</p>
	<p><?php
		$protagonist = $_POST["protagonist"];
		$antagonist = $_POST["antagonist"];
		if ($protagonist and $antagonist)
		{
			$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
			echo "Done!";
			echo "<pre>$output</pre>";
		}
		else
		{
			echo "This book got NO character!";
		}
	?></p>
</BODY>
</HTML>