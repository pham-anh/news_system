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


//Kiểm tra xem người dùng đăng nhập chưa?
if (isset($_SESSION['level'])) {
    require_once '../includes/menu.php';
    //Kiểm tra xem có phải admin không?
    if ($_SESSION['level'] == '2') {//Nếu đúng, xử lý xóa người dùng
        //Kiểm tra xem người dùng có nhấn nút xác nhận chưa
        if (isset($_POST['del'])) {//Nếu đã xác nhận
            //var_dump($_POST);
            if ($_POST['del'] == '0') {//Xác nhận không xóa-->quay lại tranh danh sách
                header('location: user_list.php');
                exit; //make sure the rest code is not executed
            } elseif ($_POST['del'] == '1') {//Xác nhận xóa-->xử lý xóa
                if ($_POST['uid'] == '1') {
                    $_SESSION['user_delete_mess'] = "<h4 class='text-danger'>Default user, cannot delete.</h4>";
                    header('location: user_list.php');
                    exit;
                }
                require 'db_connect_info.php';
                //Lấy tên user cần xóa-->để hiển thị
                $get_username_query = 'select username from user where user_id = "' . $_POST['uid'] . '";';
                //var_dump($get_username_query);
                $get_username = run_sql($get_username_query);
                //echo "get_username";
                //var_dump($get_username);
                if ($get_username->num_rows === 0) {//Nếu user muốn xóa không tồn tại-->quay về trang danh sách, hiển thị tin nhắn
                    $_SESSION['user_delete_mess'] = "<h4 class='text-danger'>The user to delete is not available.</h4>";
                    header('location: user_list.php');
                    exit;
                }
                $data = mysqli_fetch_assoc($get_username);
                $del_username = $data['username'];
                //echo '$del_username:';
                //var_dump($del_username);
                //Xử lý xóa
                $user_delete_query = 'delete from user where user_id = "' . $_POST['uid'] . '";';
                //var_dump($user_delete_query);
                $query_exec = run_sql($user_delete_query);
                if (!$query_exec) {//Có vẻ như là trường hợp này sẽ không xảy ra
                    $_SESSION['user_delete_mess'] = "<h4 class='text-danger'>The deletion is not accepted by the system at this moment. Please try again later.</h4>";
                } else {//Ngược lại thì thông báo và chuyển về trang danh sách
                    $_SESSION['del_username'] = $del_username;
                    $_SESSION['user_delete_mess'] = "<h4 class='text-success'>".'"'. $_SESSION['del_username'] . '" user deleted.</h4>';
                }
                header('location: user_list.php');
                exit;
            }
        } else {
            //Xác nhận xóa
            echo "<h4 class='text-danger'>This user is about to be deleted. Are you sure?</h4>";
            ?>
            <form action ='<?php echo $_SERVER['PHP_SELF'] ?>' method = 'post'>
                <button type="submit" name="del" value="0" class='btn btn-primary'>No, back to user list</button>
                <button type="submit" name="del" value="1" class='btn btn-danger'>Yes, delete the user please</button>
                <input type="hidden" name="uid" value="<?php echo $_GET['uid'] ?>" />
            </form>
            <?php
        }
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