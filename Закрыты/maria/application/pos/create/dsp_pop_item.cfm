<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/ionicons.css">

    <!-- The next three files allows horizontal scrolling in the right tabs of items with long names -->
    <link rel="stylesheet" href="../css/jquery.mCustomScrollbar.min.css">
    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/jquery.mCustomScrollbar.min.js"></script>

    <!-- The next file is for the custom scrollbar for iframe -->
    <link href="../css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom vertical scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }

        /* Necessary styles for the horizontal scrolling of products name */
        .scrollable .mCSB_dragger_bar {
            display: none;
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

		/* Packages list */

		.one_product {
		    margin-bottom: 15px;
		}

		.one_product img, h4 {
		    display: inline-block;
		    color: #3e474c;
		    margin-bottom: 5px;
		}

		.one_product img {
		    width: 18px;
		    height: auto;
		    vertical-align: middle;
		    margin-right: 5px;
		}

		.one_product h4 {
		    margin: 0;
		    font-size: 1.1em;
		    text-decoration: underline;
		}

		.line_wrapper {
		    margin: 5px 10px 5px 0;
		}

		.quantity {
		    display: inline-block;
		    width: 22px;
		    text-align: center;
		    vertical-align: top;
		    padding: 3px 0px;
		    background-color: #b8b8b8;
		    border-radius: 5px;
		    color: white;
		    visibility: hidden;
		}

		.another_wrapper {
		    display: inline-block;
		    width: calc(100% - 25px);
		}

		.line_wrapper p {
		    color: #3e474c;
		    display: inline-block;
		    margin: 0;
		    font-size: 1em;
		    padding-top: 3px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}

		.products_width p {
		    width: 130px;
		}

		.packages_width p {
		    width: 200px;
		}

		.services_width p {
		    width: 200px;
		}

		.grey_button {
		    display: inline-block;
		    min-width: 60px;
		    float: right;
		    background-color: #b8b8b8;
		    border-radius: 5px;
		    color: white;
		    text-align: center;
		    padding: 3px 0;
		    margin-left: 5px;
		    vertical-align: top;
		}

		.grey_button:hover {
		    cursor: pointer;
		}

    </style>
	
	<script>
		function selectitem(itemid){
			
			var unk = new Date();
			var nextid = document.getElementById("nextid").value ; 
			if (parent.document.getElementById("top_checkbox").checked == false){
				var newline = 0 ;
			} else {
				var newline = 1 ;	
			}
			var url = "databind/act_newinsert.cfm?nextid=" + nextid + "&itemid=" + itemid + "&unk=" + unk + "&newline=" + newline + "&itemtype=I" ;

			//prompt('',url);
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
		   	} else {// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		   	}
		   
		   	xmlhttp.open("GET",url,false);
			xmlhttp.send();
			xmlDoc=xmlhttp.responseXML;
			var x=xmlDoc.getElementsByTagName("returnrow");	
			for (i=0;i<x.length;i++){
				//alert(i);
				var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
				var totalsales = x[i].getElementsByTagName("totalsales")[0].childNodes[0].nodeValue;
				if(msgerror == "ok"){
					parent.document.getElementById("totalsales").innerHTML = totalsales ;
					parent.document.getElementById("main_table_wrapper").contentWindow.location.reload();
				} else {
					alert(msgerror);
				}
			}
		}
	</script>
</head>

<cfparam name="searchtype" default = "">
<cfparam name="searchdesc" default = "">
<cfparam name="searchcode" default = "">
<cfset base = "" >
<cfset base2 = "" >
<cfset base4 = "" >

<cfquery name="getitem" datasource="#dbname#">
	select
	inventory_hdr.currstkqty,itemcate_pos.baseprice_#session.him_session.branchid#,itemcate_pos.stdcost, itemcate_pos.itemtype,maingroup_pos.mid,
	itemcate_pos.itemid, itemcate_pos.description,itemcate_pos.codeno,itemcate_pos.altdesc,
	unit.description as unit,itemcate_pos.stockunit,itemcate_pos.extended,
	maincate_pos.mainid, maincate_pos.description as desp2,
	maingroup_pos.groupid, maingroup_pos.description as desp3 ,mainitem_pos.description  as desp4, mainitem_pos.id as mid
	from maincate_pos,maingroup_pos,unit , mainitem_pos,itemcate_pos left outer join inventory_hdr on (itemcate_pos.itemid = inventory_hdr.itemid and inventory_hdr.branch = '#session.him_session.branchid#')
	where itemcate_pos.mainid = maincate_pos.mainid
	and mainitem_pos.id = maingroup_pos.mid
	and maincate_pos.groupid = maingroup_pos.groupid
	and itemcate_pos.stockunit=unit.unitid
	and itemcate_pos.itemtype  = '1'
	<!---and itemcate_pos.itemstatus = '1'--->
	<cfif searchdesc neq "" >
		and
		(
			(trim(upper(mainitem_pos.description)) like '%#trim(ucase(searchdesc))#%')
			or
			(trim(upper(maingroup_pos.description)) like '%#trim(ucase(searchdesc))#%')
			or
			(trim(upper(itemcate_pos.description)) like '%#trim(ucase(searchdesc))#%')
			or
			(trim(upper(maincate_pos.description)) like '%#trim(ucase(searchdesc))#%')
		)
	</cfif>
	<cfif searchcode neq "">
		and (trim(upper(itemcate_pos.codeno)) like '%#trim(ucase(searchcode))#%')
	</cfif>
	order by desp4,desp3,desp2,itemcate_pos.description,itemcate_pos.codeno  limit 50
</cfquery>

<body>
	<cfoutput>
		<input type="hidden" value="#nextid#" name="nextid" id="nextid">
	    <div id="contentHolder">
			<cfloop query="getitem">
				<cfif (base4 neq htmleditformat(getitem.desp4)) or (base neq htmleditformat(getitem.desp3)) or (base2 neq htmleditformat(getitem.desp2))>
					<cfif base4 neq "">
						</div>
					</cfif>
					<div class="one_product">
						<h4><img src="../img/gift.png">#htmleditformat(getitem.desp4)# - #htmleditformat(getitem.desp3)# - #htmleditformat(getitem.desp2)#</h4>
						<cfset base4 = #htmleditformat(getitem.desp4)# >
						<cfset base = #htmleditformat(getitem.desp3)# >
						<cfset base2 = #htmleditformat(getitem.desp2)# >
				</cfif>
				<div class="line_wrapper products_width">
	                <div class="quantity">#val(getitem.currstkqty)#</div>
	                <div class="another_wrapper">
	                    <p class="scrollable" data-mcs-theme="minimal-dark">#htmleditformat(getitem.codeno)# - #getitem.description#</p>
	                    <div class="grey_button" onclick="selectitem('#getitem.itemid#')">RM #decimalformat(val(evaluate("getitem.baseprice_" & session.him_session.branchid)))#</div>
	                    <div class="clear"></div>
	                </div>
	            </div>
			</cfloop>
			</div>
	    </div>
	</cfoutput>
	
	
    
    <script>
        $(document).ready(function(){
            $(".scrollable").mCustomScrollbar({
            axis: "x" // horizontal scrollbar
            });
        });

        /* Following lines of code are for showing and hiding quantity */

        var wrappers = document.getElementsByClassName("another_wrapper");
        for(var i = 0; i < wrappers.length; i++) {

            wrappers[i].addEventListener("mouseenter", function(){
                show(this);
            });
            wrappers[i].addEventListener("mouseleave", function(){
                hide(this);
            });

        }

        function show(elem) {

            var previousSibling = elem.previousSibling;
            /* Check for line breaks and whitespaces */
            while(previousSibling && previousSibling.nodeType != 1) {
                previousSibling = previousSibling.previousSibling;
            }
            previousSibling.style.visibility = "visible";
        }

        function hide(elem) {

            var previousSibling = elem.previousSibling;
            /* Check for line breaks and whitespaces */
            while(previousSibling && previousSibling.nodeType != 1) {
                previousSibling = previousSibling.previousSibling;
            }
            previousSibling.style.visibility = "hidden";
        }

    </script>
</body>

</html>