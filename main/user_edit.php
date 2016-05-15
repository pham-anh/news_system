<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <?php require_once '../includes/head.php'; ?>
</head>
<body>
    <?php require_once '../includes/banner.php'; ?>
    <div class='container'>
    <?php

//require_once 'common_function.php';

//Kiểm tra xem người dùng đăng nhập chưa?
if (isset($_SESSION['level'])) {
    require_once '../includes/menu.php';
    //Kiểm tra xem có phải admin không?
    if ($_SESSION['level'] == '2') {//Nếu đúng, hiển thị thông tin hiện có trong csdl vào form
        //Kiểm tra phương thức là GET hay POST (GET: hiển thị form để người dùng chỉnh sửa, POST: cập nhật dữ liệu người dùng nhập vào để chỉnh sửa
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            require('db_connect_info.php');
            //$uid = clean_input($_GET['uid']);
            $get_user_info = 'select *  from user where user_id = "'.$_GET['uid'].'";';
            $user_info = mysqli_fetch_assoc(run_sql($get_user_info)); //Thông tin này dùng hiển thị trên form khi phương thức là GET
            if ($user_info == null) {//nếu user id không tồn tại trong DB
                $_SESSION['user_edit_mess'] = "<h4 class='text-danger'>The user to edit is not available.</h4>";
                header('location: user_list.php');
                exit;
            }
            //var_dump($user_info);
        } else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            //var_dump($_POST);
            //Nếu chỉnh sửa user admin thì không được
            if (isset($_POST['uid']) && $_POST['uid'] == "1") {
                $_SESSION['user_edit_mess'] = "<h4 class='text-danger'>Default user, cannot edit.</h4>";
                header('location: user_list.php');
                exit;
            }

            //Nếu người dùng không nhập liệu thì báo lỗi, ngược lại thì gán biến
            if (isset($_POST['username']) && strlen($_POST['username']) > 0) {
                $username = $_POST['username'];
            } else {
                $err['username'] = "<h4 class='text-danger'>Please give a user.</h4>";
            }

            if (isset($_POST['level']) && strlen($_POST['level']) > 0) {
                $level = $_POST['level'];
            } else {
                $err['level'] = "<h4 class='text-danger'>Please pick a right.</h4>";
            }

            //Khi người dùng nhập liệu đầy đủ thì kiểm 2 password có giống nhau không
            if (isset($username) && isset($level)) {
                if (isset($_POST['password']) && strlen($_POST['password']) > 0) {
                    if (isset($_POST['confirm_password']) && strlen($_POST['confirm_password']) > 0) {
                        if ($_POST['password'] === $_POST['confirm_password']) {
                            $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                            $user_edit_query = "update user set username = '".$username."', level = '".$level."', password = '".$password."' where user_id = '".$_POST['uid']."';";
                        } else {
                            $err['confirm_password'] = "<h4 class='text-danger'>Passwords not match.</h4>";
                        }
                    } else {
                        $err['confirm_password'] = "<h4 class='text-danger'>Please confirm password.</h4>";
                    }
                } elseif (isset($_POST['confirm_password']) AND strlen($_POST['confirm_password']) > 0) {
                    $err['password'] = "<h4 class='text-danger'>Please input password first</h4>";
                } else {
                    $user_edit_query = "update user set username = '".$username."', level = '".$level."' where user_id = '".$_POST['uid']."';";
                }

                if (isset($user_edit_query)) {
                    require('db_connect_info.php');
                    $query_exec = run_sql($user_edit_query);
                    if (!$query_exec) {//Có vẻ như là trường hợp này sẽ không xảy ra
                        $_SESSION['user_edit_mess'] = "<h4 class='text-danger'>The edition is not accepted by the system at this moment. Please try again later.</h4>";
                    } else {
                        //Ngược lại thì thông báo thành công và chuyển về trang danh sách
                        $_SESSION['edited_user'] = $username;
                        $_SESSION['user_edit_mess'] = "<h4 class='text-success'>".'"'.$_SESSION['edited_user'].'" user edited.</h4>';
                    }
                    header('location: user_list.php');
                    exit;
                }
            }
        }
        ?>
        <!--Ngược lại thì không làm gì cả, chỉ hiển thị form và các chức năng khác trên màn hình-->

        <!-- Link đến danh sách người dùng-->
        <a href = 'user_list.php' class='btn btn-primary'>Brow for all users</a><br /><br />

        <!-- Form thêm người dùng-->
        <form action = '<?php echo $_SERVER['PHP_SELF'] ?>' method = 'post'>
            <table>
                <tr>
                    <th>Username</th>
                    <td>
                        <input type = 'text' name = 'username' size = '25'
                               value = '<?php
                               echo (isset($_POST['username'])) ? $_POST['username'] : "";
                               echo (isset($user_info['username'])) ? $user_info['username'] : "";
                               ?>'/>
                               <?php echo (isset($err['username'])) ? "<br />".$err['username'] : ""; ?>
                    </td>
                </tr>

                <tr>
                    <th>Password</th>
                    <td>
                        <input type = 'password' name = 'password' size = '25' />
                               <!--value = '<?php echo (isset($_POST['password'])) ? $_POST['password'] : ""; ?>' />-->
                        <span class="text-info small">Blank to keep current password.</span>
                        <?php echo (isset($err['password'])) ? '<br />'.$err['password'] : ""; ?>

                    </td>
                </tr>
                <tr>
                    <th>Confirm password</th>
                    <td>
                        <input type = 'password' name = 'confirm_password' size = '25' />
                               <!-- value = '<?php echo (isset($_POST['confirm_password'])) ? $_POST['confirm_password'] : ""; ?>' />-->
                        <span class="text-info small">Blank to keep current password.</span>
                        <?php echo (isset($err['confirm_password'])) ? '<br />'.$err['confirm_password'] : ""; ?>
                    </td>
                </tr>
                <tr>
                    <th>Role</th>
                    <td>
                        <select name = 'level'>
                            <option value = '1' <?php
                            if ((isset($_POST['level']) && $_POST['level'] == '1') || (isset($user_info['level']) && $user_info['level'] == '1')) {
                                echo 'selected';
                            }
                            ?>>Member</option>
                            <option value = '2' <?php
                            if ((isset($_POST['level']) && $_POST['level'] == '2') || (isset($user_info['level']) && $user_info['level'] == '2')) {
                                echo 'selected';
                            }
                            ?>>Admin</option>
                        </select>
                        <?php echo (isset($err['level'])) ? $err['level'] : "";
                        ?>
                    </td>
                </tr>
                <tr>
                    <td colspan = '2'>
                        <input type ="hidden" name = 'uid' value ="<?php echo $_GET['uid'] ?>" />
                        <input type = 'submit' name = 'add_user' value = 'Submit' />
                    </td>
                </tr>
            </table>
        </form>
        <?php
    } else {//Nếu không phải admin, báo lỗi không có quyền, đẩy về trang chính
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