<cfif custid EQ "">You need to select customer<cfabort></cfif> 
<cfquery name="getcust" datasource="#dbname#">
	select * from customer where id = '#custid#'
</cfquery> 

<cfquery name="getbranch" datasource="#dbname#">
	select * from branch where id = '#getcust.branch#'
</cfquery>

<cfquery name="getcashbin" datasource="#dbname#">
	select sum(amt) as amt from cashbin_log where usrid = '#custid#'
</cfquery>






<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page 11</title>
    <link rel="stylesheet" href="/ssui/css/page11.css">
    <link rel="stylesheet" href="/ssui/css/ionicons.css">    
    <!-- The next file is for the custom scrollbar for iframes -->
    <script src="js/perfect-scrollbar.min.js"></script>
	
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
            <img src="/ssui/img/actress_small.jpg"/> 
            <a href="#" onclick="show_hide_menu()"><i class="ion-arrow-down-b"></i></a>
        </div>
        
        <div class="clear"></div>
    </header>
    
    <div class="left_win">
        
        <img src="/ssui/img/actress2.jpg" id="client_picture">
        
        <h3><cfoutput>#getcust.name#</cfoutput></h3>
        
		<cfoutput>
        <table>
            <tr>
                <td>ID</td>
                <td>:&nbsp;#getcust.custno#</td>
            </tr>
            <tr>
                <td>Member</td>
                <td>:&nbsp;#getcust.membershipno#</td>
            </tr>
            <tr>
                <td>Birthday</td>
                <td>:&nbsp;#dateformat(getcust.birth,"dd mmm yyyy")#</td>
            </tr>
            <tr>
                <td>Outlet</td>
                <td>:&nbsp;#getbranch.code#</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Cash Bin</td>
                <td>:&nbsp;#decimalformat(getcashbin.amt)#</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Date</td>
                <td>:&nbsp;#dateformat(now(),"dd mmm yyyy")#</td>
            </tr>
            <tr>
                <td>Time</td>
                <td>:&nbsp;#timeformat(now(),"HH:mm:ss")#</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><h4>TOTAL (RM)</h4></td>
                <td>:&nbsp;<h4><div id="totalsales">0.00</div></h4></td>
            </tr>
            <tr>
                <td>salesid</td>
                <td>:&nbsp;#nextid#</td>
            </tr>
            
        </table>
		</cfoutput>
        
        <div id="top_button_wrapper">
            <div class="outer" id="sales" onclick="switch_buttons(this)">
                <div>
                    SALES&nbsp;&nbsp;&nbsp;<i class="icon ion-android-cart"></i>
                </div>
            </div>
            <div class="outer" id="payment" onclick="switch_buttons(this)">
                <div>
                    PAYMENT&nbsp;&nbsp;&nbsp;<i class="icon ion-cash"></i>
                </div>
            </div>
            <div class="outer current_button" id="submit" onclick="switch_buttons(this)">
                <div>
                    SUBMIT&nbsp;&nbsp;&nbsp;<i class="icon ion-briefcase"></i>
                </div>
            </div>
        </div>
        
        
        <div id="bottom_button_wrapper">      
            <div class="button1">
                <i class="icon ion-wrench"></i>
                <p>On Hold</p>
            </div>

            <div class="button1" id="create_new_button">
                <i class="icon ion-heart"></i>
                <p>Create New</p>
            </div>         
        </div>
        <div class="clear"></div>
 
    </div>
    
    <div id="top_green_center">
            <i class="icon ion-ios-barcode"></i>
            <input type="text" id="top_input">
            <input type="checkbox" id="top_checkbox" class="css-checkbox"><label class="css-label" for="top_checkbox">NL</label>
            <div class="tabs">
                <div class="tabs_wrapper">
                    <div class="tab selected_tab" id="products" onclick="switch_tab(this)">PRODUCTS</div>
                    <div class="tab" id="services" onclick="switch_tab(this)">SERVICES</div>
                    <div class="tab" id="packages" onclick="switch_tab(this)">PACKAGES</div>
                    <div class="clear"></div>
                </div>
            </div>   
    </div>

    <div class="central_win">      
        <!-- This iframe has custom scrollbar -->
        <cfoutput><iframe src="dsp_saleslist.cfm?nextid=#nextid#"
                    id="main_table_wrapper"
                    frameBorder="0"
                    width="100%" 
                    scrolling="yes"></iframe> </cfoutput>      
        <div id="bottom_panel">
            <iframe src="dsp_posmain_new2.cfm" width="100%" frameBorder="0"></iframe> 
        </div>
    </div>
    
    <div class="right_win">
        <div class="content_wrapper">
            <div class="top_right_search">  
					<cfoutput><input type="hidden" id="nextid" value="#nextid#"></cfoutput> 
                    <input type="text" id="code_field" placeholder="Code">
                    <input type="text" id="desc_field" placeholder="Description">
                    <div class="orange_button" id="search_button" onclick="searchitem()"><i class="icon ion-search"></i></div>
                    <!--- <div class="orange_button" id="menu_button"><i class="icon ion-navicon-round"></i></div> --->
            </div>
            <div id="products_content">
                <!-- This iframe has custom scrollbar -->
                <cfoutput><iframe src="dsp_pop_item.cfm?nextid=#nextid#"
                        id="products_iframe"
                        scrolling="yes" 
                        frameborder="0" 
                        style="width: 100%; 
                               height: calc(100vh - 140px)"></cfoutput>   
                </iframe>
            </div>
            <!--- <div id="services_content" class="hidden">
                <!-- This iframe has custom scrollbar -->
                <iframe src="dsp_pop_service.cfm" 
                        id="services_iframe"
                        scrolling="yes" 
                        frameborder="0" 
                        style="width: 100%; 
                               height: calc(100vh - 140px)">
                </iframe>
            </div> --->
            <!--- <div id="packages_content" class="hidden">
                <!-- This iframe has custom scrollbar -->
                <iframe src="dsp_pop_package.cfm" 
                        id="packages_iframe"
                        scrolling="yes" 
                        frameborder="0" 
                        style="width: 100%; 
                               height: calc(100vh - 140px)">
                </iframe>
            </div> --->
        </div>       
    </div>
 
    <script>
        function show_hide_menu(){
            
            if(document.getElementById("top_nav").style.display == "none") {
				document.getElementById("top_nav").style.display = "block";
			} else if(document.getElementById("top_nav").style.display != "none") {
				document.getElementById("top_nav").style.display = "none";
			}    
            
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
            
            var nextid = document.getElementById("nextid").value;
            
            switch (elem.id) {
                case "products":
                    //document.getElementById("products_content").classList.remove('hidden');
                    //document.getElementById("services_content").classList.add('hidden');
                    //document.getElementById("packages_content").classList.add('hidden');
                    document.getElementById("products_iframe").src = "dsp_pop_item.cfm?nextid="+nextid;
                break;
                    
                case "services":
                    //document.getElementById("services_content").classList.remove('hidden');
                    //document.getElementById("products_content").classList.add('hidden');
                    //document.getElementById("packages_content").classList.add('hidden');
                    document.getElementById("products_iframe").src = "dsp_pop_service.cfm?nextid="+nextid;
                break;
                    
                case "packages":
                    //document.getElementById("packages_content").classList.remove('hidden');
                    //document.getElementById("products_content").classList.add('hidden');
                    //document.getElementById("services_content").classList.add('hidden');  
                    document.getElementById("products_iframe").src = "dsp_pop_package.cfm?nextid="+nextid;                  
                break;
                    
                default:
                break;
            }
            
        }
		
		
        function searchitem (){
			var source = document.getElementById("products_iframe").src ;
			source = source.split("?",1) ;
			
			var code = document.getElementById("code_field").value ;
			var desc = document.getElementById("desc_field").value ;
			var nextid = document.getElementById("nextid").value ;
			var url = source + "?searchcode=" + code + "&searchdesc=" + desc + "&nextid=" + nextid; 
			document.getElementById("products_iframe").src = url ;
			
		}
		
		/*function switch_tab(elem){
			  
			if (elem == "products"){
				document.getElementById("products_iframe").src = "dsp_pop_item.cfm";
				
			} else if (elem=="services"){
				document.getElementById("products_iframe").src = "dsp_pop_service.cfm";
				
			} else if (elem=="packages"){
				document.getElementById("products_iframe").src = "dsp_pop_package.cfm";
				
			}
		}*/
        
        function switch_buttons(elem) {
            var a = document.getElementsByClassName('outer');
            // loop through all 'outer' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'current_button' if it exists
                a[i].classList.remove('current_button')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('current_button');
        }
    </script>
    <!-- This script adds custom scrollbar to the iframe (actually to the inner content of the iframe) -->   
    <script>
      var iframe = document.querySelector('#main_table_wrapper');
      iframe.onload = function () {
        Ps.initialize(iframe.contentDocument.querySelector('#contentHolder'));
      };
      var iframe2 = document.querySelector('#products_iframe');
      iframe2.onload = function () {
        Ps.initialize(iframe2.contentDocument.querySelector('#contentHolder'));
      };
      var iframe3 = document.querySelector('#services_iframe');
      iframe3.onload = function () {
        Ps.initialize(iframe3.contentDocument.querySelector('#contentHolder'));
      };
      var iframe4 = document.querySelector('#packages_iframe');
      iframe4.onload = function () {
        Ps.initialize(iframe4.contentDocument.querySelector('#contentHolder'));
      };        
    </script>
</body>

</html>