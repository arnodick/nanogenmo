
<!DOCTYPE html>
<HTML>
<BODY>
	<p>"Writing A Book!"</p>
	<?php
		$output = shell_exec('nanogenmo.cgi');
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