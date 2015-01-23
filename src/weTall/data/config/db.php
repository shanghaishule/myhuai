<?php
$wetallroute = dirname(dirname(dirname(dirname(__FILE__))));
//dump($wetallroute);exit;

$arr = include($wetallroute."/data/conf/db.php");

return $arr;
?>