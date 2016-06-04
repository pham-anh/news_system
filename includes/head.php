<?php
ini_set('display_errors','On'); 
error_reporting(E_ALL);

var_dump($_SERVER);

if (strpos($_SERVER['SERVER_PROTOCOL'], 'HTTPS') == FALSE) {
    $protocol = 'http://';
} else {
    $protocol = 'https://';
}
$main_dir = $protocol . $_SERVER['SERVER_NAME'];

?>
<title>News system</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<?php echo $main_dir . '/bootstrap/css/bootstrap.min.css' ?>">
<link rel="stylesheet" href="<?php echo $main_dir . '/bootstrap/css/mystyle.css' ?>">
