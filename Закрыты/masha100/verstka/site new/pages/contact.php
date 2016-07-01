<?php

// Template Name: Contact (צור קשר)

get_header(); ?>
<div class="head-personal rl-head">
  <div class="head-wrap clearfix">
    <img src="<?php bloginfo( "template_directory" ) ?>/images/ttl3.jpg" class="img-our-head">
    <div class="right-text-img">
      <div class="block-l">
        	<p>דברו איתנו</p>
      </div>
    </div>
  </div>
</div>
<div class="block-bottons clearfix">
	<div class="links clearfix">
		<ul>
			<li><a href="<?php echo esc_url( home_url( '/' ) ); ?>"> עמוד הבית </a>>> </li>
    		<li><span class="active"> <?php the_title(); ?></span></li>
		</ul>
	</div>
</div>
<div class="wrap-contaсt contact">
	<div class="left-block">
		<div class="form-contact">
			<p class="title-form"><?php the_field('form_title'); ?></p>
			<!--?php // <form action="#">
				<input type="text" class="input" placeholder="שם מלא">
				<input type="text" class="input" placeholder="מספר הטלפון שלך (לא חובה)">
				<input type="text" class="input" placeholder="כתובת המייל לחזרה">
				<textarea class="textarea"></textarea>
				<input type="submit" class="submit" value="שליחה >>">
			</form> ?-->
			<?php echo do_shortcode('[contact-form-7 id="70" title="טופס יצירת קשר 1"]'); ?>
		</div>
		<div class="block-contact">
			<?php the_field('contact_text'); ?>
		</div>
	</div>
	<div class="right-block-contact">
			<img src="<?php bloginfo("template_directory") ?>/images/line.png" class="line line-all" alt="">
			<p class="text-b"><?php the_field('contact_title'); ?></p>
	</div>
	<div style="clear:both;"></div>
	<div class="block-content clearfix">
		<div class="img">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3377.5045118514527!2d34.8084522151666!3d32.1636674811615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151d488c5eb2cc45%3A0xbc6b4a2601b54edd!2sMaskit+St+22%2C+Herzliya!5e0!3m2!1sen!2sil!4v1464588041716" width="642" height="359" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		<div class="text">
		<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line-all">
			<p class="text-b"><?php the_field('map_title'); ?></p>
		</div>
		</div>
	</div>
	</div>
</div>


<?php get_footer(); ?>