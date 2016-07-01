<!DOCTYPE html>
<html>
<head>
<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">

<SCRIPT>
	<cfoutput>
	function update(docid,docname,opt) {
		if(opt == 1){
			top.window.opener.document.itemform.com_desc2.value = docname;
			top.window.opener.document.itemform.qtcombct.value = docid;
			top.window.opener.dataupdate(docid,'qtcombct');
		}
		else if(opt == 2){
			top.window.opener.document.itemform.com_desc1.value = docname;
			top.window.opener.document.itemform.pocombct.value = docid;
			top.window.opener.dataupdate(docid,'pocombct');
		}

		top.window.close();
	}
	</cfoutput>

</SCRIPT>

</head>
<cfoutput>
<cfparam name="searchcode" default="">
<cfparam name="searchtdesc" default="">
<body class="mainpage" >
<cfquery name="getdata" datasource="#dbname#">
	select comname,comid,comno from company
	where company.type IN ('0','3')
	and company.comid !='0'
	and flag = '1'
	<cfif searchtdesc neq "" and searchtdesc neq "Description">
		and upper(company.comname) like '%#ucase(searchtdesc)#%'
	</cfif>
	order by company.comname
</cfquery>
<cfif getdata.recordcount neq "0">
	<table class="basetable">
		<td class="datatableheadercell" style="width:50px;">&nbsp;</td>
		<td class="datatableheadercell" style="text-align:left;padding-left:5px;">Description</td>
		<cfloop query="getdata">
			<tr valign="middle">
				<td class="datatabledatacell_#(getdata.currentRow%2)#" style="text-align:center;">
					<cfset jss="update('#getdata.comno#','#getdata.comname#','#opt#');">
					<input type="button" value="S" name="btnselect" class="button3" onclick="#htmleditformat(jss)#">
				</td>
				<td class="datatabledatacell_#(getdata.currentRow%2)#" style="text-align:left;">
					#htmleditformat(getdata.comname)#
				</td>
			</tr>
		</cfloop>
	</table>
<cfelse>
	<table class="basetable">
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
