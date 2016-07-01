<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ssui/css/page11.css">
    <link rel="stylesheet" href="/ssui/css/ionicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css">
	<script language="JavaScript" src="/ssui/js/component.js"></script>
    
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.js"></script>    
    <script>
		function processItem(itemid,unitprice,itemtype, stepno){
			unk = new Date(); 
			var nextid = document.getElementById("nextid").value ;  
			var thispackageno = document.getElementById("thispackageno").value ; 
			var thisgroupno = document.getElementById("thisgroupno").value ;  
			var groupid = document.getElementById("groupid").value ;  
			var groupitemid = document.getElementById("groupitemid").value ; 
			var url = "package_insertselecteditem.cfm?nextid="+nextid+"&thispackageno="+thispackageno+"&thisgroupno="+thisgroupno+"&stepno="+stepno+"&groupid="+groupid+"&groupitemid="+groupitemid+"&itemid=" + itemid + "&itemtype=" + itemtype + "&unitprice=" + unitprice + "&unk=" + unk;		
			//prompt('',url) ;
			window.location = url ;
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

<cfparam name="stepno" default="0">
<cfparam name="searchcode" default="">
<cfparam name="searchdesc" default="">

<cfquery name="getgroupitems" datasource="#dbname#">
	select promotion_groupitem.* 
	from promotion_groupitem,promotion_group
	where promotion_group.refid='#thispackageno#'
	and promotion_group.groupno='#thisgroupno#'
	and promotion_group.id = promotion_groupitem.groupid
	order by id
	offset #stepno# 
</cfquery>

<body>
	<cfoutput>
		<h3>PLEASE CHOOSE #getgroupitems.recordcount# ITEM(S).</h3>
		
		<input type="hidden" value="#nextid#" name="nextid" id="nextid">
		<input type="hidden" value="#thispackageno#" name="thispackageno" id="thispackageno">
		<input type="hidden" value="#thisgroupno#" name="thisgroupno" id="thisgroupno">
		
		<input type="hidden" value="#getgroupitems.groupid#" name="groupid" id="groupid">
		<input type="hidden" value="#getgroupitems.id#" name="groupitemid" id="groupitemid">
		<cfloop query="getgroupitems">
			<cfset stepno = stepno + 1>
			<cfif getgroupitems.itemtype EQ "I" OR getgroupitems.itemtype EQ "S"><!--- if item or services, no need to choose, just insert into the slaes listing --->
			
				<cfif getgroupitems.itemtype EQ "I">
					<cfset thisitemtype = "PI">
				<cfelseif getgroupitems.itemtype EQ "S">
					<cfset thisitemtype = "PS">
				</cfif>
				<cfquery name="insertsession" datasource="#dbname#">
					insert into sales_tmp_promotion_item
					( id, refid,salesid,groupitemid , itemid,itemtype , qty , unitprice)
					values
					(nextval('seq_sales_tmp_promotion_item'),'#getgroupitems.groupid#','#nextid#','#getgroupitems.id#','#getgroupitems.itemid#','#thisitemtype#',1,'0')
				</cfquery>
				
		
			<cfelse><!-- ALL OTHERS NEED TO CHOOSE --->
				<cfset base = "" >
				<cfset base2 = "" >
				<cfset base4 = "" >
				<cfquery name="getitem" datasource="#dbname#">
					select 
					inventory_hdr.currstkqty,
					itemcate_pos.baseprice_#session.him_session.branchid#,itemcate_pos.stdcost, itemcate_pos.itemtype,maingroup_pos.mid,
					itemcate_pos.itemid,itemcate_pos.description,itemcate_pos.codeno,itemcate_pos.altdesc,
					unit.description as unit,itemcate_pos.stockunit,itemcate_pos.extended,
					maincate_pos.mainid, maincate_pos.description as desp2,
					maingroup_pos.groupid, maingroup_pos.description as desp3 ,mainitem_pos.description  as desp4, mainitem_pos.id as mid
					
					from maincate_pos,maingroup_pos,unit, 
						mainitem_pos,itemcate_pos left outer join inventory_hdr on (itemcate_pos.itemid = inventory_hdr.itemid and inventory_hdr.branch = '#session.him_session.branchid#')
					where itemcate_pos.mainid = maincate_pos.mainid
					and mainitem_pos.id = maingroup_pos.mid
					and maincate_pos.groupid = maingroup_pos.groupid
					and itemcate_pos.stockunit=unit.unitid
					and itemcate_pos.itemstatus = '0'
					<cfif (getgroupitems.itemtype eq "CI") or (getgroupitems.itemtype eq "CS")>
						and maincate_pos.mainid = '#val(getgroupitems.itemid)#'
					<cfelseif (getgroupitems.itemtype eq "GI") or (getgroupitems.itemtype eq "GS")>
						and maingroup_pos.groupid = '#val(getgroupitems.itemid)#'
					<cfelseif (getgroupitems.itemtype eq "MI") or (getgroupitems.itemtype eq "MS")>
						and mainitem_pos.id = '#val(getgroupitems.itemid)#'
					</cfif>
					<cfif searchcode neq "" >
						and 
						(
							(trim(upper(itemcate_pos.codeno)) like '%#trim(ucase(searchcode))#%')
						) 	
					</cfif>		
					<cfif searchdesc neq "" >
						and 
						(
							(trim(upper(maincate_pos.description)) like '%#trim(ucase(searchdesc))#%')
							or 
							(trim(upper(itemcate_pos.description)) like '%#trim(ucase(searchdesc))#%')
							or
							(trim(upper(maincate_pos.description)) like '%#trim(ucase(searchdesc))#%')
						) 		
						
					</cfif>	
					order by desp3,desp2,itemcate_pos.description
					limit 20
				</cfquery>
				
				<div id="contentHolder">
					<cfloop query="getitem">
						<cfif (base4 neq htmleditformat(getitem.desp4)) or (base neq htmleditformat(getitem.desp3)) or (base2 neq htmleditformat(getitem.desp2))>
							<cfif base4 neq "">
								</div>
							</cfif>
							<div class="one_product">
								<h4><img src="/ssui/img/gift.png">#htmleditformat(getitem.desp4)# - #htmleditformat(getitem.desp3)# - #htmleditformat(getitem.desp2)#</h4>
								<cfset base4 = #htmleditformat(getitem.desp4)# >
								<cfset base = #htmleditformat(getitem.desp3)# >
								<cfset base2 = #htmleditformat(getitem.desp2)# >
						</cfif>	
						<cfset price = val(evaluate('getitem.baseprice_' & session.him_session.branchid))>
						<div class="line_wrapper services_width">
			                <p class="scrollable" data-mcs-theme="minimal-dark">#htmleditformat(getitem.codeno)# - #getitem.description#</p>
			                <div class="grey_button" onclick="processItem('#getitem.itemid#','#price#','#getitem.itemtype#','#stepno#')"> S </div>
			                <div class="clear"></div>
			            </div>
						
					</cfloop>
				</div>
		
		
				<cfabort><!--- stop to choose item --->
		
			</cfif>
		
		
		</cfloop>  
		</div>
	</cfoutput>
</body>




















<cflocation url="package_selectcontrol.cfm?nextid=#nextid#">

