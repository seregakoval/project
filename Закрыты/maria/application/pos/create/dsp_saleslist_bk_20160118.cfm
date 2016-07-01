<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ssui/css/page11.css">
    <link rel="stylesheet" href="/ssui/css/ionicons.css">    
    <!-- The next file is for the custom scrollbar -->
    <link href="/ssui/css/perfect-scrollbar.min.css" rel="stylesheet">
	<script language="JavaScript" src="/ssui/js/component.js"></script>
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; } 
    </style>    
	<script>
		function dataupdate(currvar, id, currfield){
			var unk = new Date();
			var nextid = document.getElementById("nextid").value ;
			var url = "databind/act_maintenance.cfm?nextid=" + nextid + "&currvar=" + currvar + "&id=" + id + "&currfield=" + currfield + "&unk=" + unk ;

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
					document.location.reload();
				} else {
					alert(msgerror);
				}
			}
		}
	</script>
</head>

<cfquery name="getsaleshdr" datasource="#dbname#">
	select * from sales_tmp_hdr where id = '#nextid#'
</cfquery>
<cfquery name="getsalesdet" datasource="#dbname#">
	select * from sales_tmp_det where refid = '#nextid#' order by linerefid, type
</cfquery>
	

<body>
	
    <table id="table_header">
        <tr>
            <td width="5%"><i class="icon ion-ios-circle-filled"></i></td>
            <td width="5%">#</td>
            <td width="10%">Code</td>
            <td width="20%">Desc.</td>
            <td width="5%">T</td>
            <td width="5%">S</td>
            <td width="5%">D</td>
            <td width="15%">U/Price</td>
            <td width="7%">Disc</td>
            <td width="7%">Total</td>
            <td width="7%">GSM</td>
            <td width="7%">GSM Total</td>
        </tr>
    </table>
    <div id="contentHolder">
        <table id="central_table">
			<cfoutput>
			<input type="hidden" value="#nextid#" name="nextid" id="nextid">	
			<cfset count = 0>
			<cfloop query="getsalesdet">
				<cfif trim(getsalesdet.type) NEQ "P">
					<cfquery name="getitem" datasource="#dbname#">
						select * from itemcate_pos 
						where itemid ='#itemid#' 
					</cfquery>
					<cfset codeno = getitem.codeno>
					<cfset description = getitem.description>
				<cfelse>
					<cfquery name="getitem" datasource="#dbname#">
						select * from promotion_hdr 
						where packageno ='#itemid#' 
					</cfquery>
					<cfset codeno = getitem.code>
					<cfset description = getitem.description>
				</cfif>
				
				<cfset col_qty = val(getsalesdet.qty) - val(getsalesdet.bal_qty)>
				<cfif trim(getsalesdet.disctype) EQ "P">
					<cfset discamt = val(getsalesdet.disc) * val(getsalesdet.price) * val(getsalesdet.qty)/ 100>
					<cfset linetotal =val(getsalesdet.price)* val(getsalesdet.qty) - val(discamt)>
					<cfset discount = val(getsalesdet.disc) & "%">
				<cfelse>
					<cfset linetotal = val(getsalesdet.price)* val(getsalesdet.qty) - val(getsalesdet.disc)>
					<cfset discount = getsalesdet.disc>
				</cfif>
				
				<cfif trim(getsalesdet.type) NEQ "PI" and trim(getsalesdet.type) NEQ "PS">
					<cfset count = count + 1>
					<tr style="background-color:##f0f8ff">
		                <td width="5%"><input type="Checkbox" id="id" name="id" value="#getsalesdet.id#"></td>
		                <td width="5%">#count#.</td>
		                <td width="10%">#codeno#</td>
		                <td width="20%">#description#</td>
		                <td width="5%">#getsalesdet.type#</td>
		                <td width="5%"><div id="qty" contenteditable="true" onblur="dataupdate(this.innerHTML,'#getsalesdet.id#', 'qty')" onmouseover="this.style.backgroundColor='##fdd9da';" onmouseout="this.style.backgroundColor='';">#getsalesdet.qty#</div></td>
		                <td width="5%"><cfif trim(getsalesdet.type) EQ "S">-<cfelse><div id="col_qty" contenteditable="true" onblur="dataupdate(this.innerHTML,'#getsalesdet.id#', 'col_qty')"  onmouseover="this.style.backgroundColor='##fdd9da';" onmouseout="this.style.backgroundColor='';">#col_qty#</div></cfif></td>
		                <td width="15%"><div id="price" contenteditable="true" onblur="dataupdate(this.innerHTML,'#getsalesdet.id#', 'price')" onmouseover="this.style.backgroundColor='##fdd9da';" onmouseout="this.style.backgroundColor='';">#decimalformat(getsalesdet.price)#</div></td>
		                <td width="7%"><div id="disc" contenteditable="true" onblur="dataupdate(this.innerHTML,'#getsalesdet.id#', 'disc')" onmouseover="this.style.backgroundColor='##fdd9da';" onmouseout="this.style.backgroundColor='';">#discount#</div></td>
		                <td width="7%">#decimalformat(linetotal)#</td>
		                <td width="7%">#decimalformat(val(getsalesdet.gstprice))#</td>
		                <td width="7%">#decimalformat(getsalesdet.gsttotal)#</td>
		            </tr>
				<cfelse>
					<tr>
		                <td width="5%"></td>
		                <td width="5%"></td>
		                <td width="10%">#codeno#</td>
		                <td width="20%">#description#</td>
		                <td width="5%">#getsalesdet.type#</td>
		                <td width="5%">#getsalesdet.qty#</td>
		                <td width="5%"><cfif trim(getsalesdet.type) EQ "S">-<cfelse>#col_qty#</cfif></td>
		                <td width="15%">#decimalformat(getsalesdet.price)#</td>
		                <td width="7%">#discount#</td>
		                <td width="7%">#decimalformat(linetotal)#</td>
		                <td width="7%">#decimalformat(val(getsalesdet.gstprice))#</td>
		                <td width="7%">#decimalformat(getsalesdet.gsttotal)#</td>
		            </tr>
				</cfif>
				
					
			</cfloop>
	        </cfoutput>
                      
        </table>
		
    </div>
</body>

</html>