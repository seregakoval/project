<?php

get_header(); ?>

<?php if ( have_posts() ) : ?>
<div class="head-personal rl-head">
	<div class="head-wrap clearfix">
		<img  src="<?php bloginfo( "template_directory" ) ?>/images/ttl2.jpg" class="img-our-head servise-head-img">
		<div class="right-text-img">
			<div class="block-l">
				<!-- <p class="st-logo">פרסונה לאנשים</p> -->
				<p><?php echo str_replace('ארכיון: ','',get_the_archive_title()); ?></p>
			</div>
		</div>
	</div>
</div>
<div class="block-bottons clearfix">
	<div class="links clearfix">
		<ul>
			<li><a href="<?php echo esc_url( home_url( '/' ) ); ?>"> עמוד הבית </a>>> </li>
			<li><li><span class="active"> <?php echo str_replace('ארכיון: ','',get_the_archive_title()); ?> </span></li>
		</ul>
	</div>
</div>
<div class="service-temp">
	<?php while (have_posts()) : the_post(); ?>
	<div class="service-post">
		<div id="post-tab-wrap">
			<div id="post-tab-row" class="row rl">
				<div class="service-temp-line line-pos1"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></div>
			</div>
		</div>
		<div class="service-temp-block">
			<div class="st-img">
				<img src="<?php the_field('archive_image'); ?>" alt="photo">
				<div class="st-after-img"></div>
			</div>
			<div class="st-text">
				<?php if(get_field('archive_text')) { ?><span><?php the_field('archive_text'); ?></span><?php } ?>
				<?php the_field('archive_small_text'); ?>
				<a href="<?php the_permalink(); ?>">המשך קריאה >></a>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<?php endwhile; ?>
</div>
<h4 class="st-carousel-title">לקוחות משתפים:</h4>
<div id="myCarousel5" class="carousel slide carousel-green" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
    	<?php if(have_rows('clients_share_personal', 'option')) :
    	$counter=0;
    		while(have_rows('clients_share_personal', 'option')) : the_row(); 
    			$counter++ ?>
			    <div class="item <?php if($counter==1){?>active<?php } ?>">
					<div class="koval-pedik">
				    	<span class="up-quote"></span>
				       	<?php the_sub_field('clients_text'); ?>
						<p><span>(<?php the_sub_field('clients_name'); ?>)</span></p>
						<span class="down-quote"></span>	
					</div>
			    </div>
			<?php endwhile; 
		endif; ?>
      <a class="left carousel-control" href="#myCarousel5" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left-koval" aria-hidden="true"></span>
	    
	  </a>
	  <a class="right carousel-control" href="#myCarousel5" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right-koval" aria-hidden="true"></span>
	    
	  </a>
    </div>
</div>
<?php endif; ?>

<?php get_footer(); ?>