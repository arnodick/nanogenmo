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
			$protagonist = escapeshellarg($protagonist);
			$antagonist = escapeshellarg($antagonist);
			$output = shell_exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist);
			echo "Done!";
			echo "<pre>$output</pre>";//TODO this is a hack why does this work only with this line?
			$user = $_SERVER["REMOTE_USER"];
			if ($user)
			{
				mail("ash.pringle@gmail.com", $user." used up their book generation tokens", "yeah you heard it right! ".$user." used up their book generation tokens");
			}
		}
		else
		{
			echo "This book got NO character!";
		}
	?></p>
</BODY>
</HTML>