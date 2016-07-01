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
		function selectitem(itemid){
			
			var unk = new Date();
			var nextid = document.getElementById("nextid").value ; 
			if (parent.document.getElementById("top_checkbox").checked == false){
				var newline = 0 ;
			} else {
				var newline = 1 ;	
			}
			var url = "databind/act_newinsert.cfm?nextid=" + nextid + "&itemid=" + itemid + "&unk=" + unk + "&newline=" + newline + "&itemtype=S" ;

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
<cfset base4 = "" >

<cfquery name="getitem" datasource="#dbname#">
	select 
	itemcate_pos.baseprice_#session.him_session.branchid#,itemcate_pos.stdcost, itemcate_pos.itemtype,maingroup_pos.mid,
	itemcate_pos.itemid, itemcate_pos.description,itemcate_pos.codeno,itemcate_pos.altdesc,
	unit.description as unit,itemcate_pos.stockunit,itemcate_pos.extended,
	maincate_pos.mainid, maincate_pos.description as desp2,
	maingroup_pos.groupid, maingroup_pos.description as desp3 ,mainitem_pos.description  as desp4, mainitem_pos.id as mid
	from itemcate_pos,maincate_pos,maingroup_pos,unit , mainitem_pos
	where itemcate_pos.mainid = maincate_pos.mainid
	and mainitem_pos.id = maingroup_pos.mid
	and maincate_pos.groupid = maingroup_pos.groupid
	and itemcate_pos.stockunit=unit.unitid
	and itemcate_pos.itemtype  = '2'
	<!---and itemcate_pos.itemstatus = '0'--->
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
	order by desp4,desp3,desp2,itemcate_pos.description,itemcate_pos.codeno
	limit 50
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
						<h4><img src="/ssui/img/gift.png">#htmleditformat(getitem.desp4)# - #htmleditformat(getitem.desp3)# - #htmleditformat(getitem.desp2)#</h4>
						<cfset base4 = #htmleditformat(getitem.desp4)# >
						<cfset base = #htmleditformat(getitem.desp3)# >
						<cfset base2 = #htmleditformat(getitem.desp2)# >
				</cfif>	
				<div class="line_wrapper services_width">
	                <p class="scrollable" data-mcs-theme="minimal-dark">#htmleditformat(getitem.codeno)# - #getitem.description#</p>
	                <div class="grey_button" onclick="selectitem('#getitem.itemid#')">RM #decimalformat(val(evaluate("getitem.baseprice_" & session.him_session.branchid)))#</div>
	                <div class="clear"></div>
	            </div>
				
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