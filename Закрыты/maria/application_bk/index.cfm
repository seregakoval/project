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
			height: 50px;
			background: #aaa;
		}
	
		/* LEFT SIDE BAR */
		.side-container {
			position: absolute;
			left: 0px;
			top: 50px;
			bottom: 0;
			width: 40px;
			background: #fff;
		}
		
		/* CONTENT */
		.iframe-container {
			position: absolute;
			left: 40px;
			top: 50px;
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
		
		
		
		
		/* Right navigation panel */
		
		#nav_bar {
		    float: right;
		    width: 40px;
		    background-color: #ebebeb;
		    height: calc(100vh - 140px - 130px);
		}
		.outer_wrap {
		    font-size: 1.5em;
		    text-align: center;
		    color: #3f484f; 
		    padding: 10px 0 10px 5px;
		    position:relative; 
		}
		.outer_wrap:hover {
		    cursor: pointer;
		    background-color: #77a400;
		}
		.outer_wrap:hover:after {
		    content:"";
		    display:inline-block;
		    position:absolute;
		    border:4px solid white;
		    border-color:transparent transparent transparent white;
		    top:40%;
		    left:0px;
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
		/* Right navigation panel (END) */
	




		/* Header styles */

		header {
			background: #434343;
			color: white;
			padding: 5px;   
			width: 100%;
			font-family: MyriadPro;
			font-size: .7em;
			line-height: 130%;
			margin: 0;
			padding: 0;
		}

		#top_left{
			padding: 7px 0;
			float: left;
			position: relative;
		}

		#home{
			background: #202224;
			width: 1.5em;
			height: 1.5em;
			border: 1px solid #ddddde;
			border-radius: 50%;
			margin: auto;
			position: absolute;
			top: 0; 
			bottom: 0;
			text-align: center;
			font-size: 1.4em;
		}

		#home i {
			display: inline-block;
			vertical-align: -30%;
		}

		#home:hover {
			cursor: pointer;
		}

		h1 { 
			display: inline;
			padding-left: 2em; 
			font-size: 1.4em;
			margin: 0;   
		}

		#top_right {    
			display:inline-block;
			position:relative;
			float: right;
			height: auto;
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



	
	</style>
	
	
	
	
	<script>
		function changeframe(filename){
			frames['contentframe'].location.href = filename;
			//parent.document.itemform.custid.value = custid;
			//parent.document.getElementById('custname').innerHTML = custname;
		}
	</script>
	
</head>

<body>
	<div class="container">
		<div class="toolbar">

			<header>
				<div id="top_left">
					<div id="home">
						<i class="icon ion-ios-home"></i>
					</div>
					<h1>Klientec IBeauty Manager 11</h1>
				</div>

				<div id="top_right">
					<p id="greeting" class="arrow_box">
						Hi, I'm <span>Christine</span>, from MV outlet
					</p>
					<img src="img/actress_small.jpg"/> 
					<a href="##" onclick="show_hide_menu()"><i class="ion-arrow-down-b"></i></a>
				</div>
       
				<div class="clear"></div>
			</header>


	
		</div>
		
		<div class="side-container">

			<div id="nav_bar">
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

			</div>
			
		</div>
		
		<div class="iframe-container">
			<iframe src="" frameborder="0" name="contentframe">Your browser is kaput!</iframe>
		</div>
	</div>
</body>
</html>
