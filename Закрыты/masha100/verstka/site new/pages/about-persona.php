<?php

// Template Name: About Persona (על המכון)

get_header(); the_post(); ?>

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
	<div id="about-tab-wrap">
		<div id="about-tab-row" class="row rl">
			<ul class="button-b">
				<li><a href="<?php echo the_permalink(8); ?>"	 class="size active">אודות המכון</a></li>
				<li><a href="<?php echo the_permalink(10); ?>"> הפרסונות שלנו</a></li>
				<li><a href="<?php echo the_permalink(12); ?>"><span>בין לקוחותינו </span></a></li>
			</ul>
		</div>
	</div>
</div>
	<div class="block-post about-main clearfix">
	<div class="wrap-post">
		<?php if(have_rows('block_parent')) :
			while(have_rows('block_parent')) : the_row(); 
				if(get_sub_field('block_kind') == 'title_block') { ?>
					<div class="post clearfix">
					<div class="block-avatar clients-post">
						<img src="<?php bloginfo("template_directory") ?>/images/line.png" class="line" alt="">
						<p class="text-b"><?php the_sub_field('right_title'); ?></p>
					</div>
					<div class="text-post clients-left-block">
						<div class="text-block text2">
							<?php the_sub_field('left_text'); ?>
						</div>
					</div>
					</div>
					<?php } else { ?>
					<div class="post clearfix">
						<?php the_sub_field('full_width_block'); ?>
					</div>
		<?php } endwhile; endif; ?>
	</div>
</div>



<?php get_footer(); ?>