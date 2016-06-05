<?php

if (isset($_POST['post'])) {//validate:
//subject must be input
    if (isset($_POST['subj']) AND strlen($_POST['subj']) > 0) {
//sanitize value
        $subj = clean_input($_POST['subj']); //Add into POST table
    } else {
        $err['no_subj'] = "<h5 class='text-danger'>Please input subject.</h5>";
    }
//content must be input
    if (isset($_POST['content']) AND strlen($_POST['content']) > 0) {
//sanitize value
        $content = clean_input($_POST['content']); //Add into POST table
        $short_content = substr($content, 0, 300);
    } else {
        $err['no_content'] = "<h5 class='text-danger'>Please input content.</h5>";
    }
//category must be input
    if (!empty($_POST['cate'])) {
        foreach ($_POST['cate'] as $item) {
            $cate[] = clean_input($item);
        }
        //check if foreign data inputted (these value MUST be available in category table
        $categories = implode('|', $cate); //Add into POST table - check
    } else {
        $err['no_cate'] = "<h5 class='text-danger'>Please please select a category.</h5>";
    }

//file is not a MUST
    if ($_FILES['img']['error'] == 0) {
        $file_type = array('image/jpeg', 'image/png', 'image/gif');
        $file = $_FILES['img'];
        if (in_array($file['type'], $file_type)) {
//            if ($file['size'] < 100000) {

                //CONSIDER: move file after all others information PASSED
                if (!move_uploaded_file($file['tmp_name'], 'bootstrap/img/' . substr($file['name'], 0, (strrpos($file['name'], '.'))) .
                                '_' . time() . substr($file['name'], strrpos($file['name'], '.')))) {
                    $err['file_upload'] = "<h5 class='text-danger'>Failed in uploading file.</h5>";
                } else {
                    $file_name = 'bootstrap/img/' . substr($file['name'], 0, (strrpos($file['name'], '.'))) .
                            '_' . time() . substr($file['name'], strrpos($file['name'], '.')); //Add into POST table
                }
//            } else {
//                $err['file_size'] = "<h5 class='text-danger'>Please upload image less than 10MB.</h5>";
//                $file_name = '';
//            }
        } else {
            $err['file_type'] = "<h5 class='text-danger'>Please upload image with specified extension.</h5>";
            $file_name = '';
        }
    } else {
        $file_name = '';
    }


//topic is not a MUST
//sanitize new topic if any, prepare data to save into DB
    if (isset($_POST['new_topic']) AND strlen($_POST['new_topic']) != 0) {
        $new_topic = clean_input($_POST['new_topic']);
        //add this in to TOPIC table
        require ('db_connect_info.php');
        $add_topic_query = "insert into topic(name) values ('$new_topic');";
        $query_result = run_sql($add_topic_query);
        if (!$query_result) {
            $_SESSION['topic_mess'] = "Coudn't add new topic";
        } else {
            $get_id_query = "select id from topic where name = '$new_topic';";
            $query_result = run_sql($get_id_query);
            if ($query_result->num_rows != 0) {
                $added_topic = mysqli_fetch_assoc($query_result);
                $topic_id = $added_topic['id'];
            }
            echo $topic_id;
        }
//CONSIDER: TRANSACTION;
        //die();
        //TODO: create id for new topic
        //TODO: check if new topic duplicates available topic
    }

//sanitize selected topics if any
    if (!empty($_POST['selected_topic'])) {//have selected topics
        foreach ($_POST['selected_topic'] as $topic) {
            $selected_topic[] = clean_input($topic);
            //check if foreign data inputted (these value MUST be available in category table)
        }
    }

//Create string of topics to save into DB
    if (isset($topic_id) AND ! empty($selected_topic)) {
        array_push($selected_topic, $topic_id);
        $post_topics = implode('|', $selected_topic);
    } else if (isset($topic_id)) {
        $post_topics = $topic_id;
    } else if (!empty($selected_topic)) {
        $post_topics = implode('|', $selected_topic);
    } else {
        $post_topics = '';
    }


//sanitize reference if any
    if (isset($_POST['ref']) AND strlen($_POST['ref']) > 0) {
        $ref = clean_input($_POST['ref']);
    } else {
        $ref = '';
    }

//ADD DATA INTO DATABASE
    if (isset($subj) AND isset($categories) AND isset($content)) {
        require_once 'db_connect_info.php';
        /* $post_add_query = "insert into post(subject, category, author, content" . isset($file_name) ? ',img' : '' .
          isset($topics) ? ',topic' : '' . isset($ref) ? ',ref' : '' .
          ") values('$subj', '$categories', " . $_SESSION['user_id'] . ", '$content'" . isset($file_name) ? ", '$file_name'" : '' .
          isset($topics) ? ",'$topics'" : '' . isset($ref) ? ", '$ref'" : '' . ")";
          $query = "insert in to post(subject, category, author, content, img, topic, ref,updated_at) values ('$subj', '$categories', '" . $_SESSION['user_id'] . "', '$content'" . isset($file_name) ? ", '$file_name'" : '' . isset($topics) ? ", '$topics'" : '' . isset($ref) ? ", '$ref'" : '' . ")"; */
        //$updated_at = time();
        $query = "insert into post(subject, category, author, short_content, content, img, topic, ref, updated_at) values ('$subj', '$categories', '" . $_SESSION['user_id'] . "', '$short_content', '$content', '$file_name', '$post_topics', '$ref', 0" . ");";
        /* if(isset($new_topic)){
          $query .= "insert into topic (name) values ('$new_topic');";
          }
          echo $query; */
        $query_exec = run_sql($query);
        echo '<hr>';
        if (!$query_exec) {
            $_SESSION['post_add_mess'] = "<div class='alert alert-danger'>Could not add post.</div>";
            header('location:post_list.php'); //TODO: add a link
            exit();
        } else {
            $_SESSION['post_add_mess'] = "<div class='alert alert-success'>New post added.</div>";
            //echo $_SESSION['post_add_mess'];
            header('location:post_list.php'); //TODO: add a link
            exit();
            /*
             * If no transition or exit, the error below occurs:
             * Fatal error: Cannot redeclare run_sql() (previously declared in
             * D:\APPLICATION\wamp\www\news_system\main\db_connect_info.php:9)
             * in D:\APPLICATION\wamp\www\news_system\main\db_connect_info.php on line 28
             */
        }
    }

}