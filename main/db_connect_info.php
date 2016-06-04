<?php

define('HOST', 'us-cdbr-iron-east-04.cleardb.net');
define('U', 'b5ff4662599e63');
define('P', 'b9806d06');
define('DB', 'heroku_38ebe7dc01ca634');

//Hàm kết nối csdl và chạy câu sql
function run_sql($queryString) {
    //Kết nối csdl
    $db_connect = mysqli_connect(HOST, U, P, DB);
    //Kiểm tra kết nối  -- Trả về false (bool)  nếu kết nối thất bại
    if ($db_connect === false) { //Nếu không kết nối được trả về báo lỗi
        echo "<h3 class='text-danger'>Connection failed." .mysqli_connect_error(). "</h3>";;
        exit;
    } else {
        //Nếu kết nối thành công -- Chạy câu truy vấn: trả về false nếu chạy bị lỗi, ngược lại: resource hoặc true (bool) tùy câu truy vấn
        $query_exec = mysqli_query($db_connect, $queryString);
        //Nếu bị lỗi --> trả về báo lỗi
        if ($query_exec === false) {
            echo "<h3 class='text-danger'>Query failed." .mysqli_error($db_connect). "</h3>";
            exit;
        } else { //Ngược lại: trả về kết quả chạy câu sql thành công
            return $query_exec;
        }
    }
    mysqli_close($db_connect);
}