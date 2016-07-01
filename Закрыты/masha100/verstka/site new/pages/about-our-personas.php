<?php

// Template Name: About - Our Personas (הפרסונות שלנו)

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
<div class="links clearfix">
	<ul>
		<li><a href="<?php echo esc_url( home_url( '/' ) ); ?>"> עמוד הבית </a>>> </li>
		<li><span class="active"> <?php the_title(); ?></span></li>
	</ul>
</div>
<div style="clear:both;"></div>
	<div id="about-tab-wrap" class="grayed">
		<div id="about-tab-row" class="row rl">
			<ul class="button-b links_contact">
			    <li><a href="<?php echo the_permalink(8); ?>" class="size pasive">אודות המכון</a></li>
			    <li><a href="<?php echo the_permalink(10); ?>" class="active_contact"> הפרסונות שלנו</a></li>
			    <li><a href="<?php echo the_permalink(12); ?>"><span>בין לקוחותינו </span></a></li>
		  	</ul>
  		</div>
  </div>
</div>
<div class="block-post clearfix our-persona">
	<div class="wrap-post">
		<?php if(have_rows('personas_parent')) :
			while (have_rows('personas_parent')) : the_row(); ?>
				<div class="post clearfix">
				<div class="block-avatar">
					<div class="images-block">
						<img src="<?php the_sub_field('personas_image'); ?>" alt="">
						<div class="after-block">
							
						</div>
					</div>
					<a href="mailto:<?php the_sub_field('personas_contact_info'); ?>" target="_blank"><p class="name"><?php the_sub_field('personas_contact_text'); ?></p></a>
				</div>
				<div class="text-post text2">
					<p class="text1"><strong><?php the_sub_field('personas_name'); ?></strong></p>
					<?php the_sub_field('personas_text'); ?>
				</div>
				</div>
			<?php endwhile;
		endif; ?>

	</div>
</div>

<?php get_footer(); ?>