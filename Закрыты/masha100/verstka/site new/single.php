<?php

get_header(); the_post(); ?>

<?php //Get post type    
   $post_type_obj = get_post_type_object( get_post_type() );
   //Get post type's label
   $title = apply_filters('post_type_archive_title', $post_type_obj->labels->name );        
   $archive_title = apply_filters('post_type_archive_title', $post_type_obj->labels->all_items); 
   $post_type = get_post_type(); 
   ?>

<div class="head-personal rl-head">
	<div class="head-wrap clearfix">
		<img  src="<?php if(get_field('wide_image_top')) { the_field('wide_image_top'); } else { bloginfo( "template_directory" ) ?>/images/ttl2.jpg<?php } ?>" class="img-our-head servise-head-img">
		<div class="right-text-img">
			<div class="block-l">
				<p class="text-v">
					<?php the_title(); ?>
				</p>
			</div>
		</div>
	</div>
</div>

<div class="links servises clearfix">
	<ul>
		<li><a href="<?php echo esc_url( home_url( '/' ) ); ?>"> עמוד הבית </a>>> </li>
		<li><a href="<?php echo get_post_type_archive_link( $post_type ); ?>"> <?php echo $archive_title; ?></a>>> </li>
		<li><span class="active"> <?php the_title(); ?> </span></li>
	</ul>
</div>
<div class="block-post  clearfix">
	<div class="wrap-post">
		<?php if(have_rows('block_parent')) :
			while(have_rows('block_parent')) : the_row(); 
				if(get_sub_field('block_kind') == 'title_block') { ?>

					<div class="post clearfix">
						<div class="block-avatar clients-post">
							<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line line-one" alt="">
							<p class="text-b"><?php the_sub_field('right_title'); ?></p>
						</div>
						<div class="text-post clients-left-block text2">
							<?php the_sub_field('left_text'); ?>
						</div>
					</div>
				<?php } else { ?>
					<div class="post clearfix text2">
						<?php the_sub_field('full_width_block'); ?>
					</div>

		<?php } endwhile; endif; ?>
		<!-- <div class="post clearfix">
			<div class="block-avatar clients-post">
				<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line one-two" alt="">
				<p class="text-b">הכוונה תעסוקתית<br>במכון פרסונה</p>
			</div>
			<div class="text-post">
				<p class="text1">למי מיועדת ההכוונה?</p>
				<p class="text3">לצעירים בתחילת דרכם, המעוניינים בהכוונה לבחירת מסלול לימודים <br>וכיוון מקצועי לחיים, כזה שיתאים לכישוריהם, לאישיותם, ולתשוקותיהם.</p>
				<p class="text1">///////////////</p>
				<p class="text3">לנמצאים במעגל העבודה, המעוניינים לעשות שינוי כיוון תעסוקתי,<br>החשים שהעבודה הנוכחית אינה "תפורה למידותיהם", וכי אינם מממשים את <br>מלוא הפוטנציאל האישי שלהם.</p>
				<p class="text1">///////////////</p>
				<p class="text3">לנמצאים מחוץ למעגל העבודה, שרוצים למנף את תקופת האבטלה <br>לבחירה תעסוקתית מחודשת.</p>
				<p class="text1">///////////////</p>
				<p class="text3">לאימהות שרוצות לפתח קריירה, ולייצר איזון נכון של אימהות-קריירה.</p>
				<p class="text1">///////////////</p>
				<p class="text3">לאבות שרוצים לאזן בין משפחה-לקריירה...<br>לחיילים משוחררים, שרוצים לבחור בכיוון לימודי, לפני או אחרי הטיול.<br>לפורשי צה"ל, משהב"ט והמשטרה, שרוצים לעצב את האתגר הבא שלהם <br>ב"אזרחות".</p>
			</div>
		</div> -->
		<?php /*<div class="post clearfix">
			<div class="text-post client-post">
				<div class="block-avatar2 clients-post">
					<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line line-3" alt="">
					<p class="text-b">הכוונה תעסוקתית<br>במכון פרסונה</p>
				</div>
				<div style="clear:both;"></div>
			<p class="text1">למי מיועדת ההכוונה?</p>
			<p class="text3">לצעירים בתחילת דרכם, המעוניינים  <br>בהכוונה לבחירת מסלול לימודים וכיוון <br>מקצועי לחיים, כזה שיתאים לכישוריהם,<br>לאישיותם, ולתשוקותיהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים במעגל העבודה, המעוניינים לעשות שינוי כיוון תעסוקתי,<br>החשים שהעבודה הנוכחית אינה "תפורה למידותיהם", וכי אינם מממשים את <br>מלוא הפוטנציאל האישי שלהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים במעגל העבודה, המעוניינים לעשות שינוי כיוון תעסוקתי,<br>החשים שהעבודה הנוכחית אינה "תפורה למידותיהם", וכי אינם מממשים את <br>מלוא הפוטנציאל האישי שלהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לאימהות שרוצות לפתח קריירה, ולייצר איזון נכון של אימהות-קריירה.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים מחוץ למעגל העבודה, שרוצים</p>
			<img src="<?php bloginfo( "template_directory" ) ?>/images/img1.jpg" class="img2" alt="">
			</div>
			<div class="text-post right client-post">
				<div class="block-avatar2 clients-post">
					<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line line-3" alt="">
					<p class="text-b">הכוונה תעסוקתית<br>במכון פרסונה</p>
				</div>
				<div style="clear:both;"></div>
			<p class="text1">למי מיועדת ההכוונה?</p>
			<p class="text3">לצעירים בתחילת דרכם, המעוניינים  <br>בהכוונה לבחירת מסלול לימודים וכיוון <br>מקצועי לחיים, כזה שיתאים לכישוריהם,<br>לאישיותם, ולתשוקותיהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים במעגל העבודה, המעוניינים לעשות שינוי כיוון תעסוקתי,<br>החשים שהעבודה הנוכחית אינה "תפורה למידותיהם", וכי אינם מממשים את <br>מלוא הפוטנציאל האישי שלהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים במעגל העבודה, המעוניינים לעשות שינוי כיוון תעסוקתי,<br>החשים שהעבודה הנוכחית אינה "תפורה למידותיהם", וכי אינם מממשים את <br>מלוא הפוטנציאל האישי שלהם.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לאימהות שרוצות לפתח קריירה, ולייצר איזון נכון של אימהות-קריירה.</p>
			<p class="text1">///////////////</p>
			<p class="text3">לנמצאים מחוץ למעגל העבודה, שרוצים</p>
			<img src="<?php bloginfo( "template_directory" ) ?>/images/img1.jpg" class="img2" alt="">
			</div>
		</div>*/ ?>
	</div>
</div>
<?php get_footer(); ?>