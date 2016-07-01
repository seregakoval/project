<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADMIN POS</title>
    <link rel="stylesheet" href="../css/ionicons.css">

	<style>
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			font-family: calibri;
		}

		div, iframe {
			margin: 0;
			padding: 0;
			border: 0;
		}

		.container {
			background: #ffffff none repeat scroll 0 0;
			height: 100%;
			overflow-x: hidden;
			position: relative;
			width: 100%;
		}

		#main_table_wrapper {
			color: #47515a;
			float: left;
			height: calc(100vh - 40px - 30px - 20px);
			width: calc(100%);
		}

		.top_client_menu p {
			color: #3B3B40;
			font-size: 1.1em;
			margin: 0;
			padding-top: 7px;
			font-weight: bold;
		}

		.top_client_menu {
			height: 30px;
			padding-left: 20px;
			text-align: left;
			border-bottom: 1px solid #c3c3c5;
			padding: 10px 15px;
		}
		.top_client_menu span {
			color: #72a7cc;
		}
		.top_client_menu button {
			background: #656565 none repeat scroll 0 0 !important;
			border: medium none;
			border-radius: 10px;
			bottom: 5px;
			color: #fff;
			float: right;
			font-size: 14px;
			position: relative;
			width: 50px;
			padding: 3px;
		}

		 #opener a {
			background-color: #656565;
    		padding: 3px 13px;
    		margin-left: -3px;
    		border-radius: 10px;
    		text-decoration: none;
    		color: white
		}

		#opener a:hover {
			background-color:orange;
		}

		.main_content_hed, .main_content, .main_content.active {
			border-bottom: 1px solid #cccbd9;
			clear: both;
			float: left;
			line-height: 22px;
			padding: 6px;
			width: 100%;
			font-size:15px;
			font-family: calibri;
		}

		.main_content.active {
			background-color:#f4fff4;
		}

		.main_content_hed {
			background-color: #ebebeb;
			border-bottom: 1px solid #cccbd9;
			float: left;
			line-height: 22px;
			padding: 10px;
		}

		.check_button {
			width: 9%;
			float: left;
		}

		.con_id {
			width: 6%;
			float: left;
			font-weight:lighter;
		}

		.con_sub {
			width: 38%;
			float: left;
		}

		.main_content .con_sub{
			color:#72a7cc;
		}

		body{
			margin:0px;
			padding:0px;
		}

		.con_req1{
			width: 17%;
			float: left;
		}

		.con_req2, .con_ass {
			width: 15%;
			float: left;
		}

		.main_content_hed img {
			width: 12px;
		}

		.footer {
			bottom: 10px;
			position: absolute;
			right: 20px;
		}

		.fot_but1 {
			border: none;
			border-radius: 5px;
			padding: 7px 10px;
		}

		.fot_but3 {
			background: #656565 none repeat scroll 0 0;
			border: medium none;
			border-radius: 5px;
			color: #fff;
			padding: 7px 10px;
		}
		.check_button > img {
			padding-left: 18px;
		}

	</style>
</head>

<body>
	<div class="container">


		<div class="right_win">
			<div class="top_client_menu">
				<p>Agents / Louis Armstrong / All unsolved(1-10/10) <img src="../../img/new_arrow.png"> <span>Reset sort order</span>
				<button id="opener" onclick="window.location.href ='dsp_additem.cfm'; "><a href="#">Add</a></button></p>
				<div class="clear"></div>
			</div>

			<form>
			   <div class="main_content_hed">
			        <div class="check_button"><input id='inactivelist' type="checkbox"></div>
			        <div class="con_id">ID</div>
			        <div class="con_sub">SUBJECT<img src="../../img/new_arrow.png">3</div>
			        <div class="con_req1">REQUESTER<img src="../../img/new_arrow.png">2</div>
			        <div class="con_req2">REQUESTER<img src="../../img/new_arrow.png">1</div>
			        <div class="con_ass">ASSIGNEE</div>
			   </div>
			    <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#38</div>
			        <div class="con_sub">Losing integrity in the containment field</div>
			        <div class="con_req1">zendeskdemonstration</div>
			        <div class="con_req2">Aug 29, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			     <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#26</div>
			        <div class="con_sub">After an apache start</div>
			        <div class="con_req1">Louis Armstrong</div>
			        <div class="con_req2">Aug 28, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			      <div class="main_content ">
			        <div class="check_button"><input id='inactivelist' type="checkbox" ><img src="../../img/chebox.png"></div>
			        <div class="con_id">#25</div>
			        <div class="con_sub">Does fork work?</div>
			        <div class="con_req1">Louis Armstrong</div>
			        <div class="con_req2">Aug 28, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			       <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#24</div>
			        <div class="con_sub">Fork into 2 Tickets</div>
			        <div class="con_req1">Louis Armstrong</div>
			        <div class="con_req2">Aug 28, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			        <div class="main_content ">
			        <div class="check_button"><input id='inactivelist' type="checkbox" ><img src="../../img/chebox.png"></div>
			        <div class="con_id">#13</div>
			        <div class="con_sub">Losing integrity in the containment field</div>
			        <div class="con_req1">Ona Lowe</div>
			        <div class="con_req2">Aug 26, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			         <div class="main_content ">
			        <div class="check_button"><input id='inactivelist' type="checkbox" ><img src="../../img/chebox.png"></div>
			        <div class="con_id">#14</div>
			        <div class="con_sub">After an apache start</div>
			        <div class="con_req1">Mrs. Tony Sawayam</div>
			        <div class="con_req2">Aug 26, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			          <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#7</div>
			        <div class="con_sub">Does fork work?</div>
			        <div class="con_req1">Mrs. Skyla Hermann</div>
			        <div class="con_req2">Aug 26, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			           <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#6</div>
			        <div class="con_sub">Fork into 2 Tickets</div>
			        <div class="con_req1">Isabell Greenholt</div>
			        <div class="con_req2">Aug 26, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			            <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id">#5</div>
			        <div class="con_sub">After an apache start</div>
			        <div class="con_req1">Hilario Stehr</div>
			        <div class="con_req2">Aug 26, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>
			             <div class="main_content ">
			        <div class="check_button"><input type="checkbox" id='inactivelist' type="checkbox" ><img src="../../img/cheboxhover.png"></div>
			        <div class="con_id">#1</div>
			        <div class="con_sub">Does fork work?</div>
			        <div class="con_req1">Louis Armstrong</div>
			        <div class="con_req2">Aug 16, 2013</div>
			        <div class="con_ass">Louis Armstrong</div>
			   </div>

			   <div class="footer">
			   	<button type="reset" class="fot_but1">Clear Selection</button> <button class="fot_but3">Join 4 Ticket</button> <button class="fot_but3">Edit 4 Ticket</button>
			   </div>
			  </form>


		</div>

		<div class="clear"></div>

	</div>
</body>
</html>
