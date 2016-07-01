<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ssui/css/page11.css">
    <link rel="stylesheet" href="/ssui/css/ionicons.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css">
    
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.js"></script>    
	
	<script language="JavaScript" src="/ssui/js/component.js"></script>
	<script>
		function selectitem(itemid){
			var nextid = document.getElementById("nextid").value ; 
			var unk = new Date();
			document.location.href = "index.cfm?fuseaction=selectPackage&itemid=" + itemid + "&nextid=" + nextid + "&unk=" + unk ;
		}
	</script>
    
    <!-- The next file is for the custom scrollbar -->
    <link href="/ssui/css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }
        
        /* Necessary styles for the horizontal scrolling of products name */
        .scrollable .mCSB_dragger_bar {
            display: none;
        }
    </style>    
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
		            				<h4><img src="/ssui/img/gift_redempt.png">#htmleditformat(getitem.lvl1desc)# - #htmleditformat(getitem.lvl2desc)#</h4>
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
		           				<h4><img src="/ssui/img/gift_redempt.png">#htmleditformat(getitem.lvl1desc)# - #htmleditformat(getitem.lvl2desc)#</h4>
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
    
</div>
    <script>
        $(".scrollable").mCustomScrollbar({
            axis: "x" // horizontal scrollbar
        });
    </script>    
</body>

</html>