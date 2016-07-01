<?php

if ( ! function_exists( 'eagleray_theme_setup' ) ) :
	function eagleray_theme_setup() {

		load_theme_textdomain( 'eagleray');

		// This theme uses wp_nav_menu() in two locations.
		register_nav_menus( array(
			'primary'   => "Top Menu",
		) );

	}	

endif; 

add_action( 'after_setup_theme', 'eagleray_theme_setup' );
/*
	function load_scripts() {
	// Loads JavaScript file with functionality specific to this theme.
	wp_enqueue_script( 'eagleray-script', get_template_directory_uri() . '/js/functions.js', array( 'jquery' ), '2013-07-18', true );
	}

add_action( 'wp_enqueue_scripts', 'load_scripts' );*/
/*
function my_scripts(){
	wp_enqueue_script("owl.carousel",get_template_directory_uri()."/js/owl.carousel.min.js");
	wp_enqueue_script("main-js",get_template_directory_uri()."/js/main-js.js");
}
add_action("wp_enqueue_scripts","my_scripts");*/
?>