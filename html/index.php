<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>bonaventure</title>
    </head>
    <body>
	<h1>网站</h1>
	<h2>开端</h2>
	<p>正文</p>
	<a href="http://www.baidu.com">百度</a>
	<img src="/images/logo.png" width="258" height="39" />
        <?php
            echo"connected! <br>";
        ?>
	<form action="upload_file.php" method="post" enctype="multipart/form-data">
    	<label for="file">文件名：</label>
    	<input type="file" name="file" id="file"><br>
    	<input type="submit" name="submit" value="提交">
	</form>
    </body>
</html>
