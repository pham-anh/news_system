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
require_once 'common_function.php';

if (isset($_SESSION['level'])) {// has logged in
    require_once '../includes/menu.php';
    require_once 'post_add_process.php';

//Display form
//get categories
    require_once 'get_all_category.php';
//Display form
    ?>
        <h2  class="left-margin-50">Create a new post</h2>        
        <form action='' method='post' enctype='multipart/form-data'>
        <div class="center-block">
            <table class="left-margin-50">                
                <tr>
                    <th><label for='subj'>Subject *</label></th>                    
                    <td><input type='text' id='subj'  name='subj' value="<?php echo (isset($_POST['subj'])) ? $_POST['subj'] : '' ?>" size='136'/></td>
                </tr>
                <?php echo (isset($err['no_subj'])) ? '<tr><td colspan="2">'.$err['no_subj'].'</td></tr>' : '' ?>
                <tr>
                    <th>Author</th>
                    <td><span class='back-colored0'><?php echo (isset($_SESSION['username'])) ? $_SESSION['username'] : '' ?></span></td>
                </tr>
            </table>
        </div>
            
        <div class="float-left center-block">
            <fieldset>
                <legend>Category *</legend><?php echo (isset($err['no_cate'])) ? $err['no_cate'] : '' ?>
                <?php
                foreach ($cate_arr as $key => $value) {
                    ?>
                    <input type='checkbox' id='cate<?php echo $key ?>'  name='cate[]' value='<?php echo $key ?>'<?php
                    echo (isset($_POST['cate']) AND in_array($key, $_POST['cate'])) ? 'checked' : '';
                    ?> readonly/>&nbsp;<span class='back-colored<?php echo $key ?>'><label for='cate<?php echo $key ?>'><?php echo $value ?></label></span><br>
                       <?php } ?>
                       
            </fieldset>
            
            <fieldset>
                <legend>Image</legend>
                <input id='img' type='file' name='img'/>
                <p class='text-info'>Extension: .jpg, .png, .gif only</p>
                <?php echo (isset($err['file_type'])) ? $err['file_type'] : '' ?>
                <?php echo (isset($err['file_size'])) ? $err['file_size'] : '' ?>
                <?php echo (isset($err['file_upload'])) ? $err['file_upload'] : '' ?>
            </fieldset>

            <fieldset>
                <legend>Topics</legend>
                <label for='new_topic'>Add a new topic...</label><br><input id ='new_topic' type='text' name='new_topic' value='<?php echo (isset($_POST['new_topic']) ? $_POST['new_topic'] : '') ?>'placeholder='Enter new topic' /><br>
                <label for='selected_topic'>Select from available topics...</label><br>
                <select id='selected_topic' name='selected_topic[]' multiple size='full'>
                    <option value='1'>Web development</option>
                    <option value='2'>Usability</option>
                    <option value='3'>Accessibility</option>
                    <option value='4'>Coding rule</option>
                    <option value='5'>Code review</option>
                </select>
            </fieldset>
            
            <fieldset>
                <legend> Source/ Reference</legend>
                <input type='text' id='ref' name='ref' value='<?php echo (isset($_POST['ref'])) ? $_POST['ref'] : '' ?>' />
            </fieldset>
        </div>            
       
        <div class="left">
            <fieldset class='center-block'>
                <legend>Content *</legend><?php echo (isset($err['no_content'])) ? $err['no_content'] : '' ?>
                <textarea name='content' id='content' cols='100' rows='25'><?php echo (isset($_POST['content'])) ? $_POST['content'] : '' ?></textarea>
                
            </fieldset>
        </div>

        <div class='clear-float'></div>
        
        <div class='centered'>
            <hr>
            <input type='hidden' name='posted_at' value='<?php time() ?>' readonly='true'/>
            <input type='submit' name='preview' value='Preview' readonly='true' />
            <input type='submit' name='post' value='Post'readonly='true' />
        </div>
    </form>

    <?php
} else {
//has not logged in

    require_once 'not_logged_in.php';
}
?>

    </div>

<?php
require_once '../includes/footer.php';
?>
  
</body>
</html>