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
			exec("lua52 nanogenmo.lua $protagonist $antagonist $user 2>&1", $output, $error);
			if ($error == nil)
			{
				for ($i = 0; $i < count($output); $i++)
				{
					echo "<pre>$output[2]</pre>";
				}
				if ($user)
				{
					mail("ash.pringle@gmail.com", "$user made a book!", "yeah you heard it right! $user made a book for themselves!");
				}
			}
			else
			{
				echo "Generator script failed to run! This isn't supposed to happen...";
			}
		}
		else
		{
			echo "This book got NO character!";
		}
	?></p>
</BODY>
</HTML>