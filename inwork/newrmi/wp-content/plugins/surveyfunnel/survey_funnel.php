<?php


	/*
	 Plugin Name: Survey Funnel
	Plugin URI: http://www.surveyfunnel.com
	Version: 4.8
	Author: Survey Funnel
	Author URI: http://www.SurveyFunnel.com
	Description: Add dynamic survey funnels to your Wordpress site
	*/
	
	
	/***********
	 Changelog
        4.8 Fixed scroll issue for survey popup for WordPress 4.4
	4.7.9 Now survey can be setup with 'Other answer' text field with descriptive option for all the answers
	4.7.8 Now survey can be setup with 'Other answer' text field option for questions
	4.7.7 Added support for MailChimp Addon
	4.7.6 Redesigned backend/admin panel and added help text to plugin settings.
	4.7.5 Improved language compatibility to support special characters and fixed issue which disabled theme background color
	4.7.4 Fixed cloning and minor responsiveness issues. Added back cookie functionality.
	4.7.3 Now compatible with latest wordpress version 4.2.2
	4.7.2 Now it is possible specify start and end for survey.
	4.7.1 Fixed issue of survey not getting saved. 
	4.7 Now it is possible to display survey only to logged in user or non-logged in user or all users.
	4.6.9 Improved reset button functionality in backend.
	4.6.8 i)  Added back imprints display in dashboard ii)  Bug fixed related to imprint count for slide out survey iii) Changed Video Link in Dashboard .
	4.6.7 Fixed cursor action issue in Add/Edit question dialog box (Issue with WordPress 4.1)
	4.6.6 Added date and time in survey export results 	
	4.6.5 Added support for Shortcode in content area
	4.6.4 Fixed question header issue, now it allows empty string	
	4.6.3 Updated Result Analysis and Added with Individual result analysis feature 
	4.6.2 Updated fancybox library
	4.6.1 Enabled handling of html special characters in editing of funnel question
	4.6   Changed Admin Panel look and feel, Added custom theme feature.
	4.5.1 Changed Dashboard look and feel
	4.5   Funnel Theme functionality added. Fix for the export feature. All deprecated functions have been replaced.
	4.4   Question Header Feature included. HTML allowed for Question field.
	4.3   Enhanced Export Feature to include User-Level Results
	4.2   Adds the user information.
	4.1   Fixed image editor & background issue for short code
	4.0   Funnel can be Embeded on Page or Post with shortcode.
	3.1   get email notification after user completes survey
	3.0   adds survey funnel on category pages and bug fix for lightbox in sidebar on home page
	2.1.2 minor fix for WP_PLUGIN_URL_SLLSAFE and enqueued wordpress default jquery
	2.1.1 fix for anomalies with WP_CONTENT_URL showing up when using WP_PLUGIN_URL_SLLSAFE fix
	2.1 fix for single quotes in questions and answers in surveys
	2.0.10 fix for ssl, using new WP_PLUGIN_URL_SLLSAFE
	2.0.9 fix for delete and copy with new ajax method
	2.0.8 fix for multiple image triggered lightboxes conflict
	2.0.7 commented out $_POST['data'] = urldecode(($_POST['data']));
	added code to fix server settings with magic quotes on, for html content areas
	2.0.6 changed the way admin panel uses JSON to create and save funnels
	2.0.5 changed my_scripts_method to my_sf_scripts_method to avoid function name collisions with other plugins
	2.0.4 fixes a database error from 2.0.3
	2.0.3 fixes an issue with putting the lightbox image in the sidebar
	2.0.2 fixes conflict if lightbox and tab on the same page
	2.0.1 fixes https on add
	and only restricts the javascript to just the pages where it's needed
	2.0.0 adds lightbox functionality
	1.7.1 fixed a conflict with update notifier
	1.7.0 fixed some javascript conflicts - such as color picker
	1.6.1 changed session
	1.6 fixed rules bug when adding question [KW]
	1.5 color picker fix [JB]
	1.4
	Added clone [JB]
	Added delete [JB]
	Fixed numbering bug [KW]
	Added uninstall.php file [JB]
	
	1.3 Added css to css/styles.css to reset the radio input width to auto [JB]
	1.2 Fixed bug with version 1.1 default tab code on installing new funnel [JB]
	1.1 Added default tab and custom code in survey.php for easier creation of new survey funnels [JB]
	
	************/
	
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

if ( ! class_exists( 'surveyFunnel' ) ) :

final class surveyFunnel {
	
	
	protected static $_instance = null;
	
	/**
	 * Main surveyFunnel Instance
	 *
	 * Ensures only one instance of surveyFunnel is loaded or can be loaded.
	 *
	 * @since 2.1
	 * @static
	 * @see WC()
	 * @return surveyFunnel - Main instance
	 */
	public static function instance() {
		if ( is_null( self::$_instance ) ) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	
	
	public function __construct() {
				
		$this->define_constants();
		$this->includes();
		add_action('init', array($this,'survey_funnel_header'));
		add_action('shutdown', array($this,'survey_funnel_shutdown'));
		add_action('wp_enqueue_scripts', array($this,'my_sf_scripts_method'));
		add_action('wp_ajax_sf_update', array($this,'sf_update_callback'));
		add_action('wp_ajax_sf_delete', array($this,'sf_delete_callback'));//2.0.9
		add_action('wp_ajax_sf_clone', array($this,'sf_clone_callback'));//2.0.9
		include_once(dirname(__FILE__).'/sfshort.php');
		register_activation_hook(__FILE__, array($this,'survey_funnel_init_db'));
				
	}
	public function includes() {

		if(is_admin()){
			include_once 'class-admin-sf.php';
			include_once('classes/class-sf-ajax.php');
						
		}
			include_once 'class-frontend-sf.php';
	}
	
	private function define_constants() {
		
		$plugindir=explode('/', __DIR__);
		$plugindir=$plugindir[count($plugindir)-1];
		if(!defined('SF_PLUGIN_URL')) define('SF_PLUGIN_URL', WP_PLUGIN_URL.'/'.$plugindir);
		if(!defined('SF_PLUGIN_DIR')) define('SF_PLUGIN_DIR', $plugindir);
		//if(!defined('WP_PLUGIN_URL_SLLSAFE'))define('WP_PLUGIN_URL_SLLSAFE', 0);
		
	
		if ( ! defined( 'WP_CONTENT_URL' ) )
			define( 'WP_CONTENT_URL', get_option( 'siteurl' ) . '/wp-content' );
		if ( ! defined( 'WP_CONTENT_DIR' ) )
			define( 'WP_CONTENT_DIR', ABSPATH . 'wp-content' );
		if ( ! defined( 'WP_PLUGIN_URL' ) )
			define( 'WP_PLUGIN_URL', WP_CONTENT_URL. '/plugins' );
		if ( ! defined( 'WP_PLUGIN_DIR' ) )
			define( 'WP_PLUGIN_DIR', WP_CONTENT_DIR . '/plugins' );
		
		
		define( 'WP_PLUGIN_URL_SLLSAFE', str_replace(array('http://', 'https://'),'//',SF_PLUGIN_URL) );
		
	}
	
	public function survey_funnel_header(){
		include(dirname(__FILE__)."/classes/all_classes.php");
		$DBTables = new DBTables();
		$DBTables->initDBTables();
		
		//Jack added
		
		ob_start();
	}
	
	function survey_funnel_shutdown() {
		$_SESSION['sf_current_page'] = '';
	}
	

	function survey_funnel_init_db() {
		include(dirname(__FILE__)."/classes/all_classes.php");
	
		$DBTables = new DBTables();
		$DBTables->initDBTables();
	}
	
	
	function my_sf_scripts_method(){
		//See if survey funnel should be shown on public facing pages
		//Purpose: reduce loading of js and css
		global $wpdb,$post, $is_survey_page;

 		include_once(dirname(__FILE__) . "/classes/all_classes.php");

		$Survey = new Survey();
		if (!isset($post->ID)) $post->ID=0; //added for fix to survey showing on 404 page
		 
		if (is_category())
		{  
			$category = get_the_category($post->ID);
			if($Survey->isSurveyCategory($category[0]->term_id)){
		$is_survey_page = true;
		//enque the scripts and styles
	
	wp_enqueue_script('survey_funnel_ajax', SF_PLUGIN_URL.'/js/ajax.js', array('jquery') ,'1.0', false);
	wp_enqueue_script('survey_funnel', SF_PLUGIN_URL.'/js/survey_funnel.js', array('jquery'),'1.0', false);
	wp_enqueue_script('survey_funnel_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.pack.js', array('jquery'),'1.0', false);
	

	wp_enqueue_style('survey_funnel_styles', SF_PLUGIN_URL.'/css/styles.css');
	wp_enqueue_style('survey_funnel_client_styles', SF_PLUGIN_URL.'/css/survey_funnel.css');
	wp_enqueue_style('survey_funnel_client_styles_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.css' );
			}
			else 
				$is_survey_page = false;
		}
		else if ($Survey->isSurveyPage($post->ID)){
			
			$is_survey_page = true; 
			//enque the scripts and styles
			wp_enqueue_script('survey_funnel_ajax', SF_PLUGIN_URL.'/js/ajax.js', array('jquery') ,'1.0', false);
			wp_enqueue_script('survey_funnel', SF_PLUGIN_URL.'/js/survey_funnel.js', array('jquery'),'1.0', false);
			wp_enqueue_script('survey_funnel_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.pack.js', array('jquery'),'1.0', false);
			
			wp_enqueue_style('survey_funnel_styles', SF_PLUGIN_URL.'/css/styles.css' );
			wp_enqueue_style('survey_funnel_client_styles', SF_PLUGIN_URL.'/css/survey_funnel.css' );
			wp_enqueue_style('survey_funnel_client_styles_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.css' );
	
		} 
		else { 
			$found = $Survey->isShortcode($post->ID);
//			exit();
			if($found)
			{
				
				//echo "<style type=\"text/css\">#content #staticsurvey { display: none; }</style>";
				wp_enqueue_script('survey_funnel_ajax', SF_PLUGIN_URL.'/js/ajax.js', array('jquery') ,'1.0', false);
				wp_enqueue_script('survey_funnel', SF_PLUGIN_URL.'/js/survey_funnel.js', array('jquery'),'1.0', false);
				wp_enqueue_script('survey_funnel_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.pack.js', array('jquery'),'1.0', false);
					
				wp_enqueue_style('survey_funnel_styles', SF_PLUGIN_URL.'/css/styles.css' );
				wp_enqueue_style('survey_funnel_client_styles', SF_PLUGIN_URL.'/css/survey_funnel.css' );
				wp_enqueue_style('survey_funnel_client_styles_fancybox', SF_PLUGIN_URL.'/jquery/fancyBox-2.1.5/source/jquery.fancybox.css' );
				
			}else{
		$is_survey_page = false;
		}
		}
	
		
    }

	function sf_update_callback(){
	
	
	
	$parts = explode('action=', $_REQUEST['iPage']);
	
	$action = $parts[1];
	
	//$_POST['data'] = urldecode(($_POST['data']));//commented this out in 2.0.7
	parse_str($_POST['data'], $_POST);
	$_POST['action'] = $action;
	$_REQUEST['action'] = $action;
	
	//$data = urldecode(($_REQUEST['data']));
	
	//for testing
	//echo json_encode($_POST);die();
	
	

		$gpc = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
		//array_walk_recursive($gpc, 'magicQuotes_newawStripslashes');
	
	
		ob_start();
		include(dirname(__FILE__) . "/classes/all_classes.php");
	
		$SurveyActivity = new SurveyActivity();
		$SurveyActivity->initSurveyActivity();

		if (current_user_can('manage_options')) {
	$SurveyQuestionManage = new SurveyQuestionManage();
	$SurveyQuestionManage->initSurveyQuestionManage();

	$SurveyManage = new SurveyManage();
	$SurveyManage->initSurveyManage();
	
	$SurveyExport = new SurveyExport();
	$SurveyExport->initSurveyExport();
		}


	die(); // this is required to return a proper result
	}
	


	function sf_delete_callback(){
	
	
	$_POST['action'] = 'DELETE_FUNNEL';
	$_REQUEST['action'] = 'DELETE_FUNNEL';
		$gpc = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
		//array_walk_recursive($gpc, 'magicQuotes_newawStripslashes');
	
	
		ob_start();
		include(dirname(__FILE__) . "/classes/all_classes.php");
		$SurveyActivity = new SurveyActivity();
		$SurveyActivity->initSurveyActivity();

		if (current_user_can('manage_options')) {
	$SurveyQuestionManage = new SurveyQuestionManage();
	$SurveyQuestionManage->initSurveyQuestionManage();

	$SurveyManage = new SurveyManage();
	$SurveyManage->initSurveyManage();
	
	$SurveyExport = new SurveyExport();
	$SurveyExport->initSurveyExport();
		}


	die(); // this is required to return a proper result
	}

	function sf_clone_callback(){
	
	
	$_POST['action'] = 'COPY_FUNNEL';
	$_REQUEST['action'] = 'COPY_FUNNEL';
		$gpc = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
		//array_walk_recursive($gpc, 'magicQuotes_newawStripslashes');
	
	
		ob_start();
		include(dirname(__FILE__)."/classes/all_classes.php");

		$SurveyActivity = new SurveyActivity();
		$SurveyActivity->initSurveyActivity();

		if (current_user_can('manage_options')) {
	$SurveyQuestionManage = new SurveyQuestionManage();
	$SurveyQuestionManage->initSurveyQuestionManage();

	$SurveyManage = new SurveyManage();
	$SurveyManage->initSurveyManage();
	
	$SurveyExport = new SurveyExport();
	$SurveyExport->initSurveyExport();
	}


		die(); // this is required to return a proper result
	}

	
	
		
			
}

endif;

surveyFunnel::instance();
