<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }

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

		/* central table */

		#main_table_wrapper {
    		height: calc(100vh - 290px);
		}

		#central_table {
		    width: 100%;
		    font-size: 1em;
		    text-align: center;
		    color: #3e474c;
		}

		#central_table td {
    		padding: 10px;
		}

		#table_header {
		    width: 100%;
		    font-size: 1em;
		    text-align: center;
		    color: #3e474c;
		}

		#table_header td {
		    padding: 10px;
		    background-color: #f8f8f8;
		}

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
    <div id="contentHolder">
	<form name="itemform">
		<cfoutput>
			<table id="central_table">
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
			            <tr>
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
	        </table>
		</cfoutput>
	</form>
    </div>
</body>

</html>