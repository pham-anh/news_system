<?php session_start(); ?>
<!DOCTYPE html>
<html>
    <head>
        <?php require_once 'includes/head.php'; ?>
    </head>
    <body>
        <?php require_once 'includes/banner.php'; ?>
        <div class='container center-block'>
            <?php
            if (isset($_SESSION['level'])) {
                //die('hello');
                require_once 'includes/menu.php';
                ?>
                <?php
                if (isset($_SESSION['post_add_mess'])) {
                    echo $_SESSION['post_add_mess'];
                    $_SESSION['post_add_mess'] = NULL;
                }
                ?>
                <br>
                <button><a href='post_add.php'>Create a new post</a></button>
                <?php
                // put your code here
                //Display all posts available in DB, only logged in people can see this
                require_once 'db_connect_info.php';
                $sql = "SELECT *, unix_timestamp(post.updated_at) as updated_timestamp, unix_timestamp(post.created_at) as created_timestamp FROM post ORDER BY updated_at DESC";
                $posts = run_sql($sql);
                //var_dump($posts);

                if ($posts->num_rows > 0) {
                    if (!isset($_GET['post_id'])) {
                        foreach ($posts as $post) {
                            //var_dump($post);
                            if (is_null($post['updated_timestamp'])) {
                                $time_ago = time() - $post['created_timestamp'];
                                $detailed_time = $post['created_timestamp'];
                            } else {
                                $time_ago = time() - $post['updated_timestamp'];
                                $detailed_time = $post['updated_timestamp'];
                            }
                            if ($time_ago < 60 * 60) {
                                $time_display = 'About ' . floor($time_ago / 60) . ' minutes ago';
                            } else if ($time_ago < 60 * 60 * 24) {
                                $time_display = 'About ' . floor($time_ago / 3600) . ' hours ago';
                            } else {
                                if (is_null($post['updated_timestamp'])) {
                                    $time_display = date('H:i Y-m-d', time($post['created_timestamp']));
                                } else {
                                    $time_display = date('H:i Y-m-d', time($post['updated_timestamp']));
                                }
                            }
                            ?>
                            <div>

                                <h2><?php echo $post['subject'] ?></h2>
                                <p title="<?php echo date('D j M Y H:i', $detailed_time) ?>"><span class="glyphicon glyphicon-time" aria-hidden="true"></span><span class="label label-success"> <?php echo $time_display ?></span></p>

                                <?php if ($post['img'] != '') {
                                    ?>
                                    <div class="float-left">
                                        <a href="post_list.php?post_id=<?php echo $post['id'] ?>">
                                            <image src="<?php echo $post['img'] ?>" alt="image" class="img-rounded" width="60" length="50"/>
                                        </a>
                                    </div>
                                <?php } ?>
                                <div><p class="text-justify"><?php echo $post['short_content'] ?>...<label><a href="post_list.php?post_id=<?php echo $post['id'] ?>">View details</a></label></p></div>
                                <div class="clear-float"></div>
                            </div>

                            <hr>
                            <?php
                        }
                    } else {
                        //View detail
                        $post_id = $_GET['post_id'];
                        foreach ($posts as $post) {
                            if ($post['id'] != $post_id) {
                                continue;
                            } else {
                                ?>
                                <!--<div class="">-->
                                <h2><?php echo $post['subject'] ?></h2>
                                <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span> <?php echo date('D j M Y H:i', $detailed_time) ?> &nbsp;&nbsp;&nbsp;&nbsp;<button class="small"><a href="post_edit.php?post_id=<?php echo $post_id ?>">Edit post</a></button></p>
                                <?php if ($post['img'] != '') {
                                    ?>
                                    <center><image src="<?php echo $post['img'] ?>" alt="image" class="img-rounded img-responsive" width="25%" length="25%" /></center><br>
                                <?php }
                                ?>
                                <p class="text-justify"><?php echo $post['content'] ?></p>
                                <hr>
                            </div>
                            <?php
                        }
                    }
                }
            } else {
                ?>
                <h2>No post available.</h2>
                <?php
            }
            /* echo '<pre>';
              print_r($posts);
              echo '</pre>';
              echo '<hr>'; */
        } else {
            require_once 'not_logged_in.php';
        }
        ?>
    </div>
    <?php
    require_once 'includes/footer.php';
    ?>
</body>
</html>