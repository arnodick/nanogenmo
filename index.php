<!DOCTYPE html>
<HTML>
<HEAD>
	<title>ONE OF A KIND</title>
	<META name="author" content="Ashley Pringle">
	<META name="description" content="A book generator designed by Ashley Pringle">
	<link href="https://fonts.googleapis.com/css?family=Barlow+Condensed" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="css.css">
</HEAD>

<BODY>
	<p>G E N E R A T I N G</p>
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
					//echo "<pre>$output[$i]</pre>";
					echo "$output[$i]";
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