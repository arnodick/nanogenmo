
<!DOCTYPE html>
<HTML>
<BODY>
	<p>"Writing A Book!"</p>
	<?php
		$output = exec('nanogenmo.cgi');
		if (is_null($output))
		{
			echo "Failed... :(";
		}
		else
		{
			echo $output;
		}
	?>
</BODY>
</HTML>