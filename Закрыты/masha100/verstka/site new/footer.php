<div class="clear"></div>
</div> <!-- Wrapper -->
<?php include TEMPLATEPATH . '/scripts.php'; ?>
<script type='text/javascript' src='<?php echo get_template_directory_uri(); ?>/js/ScrollMagic.js'></script>
<script>
    var controller = new ScrollMagic.Controller();
</script>
<script type='text/javascript' src='<?php echo get_template_directory_uri(); ?>/js/general.js'></script>
<?php wp_footer() ; ?>
<div class="footer">
    <div class="wrap-footer clearfix">
      <div class="left">
        <!-- Facebook page/like box -->
        <!-- <img src="<?php bloginfo("template_directory") ?>/images/footer-img.jpg"> -->

          <div id="fb-like-box">
              <div class="fb-page" data-href="https://www.facebook.com/Persona.GPN/" data-tabs="timeline" data-width="465" data-height="230" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/Persona.GPN/"><a href="https://www.facebook.com/Persona.GPN/">‎מכון פרסונה - אבחון הכוונה וליווי לאנשים ולעסקים‎</a></blockquote></div></div>
          </div>
      </div>
      <div class="right">
        <div class="nav1">
          <?php wp_nav_menu( array( 'menu' => 'footer menu' ) ); ?>
        </div>
        <div class="nav1">
          <ul>
            <li>
              <a href="#">פרסונה בוידאו</a>
            </li>
            <li>
              <a href="#">ייעוץ אישי למנהלים</a>
            </li>
            <li>
              <a href="#">אבחון ומיון עובדים</a>
            </li>
            <li>
              <a href="#">יעוץ אירגוני</a>
            </li>
            <li>
              <a href="#">קלפים טיפוליים</a>
            </li>
          </ul>
        </div>
      </div>
      <div style="clear: both;"></div>
      <div class="bottom">
        <p class="text-footer">מכון פרסונה. כתובתנו: רח׳ משכית 22, הרצליה פיתוח ת.ד. 12760 מיקוד 46733 <br>
טל. 09-771-7050 ////   פקס. 09-771-2767    ////   מייל. <a href="mailto:persona@persona-e.co.il" target="_blank">persona@persona-e.co.il</a></p>
      </div>
    </div>
  </div>
  <div class="sub-footer">
    <div class="wrap-sub-footer clearfix">
      <div class="logo">
        <p>Designed by</p>
        <a href="http://studio-agenda.co.il/" target="_blank"><img src="<?php bloginfo("template_directory") ?>/images/logo-footer.png" border="0"></a>
      </div>
      <p class="copy">© כל הזכויות שמורת למכון פרסונה 2016</p>
    </div>
  </div>
</body>
</html>