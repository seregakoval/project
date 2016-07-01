<!DOCTYPE HTML>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
		/* perfect-scrollbar v0.6.7 */
		.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}

        /* Necessary styles for the custom scrollbar to work */
        #contentHolder {
				position: relative;
				height: 100vh;
		}

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

		/* Left panel clients */

		#client_wrapper {
		    position: relative;
		    overflow: hidden;
		    height: calc(100vh - 40px - 47px - 20px - 37px - 20px); /* VHeight - header - buttons - padding - search panel - additional pixels */
		}

		.client {
		    padding-bottom: 5px;
		}

		.client:first-child {
		    padding-top: 5px;
		}

		.client:first-child .client_info {
		    border-top: none;
		}

		.client:hover {
		    cursor: pointer;
		    background-color: #d4d4d4;
		}

		.client:hover .client_info {
		    border-color: #d4d4d4;
		}

		.client:hover + div .client_info {
		    border-color: #EBEBEB;
		}

		.client_pic {
		    display: block;
		    border: 2px solid #b2b1b7;
		    border-radius: 50%;
		    float: left;
		    margin: 0 10px;
		    height: 35px;
		    width: 35px;
		}

		.client_info {
		    float: left;
		    border-top: 1px solid #cccbd9;
		}

		.name {
		    color: #515f6a;
		    font-size: 1.2em;
		    margin: 0;
		    padding: 5px 15px 0 5px;
		    width: 100px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}

		.selected_name {
		    color: #90b450;
		}

		.outlet {
		    display: inline-block;
		    color: #f98d21;
		    margin: 0;
		    padding: 5px 15px 0 5px;
		}

		.circles {
		    padding-left: 10px;
		}

		.circle {
		    display: inline-block;
		    width: .6em;
		    height: .6em;
		    margin-left: 3px;
		    border-radius: 50%;
		}

		.hidden_notif{
		    visibility: hidden;
		}

		.green_notif {
		    background-color: #78a502;
		}

		.orange_notif {
		    background-color: #fe7e01;
		}

		.red_notif {
		    background-color: #eb1c24;
		}
    </style>
	
	
	<script>
		function selectedcust(custid,custname){
			parent.document.getElementById("page_1").className = "outer_wrap" ;
			parent.document.getElementById("page_2").className = "outer_wrap current" ;
			parent.document.getElementById("page_3").className = "outer_wrap" ;
			parent.document.getElementById("page_4").className = "outer_wrap" ;
			parent.document.getElementById("page_5").className = "outer_wrap" ;
			parent.document.getElementById("page_6").className = "outer_wrap" ;
			parent.document.getElementById("page_7").className = "outer_wrap" ;
			parent.document.getElementById("page_8").className = "outer_wrap" ;
			parent.document.getElementById("page_9").className = "outer_wrap" ;
			parent.frames['main_table_wrapper'].location.href = 'profile/dsp_profile.cfm?custid=' + custid;
			parent.document.itemform.custid.value = custid;
			parent.document.getElementById('custname').innerHTML = custname;
		}
	</script>	
	
	
	
</head>

<cfparam name="datavalue" default="">
<cfparam name="searchtype" default="">

 <cfquery name="getcust" datasource="#dbname#">
	select customer.*, branch.description as branchdesc, branch.code as branchcode from customer, branch
	where customer.branch = branch.id
	<cfif searchtype eq "memberno">and upper(trim(membershipno)) like '%#ucase(trim(datavalue))#%'</cfif>
	<cfif searchtype eq "custno">and upper(trim(cast(custno as text))) like '%#ucase(trim(datavalue))#%'</cfif>
	<cfif searchtype eq "name">and upper(trim(name)) like '%#ucase(trim(datavalue))#%'</cfif>
	<cfif searchtype eq "ic">and upper(trim(ic)) like '%#ucase(trim(datavalue))#%'</cfif>
	<cfif searchtype eq "mobile">and upper(trim(mobile)) like '%#ucase(trim(datavalue))#%'</cfif>
	<cfif searchtype eq "type" and datavalue neq "">and clitype = '#val(datavalue)#'</cfif>
	<cfif searchtype eq "branch" and datavalue neq "">and branch = '#val(datavalue)#'</cfif>
	order by name, branch, id
	limit 100
</cfquery> 

<body>

	<div id="contentHolder"> <!-- This wrapper is needed for custom scrollbar -->
		<cfloop query="getcust">
			<cfoutput>
				<div class="client" onclick="selectedcust(#getcust.id#,'#jsStringFormat(getcust.name)#')">
					<img class="client_pic" src="create/img/actress2.jpg">
					<div class="client_info">
						<p class="name">
							#getcust.name#
						</p>
						<p class="outlet">#getcust.branchcode#</p>
						<div class="circle green_notif"></div>
						<div class="circle orange_notif"></div>
						<div class="circle red_notif"></div>
					</div>  
					<div class="clear"></div>
				</div>
			</cfoutput>
		</cfloop>
	</div>

    <script>
        /* Fill all the title properties for all the client names, so that full name will be shown on hover */
        var namesList = document.getElementsByClassName("name");
        for(var i = 0; i < namesList.length; i++) {
            namesList[i].title = namesList[i].innerHTML;
        }
    </script>
</body>
</html>