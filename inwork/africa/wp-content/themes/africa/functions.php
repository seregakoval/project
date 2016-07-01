<?php

function my_style(){
    wp_enqueue_style("style", get_template_directory_uri()."/style.css");
}
add_action('wp_enqueue_scripts','my_style');

function theme_register_nav_menu(){
    register_nav_menu("primary", 'Primary Menu');
}
add_action("after_setup_theme", 'theme_register_nav_menu');
