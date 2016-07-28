<?php
if( !defined( 'ABSPATH') && !defined('WP_UNINSTALL_PLUGIN') ){echo 'abc';exit();}

global $wpdb;
  $thetable = $wpdb->prefix."sf_surveys";
  $wpdb->query("DROP TABLE IF EXISTS $thetable");
  
   $thetable = $wpdb->prefix."sf_survey_questions";
  $wpdb->query("DROP TABLE IF EXISTS $thetable");
  
   $thetable = $wpdb->prefix."sf_survey_results";
  $wpdb->query("DROP TABLE IF EXISTS $thetable");
  
   $thetable = $wpdb->prefix."sf_survey_stats";
  $wpdb->query("DROP TABLE IF EXISTS $thetable");
  
  $thetable = $wpdb->prefix."sf_survey_rules";
  $wpdb->query("DROP TABLE IF EXISTS $thetable");
  
  
  
  
?>