<?php get_header(); ?>

        <section class="slider clearfix" style="position: relative;overflow: hidden;">
            <?php wd_slider(3); ?>
        </section>
        <section class="search clearfix">
            <div class="container">
                <div class="row">
                    <h1>Pays</h1>
                    <div class="search-b">
                        <form action="#">
                            <input type="text" placeholder="Search" class="search-input">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="block-countries">
            <div class="container">
                <div class="row">

                    <?php $query = new WP_Query('cat=31&author=1'); ?>
                        <?php if( $query->have_posts() ){
                        while( $query->have_posts() ){ $query->the_post();
                        ?>
                    <div class="col-lg-3">
                        <a href="<?php the_permalink(); ?>">
                        <div class="img">
                           <?php the_post_thumbnail('post_thumb'); ?>
                            <div class="icon">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                        </div>
                        <p class="name"><?php the_title(); ?></p>
                        </a>
                    </div>
                            <?php
                        }wp_reset_postdata();
                        }
                        else echo 'Записей нет.';
                        ?>
                </div>
            </div>
        </section>
        <section class="title clearfix">
            <div class="container">
                <div class="row">
                    <h1>ADS</h1>
                </div>
            </div>
        </section>
        <section class="popular-block clearfix">
            <div class="container">
                <h1>Popular</h1>
                <div style="clear: both;"></div>
                <div class="row">
                        <div class="col-lg-3">
                            <a href="#">
                                <div class="img">
                                    <img src="<?php bloginfo("template_url") ?>/img/111.jpg" alt="">
                                    <div class="icon">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <p class="name">Congo RBC</p>
                            </a>
                        </div>
                        <div class="col-lg-3">
                            <a href="#">
                                <div class="img">
                                    <img src="<?php bloginfo("template_url") ?>/img/111.jpg" alt="">
                                    <div class="icon">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <p class="name">Congo RBC</p>
                            </a>
                        </div>
                        <div class="col-lg-3">
                            <a href="#">
                                <div class="img">
                                    <img src="<?php bloginfo("template_url") ?>/img/111.jpg" alt="">
                                    <div class="icon">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <p class="name">Congo RBC</p>
                            </a>
                        </div>
                        <div class="col-lg-3">
                            <a href="#">
                                <div class="img">
                                    <img src="<?php bloginfo("template_url") ?>/img/111.jpg" alt="">
                                    <div class="icon">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <p class="name">Congo RBC</p>
                            </a>
                        </div>
                </div>
            </div>
        </section>
        </div>
<?php get_footer(); ?>
</body>
</html>