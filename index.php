<!DOCTYPE html>
<HTML>
<BODY>
	<p>GENERATING</p>
	<p>...</p>
	<p><?php
		$protagonist = escapeshellarg($_POST["protagonist"]);
		$antagonist = escapeshellarg($_POST["antagonist"]);
		if ($protagonist and $antagonist)
		{
			$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
			echo "Done!";
			echo "<pre>$output</pre>";//TODO this is a hack why does this work only with this line?
		}
		else
		{
			echo "This book got NO character!";
		}
	?></p>
</BODY>
</HTML>