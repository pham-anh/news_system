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
/* if (isset($_SESSION['username'])) {
  //if logged in
  echo "<h4 class='text-info'>Welcome home, " . $_SESSION['username'] . '!</h4>';
  ?>
  <h3>Home</h3>
  <table class="table-responsive">
  <?php

  //Nếu là admin mới được quản lý user
  if ($_SESSION['level'] == '2') {
  ?>
  <tr>
  <th><a href = 'user_list.php'><span class="glyphicon glyphicon-user" aria-hidden="true"></span> User manager</a></th>
  </tr>
  <?php

  }
  ?>

  <tr>
  <th><a href = 'post_list.php' class="btn-menu"><span class="glyphicon glyphicon-tasks"></span> News manager</a></th>
  </tr>
  <tr>
  <th><a href = 'category_list.php'><span class="glyphicon glyphicon-tags"></span> Category manager</a></th>
  </tr>
  <tr>
  <th><a href = 'logout.php'><span class="glyphicon glyphicon-log-out"></span> Logout</a></th>
  </tr>
  </table>
  <?php

  } else {
  //if not logged in
  require_once 'not_logged_in.php';
  } */

if (isset($_SESSION['level'])) {
    echo "<h4 class='text-info'>Welcome home, " . $_SESSION['username'] . '!</h4>';
    require_once 'includes/menu.php';
//some contents
    echo 'hello';
    
    
    
    
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