<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<title><?php wp_title() ;?></title>
<?php wp_head(); ?>

 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://fonts.googleapis.com/css?family=Alef:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<?php bloginfo("template_directory");?>/js/main-js.js"></script>
<link rel="stylesheet" href="<?php bloginfo('template_directory') ?>/style.css" type="text/css" media="all">
<link rel="stylesheet" href="<?php bloginfo('template_directory') ?>/media.css" type="text/css" media="all">
<script>
           
        </script>
</head>

<body <?php body_class() ?>>	

<div id="wrapper">
<div class="header clearfix">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
    <div id="navbar" class="nav">
        <ul>
            <li><a href="#">דברו <br> איתנו</a></li>
            <li><a href="#">סדנאות <br>והרצאות</a></li>
            <li><a href="#">פרסונה <br> בתקשור</a></li>
            <li><a href="#">פרסונה <br>לעסקים </a></li>
            <li><a href="#">פרסונה <br>לאנשים</a></li>
            <li><a href="#">אודות <br> המכון</a></li>
        </ul>
    </div>
	<div class="logo">
		<a href="#"><img src="<?php bloginfo("template_directory") ?>/images/logo.png"></a>
	</div>
</div>
