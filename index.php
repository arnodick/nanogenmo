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
			$user = $_SERVER["REMOTE_USER"];
			$protagonist = escapeshellarg($protagonist);
			$antagonist = escapeshellarg($antagonist);
			//exec("lua52 nanogenmo.lua ".$protagonist." ".$antagonist." ".$user." 2>&1", $output);
			exec("lua52 nanogenmo.lua $protagonist $antagonist $user 2>&1", $output);
			for ($i = 0; $i < count($output); $i++)
			{
				echo "<pre>$output[$i]</pre>";
			}
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