<?php
$root = dirname( plugin_basename( __FILE__ ) );
define( 'SF_ROOT', WP_PLUGIN_DIR . '/' . $root );

//require_once( SF_ROOT . '/survey_funnel.php' );
//require_once( SF_ROOT . '/classes/survey_classes/survey_class.php' );
//require_once( SF_ROOT . '/js/survey_funnel.js' );

add_shortcode('survey_funnel', 'call_SF');

function call_SF( $atts ,$content = null) {

global $wpdb;
extract( shortcode_atts( array(
"key" => '0',
), $atts ) );

$Survey = new Survey();
$key = isset($atts['key'])?$atts['key']:'';
$tr = $wpdb->get_results("SELECT startDate, endDate, use_shortcode,survey_id FROM {$wpdb->prefix}sf_surveys WHERE (survey_key = '$key') ");
//echo "SELECT shortcode FROM {$wpdb->prefix}sf_surveys WHERE (survey_key = '$key') ";
//echo " Shortcode : ".$tr[0]->shortcode;
//var_dump($tr);
	if( !empty($tr) ){
		
		$sdate=strtotime($tr[0]->startDate);
		$edate=strtotime($tr[0]->endDate);
		$curr=strtotime(date("Y-m-d"));

		if($tr[0]->startDate=='0000-00-00')
		{
			$sdate = 0;
		}
		if($tr[0]->endDate=='0000-00-00')
		{
			$edate = 0;
		}
		if(isset($tr[0]->use_shortcode))
		{
			if(($curr >= $sdate && $curr <= $edate) || ($sdate=='0' && $edate=='0') || ($curr >= $sdate && $edate=='0') || ($sdate=='0' && $curr <= $edate))
			{
				$shortvalue = $Survey->Displayshortcode($key).do_shortcode($content);
			}
			else{

				$shortvalue = '';
			}
		}
	}
return $shortvalue;
}
