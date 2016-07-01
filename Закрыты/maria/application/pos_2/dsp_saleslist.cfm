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
			height: 30.5px;
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
			width: 120px;
			padding: 4px 5px;
		}

		 /*#opener a {
			background-color: #656565;
    		padding: 4px 15px;
			text-align: center;
		    margin-left: -11px;
		    margin-right: -11px;
    		border-radius: 10px;
    		text-decoration: none;
    		color: white
		}

		#opener a:hover {
			background-color:orange;
		}*/

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

 <cfquery name="getsales" datasource="#dbname#">
	select * from sales_hdr limit 13

</cfquery>


<body>
	<div class="container">


		<div class="right_win fg>
			<div class="top_client_menu">
				<p>Today Sales <img src="../../img/new_arrow.png"> <span>Reset sort order</span>
				<button id="opener" onclick="window.location.href ='dsp_additem.cfm'; "><a href="#">Sales History</a></button></p>
				<div class="clear"></div>
			</div>

			<form>
			   <div class="main_content_hed">
			        <div class="check_button"><input id='inactivelist' type="checkbox"></div>
			        <div class="con_id">No</div>
			        <div class="con_sub">SALESNO<img src="../../img/new_arrow.png"></div>
			        <div class="con_req1">CUSTOMER<img src="../../img/new_arrow.png"></div>
			        <div class="con_req2">AMOUNT<img src="../../img/new_arrow.png"></div>
			        <div class="con_ass">SALESDATE</div>
			   </div>
			   <cfoutput>
			   <cfloop query="getsales">
			    <div class="main_content">
			        <div class="check_button"><input id='inactivelist' type="checkbox"><img src="../../img/chebox.png"></div>
			        <div class="con_id" style="width:6%;">#getsales.currentrow#</div>
			        <div class="con_sub" style="width:10%;">#getsales.salesno#</div>
			        <div class="con_req1" style="width:20%;">#getsales.custname#</div>
			        <div class="con_req2" style="width:20%;">#decimalformat(getsales.total)#</div>
			        <div class="con_ass" style="width:20%;">#dateformat(trans_date,"dd-mm-yyyy")#</div>
			   </div>
			   </cfloop>
			   </cfoutput>

			   <div class="footer">
			   	<button type="reset" class="fot_but1">Clear Selection</button> <button class="fot_but3">Join 4 Ticket</button> <button class="fot_but3">Edit 4 Ticket</button>
			   </div>
			  </form>


		</div>

		<div class="clear"></div>

	</div>
</body>
</html>
