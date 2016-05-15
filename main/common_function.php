<?php

/**
 * /common_fucntion.php
 *
 * @copyright Copyright (C) 2016 X-TRANS inc.
 * @author Pham Quynh Anh
 * @package news_system
 * @since Jan 13, 2016
 * @version $Id$
 * @license X-TRANS Develop License 1.0
 */

function clean_input($data){
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function validate_text($text){
    if(isset($text) AND strlen($text)){
        return true;
    } return false;
}

