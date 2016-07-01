<!DOCTYPE html>
<html>
<head>
<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/newcss3.css">

<SCRIPT LANGUAGE="JavaScript">
<cfoutput>
function update(costcode,costname,costid,accid,acccode,accname){
	top.window.opener.document.itemform.costid1.value = costid;
	top.window.opener.document.itemform.costname.value = costname;
	//cannot remark else data not saved to the db
	top.window.opener.dataupdate(costid,'costid');
	top.window.close()
}
</cfoutput>

</SCRIPT>

</head>
<cfoutput>
<body class="entrypage" >
<cfset rcount=0><!--- don't change and this is must. this muct be define in begining --->

<!--- LEVEL 1 --->
<cfif displaylevel eq "1">
	<cfquery name="getcharge" datasource="#dbname#">
		select mcostid,description,maincode
		from maincost
		order by maincode
	</cfquery>
	<cfloop query="getcharge">
		<table class="basetable">
			<tr>
				<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;" >
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAa" href="dsp_selectcostlist.cfm?id=#getcharge.mcostid#&displaylevel=2&pro=">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
				</td>
			</tr>
		</table>
	</cfloop>

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
		<table class="basetable">
			<tr>
				<td class="searchheaderrow" style="padding-left:10px;">
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=&displaylevel=1&pro=">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
				</td>
			</tr>
		</table>

	<cfif getcharge2.recordcount neq "0">
		<cfloop query="getcharge2">
		<table class="basetable">
			<tr>
				<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;padding-left:10px;">
						&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=#getcharge2.mcostid#&id2=#getcharge2.cgid#&displaylevel=3&pro=">#htmleditformat(getcharge2.cgcode)# #htmleditformat(getcharge2.description)#</a>
				</td>
			</tr>
		</table>
		</cfloop>
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
		<table class="basetable" >
			<tr>
				<td class="searchheaderrow" style="padding-left:0px;">
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=&displaylevel=1&pro=">#htmleditformat(getcharge.maincode)# #htmleditformat(getcharge.description)#</a>
				</td>
			</tr>
		</table>
		<table class="basetable">
			<tr>
				<td class="searchheaderrow" style="padding-left:10px;">
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=#getcharge2.mcostid#&id2=#getcharge2.cgid#&displaylevel=2&pro=">#htmleditformat(getcharge2.cgcode)# #htmleditformat(getcharge2.description)#</a>
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
			<table class="basetable">
				<tr >
					<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;padding-left:20px;width:20px;">
						<cfset jss = "update('#jsstringformat(getcost.chargecode)#','#jsstringformat(getcost.description)#',#jsstringformat(getcost.costid)#,'#jsstringformat(getmap.id)#','#jsstringformat(getmap.code)#','#jsstringformat(getmap.acc_name)#');">
						<input type="button" value="S" name="btnselect" class="button3" onclick="#htmleditformat(jss)#">
					</td>
					<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;">
						<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getcost.chargecode)#</font> #htmleditformat(getcost.description)#
					</td>
				</tr>
			</table>
			<cfset rcount=rcount + 1>
		</cfloop>
	<cfelse>
	<table class="basetable">
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
		<cfelseif searchprodesc NEQ "" and searchprodesc NEQ "Cost Description">
			<cfloop list="#searchprodesc#" delimiters=" " index="thisdescription">
				<cfif isdefined("searchtype") and searchtype EQ "start">
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
				<table class="basetable">
					<tr>
						<td  class="searchheaderrow" style="padding-left:0px;">
							&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=&displaylevel=1&pro=">#htmleditformat(getcost.maincode)# #htmleditformat(getcost.desc1)#</a>
						</td>
					</tr>
				</table>
				<cfset base2 = #htmleditformat(getcost.mcostid)# >
			</cfif>

			<cfif base neq #htmleditformat(getcost.cgid)# >
				<table class="basetable">
					<tr>
						<td class="searchheaderrow" style="padding-left:10px;">
							&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="m3eAaB" href="dsp_selectcostlist.cfm?id=&displaylevel=1&pro=">#htmleditformat(getcost.cgcode)# #htmleditformat(getcost.desc2)#</a>
						</td>
					</tr>
				</table>
				<cfset base = #htmleditformat(getcost.cgid)# >
			</cfif>

			<cfquery name="getmap" datasource="#dbname#">
				select chartofaccount.id,chartofaccount.code,chartofaccount.acc_name 
				from mapchart,chartofaccount
				where mapchart.costid='#getcost.costid#'
				<cfif pro eq 1>
				and mapchart.chartid_s=chartofaccount.id
				<cfelseif pro eq 2>
				and mapchart.chartid_c=chartofaccount.id
				<cfelse>
				and mapchart.chartid=chartofaccount.id
				</cfif>
			</cfquery>

			<table class="basetable">
				<tr valign="middle">
					<td class="l2datatabledatacell_#(rcount%2)#" style="text-align:left;padding-left:20px;width:20px;">
						<cfset jss = "update('#jsstringformat(getcost.chargecode)#','#jsstringformat(getcost.description)#',#jsstringformat(getcost.costid)#,'#jsstringformat(getmap.id)#','#jsstringformat(getmap.code)#','#jsstringformat(getmap.acc_name)#');">
						<input type="button" value="S" name="btnselect" class="button3" onclick="#htmleditformat(jss)#">
					</td>
					<td class="l2datatabledatacell_#(rcount%2)#" style="text-align:left;">
						<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getcost.chargecode)#</font> #htmleditformat(getcost.description)#
					</td>
				</tr>
			</table>
			<cfset rcount=rcount + 1>
		</cfloop>
	<cfelse>
		<table class="basetable">
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
