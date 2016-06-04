<!DOCTYPE html>
<html>
<head>
    <?php require_once 'includes/head.php'; ?>
</head>
<body>
    <?php require_once 'includes/banner.php'; ?>
        <?php

session_start();
//Nếu người dùng đã đăng nhập và là admin thì mới được vào
if (isset($_SESSION['level'])) {
    require_once 'includes/menu.php';
    //Kiểm tra người dùng có là admin không, nếu có thì cho add user
    if (($_SESSION['level']) === '2') {
        //Nếu người dùng nhấn nút Submit thì xử lý:
        require_once 'user_add_process.php';
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
require_once 'includes/footer.php';
?>
</body>
</html>