<?php
/**
* 读取图片内容 输出至浏览器
* edit by www.jbxue.com
*/

class imgdata{
public $imgsrc;
public $imgdata;
public $imgform;
public function getdir($source){
$this->imgsrc = $source;
}
public function img2data(){
$this->_imgfrom($this->imgsrc);
return $this->imgdata=fread(fopen($this->imgsrc,'rb'),filesize($this->imgsrc)); 
}
public function data2img(){
header("content-type:$this->imgform");
echo $this->imgdata;
//echo $this->imgform;
//imagecreatefromstring($this->imgdata);
}
public function _imgfrom($imgsrc){
$info=getimagesize($imgsrc);
//var_dump($info);
return $this->imgform = $info['mime'];
}
}
$n = new imgdata;
$n -> getdir("1.jpg");
$n -> img2data();
$n -> data2img();
?>
