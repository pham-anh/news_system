<!DOCTYPE html>
<html>
<head>
    <?php require_once '../includes/head.php'; ?>
</head>
<body>
    <?php require_once '../includes/banner.php'; ?>
        <?php

session_start();
//Nếu người dùng đã đăng nhập và là admin thì mới được vào
if (isset($_SESSION['level'])) {
    require_once '../includes/menu.php';
    //Kiểm tra người dùng có là admin không, nếu có thì cho add user
    if (($_SESSION['level']) === '2') {
        //Nếu người dùng nhấn nút Submit thì xử lý:
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
                    $_SESSION['user_add_mess'] = "<h4 class='text-success'>New user ".'"'.$_SESSION['added_user'].'" added.</h4>';
                    header('location: user_list.php');
                    exit;
                }
            }
        }
        ?>
    <div class="container">
        <!--Ngược lại thì không làm gì cả, chỉ hiển thị form và các chức năng khác trên màn hình-->

        <!-- Link đến danh sách người dùng-->
        <a href = 'user_list.php' class='btn btn-primary'>Browse for all users</a>

        <!-- Form thêm người dùng-->
        <form action = '<?php echo $_SERVER['PHP_SELF'] ?>' method = 'post'>
            <table class='table-responsive table-condensed'>
                <tr>
                    <th>Username</th>
                    <td>
                        <input type = 'text' name = 'username' size = '25'
                               value = '<?php echo (isset($_POST['username'])) ? $_POST['username'] : ''; ?>' />
                               <?php echo (isset($err['username'])) ? '<br />'.$err['username'] : ''; ?>
                    </td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <input type = 'password' name = 'password' size = '25'
                               value = '<?php echo (isset($_POST['password'])) ? $_POST['password'] : ''; ?>' />
                               <?php echo (isset($err['password'])) ? $err['password'] : ''; ?>
                    </td>
                </tr>
                <tr>
                    <th>Password again</th>
                    <td>
                        <input type = 'password' name = 'confirm_password' size = '25'
                               value = '<?php echo (isset($_POST['confirm_password'])) ? $_POST['confirm_password'] : ''; ?>' />
                               <?php echo (isset($err['confirm_password'])) ? $err['confirm_password'] : ''; ?>
                    </td>
                </tr>
                <tr>
                    <th>Role</th>
                    <td>
                        <select name = 'level'>
                            <option value = '1' >Member</option>
                            <option value = '2' >Admin</option>
                        </select>
                        <?php echo (isset($err['level'])) ? $err['level'] : ''; ?>
                    </td>
                </tr>
                <tr>
                    <td colspan = '2'>
                        <input type = 'submit' name = 'add_user' value = 'Submit' />
                    </td>
                </tr>
            </table>
        </form>
        <?php
    } else {
        //Nếu không phải admin thì báo lỗi
        require_once 'member_to_admin_path.php';
    }
} else {
//if not logged in
    require_once 'not_logged_in.php';
}
?>
    </div>
        <?php
require_once '../includes/footer.php';
?>
</body>
</html>