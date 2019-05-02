<?php
	echo "this is php!"
	$con=mysql_connect("bonaventure.club:3306","root","1");
	//$con=mysql_connect("localhost:3306","root","1");
	if(!$con)
	{
		echo "connect failed! <br>";
		echo "error number: ".mysql_errno()."<br>";
		echo "error info: ".mysql_error()."<br>";
	//	die();//stop program
	}
	echo "connected! <br>";
?>
