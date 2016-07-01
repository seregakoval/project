<?php

// Template Name: About - Our Clients (בין לקוחותינו)

get_header(); ?>
<div class="head-personal rl-head">
  <div class="head-wrap clearfix">
    <img src="<?php bloginfo( "template_directory" ) ?>/images/ttl1.jpg" class="img-our-head">
    <div class="right-text-img">
      <div class="block-l">
        <p class="text-about">אודות</p>
      </div>
    </div>
  </div>
</div>
<div class="block-bottons rl clearfix">
<div class="links  clearfix">
	<ul>
    <li><a href="<?php echo esc_url( home_url( '/' ) ); ?>"> עמוד הבית </a>>> </li>
    <li><span class="active"> <?php the_title(); ?></span></li>
  </ul>
</div>
<div style="clear:both;"></div>
	<!-- <ul class="button-b links_contact">
		<li><a href="#" class="active_contact"><span>בין לקוחותינו </span></a></li>
		<li><a href="#"> הפרסונות שלנו</a></li>
		<li><a href="#"	 class="size pasive">אודות המכון</a></li>
	</ul> -->
<div id="about-tab-wrap" class="grayed">
   <div id="about-tab-row" class="row rl">
      <ul class="button-b links_contact">
        <li><a href="<?php echo the_permalink(8); ?>" class="size pasive">אודות המכון</a></li>
        <li><a href="<?php echo the_permalink(10); ?>"> הפרסונות שלנו</a></li>
        <li><a href="<?php echo the_permalink(12); ?>" class="active_contact"><span>בין לקוחותינו </span></a></li>
      </ul>
  </div>
</div>
</div>
	<div class="main-text-buttons clearfix">
		<div class="wrap-main-text-bottons">
      <div class="text-block">
			   <?php the_field('main_text'); ?>
      </div>
		</div>
	</div>
	<div class="reclam-sub-page  clearfix">
    <div class="wrap-reclam">
      <div id="myCarousel3" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
      <div class="item active">
       <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam1.png">
        </div>
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam2.png">
        </div>
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam3.png">
        </div>
       <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam4.png">
       </div>
         <div class="box">
           <img src="<?php bloginfo("template_directory") ?>/images/reclam5.png">
         </div>
          <div class="box">
            <img src="<?php bloginfo("template_directory") ?>/images/reclam6.png">
          </div>
    </div>
    <div class="item">
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam1.png">
        </div>
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam2.png">
        </div>
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam3.png">
        </div>
       <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam4.png">
       </div>
         <div class="box">
           <img src="<?php bloginfo("template_directory") ?>/images/reclam5.png">
         </div>
          <div class="box">
            <img src="<?php bloginfo("template_directory") ?>/images/reclam6.png">
          </div>
      </div>
    </div>
    </div>
</div>

</div>
<div class="block-form">
  <div class="block-koval-input">
    <input type="submit" id="submit-button-mh" class="button sub-kov" value="שליחה >>"></input>
  </div>
  	<div class="form">
    <div class="wrap-form clearfix">
        <div class="left-block">
          <?php echo do_shortcode('[contact-form-7 id="107" title="צור קשר כללי לעמודים"]'); ?>
          <!-- <form action="#" class="form">
            <div style="clear:both;">
               <input type="text">
               <p>שם מלא:</p>
            </div>
            <div style="clear:both;">
               <input type="text">
               <p>טלפון:</p>
            </div>
             <div style="clear:both;">
               <input type="text">
               <p>מייל:</p>
            </div>
            <div style="clear:both;" class="textarea">
               <textarea name="" id="" cols="30" rows="10"></textarea>
               <p>איך <br>נוכל <br>לעזור?</p>
            </div>
          </form> -->
        </div>
    </div>
    
  </div>
  <div class="right-block">
        <div class="b-text">
          <p><?php the_field('about_contact_title'); ?></p>
        </div>
    </div>
  </div>


<?php get_footer(); ?>