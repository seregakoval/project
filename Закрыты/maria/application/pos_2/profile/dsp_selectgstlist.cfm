<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/newcss3acc.css">

<SCRIPT>
	<cfoutput>
	function update(docid,doccode,docname,rate) {
		top.window.opener.document.itemform.gstcode.value = doccode;	
		top.window.opener.document.itemform.gstname.value = docname;	
		top.window.opener.document.itemform.gst_acccode.value = docid;	
		top.window.opener.document.itemform.gst_percent.value = rate;
		top.window.opener.calculategstamont("3");
		top.window.parent.close();
	}
	</cfoutput>

</SCRIPT>

</head>
<cfoutput>
<cfparam name="searchcode" default="">	
<cfparam name="searchtdesc" default="">	
<body class="mainpage" >
<cfquery name="getdata" datasource="#dbname#">
	select company.comno,company.comname,partylist.*
	from company,partylist
	where company.comno = partylist.comno
	and  partylist.type ='7'
	<cfif searchtdesc neq "" and searchtdesc neq "Description">
		and upper(company.comname) like '%#ucase(searchtdesc)#%'
	</cfif>
	<cfif searchcode neq "" and searchcode neq "Code">
		and upper(partylist.code) like '%#ucase(searchcode)#%'
	</cfif>
	order by company.comname
</cfquery>
<cfif getdata.recordcount neq "0">
	<table class="searchtable">
		<!--- <td class="datatableheadercell" style="width:50px;">&nbsp;</td>
		<td class="datatableheadercell" style="text-align:left;padding-left:5px;">Description</td>
		<td class="datatableheadercell" style="text-align:left;padding-left:5px;width:50px;">Rate</td> --->
		<cfloop query="getdata">					
			<tr valign="middle">
				<td class="datatabledatacell_#(getdata.currentRow%2)#" style="text-align:center;">
					<cfset jss="update('#getdata.id#','#getdata.code#','#getdata.comname#','#getdata.taxrate#');">
					<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
				</td>
				<td class="datatabledatacell_#(getdata.currentRow%2)#" style="text-align:left;">
					<span style="color:##ff0000;">#htmleditformat(getdata.code)#</span>&nbsp;-&nbsp;#htmleditformat(getdata.comname)#
				</td>
				<td class="datatabledatacell_#(getdata.currentRow%2)#" style="text-align:right;padding-right:5px;font-weight:bold;">
					#htmleditformat(getdata.taxrate)#%
				</td>
			</tr>				
		</cfloop>	
	</table>	
<cfelse>
	<table class="searchtable">
		<tr>
			<td style="background-color:##EFEFEF;text-align:left;font-family:arial ; font-size:10pt; color:##484848;padding-left:10px;font-weight:bold;">
			  No Data Available That Match Your Search
			</td>
		</tr>
	</table>
</cfif>	
</body>
</cfoutput>
</html>
