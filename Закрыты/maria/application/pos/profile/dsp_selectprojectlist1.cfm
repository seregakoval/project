<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/newcss3acc.css">


<SCRIPT LANGUAGE="JavaScript">
<cfoutput>
function update(projectname,partname,projectid,partid) {
	top.window.opener.document.itemform.searchpronm.value = projectname;
	top.window.opener.document.itemform.searchpro.value = projectid;
	top.window.opener.document.itemform.searchpart.value = partid;
	top.window.close();
}
</cfoutput>

</SCRIPT>

</head>
<cfoutput>
<body class="mainpage" >
<cfset rcount=0><!--- don't change and this is must. this muct be define in begining --->
<!--- LEVEL 1 --->
<cfif displaylevel eq "1">	
	<cfquery name="getproject" datasource="#dbname#">
		select * from project
		where project.status ='1'
		and project.projectid !='0'
		and project.stage = '1'
		order by project.projectcode
		limit 50
	</cfquery>
	<table class="searchtable">
	<cfloop query="getproject">				
		<tr>		
			<td class="datatabledatacell_#(rcount%2)#" style="text-align:center;width:50px;">
				<cfset jss = "update('#jsstringformat(getproject.projectcode)# - #jsstringformat(getproject.sdesp)#','',#jsstringformat(getproject.projectid)#,'');">
				<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
			</td>				
			<td class="datatabledatacell_#(getproject.currentRow%2)#" style="text-align:left;">
				<cfif getproject.projectid eq "2" or getproject.projectid eq "1">
					&nbsp;&nbsp;<a class="nevelink" href="dsp_selectprojectlist1.cfm?id=#getproject.projectid#&displaylevel=2">#htmleditformat(getproject.projectcode)# - #htmleditformat(getproject.sdesp)#</a>
				<cfelse>
					&nbsp;&nbsp;#htmleditformat(getproject.projectcode)# - #htmleditformat(getproject.sdesp)#
				</cfif>
			</td>
		</tr>		
	</cfloop>
	</table>

<!--- LEVEL 2 --->
<cfelseif displaylevel eq "2">
	<cfquery name="getproject" datasource="#dbname#">
		select * from project
		where projectid= '#id#'
	</cfquery>
	<cfquery name="getpart" datasource="#dbname#">
		select * from part
		where projectid= '#id#'
		order by outline_no
	</cfquery>		
	
		
	<cfif getpart.recordcount neq "0">
		<cfset divmainwidth = 690>
		<table class="searchtable">
			<tr>						
				<td class="searchheaderrow" style="padding-left:10px;">
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_selectprojectlist1.cfm?id=&displaylevel=1">#htmleditformat(getproject.projectcode)# - #htmleditformat(getproject.sdesp)#</a>
				</td>
			</tr>
		</table>
	<cfelse>	
		<table class="searchtable">
			<tr>						
				<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;padding-left:10px;">
					&nbsp;&nbsp;<img align="absmiddle" src="../../images/lib.gif" width=16 height=16>&nbsp;&nbsp;<a class="nevelink" href="dsp_selectprojectlist1.cfm?id=&displaylevel=1">&nbsp;</a>
				</td>
			</tr>
		</table>	
	</cfif>
	
	<cfif getpart.recordcount neq "0">
		<cfloop query="getpart">
			<table class="searchtable">
				<tr >
					<td class="datatabledatacell_#(rcount%2)#" style="text-align:center;width:50px;">
						<cfset jss = "update('#jsstringformat(getproject.projectcode)# - #jsstringformat(getproject.sdesp)#','#jsstringformat(getpart.part_desp)#',#jsstringformat(getproject.projectid)#,#jsstringformat(getpart.part_no)#);">
						<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
					</td>
					<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;">
						<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getpart.part_code)#</font> #htmleditformat(getpart.part_desp)#
					</td>
				</tr>
			</table>
			<cfset rcount=rcount + 1>
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
	<cfquery name="getpart" datasource="#dbname#">
		select project.projectid,part.part_no,project.sdesp,part.part_desp ,project.projectcode
		from part,project
		where project.projectid= part.projectid
                and project.projectid !='0'
				and project.stage = '1'
		<cfif searchprojectcode NEQ "" and searchprojectcode NEQ "Code">
			<cfif  isdefined("searchtype") and searchtype EQ "start">
				 and trim(upper(project.projectcode)) like '#trim(ucase(searchprojectcode))#%' 			
			<cfelse>
				 and trim(upper(project.projectcode)) like '%#trim(ucase(searchprojectcode))#%' 			
			</cfif>
		<cfelseif searchprojectdesc NEQ "" and searchprojectdesc NEQ "Description">
			<cfloop list="#searchprojectdesc#" delimiters=" " index="thisdesc">
				<cfif isdefined("searchtype") and searchtype EQ "start">
					and trim(upper(project.sdesp)) like '#trim(ucase(thisdesc))#%' 
				<cfelse>
				 	and trim(upper(project.sdesp)) like '%#trim(ucase(thisdesc))#%' 
				</cfif>
			</cfloop>
		</cfif>
		order by projectid,part.outline_no
		limit 300
	</cfquery>		


	<cfif getpart.recordcount neq "0">
		
		<cfset base = "">

		<cfloop query="getpart">				
			
			<cfset divmainwidth = 690>
			<cfif base neq #htmleditformat(getpart.projectid)# >		
				<table class="searchtable">
					<tr>	
						<td class="searchheaderrow" style="text-align:center;width:50px;padding-left:0px;">
							<cfset jss = "update('#jsstringformat(getpart.projectcode)# - #jsstringformat(getpart.sdesp)#','#jsstringformat(getpart.part_desp)#',#jsstringformat(getpart.projectid)#,#jsstringformat(getpart.part_no)#);">
							<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
						</td>					
						<td  class="searchheaderrow" style="padding-left:0px;">
							<a class="nevelink" href="dsp_selectprojectlist1.cfm?id=&displaylevel=1">#htmleditformat(getpart.projectcode)# - #htmleditformat(getpart.sdesp)#</a>
						</td>
					</tr>
				</table>
				<cfset base = #htmleditformat(getpart.projectid)# >	
			</cfif>		
			<cfif getpart.projectid eq "2" or getpart.projectid eq "1">
				<table class="searchtable">
					<tr>
						<td class="datatabledatacell_#(rcount%2)#" style="text-align:center;width:45px;">
							<cfset jss = "update('#jsstringformat(getpart.projectcode)# - #jsstringformat(getpart.sdesp)#','#jsstringformat(getpart.part_desp)#',#jsstringformat(getpart.projectid)#,#jsstringformat(getpart.part_no)#);">
							<input type="button" value="S" name="btnselect" class="btns" onclick="#htmleditformat(jss)#">
						</td>
						<td class="datatabledatacell_#(rcount%2)#" style="text-align:left;">
							<img align="absmiddle" src="../../images/spacer.gif" width=12 height=14><font color="Red">#htmleditformat(getpart.part_no)#</font> #htmleditformat(getpart.part_desp)#
						</td>
					</tr>
				</table>
			</cfif> 
			<cfset rcount=rcount + 1>
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
