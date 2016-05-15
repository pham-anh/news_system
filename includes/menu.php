
<?php
//session_start();
/*if (isset($_SESSION['level'])) {*/
//if logged in
date_default_timezone_set('Asia/Ho_Chi_Minh');
    
    ?>
<div class="centered margin-bottom-50">
    <ul class="menu">        
        
        <li><a href = 'post_list.php' class="btn-menu"><span class="glyphicon glyphicon-tasks"></span> News manager</a></li>
        <li><a href = 'category_list.php'><span class="glyphicon glyphicon-tags"></span> Category manager</a></li>
        <?php
        //Nếu là admin mới được quản lý user
        if ($_SESSION['level'] == '2') {
            ?>
            <li><a href = 'user_list.php'><span class="glyphicon glyphicon-user" aria-hidden="true"></span> User manager</a></li>
            <?php
        }
        ?>
        <li><a href = 'logout.php'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
</div>
    <?php
/*} else {
    //if not logged in
    require_once 'main/not_logged_in.php';
}*/
