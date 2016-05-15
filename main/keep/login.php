<!DOCTYPE html>
<html>
    <head>
        <?php require_once '../includes/head.php'; ?>
    </head>
    <body>
        <?php require_once '../includes/banner.php'; ?>
<?php
session_start();

//Nếu người dùng nhấn nút Login thì xử lý
if (isset($_POST['login'])) {
    //Nếu người dùng nhập liệu đầy đủ thì gán biến, ngược lại thì báo lỗi
    if (isset($_POST['username']) && strlen($_POST['username']) > 0 &&
            isset($_POST['password']) && strlen($_POST['password']) > 0) {
        $username = $_POST['username'];
        $password = $_POST['password'];
    } else {
        $err['login'] = 'Please give a username and password.';
    }

    /* Nếu người dùng có nhập liệu thì kiểm tra xem dữ liệu nhập vào có thuộc csdl không
     * Nếu sai: báo lỗi (lỗi được trả về từ hàm riêng), Ngược lại: đăng nhập thành công
     */
    if (isset($username) && isset($password)) {
        require('db_connect_info.php');
        //$login_info_query = "select * from user where username = '$username' and password = '$password'";
        $login_info_query = "select * from user where username = '$username'"; //TODO: username unique!!!
        $query_exec = run_sql($login_info_query); //Hàm này sẽ xuất ra báo lỗi hoặc trả về resource / true (bool) tùy câu truy vấn
        //Nếu số dòng = 0 --> Báo lỗi đăng nhập
        if ($query_exec->num_rows === 0) {
            $err['login'] = 'Username or password is not correct.';
        } else {
            //var_dump($_SESSION);
            $login_info = mysqli_fetch_assoc($query_exec);
            //Check if the password is correct
            //var_dump($login_info);
            if (!password_verify($password, $login_info['password'])) {
                $err['login'] = 'Username or password is not correct.';
            } else {
                /* Ngược lại thì đăng nhập thành công --> Cấp phiên làm việc và chuyển đến trang kế */
                //Cấp phiên làm việc 
                $_SESSION['user_id'] = $login_info['user_id'];
                $_SESSION['username'] = $login_info['username'];
                $_SESSION['level'] = $login_info['level'];
                
                //Chuyển trang
                header('location: index.php');
                exit;
            }
        }
    }
}

?>
<div class='container'>
<?php 
//Ngược lại thì không làm gì cả, chỉ hiển thị form
//Tuy nhiên cần hiển thị tin nhắn nếu có
if (isset($err['login'])) {
    echo "<h4 class='text-danger'>" . $err['login'] . '</h4>';
}
?>
<form action = '' method = 'post'>
    <table class='table-responsive table-condensed'>
        <tr>
            <th>Username</th>
            <td>
                <input type = 'text' name = 'username' size = '25' />
            </td>
        </tr>
        <tr>
            <th>Password</th>
            <td>
                <input type = 'password' name = 'password' size = '25' />
            </td>
        </tr>
        <tr>
            <td colspan = '2'>
                <input  type = 'submit' name = 'login' value = 'Login' class='btn btn-primary'/>
            </td>
        </tr>
    </table>
</form>
</div>

<?php
require_once '../includes/footer.php';
?>
</body>
</html>
