<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<title><?php wp_title() ;?></title>
<?php wp_head(); ?>

 <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href='https://fonts.googleapis.com/css?family=Alef:400,700' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<?php bloginfo("template_directory");?>/js/main-js.js"></script>
<!--script src="<?php bloginfo("template_directory");?>/js/modernizr.js"></script>
<script src="<?php bloginfo("template_directory");?>/js/detectizr.js"></script-->
<link rel="stylesheet" href="<?php bloginfo('template_directory') ?>/style.css" type="text/css" media="all">
<link rel="stylesheet" href="<?php bloginfo('template_directory') ?>/css/media.css" type="text/css" media="all">
<link rel="stylesheet" href="<?php bloginfo('template_directory') ?>/css/mac.css" type="text/css" media="all">
<script>
           
        </script>
</head>

<body <?php body_class() ?>>	
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/he_IL/sdk.js#xfbml=1&version=v2.6&appId=1400580323496725";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>
  if (navigator.userAgent.indexOf('Mac OS X') != -1) {
  $("body").addClass("mac");
} else {
  $("body").addClass("pc");
}
</script>
<div id="wrapper">
<div class="header clearfix">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
    <div id="navbar" class="nav">
      <?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu' => 'Menu 1' ) ); ?>
        <!-- <ul>
            <li><a href="<?php echo the_permalink(8); ?>">אודות <br> המכון</a></li>
            <li><a href="<?php echo the_permalink(15); ?>">פרסונה <br>לאנשים</a></li>
            <li><a href="#">פרסונה <br>לעסקים </a></li>
            <li><a href="#">פרסונה <br> בתקשור</a></li>
            <li><a href="#">סדנאות <br>והרצאות</a></li>
            <li><a href="<?php echo the_permalink(19); ?>">דברו <br> איתנו</a></li>
        </ul> -->
    </div>
	<div class="logo">
		<a href="<?php echo esc_url( home_url( '/' ) ); ?>"><img src="<?php bloginfo("template_directory") ?>/images/logo.png"></a>
	</div>
</div>


<style>
body {overflow-x:hidden ;}
.box-social img.open {display:  none;}
.box-wrap .box-social {visibility: hidden;opacity: 0;
    -webkit-transition: all 0.2s ease-out;
    transition: all 0.2s ease-out;}
.box-wrap .box-social.active {visibility: visible;opacity:1;}
.box-wrap .box-social.expanded {left:-54px;}
.box-wrap .box-social.expanded img {width:  205px;}

</style>

<div id="social-block" class="social-block">
 <div class="box-wrap">
    <div class="box-social slim active">
        <a target="_blank" href="https://www.facebook.com/Persona.GPN/" class="facebook"> 
            <img src="<?php bloginfo("template_directory") ?>/images/facebook.png"  />
         </a>
    </div>

     <div class="box-social expanded">
        <a target="_blank" href="https://www.facebook.com/Persona.GPN/" class="facebook"> 
            <img src="<?php bloginfo("template_directory") ?>/images/face_open.png" />
         </a>
    </div>
 </div>
    <div class="clear"></div>
   <div class="box-wrap">  
        <div class="box-social slim active">
            <a target="_blank" href="https://www.google.co.il/maps/place/Maskit+St+22,+Herzliya/@32.163672,34.8084522,17z/data=!3m1!4b1!4m5!3m4!1s0x151d488c5eb2cc45:0xbc6b4a2601b54edd!8m2!3d32.1636675!4d34.8106409?hl=en" class="map">
                <img src="<?php bloginfo("template_directory") ?>/images/map.png" />
            </a>
        </div>
          <div class="box-social expanded">
            <a target="_blank" href="https://www.google.co.il/maps/place/Maskit+St+22,+Herzliya/@32.163672,34.8084522,17z/data=!3m1!4b1!4m5!3m4!1s0x151d488c5eb2cc45:0xbc6b4a2601b54edd!8m2!3d32.1636675!4d34.8106409?hl=en" class="map">
                <img src="<?php bloginfo("template_directory") ?>/images/location_open.png" />
            </a>
        </div>   
  </div>   
    <div class="clear"></div>
     <div class="box-wrap">
      <div class="box-social slim active">
             <a href="mailto:persona@persona-e.co.il" target="_blank" class="message">
                 <img src="<?php bloginfo("template_directory") ?>/images/message.png" />
             </a>
      </div>
      <div class="box-social expanded">
             <a href="mailto:persona@persona-e.co.il" target="_blank" class="message">
                  <img src="<?php bloginfo("template_directory") ?>/images/email_open.png" />
             </a>
      </div>   
    </div>   
    <div class="clear"></div>
     <div class="box-wrap">
    <div class="box-social slim active">
        <a href="tel:09-7717050" class="call">
            <img src="<?php bloginfo("template_directory") ?>/images/phone_closed.png" />
        </a>
    </div>
   <div class="box-social expanded" style="left: -56px;">
        <a href="tel:09-7717050" class="call">
            <img src="<?php bloginfo("template_directory") ?>/images/cell2.png" />
        </a>
    </div>
    <div class="clear"></div>
    </div>
    <div class="box-wrap">
           <div class="box-social slim active">
                <a href="https://www.youtube.com/user/personaGPN" target="_blank" class="youtube">
                   <img src="<?php bloginfo("template_directory") ?>/images/youtube_closed.png" />
                </a>
            </div>
         <div class="box-social expanded" style="left: -57px;">
              <a href="https://www.youtube.com/user/personaGPN" target="_blank" class="youtube">
                  <img src="<?php bloginfo("template_directory") ?>/images/yoo.png" />
              </a>
         </div>
    </div>
</div>

<!-- <div id="social-block" class="social-block">
    <div class="box-social">
        <a target="_blank" href="https://www.facebook.com/Persona.GPN/" class="facebook"> 
            <img src="<?php bloginfo("template_directory") ?>/images/facebook.png" data-hover="<?php bloginfo("template_directory") ?>/images/face_open.png" />
         </a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a target="_blank" href="https://www.google.co.il/maps/place/Maskit+St+22,+Herzliya/@32.163672,34.8084522,17z/data=!3m1!4b1!4m5!3m4!1s0x151d488c5eb2cc45:0xbc6b4a2601b54edd!8m2!3d32.1636675!4d34.8106409?hl=en" class="map">
            <img src="<?php bloginfo("template_directory") ?>/images/map.png" data-hover="<?php bloginfo("template_directory") ?>/images/location_open.png" />
        </a>
    </div>
    <div class="clear"></div>
      <div class="box-social">
        <a href="mailto:persona@persona-e.co.il" target="_blank" class="message">
            <img src="<?php bloginfo("template_directory") ?>/images/message.png" data-hover="<?php bloginfo("template_directory") ?>/images/email_open.png" />
        </a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a href="tel:09-7717050" class="call">
            <img src="<?php bloginfo("template_directory") ?>/images/phone_closed.png" data-hover="<?php bloginfo("template_directory") ?>/images/cell2.png" />
        </a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a href="https://www.youtube.com/user/personaGPN" target="_blank" class="youtube">
            <img src="<?php bloginfo("template_directory") ?>/images/youtube_closed.png" data-hover="<?php bloginfo("template_directory") ?>/images/yoo.png" />
          </a>
    </div>
</div> -->

<?php /*
<!-- <div class="social-block">
    <div class="box-social">
        <a target="_blank" href="https://www.facebook.com/Persona.GPN/" class="facebook"> <img src="<?php bloginfo("template_directory") ?>/images/facebook.png" /><img src="<?php bloginfo("template_directory") ?>/images/face_open.png" class="active" /></a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a target="_blank" href="https://www.google.co.il/maps/place/Maskit+St+22,+Herzliya/@32.163672,34.8084522,17z/data=!3m1!4b1!4m5!3m4!1s0x151d488c5eb2cc45:0xbc6b4a2601b54edd!8m2!3d32.1636675!4d34.8106409?hl=en" class="map"><img src="<?php bloginfo("template_directory") ?>/images/map.png" /><img src="<?php bloginfo("template_directory") ?>/images/location_open.png" class="active" /></a>
    </div>
    <div class="clear"></div>
      <div class="box-social">
        <a href="mailto:persona@persona-e.co.il" target="_blank" class="message"><img src="<?php bloginfo("template_directory") ?>/images/message.png"  /><img src="<?php bloginfo("template_directory") ?>/images/email_open.png" class="active" /></a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a href="tel:09-7717050" class="call"><img src="<?php bloginfo("template_directory") ?>/images/phone_closed.png" /> <img src="<?php bloginfo("template_directory") ?>/images/cell2.png" class="active" /></a>
    </div>
    <div class="clear"></div>
    <div class="box-social">
        <a href="https://www.youtube.com/user/personaGPN" target="_blank" class="youtube"><img src="<?php bloginfo("template_directory") ?>/images/youtube_closed.png" /><img src="<?php bloginfo("template_directory") ?>/images/yoo.png" class="active" /></a>
    </div>
</div> -->
*/ ?>
