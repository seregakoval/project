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

function create_modules() {
      register_post_type('persona_people', array('labels' => array('name' => __( 'פרסונה לאנשים' ),
                                                          'singular_name' => __( 'פרסונה לאנשים' ),
                                                          'edit_item' => __( 'ערוך פרסונה לאנשים' )),
                                        'public' => false,
                                        'show_in_nav_menus' => true,
                                        'show_ui' => true,
                                        'publicly_queryable' => true,
                                        'has_archive' => true,
                                        'exclude_from_search' => false,
                                        'menu_position' => 5,
                                        'rewrite' => array('slug'=>'personal'),
                                        'supports' => array( 'title' , 'editor' , 'revisions' )
        )
  ); 
      register_post_type('persona_buisness', array('labels' => array('name' => __( 'פרסונה לעסקים' ),
                                                          'singular_name' => __( 'פרסונה לעסקים' ),
                                                          'edit_item' => __( 'ערוך פרסונה לעסקים' )),
                                        'public' => false,
                                        'show_ui' => true,
                                        'publicly_queryable' => true,
                                        'has_archive' => true,
                                        'exclude_from_search' => false,
                                        'menu_position' => 5,
                                        'rewrite' => array('slug'=>'buisness'),
                                        'supports' => array( 'title' , 'editor' , 'revisions' )
        )
  ); 
      register_post_type('persona_comms', array('labels' => array('name' => __( 'פרסונה בתקשורת' ),
                                                          'singular_name' => __( 'פרסונה בתקשורת' ),
                                                          'edit_item' => __( 'ערוך פרסונה בתקשורת' )),
                                        'public' => false,
                                        'show_ui' => true,
                                        'publicly_queryable' => true,
                                        'has_archive' => true,
                                        'exclude_from_search' => false,
                                        'menu_position' => 5,
                                        'rewrite' => array('slug'=>'communications'),
                                        'supports' => array( 'title' , 'editor' , 'revisions' )
        )
  ); 
      register_post_type('persona_lectures', array('labels' => array('name' => __( 'סדנאות והרצאות' ),
                                                          'singular_name' => __( 'סדנאות והרצאות' ),
                                                          'edit_item' => __( 'ערוך סדנאות והרצאות' )),
                                        'public' => false,
                                        'show_ui' => true,
                                        'publicly_queryable' => true,
                                        'has_archive' => true,
                                        'exclude_from_search' => false,
                                        'menu_position' => 5,
                                        'rewrite' => array('slug'=>'lectures'),
                                        'supports' => array( 'title' , 'editor' , 'revisions' )
        )
  ); 
}
add_action( 'init', 'create_modules' );   


//Hide menu items that are not used except from administrators. 
function hide_admin_menus()
{
    // provide a list of usernames who can edit custom field definitions here
    $admins = array( 
        'enterseo',
        'atanas',
        'mayaadmin'
    ); 
    // get the current user
    $current_user = wp_get_current_user();
    // match and remove if needed
    if( !in_array( $current_user->user_login, $admins ) )
    {
        remove_menu_page('edit.php');
        remove_menu_page('edit.php?post_type=acf');
        remove_menu_page('tools.php');
      remove_menu_page('edit-comments.php');
          remove_menu_page( 'wpcf7' );

    }

}
add_action('admin_menu','hide_admin_menus',999);

//shortcode creater//
//[...]
function line_func( $atts ){
  return "<p class='text1'>///////////////</p>";
}
add_shortcode('slash-line', 'line_func');

function green_text( $atts, $content = null ){
  return "<div class='text1'>".$content."</div>";
}
add_shortcode('green_text', 'green_text');

// Simply remove anything that looks like an archive title prefix ("Archive:", "Foo:", "Bar:").
add_filter('get_the_archive_title', function ($title) {
    return preg_replace('/^\w+: /', '', $title);
});

if( function_exists('acf_add_options_page') ) {

  acf_add_options_page('Theme Settings');

}

?>