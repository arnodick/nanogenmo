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
					echo "<pre>$output[$i]</pre>";
				}
				if ($user)
				{
					mail("ash.pringle@gmail.com", "$user made a book!", "yeah you heard it right! $user made a book for themselves! nice!");
				}
			}
			else
			{
				echo "Book generator script failed to run! This isn't supposed to happen...\n";
				echo var_dump($error);
			}
		}
		else
		{
			echo "This book got NO dang character!\nPlease use <a href='https://www.ashleypringle.ca/nanogenmo/BookGenerator.html'>this link</a> to make a book!";
		}
	?></p>
</BODY>
</HTML>