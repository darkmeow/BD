<?php
header('Content-Type: text/html; charset=UTF-8'); 
session_start();
unset($_SESSION);
session_destroy();
session_write_close();
header('Location: Menu.php');
die;
?>
