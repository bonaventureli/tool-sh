<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>登陆成功</title>
    </head>
    <body>
        header('content-type:image/jpeg');
	$filename='d.jpg';
	$handle=fopen($filename,'rb+');
	$res=fread($handle,filesize($filename));
	fclose($handle);
	echo $res;
    </body>
</html>
