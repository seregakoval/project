<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page 12</title>
    <link rel="stylesheet" href="css/ionicons.css">
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <!-- The next file is for the custom scrollbar -->
    <script src="js/perfect-scrollbar.min.js"></script>
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

		/* Page 12 specific layout */

		/* Next two rules fix shadow and arrow for top right menu */

		#top_nav {
		    box-shadow: 0px 0px 2px 2px rgba(130,130,130, 0.7);
		}

		#top_nav:after {
		    bottom: 100%;
			left: 80%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-bottom-color: #828282;
			border-width: 8px;
			margin-top: -8px;
		}

		.left_win {
		    width: 250px;
		    float: left;
		    background-color: #ebebeb;
		    height: calc(100vh - 40px); /* 100% viewport height - header */
		    border-right: 1px solid #e6e6e6;
		    color: #3e474c;
		}

		.right_win {
		    float: right;
		    width: calc(100% - 251px);
		    height: calc(100vh - 40px); /* 100% viewport height - header - green line */
		}

		/* Top left list&calendar panel */

		#calendar_panel {
		    border-radius: 5px;
		    margin: 10px;
		}

		.tab {
		    text-align: center;
		    padding: 5px 0;
		    color: #3e474c;
		    border: 1px solid white;
		    border-top-left-radius: 5px;
		    border-top-right-radius: 5px;
		    border-bottom: none;
		}

		#list_tab {
		    float: left;
		    width: 43%;
		}

		#calendar_tab {
		    float: right;
		    width: 53%;
		}

		.selected_tab {
		    background-color: white;
		}

		.tab:hover {
		    cursor: pointer;
		}

		.hidden {
		    display: none;
		}

		#calendar_content {
		    padding-top: 10px;
		    background-color: white;
		    position: relative;
		}

		#list_content {
		    height: 240px;
		    background-color: white;
		}

		#calendar_content, #main_wrapper {
		    height: 230px;
		}

		#calendar_iframe {
		    height: 190px;
		}

		#calendar_table {
		    text-align: center;
		    margin: 0 auto;
		    color: #3F464C;
		    width: 100%;
		    margin-bottom: 5px;
		}

		#calendar_table td:hover {
		    cursor: pointer;
		}

		#prev_month, #current_month, #next_month {
		    padding: 10px 0;
		    font-size: 1.2em;
		    display: inline-block;
		    text-align: center;
		}

		#prev_month, #next_month {
		    width: 24%;
		}

		#current_month {
		    width: 49%;
		    color: #3F464C;
		}

		.month_switcher {
		    color: #FF9740;
		}

		.month_switcher:hover {
		    cursor: pointer;
		}

		.selected_date{
		    color: white;
		    background-color: #FF9740;
		    border-radius: 5px;
		}

		/* Day, week, month buttons */

		.orange_button {
		    display: inline-block;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 5px 0;
		    border-radius: 5px;
		    width: 32%;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		/* Move buttons down */

		#main_wrapper {
		    position: relative;
		}

		.buttons_wrapper {
		    position: absolute;
		    bottom: 10px;
		    width: 90%;
		    padding: 0 5%;
		}

		.hidden {
		    display: none;
		}

		/* Search panel */

		.left_win h3 {
		    margin: 0 0 0 10px;
		}

		#search_panel {
		    margin: 10px;
		    padding: 10px;
		    border: 1px solid white;
		    border-radius: 5px;
		    position: relative;
		    height: calc(100vh - 385px);
		    overflow: hidden;
		}

		#search_panel p, h4 {
		    margin: 5px 0;
		}

		#search_panel input {
		    box-sizing: border-box;
		    border-radius: 5px;
		    border: 1px solid #CCCBD9;
		    color: #3e474c;
		    padding: 2px;
		}


		#minimum_price {
		    float: left;
		    width: 49%;
		}

		#maximum_price {
		    float: right;
		    width: 49%;
		}

		.bed_bath {
		    float: left;
		    width: 30%;
		    margin-right: 5px;
		}

		#button_wrapper {
		    text-align: center;
		}

		#refresh_button {
		    color: white;
		    background-color: #ff9740;
		    border-radius: 5px;
		    text-align: center;
		    margin: 0 auto;
		    width: 60%;
		    padding: 5px 0;
		    font-size: 1.2em;
		}

		#refresh_button:hover {
		    cursor: pointer;
		}

		::-webkit-input-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		:-moz-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		::-moz-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		:-ms-input-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}

		/* Custom select */

		.styled-select select {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    width: 100%;
		    border: 1px solid #cccbd9;
		    border-radius: 5px;
		    font-weight: bold;
		    font-size: 1em;
		    color: #515e67;
		    background: transparent;
		    padding-left: 5px;
		    height: 30px;
		}

		.styled-select {
		    display: block;
		    float: left;
		    height: auto;
		    overflow: hidden;
		    background: url(../img/new_arrow.png) no-repeat right white;
		    border-radius: 5px;
		}

		/* Custom checkbox */

		.checkbox_wrapper {
		    margin: 5px 0;
		}

		input[type=checkbox].css-checkbox {
		    position:absolute;
		    z-index:-1000;
		    left:-1000px;
		    overflow: hidden;
		    clip: rect(0 0 0 0);
		    height:1px;
		    width:1px;
		    margin:-1px;
		    padding:0;
		    border:0;
		}

		input[type=checkbox].css-checkbox + label.css-label {
		    padding-left:18px;
		    height:13px;
		    display:inline-block;
		    line-height:13px;
		    background-repeat:no-repeat;
		    background-position: 0 0;
		 /*   vertical-align:middle; */
		    cursor:pointer;
		}

		input[type=checkbox].css-checkbox:checked + label.css-label {
		    background-position: 0 -13px;
		}

		label.css-label {
		    background-image:url("../img/checkbox12.png");
		    -webkit-touch-callout: none;
		    -webkit-user-select: none;
		    -khtml-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		}

		/* Main window */

		/* Top line of buttons */

		#top_line {
		    width: 100%;
		    padding: 10px 0;
		}

		#appointment_button, #center_week_selector {
		    display: block;
		    color: white;
		    background-color: #ff9740;
		    border-radius: 5px;
		    text-align: center;
		    padding-top: 8px;
		    font-size: 1.2em;
		    width: 120px;
		    margin-left: 10px;
		    height: 22px;
		}

		#appointment_button {
		    float: left;
		}

		#center_week_selector {
		    float: right;
		    width: 150px;
		    margin: 0;
		}

		#appointment_button:hover {
		    cursor: pointer;
		}

		/* Specific styles for selects on the left panel */

		#search_panel select {
		    height: 25px;
		}

		#search_panel .styled-select {
		    width: 90%;
		}

		#location_select {
		    margin-left: 20px;
		    width: 120px;
		}

		#massage_select {
		    margin-left: 5px;
		    width: 150px;
		}

		#week_select {
		    margin-left: 20px;
		    width: 100px;
		    position: relative;
		}

		#week_select select {
		    padding-left: 25px;
		}

		#week_select i {
		    position: absolute;
		    left: 8px;
		    top: 4px;
		    font-size: 20px;
		    color: #515e67;
		}

		#print_button, #next_week_button, #prev_week_button {
		    float: right;
		    border: 1px solid #cccbd9;
		    border-radius: 5px;
		    padding-top: 8px;
		    font-size: 1.2em;
		    height: 20px;
		    text-align: center;
		    width: 70px;
		    margin-right: 10px;
		    color: #515e67;
		}

		#print_button:hover, #next_week_button:hover, #prev_week_button:hover {
		    cursor: pointer;
		}

		#next_week_button {
		    width: 50px;
		    margin-right: 50px;
		    margin-left: 2px;
		}

		#prev_week_button {
		    width: 50px;
		    margin-right: 2px;
		}

		/* Second line of buttons */

		#second_line {
		    color: #515e67;
		    font-size: 1.4em;
		    padding-left: 10px;
		    padding-top: 15px;
		    margin-bottom: 20px;
		}

		#second_line p {
		    margin: 0;
		}

		#second_line p {
		    display: inline-block;
		    margin-left: 5px;
		    margin-right: 15px;
		}

		#second_line div {
		    display: inline-block;
		}

		.green_number, .orange_number {
		    color: white;
		    border-radius: 5px;
		    padding: 5px 10px;
		    margin-right: 5px;
		}

		.green_number {
		    background-color: #76a500;
		}

		.orange_number {
		    background-color: #ff9740;
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
            <h1>Klientec IBeauty Manager 11</h1>
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

        <div id="calendar_panel">
            <div class="tab" id="list_tab" onclick="switch_tab(this)">
                LIST
            </div>
            <div class="tab selected_tab" id="calendar_tab" onclick="switch_tab(this)">
                CALENDAR
            </div>

            <div class="clear"></div>

            <div id="list_content" class="hidden">
            </div>

            <div id="calendar_content">
                <iframe src="page12_iframe_calendar.html"
                        id="calendar_iframe"
                        scrolling="no"
                        frameborder="0"
                        style="width: 100%;">
                </iframe>
                <div class="buttons_wrapper">
                    <div class="orange_button" id="day_button" onclick="switch_view(this)">DAY</div>
                    <div class="orange_button" id="week_button" onclick="switch_view(this)">WEEK</div>
                    <div class="orange_button" id="month_button" onclick="switch_view(this)">MONTH</div>
                </div>
            </div>
        </div>

        <h3>Search:</h3>

        <div id="search_panel">
            <form>
                <div id="city">
                    <h4>City:</h4>
                    <div class="styled-select">
                        <select>
                            <option value="option1">New York</option>
                            <option value="option2">Barcelona</option>
                            <option value="option3">Chicago</option>
                            <option value="option4">London</option>
                            <option value="option5">Moscow</option>
                        </select>
                    </div>
                </div>
                <div id="minimum_price">
                    <h4>Min Price ($):</h4>
                    <div class="styled-select">
                        <select>
                            <option value="option1">0</option>
                            <option value="option2">50</option>
                            <option value="option3">100</option>
                            <option value="option4">1000</option>
                            <option value="option5">10000</option>
                        </select>
                    </div>
                </div>
                <div id="maximum_price">
                    <h4>Max Price ($):</h4>
                    <div class="styled-select">
                        <select>
                            <option value="option1">0</option>
                            <option value="option2">50</option>
                            <option value="option3">100</option>
                            <option value="option4">1000</option>
                            <option value="option5">10000</option>
                        </select>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="bed_bath">
                    <h4>Bedrooms:</h4>
                    <div class="styled-select">
                        <select>
                            <option value="option1">0</option>
                            <option value="option2">1</option>
                            <option value="option3">2</option>
                            <option value="option4">3</option>
                            <option value="option5">4+</option>
                        </select>
                    </div>
                </div>
                <div class="bed_bath">
                    <h4>Bathrooms:</h4>
                    <div class="styled-select">
                        <select>
                            <option value="option1">0</option>
                            <option value="option2">1</option>
                            <option value="option3">2</option>
                            <option value="option4">3</option>
                            <option value="option5">4+</option>
                        </select>
                    </div>
                </div>
                <div class="clear"></div>
                <h4>Property Types:</h4>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="family_checkbox" class="css-checkbox">
                    <label class="css-label" for="family_checkbox">Single Family Home</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="condo_checkbox" class="css-checkbox">
                    <label class="css-label" for="condo_checkbox">Condo/Town/House</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="farm_checkbox" class="css-checkbox">
                    <label class="css-label" for="farm_checkbox">Farm</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="mobile_checkbox" class="css-checkbox">
                    <label class="css-label" for="mobile_checkbox">Mobile</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="other_checkbox" class="css-checkbox">
                    <label class="css-label" for="other_checkbox">Other</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="timeshare_checkbox" class="css-checkbox">
                    <label class="css-label" for="timeshare_checkbox">Timeshare</label>
                </div>
                <div class="checkbox_wrapper">
                    <input type="checkbox" id="any_checkbox" class="css-checkbox">
                    <label class="css-label" for="any_checkbox">Any</label>
                </div>
                <div id="refresh_button">REFRESH RESULTS</div>
            </form>
        </div>

    </div>

    <div class="right_win fg">
        <div id="top_line">
            <div id="appointment_button">
                <i class="ion-plus"></i>&nbsp;Appointment
            </div>
            <div class="styled-select" id="location_select">
                <select>
                    <option value="option1">Location</option>
                    <option value="option2">New York</option>
                    <option value="option3">San Francisco</option>
                    <option value="option4">Detroit</option>
                </select>
            </div>
            <div class="styled-select" id="massage_select">
                <select>
                    <option value="option1">Massage Therapies</option>
                    <option value="option2">Option 2</option>
                    <option value="option3">Option 3</option>
                    <option value="option4">Option 4</option>
                </select>
            </div>
            <div class="styled-select" id="week_select">
                <i class="ion-calendar"></i>
                <select>
                    <option value="option1">Week</option>
                    <option value="option2">Option 2</option>
                    <option value="option3">Option 3</option>
                    <option value="option4">Option 4</option>
                </select>
            </div>

            <div id="print_button">
                <i class="ion-android-print"></i>&nbsp;Print
            </div>
            <div id="next_week_button" onclick="next_week()">&gt;&gt;</div>
            <div id="center_week_selector">1 - 7 Nov 2015</div>
            <div id="prev_week_button" onclick="prev_week()">&lt;&lt;</div>
            <div class="clear"></div>
        </div>
        <div id="second_line">
            <i class="ion-android-time"></i>
            <p>08:00</p>
            <div class="green_number">6</div>
            <div class="orange_number">6</div>
            <div class="clear"></div>
        </div>
        <!-- This iframe has custom scrollbar -->
        <iframe src="page12_iframe_appointments.html"
                id="appointments_iframe"
                scrolling="no"
                frameborder="0"
                style="width: 100%;
                       height: calc(100vh - 160px)">
        </iframe>
    </div>

    <script src="js/show_menu.js"></script>
    <script>
        /* Adding custom scrollbar */
        var iframe = document.querySelector('#appointments_iframe');
            iframe.onload = function () {
            Ps.initialize(iframe.contentDocument.querySelector('#contentHolder'));
        };

        var container = document.getElementById('search_panel');
        Ps.initialize(container);

        /* Most of this is for switching weeks in upper right corner */

        var month = new Array();
        month[0] = "Jan";
        month[1] = "Feb";
        month[2] = "Mar";
        month[3] = "Apr";
        month[4] = "May";
        month[5] = "Jun";
        month[6] = "Jul";
        month[7] = "Aug";
        month[8] = "Sep";
        month[9] = "Oct";
        month[10] = "Nov";
        month[11] = "Dec";

        var date = new Date();
        date.setDate(1); /* Start with the first day of the month */

        set_week();

        function set_week(){
            var days_in_month = daysInMonth(date.getMonth(), date.getFullYear());

            /* If we're near the end of the month the end day will be the last day of the month */
            if(date.getDate() >= 29) {
                document.getElementById("center_week_selector").innerHTML = date.getDate() + ' - ' +
                                                                            days_in_month + ' ' +
                                                                            month[date.getMonth()] + " " +
                                                                            date.getFullYear();
            } else {
                document.getElementById("center_week_selector").innerHTML = date.getDate() + ' - ' +
                                                                            (date.getDate() + 6) + ' ' +
                                                                            month[date.getMonth()] + " " +
                                                                            date.getFullYear();
            }
        }

        function next_week(){
            if(date.getDate() >= 29) {
                date.setDate(daysInMonth(date.getMonth(), date.getFullYear()) + 1);
            } else {
                date.setDate(date.getDate() + 7);
            }
            set_week();
        }

        function prev_week(){
            if(date.getDate() == 1) {
                date.setMonth(date.getMonth() - 1);
                if(daysInMonth(date.getMonth(), date.getFullYear()) >= 29) {
                    date.setDate(29);
                } else {
                    date.setDate(22);
                }
            } else {
                date.setDate(date.getDate() - 7);
            }
            set_week();
        }

        function daysInMonth(month, year) {
            return new Date(year, month + 1, 0).getDate();
        }

        function switch_tab(elem){

            var a = document.getElementsByClassName('tab');
            // loop through all 'tab' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'selected_tab' if it exists
                a[i].classList.remove('selected_tab')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('selected_tab');

            switch (elem.id) {
                case "list_tab":
                    document.getElementById("list_content").classList.remove('hidden');
                    document.getElementById("calendar_content").classList.add('hidden');
                break;

                case "calendar_tab":
                    document.getElementById("calendar_content").classList.remove('hidden');
                    document.getElementById("list_content").classList.add('hidden');
                break;

                default:
                break;
            }

        }

        /* Switching calendar in the top left corner */

        function switch_view(elem){

            /* These two lines get iframe content */
            var calendar_iframe = document.getElementById('calendar_iframe');
            var iframeDocument = calendar_iframe.contentDocument || calendar_iframe.contentWindow.document;

            switch (elem.id) {
                case "day_button":
                    iframeDocument.getElementById("calendar_table").classList.remove('hidden');
                    iframeDocument.getElementById("week_view").classList.add('hidden');
                    iframeDocument.getElementById("month_view").classList.add('hidden');
                break;

                case "week_button":
                    iframeDocument.getElementById("calendar_table").classList.add('hidden');
                    iframeDocument.getElementById("week_view").classList.remove('hidden');
                    iframeDocument.getElementById("month_view").classList.add('hidden');
                break;

                case "month_button":
                    iframeDocument.getElementById("calendar_table").classList.add('hidden');
                    iframeDocument.getElementById("week_view").classList.add('hidden');
                    iframeDocument.getElementById("month_view").classList.remove('hidden');
                break;

                default:
                break;
            }

        }

    </script>

</body>

</html>