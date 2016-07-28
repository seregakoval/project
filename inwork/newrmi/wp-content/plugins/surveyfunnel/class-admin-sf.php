<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

if ( ! class_exists( 'SF_Admin' ) ) :
class SF_Admin {
	var $survey_id;
	var $start;
	var $end;
	public function __construct() {
		
		add_action('admin_menu', array($this,'survey_funnel_admin_menu'));
		add_action( 'admin_init', array($this,'survey_funnel_admin_init'));
		add_action( 'admin_enqueue_scripts', array($this,'my_enqueue') );
	}
	
	public function survey_funnel_admin_menu() {
		// Admin Navigation
		
		
	
		add_menu_page('Survey Funnel Dashboard', 'Survey Funnel', 'manage_options', 'survey_funnel_welcome', array($this,'survey_funnel_dashboard') , SF_PLUGIN_URL.'/images/survey.png');
		add_submenu_page('survey_funnel_welcome', 'Survey Funnel', 'Dashboard', 'manage_options', 'survey_funnel_welcome', array($this,'survey_funnel_dashboard'));
		
		$addPage = add_submenu_page('survey_funnel_welcome', 'Survey Funnel: Add New', 'Add Funnel', 'manage_options', 'survey_funnel_add', array($this,'survey_funnel_add'));
		
		add_submenu_page($addPage, 'Survey Funnel: Edit', '', 'manage_options', 'survey_funnel_edit', array($this,'survey_funnel_edit'));
		add_submenu_page($addPage, 'Survey Funnel: Results', '', 'manage_options', 'survey_funnel_results', array($this,'survey_funnel_results'));
		
		
		add_submenu_page('survey_funnel_welcome', 'Survey Funnel', 'Setting', 'manage_options', 'survey_funnel_setting', array($this,'survey_funnel_setting'));
		
		wp_enqueue_script('survey_funnel_scripts', SF_PLUGIN_URL .'/js/scripts.js');
	
	
	
	
		//wp_tiny_mce(false, false);
	}
	
	public function survey_funnel_welcome() {
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
	
		include(dirname(__FILE__)."/classes/all_classes.php");
		include_once(dirname(__FILE__).'/admin-header.php');
		include(dirname(__FILE__)."/welcome.php");
	}
	
	function survey_funnel_setting() {
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
		wp_enqueue_style('survey_style',SF_PLUGIN_URL.'/css/styles.css');
		
		include(dirname(__FILE__)."/classes/all_classes.php");
		include_once(dirname(__FILE__)."/admin-header.php");
		
		$email_display = get_option('sf_email_id');
		if(!$email_display){
			$email_display = '';
		}
		$email = isset($_POST['sf-email'])? $_POST['sf-email']:'';
		if($email != '') {
			update_option('sf_email_id',$email);
			$email_display = $email;
		}
		wp_enqueue_style('bootstrap_admin_css', SF_PLUGIN_URL . "/js/bootstrap/css/bootstrap.min.css");
		wp_enqueue_script('bootstrap_admin_js', SF_PLUGIN_URL . '/js/bootstrap/js/bootstrap.min.js');
		
		?>
				<div class="panel panel-primary" style="width: 99%;margin-top: 42px;">
		    <div class="panel-heading">
	        <h3 class="panel-title">Survey Funnel Settings</h3>
	      </div>
	      <div class="panel-body">
		<form action='' method='POST'>
			<table>
  <tr>
    <th width="20%">Send Mail From</th>
    <td width="30%"><input id='sf-email' name='sf-email' type='email' value='<?php echo $email_display; ?>' maxlength='255' /> </td>
  	<td><span class="description">After successful subscription users will get mail from this email id.</span></td>
  </tr>

</table>
<input class='button button-primary' id='saveEmail' name='saveEmail' type='submit' value='Submit'/> 
</form>
</div>
<?php 

	}
	
	function survey_funnel_dashboard() {
		global $update_needed;
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
		wp_enqueue_style('survey_style',SF_PLUGIN_URL.'/css/styles.css');
		
		include(dirname(__FILE__)."/classes/all_classes.php");
		include_once(dirname(__FILE__)."/admin-header.php");
		include(dirname(__FILE__)."/form_templates/dashboard.php");
	}
	
	/**
	 * Enter description here...
	 *
	 */
	function survey_funnel_add() {
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
		wp_register_script('date.js', SF_PLUGIN_URL . '/js/date.js','','',true);
		wp_enqueue_script('date.js');
		wp_enqueue_style('survey',SF_PLUGIN_URL.'/css/datepicker.css');
		wp_register_script('jquery.ui.datepicker.js', SF_PLUGIN_URL . '/js/jquery.ui.datepicker.js');
		wp_enqueue_script('jquery.ui.datepicker.js');
		wp_enqueue_style('bootstrap_admin_css', SF_PLUGIN_URL . "/js/bootstrap/css/bootstrap.min.css");
		wp_enqueue_script('bootstrap_admin_js', SF_PLUGIN_URL . '/js/bootstrap/js/bootstrap.min.js');
		include_once(dirname(__FILE__).'/admin-header.php');
		include(dirname(__FILE__)."/form_templates/add_new.php");
	}
	
	/**
	 * Enter description here...
	 *
	 */
	function survey_funnel_edit() {
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
		wp_register_script('date.js', SF_PLUGIN_URL . '/js/date.js','','',true);
		wp_enqueue_script('date.js');
		wp_enqueue_style('survey',SF_PLUGIN_URL.'/css/datepicker.css');
		wp_register_script('jquery.ui.datepicker.js', SF_PLUGIN_URL . '/js/jquery.ui.datepicker.js');
		wp_enqueue_script('jquery.ui.datepicker.js');
		wp_enqueue_style('bootstrap_admin_css', SF_PLUGIN_URL . "/js/bootstrap/css/bootstrap.min.css");
		wp_enqueue_script('bootstrap_admin_js', SF_PLUGIN_URL . '/js/bootstrap/js/bootstrap.min.js');
	
		include(dirname(__FILE__)."/classes/all_classes.php");
	
	
	
		include(dirname(__FILE__)."/form_templates/edit.php");
		include(dirname(__FILE__)."/form_templates/question.php");
	
		include(dirname(__FILE__)."/form_templates/content.php");
		include(dirname(__FILE__)."/form_templates/userInfo.php");
	}
	

	/**
	 * Enter description here...
	 *
	 */
	function survey_funnel_results() {
		include_once 'classes/sf_individual_result_class.php';
		include_once 'class-admin-result-analyze-sf.php';
	}
	
	function survey_funnel_admin_init() {
		/* Register our script. */
		wp_register_script('survey_funnel_minicolor_js', SF_PLUGIN_URL.'/jquery/js/jquery.miniColors.min.js' );
		
		wp_enqueue_style('survey_funnel_result_css',SF_PLUGIN_URL.'/css/sf_result.css');
		wp_register_style('survey_funnel_jquery_ui_css', SF_PLUGIN_URL.'/jquery/css/redmond/jquery-ui-1.7.3.custom.css' );
		wp_register_style('survey_funnel_minicolor_css', SF_PLUGIN_URL.'/jquery/css/minicolor/jquery.miniColors.css' );
	
		//Figures updates
	
	}
	
	function my_enqueue($hook) {
		//echo $hook;exit;
		$dash_ar = array(
				'survey-funnel_page_survey_funnel_dashboard',
				'admin_page_survey_funnel_edit',
				'survey-funnel_page_survey_funnel_add'
	
		);
		if(in_array($hook, $dash_ar)) {
			/* Added in 2.1.2 to include wordpress jquery */
			wp_enqueue_script('jquery-ui-tabs');
			wp_enqueue_script('jquery-ui-sortable');
			wp_enqueue_script( 'jquery-ui-dialog' );
			 
			wp_enqueue_script( 'survey_funnel_minicolor_js');
			wp_enqueue_style( 'survey_funnel_jquery_ui_css');
			wp_enqueue_style( 'survey_funnel_minicolor_css');
			wp_enqueue_script('survey_funnel_ajax', SF_PLUGIN_URL.'/js/ajax.js', array('jquery') ,'1.0', false);
	
			// Media Uploader
			wp_enqueue_script(array('media-upload', 'thickbox'));
			wp_enqueue_style('thickbox');
	
			// Main styles
			wp_enqueue_style('survey_funnel_styles', SF_PLUGIN_URL.'/css/styles.css' );
		}
	
	
		return;
	}
	
}
endif;

new SF_Admin();
