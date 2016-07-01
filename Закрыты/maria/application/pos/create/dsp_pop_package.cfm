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
        /* Necessary styles for the custom scrollbar to work */
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
			var nextid = document.getElementById("nextid").value ; 
			var unk = new Date();
			document.location.href = "index.cfm?fuseaction=selectPackage&itemid=" + itemid + "&nextid=" + nextid + "&unk=" + unk ;
		}
	</script>
</head>

<cfparam name="searchtype" default = "">
<cfparam name="searchdesc" default = "">
<cfparam name="searchcode" default = "">
<cfset base = "" >
<cfset base2 = "" >

<cfquery name="getitem" datasource="#dbname#">
	select
	promotiondiv.id as lvl1id, promotiondiv.name as lvl1desc,
	promotionsection.id as lvl2id, promotionsection.name as lvl2desc,
	promotion_hdr.packageno as lvl3id, promotion_hdr.description as lvl3desc,promotion_hdr.code,
	promotion_hdr.price_opt,promotion_hdr.tol_price_#session.him_session.branchid#,promotion_hdr.outlet,promotion_hdr.memberlist
	from promotiondiv,promotionsection,promotion_hdr
	where
	promotiondiv.id = promotionsection.divid
	and promotionsection.id = promotion_hdr.sectionid
	and (
		promotion_hdr.validtype = '0'
		or
		(
			promotion_hdr.validtype = '1'
				and
			<!--- promotion_hdr.startdate::date <= now() and promotion_hdr.enddate::date >= now() --->
			now()::date between promotion_hdr.startdate::date and promotion_hdr.enddate::date
		)
	)
	<cfif searchdesc neq "" >
		and
		(
			(trim(upper(promotiondiv.name)) like '%#trim(ucase(searchdesc))#%')
			or
			(trim(upper(promotionsection.name)) like '%#trim(ucase(searchdesc))#%')
			or
			(trim(upper(promotion_hdr.description)) like '%#trim(ucase(searchdesc))#%')
		)
	</cfif>
	<cfif searchcode neq "">
		and (trim(upper(promotion_hdr.code)) like '%#trim(ucase(searchcode))#%')
	</cfif>
	order by lvl1desc,lvl2desc,lvl3desc
	<!--- limit 50 --->
</cfquery>


<body>
	<cfoutput>
		<input type="hidden" value="#nextid#" name="nextid" id="nextid">
	    <div id="contentHolder">
			<cfloop query="getitem">
				<cfif listfind(getitem.outlet, session.him_session.branchid) neq 0>
					<cfif getitem.memberlist neq "">
						<cfif listfind(getitem.memberlist, session.him_session.pos.create.clitype) neq 0>
							<cfif (base neq getitem.lvl1id) or (base2 neq getitem.lvl2id)>
								<cfif base neq "">
									</div>
								</cfif> 
								 <div class="one_product">        
		            				<h4><img src="../img/gift_redempt.png">#htmleditformat(getitem.lvl1desc)# - #htmleditformat(getitem.lvl2desc)#</h4>
									<cfset base = #htmleditformat(getitem.lvl1id)# >	
									<cfset base2 = #htmleditformat(getitem.lvl2id)# >
							</cfif>
							<div class="line_wrapper packages_width">
				                <p class="scrollable" data-mcs-theme="minimal-dark">#htmleditformat(getitem.code)# - #htmleditformat(getitem.lvl3desc)#</p>
				                <div class="grey_button" onclick="selectitem('#getitem.lvl3id#')"><cfif getitem.price_opt eq 1>RM #decimalformat(val(evaluate("getitem.tol_price_" & session.him_session.branchid)))#<cfelse><i>Calculated</i></cfif></div>
				                <div class="clear"></div>
				            </div>
						</cfif>
					<cfelse>
						<cfif (base neq getitem.lvl1id) or (base2 neq getitem.lvl2id)>
							<cfif base neq "">
								</div>
							</cfif> 
							 <div class="one_product">        
		           				<h4><img src="../img/gift_redempt.png">#htmleditformat(getitem.lvl1desc)# - #htmleditformat(getitem.lvl2desc)#</h4>
								<cfset base = #htmleditformat(getitem.lvl1id)# >	
								<cfset base2 = #htmleditformat(getitem.lvl2id)# >
						</cfif>
						<div class="line_wrapper packages_width">
			                <p class="scrollable" data-mcs-theme="minimal-dark">#htmleditformat(getitem.code)# - #htmleditformat(getitem.lvl3desc)#</p>
			                <div class="grey_button" onclick="selectitem('#getitem.lvl3id#')"><cfif getitem.price_opt eq 1>RM #decimalformat(val(evaluate("getitem.tol_price_" & session.him_session.branchid)))#<cfelse><i>Calculated</i></cfif></div>
			                <div class="clear"></div>
			            </div>
						
					</cfif>
				</cfif>
			</cfloop>
		</div>
	</cfoutput>
	
    
    <script>
        $(".scrollable").mCustomScrollbar({
            axis: "x" // horizontal scrollbar
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