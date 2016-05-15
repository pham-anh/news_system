<?php

if (isset($_POST['add_user'])) {
    //Nếu người dùng không nhập liệu thì báo lỗi, ngược lại thì gán biến
    if (isset($_POST['username']) && strlen($_POST['username']) > 0) {
        $username = $_POST['username'];
    } else {
        $err['username'] = "<p class='text-danger'>Please give a username.</p>";
    }

    if (isset($_POST['password']) && strlen($_POST['password']) > 0) {
        if (isset($_POST['confirm_password']) && strlen($_POST['confirm_password']) > 0) {
            if ($_POST['password'] == $_POST['confirm_password']) {
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            } else {
                $err['confirm_password'] = "<p class='text-danger'>Passwords not match.</p>";
            }
        } else {
            $err['confirm_password'] = "<p class='text-danger'>Please confirm password.</p>";
        }
    } else {
        $err['password'] = "<p class='text-danger'>Please input password.</p>";
    }

    if (isset($_POST['level']) && strlen($_POST['level']) > 0) {
        $level = $_POST['level'];
    } else {
        $err['level'] = "<p class='text-danger'>Please pick a right.</p>";
    }
    //Khi người dùng nhập liệu đầy đủ thì inset vao DB
    if (isset($username) && isset($password) && isset($level)) {
        require('db_connect_info.php');
        $user_add_query = "insert into user(username, level, password) values('$username', '$level', '$password')";
        $query_exec = run_sql($user_add_query);
        if (!$query_exec) {
            $_SESSION['user_add_mess'] = "<p class='text-danger'>The new user is not accepted by the system at this moment. Please try again later.</p>";
            header('location: user_list.php');
            exit;
        } else {
            //Ngược lại thì báo thành công và chuyển về trang danh sách
            $_SESSION['added_user'] = $username;
            $_SESSION['user_add_mess'] = "<h4 class='text-success'>New user " . '"' . $_SESSION['added_user'] . '" added.</h4>';
            header('location: user_list.php');
            exit;
        }
    }
}