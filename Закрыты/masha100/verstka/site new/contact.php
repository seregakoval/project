<?php

// Template Name: Contact (צור קשר)

get_header(); ?>
<div class="head-personal clearfix">
	<img src="<?php bloginfo( "template_directory" ) ?>/images/header-contact.png" class="img-our-head">
	<div class="right-text-img">
		<div class="block-l">
			<p>דברו איתנו</p>
		</div>
	</div>
</div>
<div class="wrap-contaсt">
	<div class="left-block">
		<div class="form-contact">
			<p class="title-form">רוצה שנחזור אליך?</p>
			<form action="#">
				<input type="text" class="input" placeholder="שם מלא">
				<input type="text" class="input" placeholder="מספר הטלפון שלך (לא חובה)">
				<input type="text" class="input" placeholder="כתובת המייל לחזרה">
				<textarea class="textarea"></textarea>
				<input type="submit" class="submit" value="שליחה >>">
			</form>
		</div>
		<div class="block-contact">
			<p class="text-contact">כתובתנו: מכון פרסונה.</p>
			<p class="text-contact">רח׳ משכית 22, הרצליה פיתוח</p>
			<p class="text-contact"> ת.ד. 12760 46733</p>
			<p class="line2">/////////////////</p>
			<p class="text-contact">טל. <a href="tel:" class="contact-phone">09-7717050</a></p>
			<p class="text-contact">פקס. 09-7712767</p>
			<p class="line2">/////////////////</p>
			<p class="text-contact">לפניות במייל.</p>
			<p class="text-contact"><a class="contact-mail" href="mailto:persona@persona-e.co.il">persona@persona-e.co.il</a></p>
		</div>
	</div>
	<div class="right-block-contact">
			<img src="<?php bloginfo("template_directory") ?>/images/line.png" class="line line-all" alt="">
			<p class="text-b">למכון פרסונה שני <br>כובעים עיקריים:</p>
	</div>
	<div style="clear:both;"></div>
	<div class="block-content clearfix">
		<div class="img">
			<img src="<?php bloginfo( "template_directory" ) ?>/images/Rectangle-1.png">
		</div>
		<div class="text">
		<img src="<?php bloginfo( "template_directory" ) ?>/images/line.png" class="line-all">
			<p class="text-b">למכון פרסונה שני <br>כובעים עיקריים:</p>
		</div>
		</div>
	</div>
	</div>
</div>


<?php get_footer(); ?>