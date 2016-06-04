<!DOCTYPE html>
<html>
<head>
    <?php require_once 'includes/head.php'; ?>
</head>
<body>
    <?php require_once 'includes/banner.php'; ?>
    <?php require_once 'login_process.php'; ?> 

    <div class='container center-block'>
        <?php
//Ngược lại thì không làm gì cả, chỉ hiển thị form
//Tuy nhiên cần hiển thị tin nhắn nếu có
        if (isset($err['login'])) {
            echo "<h4 class='alert alert-danger'>" . $err['login'] . '</h4>';
        }
        ?>
        <form action = '' method = 'post' class='centered'>
            <table class='table-responsive table-condensed' align='center'>
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
    require_once 'includes/footer.php';
    ?>
</body>
</html>
