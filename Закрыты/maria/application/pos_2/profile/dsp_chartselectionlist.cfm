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
function update(accname,acccode,accid){
	top.window.opener.document.itemform.accname.value = accname;
	top.window.opener.document.itemform.acccode.value = acccode;
	top.window.opener.document.itemform.accid.value = accid;
	top.window.parent.close();
}

</script>

<cfparam name="displaylevel" default="1">
<Cfparam name="id" default="">

<cfoutput>
<body class="mainpage" >

<!--- LEVEL 1 --->
<cfif displaylevel eq "1">	
	<cfquery name="getchart" datasource="#dbname#">
		select acc_name,code,id,controlacc,actype,outline_no,outline_number
		from chartofaccount
		where cat='1'
		and obs='0'
		and partyreq='0' <!--- only show those that do not need party --->
		order by actype,outline_no
	</cfquery>

	<cfif getchart.recordcount neq "0">
		<table class="searchtable">
		<cfloop query="getchart">
			<tr valign="middle">
				<td class="datatabledatacell_#(getchart.currentRow%2)#" style="text-align:center;">
					<cfset jss = "update('#jsstringformat(getchart.acc_name)#','#jsstringformat(getchart.code)#','#jsstringformat(getchart.id)#');">
					<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
				</td>
				<td class="datatabledatacell_#(getchart.currentRow%2)#" style="text-align:left;">
					<span style="color:##ff0000;">#htmleditformat(getchart.code)#</span>&nbsp;-&nbsp;#htmleditformat(getchart.acc_name)#
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

	
	
<!--- LEVEL 2 --->
<cfelseif displaylevel eq "2">
	<cfquery name="getchart" datasource="#dbname#">
		select acc_name,code,id,controlacc,actype,outline_no,outline_number
		from chartofaccount
		where cat='1'
		and obs='0'
		and partyreq='0' <!--- only show those that do not need party --->
		<cfif searchchartcode NEQ "" and searchchartcode NEQ "Chart Code">
			<cfif searchtype EQ "start">
				 and trim(upper(chartofaccount.code)) like '#trim(ucase(searchchartcode))#%' 			
			<cfelse>
				 and trim(upper(chartofaccount.code)) like '%#trim(ucase(searchchartcode))#%' 			
			</cfif>
		<cfelseif searchchartdesc NEQ "" and searchchartdesc NEQ "Chart Description">
			<cfloop list="#searchchartdesc#" delimiters=" " index="thisdesc">
				<cfif searchtype EQ "start">
					and trim(upper(chartofaccount.acc_name)) like '#trim(ucase(thisdesc))#%' 
				<cfelse>
				 	and trim(upper(chartofaccount.acc_name)) like '%#trim(ucase(thisdesc))#%' 
				</cfif>
			</cfloop>
		</cfif>
		order by actype,outline_no
		limit 300
	</cfquery>		


	<cfif getchart.recordcount neq "0">
		<table class="searchtable">
		<cfloop query="getchart">				
			
			<tr valign="middle">
				<td class="datatabledatacell_#(getchart.currentRow%2)#" style="text-align:center;">
					<cfset jss = "update('#jsstringformat(getchart.acc_name)#','#jsstringformat(getchart.code)#','#jsstringformat(getchart.id)#');">
					<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
				</td>
				<td class="datatabledatacell_#(getchart.currentRow%2)#" style="text-align:left;">
					<span style="color:##ff0000;">#htmleditformat(getchart.code)#</span>&nbsp;-&nbsp;#htmleditformat(getchart.acc_name)#
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
</cfif>
</body>
</cfoutput>
</html>

