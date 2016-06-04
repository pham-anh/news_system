<?php
require('db_connect_info.php');
    $get_cate_sql = 'select * from category';
    $query_exec = run_sql($get_cate_sql); //echo an error message then exit, or a resource/ true on success
    if (!$query_exec) {
//error - this is the output for error case of run_sql()
//the code seems not go here
    } else {
//get categories
        while ($category = mysqli_fetch_array($query_exec)) {
            $cate_arr[$category['id']] = $category['name'];
        }
    }