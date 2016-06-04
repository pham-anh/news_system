<!DOCTYPE html>
<html>
<head>
    <?php require_once 'includes/head.php'; ?>
</head>
<body>
    <?php require_once 'includes/banner.php'; ?>
    <div class='container'>
<?php

session_start();
//Nếu người dùng đã đăng nhập và là admin thì mới được vào
if (isset($_SESSION['level'])) {
    require_once 'includes/menu.php';
    //Kiểm tra xem người dùng có phải admin không, nếu có thì hiện danh sách user
    if (($_SESSION['level']) === '2') {

        /*if (isset($_SESSION['err_db'])) {
            echo $_SESSION['err_db'];
            $_SESSION['err_db'] = null; //Gán bằng null để không echo khi back lại trang danh sách người dùng
        }*/

        //Hiển thị tin nhắn ở user_add và user_edit
        if (isset($_SESSION['user_add_mess'])) {
            echo $_SESSION['user_add_mess'];
            $_SESSION['user_add_mess'] = null; //Gán bằng null để không echo khi back lại trang danh sách người dùng
        }

        if (isset($_SESSION['user_edit_mess'])) {
            echo $_SESSION['user_edit_mess'];
            $_SESSION['user_edit_mess'] = null; //Gán bằng null để không echo khi back lại trang danh sách người dùng
        }

        //Hiển thị tin nhắn ở user_delete
        if(isset($_SESSION['user_delete_mess'])){
            echo $_SESSION['user_delete_mess'];
            $_SESSION['user_delete_mess'] = null;//Gán bằng null để không echo khi back lại trang danh sách người dùng
        }

        ?>
        <br />
		<div class='float-left'>
		<h3>Menu</h3>
        <a href = 'user_add.php' class='btn btn-menu'><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New user</a><br />
        <a href = 'index.php' class='btn btn-menu'><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a><br />
        <a href = 'logout.php' class='btn btn-menu'><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout</a>
		</div>

        <?php
        //Lấy danh sách user
        //Kết nối csdl
        require 'db_connect_info.php';
        $select_all_user = 'select * from user order by level DESC, username';
        $get_user_list = run_sql($select_all_user);
        ?>
		<div class='float-left'>
		<h3>User List</h3>

        <table class='table table-hover'>
            <tr>
                <th class='centered'>Username</th>
                <th class='centered'>Role</th>
                <th  class='centered' colspan='2'>Action</th>
            </tr>
            <?php while ($data = mysqli_fetch_assoc($get_user_list)) { ?>
                <tr>
                    <td><?php echo $data['username'] ?></td>
                    <td>
                        <?php echo ($data['level'] == 2) ? 'Admin' : 'Member'; ?>
                    </td>
                    <?php
                    //var_dump($data);
                    if ($data['user_id'] != '1') {
                        ?>
                        <td class='centered'><a href = 'user_edit.php?uid=<?php echo $data['user_id'] ?>' class='btn btn-primary btn-sized'>
						Edit <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td>
                        <td class='centered'><a href = 'user_delete.php?uid=<?php echo $data['user_id'] ?>' class='btn btn-danger btn-sized'>
						Delete <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>

                    <?php } else {
                        ?>
                        <td colspan = '2'>Default user, no actions available.</td>
                    </tr>
                    <?php
                }
            }
            ?>
        </table>
		</div>
		<div class='clear-float'></div>
        <?php
    } else {
        //Nếu không phải admin thì báo lỗi
        require_once 'member_to_admin_path.php';
    }
} else {
//Nếu chưa đăng nhập thì phải đăng nhập
    require_once 'not_logged_in.php';
}
?>
    </div>
<?php
require_once 'includes/footer.php';
?>
</body>
</html>