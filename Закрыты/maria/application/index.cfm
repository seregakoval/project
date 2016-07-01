<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>WANPOS ADMIN</title>
	<link rel="stylesheet" href="../css/ionicons.css">

	<style>

		.clear {
			clear: both;
		}
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		}

		div, iframe {
			margin: 0;
			padding: 0;
			border: 0;
		}

		.container {
			position: relative;
			width: 100%;
			height: 100%;
			background: #222;
		}

		/* HEADER */
		.toolbar {
			height: 40px;
			background: #aaa;
		}

		/* LEFT SIDE BAR */
		.side-container {
			position: absolute;
			left: 0px;
			top: 40px;
			bottom: 0;
			width: 50px;
			background: #fff;
		}

		/* CONTENT */
		.iframe-container {
			position: absolute;
			left: 50px;
			top: 40px;
			bottom: 0;
			right: 0;
			/*width: 100%;*/
			background: #555;
			overflow-y: hidden;
		}
		.iframe-container iframe {
			position: absolute;
			width: 100%;
			height: 100%;
		}




		/* Left navigation panel */

		#nav_bar {
			padding-top: 6px;
			float: left;
			width: 50px;
			background-color: #ebebeb;
			height: calc(100vh - 46px - 0px);
		}
		#nav_bar a {
			text-decoration: none;
			display: block;
		}
		.outer_wrap {
			color: #b4b4b4;
			font-size:1.3em;
			padding: 10px 0 10px 5px;
			position:relative;
			text-align: center;
		}
		.outer_wrap i:hover, .outer_wrap i:visited  {
			color: #86b100;
		}
		.bot_icon {
			bottom: 0;
			position: absolute;
			width: 50px;
		}

		.orange_circle {
		    background-color: #FF9740;
		    border-radius: 50%;
		    color: white;
		    width: 28px;
		    height: 22px;
		    padding-top: 5px;
		    margin-left: 3px;
		}
		#current{
		    background-color: #77a400;
		    position:relative;
		}
		/* Left navigation panel (END) */





		/* Header styles */

		header {
			background: #434343;
			color: white;
			height: 40px;
			font-size:11px;
		}

		#top_left{
			padding: 11px 0;
			float: left;
			position: relative;
		}

		#home{
			background: #202224 none repeat scroll 0 0;
			border: 1px solid #ddddde;
			border-radius: 50%;
			bottom: 0;
			font-size: 1.6em;
			height: 1.3em;
			margin: auto;
			margin-left: 3px;
			position: absolute;
			text-align: center;
			top: 0;
			width: 1.5em;
		}

		#home i {
			display: inline-block;
			vertical-align: -5%;
		}

		#home:hover {
			cursor: pointer;
		}

		h1 {
			display: inline;
			padding-left: 2.3em;
			font-size: 1.4em;
			margin: 0;
		}

		#top_right {
			display: inline-block;
			float: right;
			height: auto;
			position: relative;
			padding: 3px 0;
			padding:-right: 5px;
		}

		#top_right img {
			height: 30px;
			width: 30px;
		}

		#greeting{
			display:inline-block;
			float: left;
			margin: 6px 13px 0 0;
			padding: 3px 6px;
			color: black;
			background-color: white;
			border-radius: 5px;
		}


		/* Right-pointing arrow */

		.arrow_box {
			position: relative;
			background: #ffffff;
		}
		.arrow_box:after {
			left: 100%;
			top: 50%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-left-color: #ffffff;
			border-width: 5px;
			margin-top: -5px;
		}

		#top_right img {
			display: block;
			float: right;
			border-radius: 50%;
		}

		#top_right a {
			color: black;
			position:absolute;
			bottom:0;
			right:0;
			background-color: white;
			border-radius: 50%;
			text-align: center;
			width: 12px;
			height: 12px;
		}


		/* Top right openable menu */

		#top_nav {
			position: fixed;
			z-index: 2;
			right: 10px;
			top: 55px;
			background-color: white;
			margin: 0;
			padding: 0;
			box-shadow: 2px 2px 1px #828282,
						-2px 2px 1px #828282,
						2px 2px 1px #828282;
		}

		#top_nav:after {
			bottom: 100%;
			left: 80%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-bottom-color: #ffffff;
			border-width: 8px;
			margin-top: -8px;
		}

		#top_nav li {
			list-style: none;
			border-bottom: 2px solid #ededed;
		}

		#top_nav li a {
			display: inline-block;
			width: calc(100% - 20px);
			text-decoration: none;
			color: #47515a;
			padding: 9px 10px;
    		font-size: 0.8em
		}

		#top_nav li a:hover {
			background-color: #ededed;
		}

		/* Header styles (end) */

	</style>




	<script>
		function changeframe(filename){
			frames['contentframe'].location.href = filename;
			//parent.document.itemform.custid.value = custid;
			//parent.document.getElementById('custname').innerHTML = custname;
		}

		function gotopage(filename){
			window.location.href = filename;

		}
	</script>

</head>

<body>

	<ul id="top_nav" style="display:none">
        <li><a href="#"><i class="ion-person"></i>&nbsp;&nbsp;Profile</a></li>
        <li><a href="#"><i class="ion-social-usd"></i>&nbsp;&nbsp;Sales</a></li>
        <li><a href="#"><i class="ion-social-buffer"></i>&nbsp;&nbsp;Comission</a></li>
        <li><a href="#"><i class="ion-log-out"></i>&nbsp;&nbsp;Logout</a></li>
    </ul>

	<div class="container">
		<div class="toolbar">

			<header>
				<div id="top_left">
					<div id="home">
						<i class="icon ion-ios-home"></i>
					</div>
					<h1>wan MANAGER</h1>
				</div>

				<div id="top_right">
					<p id="greeting" class="arrow_box">
						Hi, I'm <span>Christine</span>, from MV outlet
					</p>
					<img src="../img/actress_small.jpg"/>
					<a href="##" onclick="show_hide_menu()"><i class="ion-arrow-down-b"></i></a>
				</div>

				<div class="clear"></div>
			</header>



		</div>

		<div class="side-container">

			<div id="nav_bar">
				<div class="outer_wrap" title="POS" onclick="gotopage('pos/index.cfm');">
					<i class="ion-cash"></i>
				</div>
				<div class="outer_wrap" title="Appointment" onclick="gotopage('crm/appt/index.cfm');">
					<i class="ion-android-calendar"></i>
				</div>
				<div class="outer_wrap" title="Sales" onclick="changeframe('dsp_posframe.cfm');">
					<i class="ion-social-usd"></i>
				</div>
				<div class="outer_wrap" title="CRM" onclick="changeframe('dsp_crmframe.cfm');">
					<i class="ion-person-stalker"></i>
				</div>
				<div class="outer_wrap" title="Inventory" onclick="changeframe('dsp_invframe.cfm');">
					<i class="ion-cube"></i>
				</div>
				<div class="outer_wrap" title="Call Center" onclick="changeframe('dsp_ccframe.cfm');">
					<i class="ion-headphone"></i>
				</div>
				<div class="bot_icon">
					<div class="outer_wrap" title="HR" onclick="changeframe('dsp_hrframe.cfm');">
						<i class="ion-ios-color-filter"></i>
					</div>
					<div class="outer_wrap" title="Accounting" onclick="changeframe('dsp_accframe.cfm');">
						<i class="ion-calculator"></i>
					</div>

					 <div class="outer_wrap">
						<i class="ion-help-buoy"></i>
					</div>

				   <div class="outer_wrap" title="Dashboard" onclick="changeframe('dsp_dashboard.cfm');">
						<i class="ion-stats-bars"></i>
					</div>

				   <div class="outer_wrap"  title="System Admin" onclick="changeframe('dsp_dashboard.cfm');">
						<i class="ion-gear-b"></i>
					</div>

				</div>

			</div>




			<!---div id="nav_bar">
				<div class="outer_wrap" title="New Sales" onclick="changeframe('dsp_dashboard.cfm');">
					<div class="orange_circle">
					 <i class="icon ion-social-usd"></i>
					</div>
				</div>
				<div class="outer_wrap" title="Activity"  onclick="changeframe('dsp_adminpos.cfm');">
					<i class="icon ion-android-settings"></i>
				</div>
				<div class="outer_wrap" title="Profile" id="current">
					<i class="icon ion-person"></i>
				</div>
				<div class="outer_wrap" title="Sales History">
					<i class="icon ion-android-cart"></i>
				</div>
				<div class="outer_wrap" title="Payment">
					<i class="icon ion-cash"></i>
				</div>
				<div class="outer_wrap" title="Collection">
					<i class="icon ion-briefcase"></i>
				</div>

			</div--->

		</div>

		<div class="iframe-container">
			<iframe src="" frameborder="0" name="contentframe">Your browser is kaput!</iframe>
		</div>
	</div>

	<script src="JS/show_menu.js"></script>

</body>
</html>
