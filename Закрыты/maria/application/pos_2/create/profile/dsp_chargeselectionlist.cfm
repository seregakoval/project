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
function update(costcode,costname,costid,accid,acccode,accname){
	top.window.opener.document.itemform.chargename.value = costname;
	top.window.opener.document.itemform.chargecode.value = costcode;
	top.window.opener.document.itemform.chargeid.value = costid;
	top.window.opener.document.itemform.accname.value = accname;
	top.window.opener.document.itemform.acccode.value = acccode;
	top.window.opener.document.itemform.accid.value = accid;
	top.window.opener.document.itemform.partycode.value = '';
	top.window.opener.document.itemform.partyid.value = '';
	top.window.opener.document.itemform.partyname.value = '';
	top.window.close();
}
</script>

<cfparam name="displaylevel" default="1">
<Cfparam name="id" default="">

<cfoutput>
<body class="mainpage" >

<!--- LEVEL 1 --->
<cfif displaylevel eq "1">	
	<cfquery name="getcharge" datasource="#dbname#">
		select mcostid,description,maincode
		from maincost
		order by maincode
	</cfquery>
	<table class="searchtable">
	<cfloop query="getcharge">
		<tr>						
			<td class="datatabledatacell_#(getcharge.currentRow%2)#" style="text-align:left;">
				&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=#getcharge.mcostid#&displaylevel=2&pro=#pro#">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
			</td>
		</tr>
	</cfloop>	
	</table>
<!--- LEVEL 2 --->
<cfelseif displaylevel eq "2">
	<cfquery name="getcharge" datasource="#dbname#">
		select * from maincost
		where mcostid = '#id#'
		order by maincode
	</cfquery>
	
	<cfquery name="getcharge2" datasource="#dbname#">
		select * from costgroup
		where costgroup.mcostid = '#id#'
		order by cgcode	
	</cfquery>		
			
	<cfset divmainwidth = 690>	
	<table class="searchtable">
		<tr>						
			<td class="searchheaderrow" style="padding-left:10px;">				
				<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=&displaylevel=1&pro=#pro#">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
			</td>
		</tr>
	</table>
	
	<cfif getcharge2.recordcount neq "0">
		<cfloop query="getcharge2">
			
			<table class="searchtable">
				<tr>						
					<td class="ddatatabledatacell_#((getcharge2.currentRow+1)%2)#" style="text-align:left;" >
						&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=#getcharge2.mcostid#&id2=#getcharge2.cgid#&displaylevel=3&pro=#pro#">#htmleditformat(getcharge2.cgcode)# #htmleditformat(getcharge2.description)#</a>
					</td>
				</tr>
			</table>		
		</cfloop>		
	<cfelse>
		<table class="searchtable">
			<tr>
				<td bgcolor="##EFEFEF" style="text-align:left;font-family:arial ; font-size:10pt; color:##484848;padding-left:10px;font-weight:bold;">
				  No Product Available That Match Your Search
				</td>
			</tr>
		</table>
	</cfif>		
	
<!--- LEVEL 3 --->
<cfelseif displaylevel eq "3">
	<cfquery name="getcharge" datasource="#dbname#">
		select * from maincost
		where mcostid = '#id#'
		order by maincode
	</cfquery>
	
	<cfquery name="getcharge2" datasource="#dbname#">
		select * from costgroup
		where cgid = '#id2#'
		order by cgcode	
	</cfquery>		
			
	<cfset divmainwidth = 690>
	<table class="searchtable">
		<tr>						
			<td class="searchheaderrow" style="padding-left:10px;">				
				<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=&displaylevel=1&pro=#pro#">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
			</td>
		</tr>
	</table>	
	<table class="searchtable">
		<tr>						
			<td class="searchheaderrow" style="padding-left:10px;">				
				&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=#getcharge2.mcostid#&id2=#getcharge2.cgid#&displaylevel=2&pro=#pro#">#htmleditformat(getcharge2.cgcode)# #htmleditformat(getcharge2.description)#</a>
			</td>
		</tr>
	</table>
	<cfquery name="getcost" datasource="#dbname#">
		select cost.cgid,cost.description,
		cost.chargecode,cost.costid
		from cost
		where cost.cgid = '#id2#'
		order by cost.chargecode
		limit 300
	</cfquery>		

	<cfif getcost.recordcount neq "0">
	<table class="searchtable">
		<cfloop query="getcost">			
			<cfquery name="getmap" datasource="#dbname#">
				select chartofaccount.id,chartofaccount.code,chartofaccount.acc_name from mapchart,chartofaccount
				where mapchart.costid='#getcost.costid#'
				<cfif pro eq 1>
				and mapchart.chartid_s=chartofaccount.id
				<cfelseif pro eq 2>
				and mapchart.chartid_c=chartofaccount.id
				<cfelse>
				and mapchart.chartid=chartofaccount.id
				</cfif>
			</cfquery>					
			
				<tr valign="middle">
					<td class="datatabledatacell_#((getcost.currentRow+1)%2)#" style="text-align:center;width:50px;">
						<cfset jss = "update('#jsstringformat(getcost.chargecode)#','#jsstringformat(getcost.description)#',#jsstringformat(getcost.costid)#,'#jsstringformat(getmap.id)#','#jsstringformat(getmap.code)#','#jsstringformat(getmap.acc_name)#');">
						<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
					</td>
					<td class="datatabledatacell_#((getcost.currentRow+1)%2)#" style="text-align:left;">
						<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getcost.chargecode)#</font> #htmleditformat(getcost.description)#
					</td>
				</tr>
			
		</cfloop>	
		</table>	
	<cfelse>
		<table class="searchtable">
			<tr>
				<td bgcolor="##EFEFEF" style="text-align:left;font-family:arial ; font-size:10pt; color:##484848;padding-left:10px;font-weight:bold;">
				  No Product Available That Match Your Search
				</td>
			</tr>
		</table>
	</cfif>	
<!--- LEVEL 4 --->
<cfelseif displaylevel eq "4">
	<cfquery name="getcost" datasource="#dbname#">
		select cost.cgid,cost.description,cost.chargecode,cost.costid,
		costgroup.cgcode,costgroup.description as desc2,costgroup.cgid,
		maincost.maincode,maincost.description as desc1,maincost.mcostid
		from cost,costgroup,maincost
		where cost.cgid = costgroup.cgid
		and costgroup.mcostid = maincost.mcostid
		<cfif searchcostcode NEQ "" and searchcostcode NEQ "Cost Code">
			<cfif searchtype EQ "start">
				 and trim(upper(cost.chargecode)) like '#trim(ucase(searchcostcode))#%' 			
			<cfelse>
				 and trim(upper(cost.chargecode)) like '%#trim(ucase(searchcostcode))#%' 			
			</cfif>
		<cfelseif searchcostdescription NEQ "" and searchcostdescription NEQ "Cost Description">
			<cfloop list="#searchcostdescription#" delimiters=" " index="thisdescription">
				<cfif searchtype EQ "start">
					and trim(upper(cost.description)) like '#trim(ucase(thisdescription))#%' 
				<cfelse>
				 	and trim(upper(cost.description)) like '%#trim(ucase(thisdescription))#%' 
				</cfif>
			</cfloop>
		</cfif>
		order by maincost.maincode,costgroup.cgcode,cost.chargecode
		limit 300
	</cfquery>		

	<cfif getcost.recordcount neq "0">
		
		<cfset base = "">
		<cfset base2 = "">

		<cfloop query="getcost">				
			
			<cfset divmainwidth = 690>
			<cfif base2 neq #htmleditformat(getcost.mcostid)# >				
				<table class="searchtable">
					<tr>						
						<td class="searchheaderrow" style="padding-left:10px;">				
							<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=&displaylevel=1">#htmleditformat(getcost.maincode)# #htmleditformat(getcost.desc1)#</a>
						</td>
					</tr>
				</table>
				<cfset base2 = #htmleditformat(getcost.mcostid)# >	
			</cfif>		
			
			<cfif base neq #htmleditformat(getcost.cgid)# >	
				<table class="searchtable">
					<tr>						
						<td class="searchheaderrow" style="padding-left:10px;">				
							&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_chargeselectionlist.cfm?id=&displaylevel=1">#htmleditformat(getcost.cgcode)# #htmleditformat(getcost.desc2)#</a>
						</td>
					</tr>
				</table>
				<cfset base = #htmleditformat(getcost.cgid)# >	
			</cfif>		
	
			<cfquery name="getmap" datasource="#dbname#">
				select chartofaccount.id,chartofaccount.code,chartofaccount.acc_name from mapchart,chartofaccount
				where mapchart.costid='#getcost.costid#'
				<cfif pro eq 1>
				and mapchart.chartid_s=chartofaccount.id
				<cfelseif pro eq 2>
				and mapchart.chartid_c=chartofaccount.id
				<cfelse>
				and mapchart.chartid=chartofaccount.id
				</cfif>
			</cfquery>			
			<table class="searchtable">
				<tr valign="middle">
					<td class="datatabledatacell_#((getcost.currentRow+1)%2)#" style="text-align:center;width:50px;">
						<cfset jss = "update('#jsstringformat(getcost.chargecode)#','#jsstringformat(getcost.description)#',#jsstringformat(getcost.costid)#,'#jsstringformat(getmap.id)#','#jsstringformat(getmap.code)#','#jsstringformat(getmap.acc_name)#');">
					<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
					</td>
					<td class="datatabledatacell_#((getcost.currentRow+1)%2)#" style="text-align:left;">
						<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getcost.chargecode)#</font> #htmleditformat(getcost.description)#
					</td>
				</tr>
			</table>
		</cfloop>		
	<cfelse>
		<table class="searchtable">
			<tr>
				<td bgcolor="##EFEFEF" style="text-align:left;font-family:arial ; font-size:10pt; color:##484848;padding-left:10px;font-weight:bold;">
				  No Product Available That Match Your Search
				</td>
			</tr>
		</table> 
	</cfif>	
</cfif>
</body>
</cfoutput>
</html>

