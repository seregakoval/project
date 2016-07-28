<?php
include_once(dirname(__FILE__) . "/classes/sf_individual_result_class.php");
if(!class_exists('SF_Admin_Result_Analyze')) :

class SF_Admin_Result_Analyze{
	public $wpdb;
	public $survey_id = null;
	public $page_no = 1;
	public $SurveyManage = null;
	
	public $SF_indv;
	public $indv_results;
	public function __construct() {
		
		global $wpdb;
		
		$this->wpdb = $wpdb;
		$this->SurveyManage = new SurveyManage();
		$this->SurveyManage->loadSurvey($_REQUEST['survey_id']);
		$this->survey_id = $this->SurveyManage->survey_id;
		add_action('admin_footer', array($this,'indvidual_analyze_ajax'));
		
		$this->SF_indv = new sf_indv_result();
		
		$this->includes();
	}
	
	
	public function indvidual_analyze_ajax(){
		?>
			
			<script type="text/javascript" >
			
			
				function get_indv_result($pageno){
					//alert($pageno);
					var data = {
							'action': 'surveyfunnel_get_individual_results',
							'page_no': $pageno,
							'survey_id': '<?php echo $this->survey_id; ?>'
							
						};

						// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
						jQuery.post(ajaxurl, data, function(response) {
							jQuery('#indv').html(response);
						});
				}
			</script>
		<?
	}
	

	public function includes(){
		if (!current_user_can('manage_options')) {
			wp_die(__('You do not have sufficient permissions to access this page.'));
		}
		include(dirname(__FILE__)."/classes/all_classes.php");

		$SurveyManage = $this->SurveyManage;
		
		
		$survey_id = $SurveyManage->survey_id;
		$this->SF_indv->sf_get_indv_results();
		$indv_results = $this->SF_indv->indv_results;
		
		$userCounts = $this->SF_indv->sf_get_usercounts();
		wp_enqueue_style('bootstrap_admin_css', SF_PLUGIN_URL . "/js/bootstrap/css/bootstrap.min.css");
		
		wp_enqueue_script('bootstrap_admin_js', SF_PLUGIN_URL . '/js/bootstrap/js/bootstrap.min.js');
		
		include(dirname(__FILE__)."/form_templates/results.php");
		
	}
	
	
} 

endif;

new SF_Admin_Result_Analyze();


?>