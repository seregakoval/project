<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/newcss3acc.css">
</head>

<script language="JavaScript" src="../../form_tab.js"></script>

<script language="JavaScript">
function update(toAddr1,toAddr2,toAddr3,toAddr4,toAddr5,toAddr6,m,n,k,l,s,t) {
	top.window.opener.document.itemform.elements[m].value = toAddr1;
	top.window.opener.document.itemform.elements[n].value = toAddr2;
	top.window.opener.document.itemform.elements[k].value = toAddr3;
	top.window.opener.document.itemform.elements[l].value = toAddr4;
	top.window.opener.document.itemform.elements[s].value = toAddr5;
	top.window.opener.document.itemform.elements[t].value = toAddr6;
	top.window.parent.close();
}

</script>

<cfparam name="searchcode" default="">	
<cfparam name="searchtdesc" default="">	

<cfoutput>
<body class="mainpage" >


	<cfquery name="retrieve" datasource="#dbname#">
		select partylist.code,partylist.payterm,chartofaccount.id,chartofaccount.code as codeno,chartofaccount.acc_name,
		partylist.id as partyid,company.comname,company.comno
		from chartofaccount,partylist,company
		where partylist.acccontrol=chartofaccount.id
		and partylist.comno=company.comno
		and company.flag='1'
		<cfif isdefined("fd7")>
		and partylist.acccontrol='#val(fd7)#'
		</cfif>
		<cfif searchcode neq "" and searchcode neq "Party Code">
			and upper(partylist.code) like '%#ucase(searchcode)#%'
		</cfif>
		<cfif searchtdesc neq "" and searchtdesc neq "Party Name">
			and upper(company.comname) like '%#ucase(searchtdesc)#%'
		</cfif>
		order by partylist.code
	</cfquery>
	
		

<table class="searchtable">
<cfloop query="retrieve">
	<tr>
		<form>
		<cfset js="update('#jsstringformat(htmleditformat(retrieve.code))#','#jsstringformat(htmleditformat(retrieve.partyid))#','#jsstringformat(htmleditformat(retrieve.comname))#','#jsstringformat(htmleditformat(retrieve.acc_name))#','#jsstringformat(htmleditformat(retrieve.codeno))#','#jsstringformat(htmleditformat(retrieve.id))#','#fd1#','#fd2#','#fd3#','#fd4#','#fd5#','#fd6#');">
		<td class="datatabledatacell_#(retrieve.currentRow%2)#" style="text-align:center;width:50px;"><cfoutput><input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(js)#"></cfoutput></td>
		</form>
		<td  class="datatabledatacell_#(retrieve.currentRow%2)#" style="text-align:left;"><cfoutput><span style="color:##ff0000;">#htmleditformat(retrieve.code)#</span>-#htmleditformat(retrieve.comname)#</cfoutput></td>
	</tr>
</cfloop>


<cfif retrieve.RecordCount eq 0>
	<tr>
		<td style="background-color:##EFEFEF;text-align:left;font-family:arial ; font-size:10pt; color:##484848;padding-left:10px;font-weight:bold;">
		  No Data Available.
		</td>
	</tr>
</cfif>
</table>
</body>
</cfoutput>
</html>

