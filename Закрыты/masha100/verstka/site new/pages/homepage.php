<?php
// Template Name: Homepage (עמוד הבית)
get_header(); ?>

<div class="slider clearfix">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->
    <!--<ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>-->

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
       <img src="<?php bloginfo("template_directory") ?>/images/slide2.png" class="slide-g">
       <img src="<?php bloginfo("template_directory") ?>/images/slide1024.png" class="slide-g-mobile">
        <img src="<?php bloginfo("template_directory") ?>/images/slide320.png" class="slide-g-mobile320">
      </div>
      <!--<div class="item">
         <img src="<?php bloginfo("template_directory") ?>/images/slide.png" class="slide-g">
       <img src="<?php bloginfo("template_directory") ?>/images/slide1024.png" class="slide-g-mobile">
        <img src="<?php bloginfo("template_directory") ?>/images/slide320.png" class="slide-g-mobile320">
      </div> -->
    </div>
    <!-- Left and right controls -->
    <!--<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>-->
  </div>
</div>
<div class="center-block">
  <div class="boxes clearfix">
    <a href="#">
      <div class="box box3 rl-box rl-box3">
        <div class="img">
          <img src="<?php bloginfo("template_directory") ?>/images/icon4.png">
        </div>
        <p class="title">אבחון ומיון עובדים</p>
        <div class="hidablock text-first-block"><?php the_field('fr_first_text'); ?></div>
      </div>
    </a>
    <a href="#">
      <div class="box box1 rl-box rl-box2">
        <div class="img">
          <img src="<?php bloginfo("template_directory") ?>/images/icon3.png">
        </div>
        <p class="title">הכוונה <br> תעסוקתית <br>ולימודית </p>
        <div class="hidablock text-first-block"><?php the_field('fr_second_text'); ?></div>
      </div>
    </a>
    <a href="#">
      <div class="box box3 rl-box rl-box3">
        <div class="img">
          <img src="<?php bloginfo("template_directory") ?>/images/icon2.png">
        </div>
        <p class="title">ליווי תהליכים <br> אישיים</p>
        <div class="hidablock text-first-block"><?php the_field('fr_third_text'); ?></div>
      </div>
    </a>
    <a href="#">
      <div class="box box1 rl-box rl-box4">
        <div class="img">
          <img src="<?php bloginfo("template_directory") ?>/images/icon1.png">
        </div>
        <p class="title">סדנאות <br> קורסים <br>והרצאות</p>
        <div class="hidablock text-first-block"><?php the_field('fr_fourth_text'); ?></div>
      </div>
    </a>
  </div>
</div>
<div class="block-text clearfix">
  <div class="inner-block">
    <h1><?php the_field('upper_text_block_title'); ?></h1>
    <div class="main-text"><?php the_field('upper_text_block'); ?></div>
  </div>
  <p class="rigth-text"><?php the_field('sessions_block_title'); ?></p>
</div>
<div class="slider-two clearfix">

 <div class="diag-button-wrap left-sided">
     <div class="row rl diag-button-row">
        <a href="<?php echo get_post_type_archive_link('persona_lectures'); ?>" class="button-slider diag-button"><span>להרצאות וסדנאות נוספות >></span></a>
     </div>
 </div>

  <div id="myCarousel_2" class="carousel slide" data-ride="carousel">


    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <?php
        // The Query
        $args = array(  'post_type' => 'persona_lectures',  );
        $sessions = new WP_Query( $args );
        // The Loop
        if ( $sessions->have_posts() ) {
          $counter=0;
          while ( $sessions->have_posts() ) { $sessions->the_post();
            $counter++;
            $archive_text = get_field('archive_text');
            $archive_text_trim = str_replace("<p>", "", $archive_text);
            $archive_text_trim = str_replace("</p>", "",$archive_text_trim);
            $archive_text_trim = strlen($archive_text_trim) > 115 ? mb_substr($archive_text_trim,0,115)."..." : $archive_text_trim;

            ?>
                <div class="item <?php if($counter==1){?>active<?php } ?>">
                    <div class="img">
                        <div class="img-skew"></div>
                        <div class="img-skew2"></div>
                        <img src="<?php the_field('sessions_homepage_img'); ?>">
                    </div>
                    <div class="slide-content">
                        <h1><?php the_title(); ?></h1>
                        <p><?php echo $archive_text_trim; ?> <span class="gggg"><a href="<?php the_permalink(); ?>">המשך קריאה >></a></span></p>
                        
                        <div class="block-buttom clearfix">
                            <p class="text">המועד הקרוב</p>
                            <p class="date"><?php the_field('session_date'); ?></p>
                      </div>
                     </div>
                  </div>
          <?php }
        }
        /* Restore original Post Data */
        wp_reset_postdata(); ?>
      
      <!-- <div class="item ">

      <div class="img">
      <div class="img-skew"></div>
       <div class="img-skew2"></div>
         <img src="<?php bloginfo("template_directory") ?>/images/333.jpg">
      </div>
       <div class="slide-content">
        <h1>כותרת סדנא עד 2 שורות לא יותר</h1>
        <p>טקסט מתאר סדנא, פסקה קצרה ותמציתית המניעה לפעולה אבל לא יותר מ 3 שורות המניעה לפעולה אבל לא יותר מ 3 שורות...<span class="gggg"><a href="#">המשך קריאה >></a></span></p>
        <div class="block-buttom clearfix">
          <p class="text">המועד הקרוב</p>
          <p class="date">23.5.16</p>
        </div>
       </div>
      </div> -->
    </div>
   
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel_2" role="button" data-slide="prev">
    
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel_2" role="button" data-slide="next">
  
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="title-video clearfix">
 <div class="title-video-wrap">
   <p><?php the_field('video_block_title'); ?></p>
 </div>
</div>
<div class="wrap-video clearfix">

 <div class="diag-button-wrap left-sided">
     <div class="row rl diag-button-row">
        <a href="<?php echo get_post_type_archive_link('persona_lectures'); ?>" class="button-slider diag-button"><span>להרצאות וסדנאות נוספות >></span></a>
     </div>
 </div>


  <div class="video clearfix">
    <div class="right element">
      <iframe width="560" height="320" src="https://www.youtube.com/embed/<?php the_field('video_block_vidid'); ?>" frameborder="0" allowfullscreen></iframe>
    </div>
      <div class="text">
        <?php the_field('video_block_text'); ?>
      </div>
</div>
</div>
<div class="reclam clearfix">
<p class="title">אנו עובדים עם מיטב החברות המובילות בשוק:</p>
    <div class="wrap-reclam">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
      <div class="item active">
       <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam1.png">
        </div>
        <div class="box">
          <img src="<?php bloginfo("template_directory") ?>/images/reclam2.png">
        </div>
        <div class="box">
          <img style="margin-left: 28px;" src="<?php bloginfo("template_directory") ?>/images/reclam3.png">
        </div>
       <div class="box">
          <img style="margin-left: 15px;"  src="<?php bloginfo("template_directory") ?>/images/reclam4.png">
       </div>
         <div class="box">
           <img  src="<?php bloginfo("template_directory") ?>/images/reclam55.png">
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
          <img  style="margin-left: 28px;"  src="<?php bloginfo("template_directory") ?>/images/reclam3.png">
        </div>
        <div class="box">
          <img style="margin-left: 15px;" src="<?php bloginfo("template_directory") ?>/images/reclam4.png">
       </div>
         <div class="box">
           <img  src="<?php bloginfo("template_directory") ?>/images/reclam55.png">
         </div>
          <div class="box">
            <img src="<?php bloginfo("template_directory") ?>/images/reclam6.png">
          </div>
      </div>
    </div>
    </div>
</div>

</div>
<div class="people clearfix">
  <div class="wrap clearfix">
    <div class="wrap970">
      <div class="boxes clearfix">
        <div class="box">
        <span class="block-plus">
          <img src="<?php bloginfo("template_directory") ?>/images/plus.png" class="plus" alt="">
          <img src="<?php bloginfo("template_directory") ?>/images/minus.png" class="minus" alt="">
        </span>
          <div class="img">
            <img src="<?php bloginfo("template_directory") ?>/images/img1.png" alt="">
          </div>
          <div class="hide-block">
            <div class="title_persona"><?php the_field('persona_name_one'); ?></div>
          <?php the_field('persona_one_text'); ?>
          </div>
        </div>
        <div class="box2">
        <span class="block-plus">
          <img src="<?php bloginfo("template_directory") ?>/images/plus.png" class="plus" alt="">
          <img src="<?php bloginfo("template_directory") ?>/images/minus.png" class="minus" alt="">
        </span>
        <div class="hide-block">
          <div class="title_persona"><?php the_field('persona_name_two'); ?></div>
          <?php the_field('persona_two_text'); ?>
          </div>
          <div class="img2">
            <img src="<?php bloginfo("template_directory") ?>/images/img2.png" alt="">
          </div>
        </div>
        <div class="box3">
        <span class="block-plus">
          <img src="<?php bloginfo("template_directory") ?>/images/plus.png" class="plus" alt="">
          <img src="<?php bloginfo("template_directory") ?>/images/minus.png" class="minus" alt="">
        </span>
        <div class="hide-block">
          <div class="title_persona"><?php the_field('persona_name_three'); ?></div>
          <?php the_field('persona_one_text'); ?>
          </div>
          <div class="img3">
            <img src="<?php bloginfo("template_directory") ?>/images/img3.png" alt="">
          </div>
        </div>
    </div>
    </div>
    
   
  </div>

  <div class="rl-block-wrap right-sided teal">
      <div class="row rl rl-block-wrap-row">
          <div class="rl-block">
              <div class="b-text">
                <p><?php the_field('personas_block_title'); ?></p>
              </div>
          </div>
      </div>
  </div>


    <div class="diag-button-wrap teal left-sided">
        <div class="row rl diag-button-row">
            <a href="<?php echo get_permalink(10) ?>" class="button-slider diag-button"><span>לכל הפרסונות שלנו >></span></a>
        </div>
    </div>

  </div>
  <div class="block-form homepage-form">
  <!-- <button type="submit" class="button2" value=""><p>שליחה >></p></button> -->

   <div class="diag-button-wrap left-sided">
     <div class="row rl diag-button-row">
        <button type="submit" id="submit-button-mh" class="button2 diag-button" value=""><span>שליחה >></span></button>
     </div>
  </div>

    <div class="form">
    <div class="wrap-form clearfix">
        <div class="left-block">
          <?php echo do_shortcode('[contact-form-7 id="107" title="צור קשר כללי לעמודים"]'); ?>
        </div>
    </div>
  </div>
<!--     <div class="right-block-h">
        <div class="b-text">
          <p>נשמח לענות על כל שאלה</p>
        </div>
    </div> -->

      <div class="rl-block-wrap right-sided" id="contact-block-wrap">
          <div class="row rl rl-block-wrap-row">
              <div class="rl-block">
                  <div class="btext">
                    <p><?php the_field('contact_us_title'); ?></p>
                  </div>
              </div>
          </div>
      </div>
  </div>

  </div>
  
<?php get_footer(); ?>