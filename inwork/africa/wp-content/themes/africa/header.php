<?php
/* Template Name: front-page*/
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php bloginfo('name'); ?></title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!--<link rel="stylesheet" href="<?php bloginfo("template_url"); ?>/style.css">-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <?php wp_head(); ?>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="row">
            <a href="#"><img src="<?php bloginfo("template_url"); ?>/img/logo.png" alt=""></a>
            <nav class="nav">
                <?php wp_nav_menu("Primary Menu"); ?>
            </nav>
        </div>
    </div>
</div>