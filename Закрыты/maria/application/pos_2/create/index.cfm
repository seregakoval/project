<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page 01</title>
    <link rel="stylesheet" href="css/ionicons.css">

    <!-- The next file is for the custom scrollbar -->
    <script src="js/perfect-scrollbar.min.js"></script>
    <script>
		function changeframe(filename,id){

			document.getElementById("page_1").className = "outer_wrap" ;
			document.getElementById("page_2").className = "outer_wrap" ;
			document.getElementById("page_3").className = "outer_wrap" ;
			document.getElementById("page_4").className = "outer_wrap" ;
			document.getElementById("page_5").className = "outer_wrap" ;
			document.getElementById("page_6").className = "outer_wrap" ;
			document.getElementById("page_7").className = "outer_wrap" ;
			document.getElementById("page_8").className = "outer_wrap" ;
			document.getElementById("page_9").className = "outer_wrap" ;

			document.getElementById(id).className = "outer_wrap current" ;

			var custid = parent.document.itemform.custid.value ;
			var url = filename + "?custid=" + custid ;
			frames['main_table_wrapper'].location.href = url;

			//parent.document.itemform.custid.value = custid;
			//parent.document.getElementById('custname').innerHTML = custname;

		}

		function gensales(){
			window.location.href="create/index.cfm?fuseaction=createsales&custid=" + parent.document.itemform.custid.value + "&type=2";
			//window.location.href='dsp_sales.cfm?custid=' + parent.document.itemform.custid.value;
		}

		function changesearch(type){
			if (type == "type"){
				document.getElementById("input_container").style.display = "none" ;
				document.getElementById("input_container2").style.display = "block" ;
				document.getElementById("input_container3").style.display = "none" ;

			} else if (type == "branch"){
				document.getElementById("input_container").style.display = "none" ;
				document.getElementById("input_container2").style.display = "none" ;
				document.getElementById("input_container3").style.display = "block" ;

			} else {
				document.getElementById("input_container").style.display = "block" ;
				document.getElementById("input_container2").style.display = "none" ;
				document.getElementById("input_container3").style.display = "none" ;

			}
		}

		function searchdata(){
			var searchtype = document.getElementById("searchtype").value ;
			var datavalue = document.getElementById("search_input").value ;

			document.getElementById("client_wrapper").src = "dsp_customerlist.cfm?datavalue="+datavalue+"&searchtype="+searchtype;
		}



    </script>

		<style>
			@font-face {
			    font-family: MyriadPro;
			    src: url("../fonts/MyriadPro-Regular.otf") format("opentype");
			    src: url("../fonts/MyriadPro-Regular.woff") format("woff");
			}
						.clear {
			    clear: both;
			}

			body {
			    width: 100%;
			    font-family: MyriadPro;
			    font-size: 11px;
			    line-height: 130%;
			    margin: 0;
			    padding: 0;
			    color: #515e67;
			}

			/* Header styles */

			header {
			    background: #434343;
			    color: white;
			    padding: 5px;
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
			    padding: 10px;
			    font-size: 1.2em;
			}

			#top_nav li a:hover {
			    background-color: #ededed;
			}

			.left_win {
			    width: 200px;
			    float: left;
			    background-color: #ebebeb;
			    height: calc(100vh - 40px); /* 100% viewport height - header */
			    border-right: 1px solid #c3c3c5;
			}

			.right_win {
			    float: left;
			    width: calc(100% - 201px);
			    height: calc(100% - 70px);
			}

			/* Two top left buttons */

			.button1 {
			    float: left;
			    text-align: center;
			    color: #515e67;
			    background-color: #d4d4d4;
			    padding: 5px 0;
			    border-bottom: 1px solid #c3c3c5;
			    border-right: 1px solid #c3c3c5;
			    width: calc(50% - 1px);
			    height: 35px;
			}

			.button1:hover {
			    cursor: pointer;
			    background-color: #FF9740;
			    border-bottom-color: #FF9740;
			    color: white;
			}

			#walk_in_sales_button {
			    border-right: none;
			    width: 50%;
			}

			.button1 i {
			    font-size: 2em;
			}

			.button1 p {
			    margin: 0;
			}

			/* Search field and drop-down list */

			.panel_wrapper {
			    width: 100%;
			    padding: 10px 0;
			}

			#search_container {
			    width: auto;
			    border-bottom: 1px solid #cccbd9;
			    padding-bottom: 10px;
			    margin-left: 10px;
			    margin-right: 10px;
			}

			#input_container {
			    float: left;
			    position:relative;
			    padding:0;
			    margin:0;
			    width: 52%;
			}
			#input_container2 {
			    float: left;
			    position:relative;
			    padding:0;
			    margin:0;
			    width: 52%;
			}
			#input_container3 {
			    float: left;
			    position:relative;
			    padding:0;
			    margin:0;
			    width: 52%;
			}

			#search_input {
			    box-sizing: border-box;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    margin:0;
			    width: 100%;
			    height: 25px;
			    border: 2px solid #cccbd9;
			    border-radius: 10px;
			    padding-left: 5%;
			    font-size: 1em;
			}

			#input_container i {
			    float: left;
			    position:absolute;
			    bottom:45%;
			    right:6px;
			    height:9px;
			    color: #8db342;
			    font-size: 1.4em;
			}

			#input_container i:hover {
			    cursor: pointer;
			}

			#select_container {
			    display: inline-block;
			    position: relative;
			    float: right;
			    width: 42%;
			}

			#search_container select {
			    box-sizing: border-box;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    height: 25px;
			    width: 100%;
			    border: 2px solid #cccbd9;
			    border-radius: 10px;
			    font-weight: bold;
			    font-size: 1em;
			    color: #515e67;
			    background: transparent;
			    padding-left: 5px;
			}

			.styled-select {
			    width: 100%;
			    height: auto;
			    overflow: hidden;
			    border-radius: 10px;
			    background: url(../img/new_arrow.png) no-repeat right white;
			}

			/* hide default arrow in IE */

			#search_container select::-ms-expand {
			    display: none;
			}

			/* Left panel clients */

			#client_wrapper {
			    position: relative;
			    overflow: hidden;
			    height: calc(100vh - 40px - 47px - 20px - 37px - 20px); /* VHeight - header - buttons - padding - search panel - additional pixels */
			}

			.top_client_menu {
			    background-color: #77a600;
			    text-align: center;
			    height: 30px;
			}

			.green_menu_button {
			    display: inline-block;
			    float: left;
			    color: white;
			    padding: 5px 0 0 10px;
			    font-size: 2em;
			}

			.green_menu_button:hover {
			    cursor: pointer;
			}

			.top_client_menu p {
			    font-size: 1.4em;
			    padding-top: 7px;
			    margin: 0;
			    color: white;
			}

			/* Right navigation panel */

			#nav_bar {
			    float: right;
			    width: 40px;
			    background-color: #ebebeb;
			    height: calc(100vh - 40px - 30px);
			}

			#nav_bar a {
			    text-decoration: none;
			    display: block;
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

			.current{
			    background-color: #77a400;
			    position:relative;
			}

			/* right-pointing white arrow */

			.current:after{
			    content:"";
			    display:inline-block;
			    position:absolute;
			    border:4px solid white;
			    border-color:transparent transparent transparent white;
			    top:40%;
			    left:0px;
			}

			#main_table_wrapper {
			    float: left;
			    padding: 5px;
			    color: #47515a;
			    width: calc(100% - 40px - 10px); /* -right panel width and -left and right padding */
			    height: calc(100vh - 40px - 30px - 40px);
			}

		</style>

</head>

<body>

    <ul id="top_nav" style="display:none">
        <li><a href="#"><i class="ion-person"></i>&nbsp;&nbsp;Profile</a></li>
        <li><a href="#"><i class="ion-social-usd"></i>&nbsp;&nbsp;Sales</a></li>
        <li><a href="#"><i class="ion-social-buffer"></i>&nbsp;&nbsp;Comission</a></li>
        <li><a href="#"><i class="ion-log-out"></i>&nbsp;&nbsp;Logout</a></li>
    </ul>

    <header>
        <div id="top_left">
            <div id="home">
                <i class="icon ion-ios-home"></i>
            </div>
            <h1><a href="#" onclick="window.location='../../index.cfm';">wanERP</a></h1>
        </div>

        <div id="top_right">
            <p id="greeting" class="arrow_box">
                Hi, I'm <span>Christine</span>, from MV outlet
            </p>
            <img src="img/actress_small.jpg"/>
            <a href="#" onclick="show_hide_menu()"><i class="ion-arrow-down-b"></i></a>
        </div>

        <div class="clear"></div>
    </header>

    <div class="left_win">

        <div class="button1">
            <i class="icon ion-person-add"></i>
            <p>New Customer</p>
        </div>

        <div class="button1" id="walk_in_sales_button">
            <i class="icon ion-social-usd"></i>
            <p>Walk In Sales</p>
        </div>
        <div class="clear"></div>

        <div class="panel_wrapper">

            <div id="search_container">
                <div id="input_container">
                    <input type="text" id="search_input" placeholder="Search..." onkeyup="searchdata()">
                    <i class="icon ion-search"></i>
                </div>

               <div id="input_container2" style="display:none">
					<cfquery name="getdata" datasource="#dbname#">
						select * from clitype order by id
					</cfquery>
					<cfoutput>
						<select id="search_input" name="search_input" onchange="searchdata()">
							<option value="">-Please Select-</option>
							<cfloop query="getdata">
								<option value="#getdata.id#">#getdata.description#</option>
							</cfloop>
						</select>
					</cfoutput>
               </div>
               <div id="input_container3" style="display:none">
					<cfquery name="getdata" datasource="#dbname#">
						select * from branch order by id
					</cfquery>
					<cfoutput>
						<select id="search_input" name="search_input" onchange="searchdata()">
							<option value="">-Please Select-</option>
							<cfloop query="getdata">
								<option value="#getdata.id#">#getdata.description#</option>
							</cfloop>
						</select>
					</cfoutput>
                </div>
               <div id="select_container">
                    <div class="styled-select">
						<select name="searchtype" onchange="changesearch(this.value);searchdata();" id="searchtype">
							<option value="memberno">Member No</option>
							<option value="custno">Customer No</option>
							<option value="name">Name</option>
							<option value="ic">I/C</option>
							<option value="mobile">Mobile</option>
							<option value="type">Type</option>
							<option value="branch">Branch</option>
						</select>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        <!-- This iframe has custom scrollbar -->
            <iframe src="dsp_customerlist.cfm"
                    frameBorder="0"
                    id="client_wrapper"
                    width="100%"
                    scrolling="yes">
            </iframe>
        </div>
    </div>

    <div class="right_win">
        <div class="top_client_menu">
            <div class="green_menu_button"><i class="ion-navicon-round"></i></div>
            <!--- <p>Tan Mei Mei</p> --->
			<p id="custname">&nbsp;</p><form name="itemform" action="index.cfm" method="post"><input name="custid" type="hidden" value=""></form>
            <div class="clear"></div>
        </div>

        <!-- This iframe has custom scrollbar -->
        <iframe src=""
                frameBorder="0"
                id="main_table_wrapper"
		name="main_table_wrapper"
                scrolling="no">
        </iframe>

        <div id="nav_bar">
            <a href="page11.html">
                <div class="outer_wrap" title="New Sales" onclick="gensales();">
                    <div class="orange_circle">
                        <i class="icon ion-social-usd"></i>
                    </div>
                </div>
            </a>
            <div class="outer_wrap" title="Activity" id="page_1" onclick="changeframe('page11_iframe_main.html',this.id);">
                <i class="icon ion-android-settings"></i>
            </div>

            <div class="outer_wrap current" title="Profile" id="page_2" onclick="changeframe('profile/dsp_profile.cfm',this.id);">
                <i class="icon ion-person"></i>
            </div>
           <!---  <a href="page02.html"> --->
                <div class="outer_wrap" title="Sales History" id="page_3"  onclick="changeframe('dsp_saleshistory.cfm',this.id);">
                    <i class="icon ion-android-cart"></i>
                </div>
            <!--- </a> --->
            <!--- <a href="page05_06.html"> --->
                <div class="outer_wrap" title="Payment" id="page_4"  onclick="changeframe('dsp_payment.cfm',this.id);">
                    <i class="icon ion-cash"></i>
                </div>
           <!---  </a> --->
           <!---  <a href="page03_04.html"> --->
                <div class="outer_wrap" title="Collection" id="page_5"  onclick="changeframe('dsp_collectionhistory.cfm',this.id);">
                    <i class="icon ion-briefcase"></i>
                </div>
           <!---  </a> --->
           <!---  <a href="page07.html"> --->
                <div class="outer_wrap" title="Maintainance" id="page_6" onclick="changeframe('dsp_maintenance.cfm',this.id);">
                    <i class="icon ion-wrench"></i>
                </div>
           <!---  </a> --->
           <!---  <a href="page09.html"> --->
                <div class="outer_wrap" title="Point" id="page_7" onclick="changeframe('dsp_points.cfm',this.id);">
                    <i class="icon ion-heart"></i>
                </div>
           <!---  </a> --->
           <!---  <a href="page08.html"> --->
                <div class="outer_wrap" title="Service" id="page_8" onclick="changeframe('dsp_endservice.cfm',this.id);">
                    <i class="icon ion-happy-outline"></i>
                </div>
            <!--- </a> --->
           <!---  <a href="page10.html"> --->
                <div class="outer_wrap" title="Service History" id="page_9" onclick="changeframe('dsp_servicehistory.cfm',this.id);">
                    <i class="icon ion-document-text"></i>
                </div>
           <!---  </a> --->
        </div>
    </div>

    <div class="clear"></div>

    <script src="js/show_menu.js"></script>

<!-- This script adds custom scrollbar to the iframe (actually to the inner content of the iframe) -->
    <script>

    </script>
</body>

</html>
