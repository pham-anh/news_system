<?php
//require_once 'header.php';
session_start();
session_unset();
header('location: login.php');
//require_once 'footer.php';