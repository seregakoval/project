<cfif isdefined("doctype") and trim(doctype) eq "excel">
	<cfcontent type="application/msexcel">
	<cfheader name="Content-Disposition" value="filename=MaterialMaster.xls">
	<html xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:x="urn:schemas-microsoft-com:office:excel"
	xmlns="http://www.w3.org/TR/REC-html40">
</cfif>

<!--- <cfsavecontent variable="strExcelData"> --->
<cfquery name="getall" datasource="#dbname1#">
	select mainlevel.code as l1code,mainlevel.description as l1descp,
	mainitem.code as l2code,mainitem.description as l2descp,
	maingroup.code as l3code,maingroup.description as l3descp,
	maincate.code as l4code,maincate.description as l4descp,
	itemcate.codeno as l5code,itemcate.description as l5descp
	from itemcate,mainitem,maingroup,maincate,mainlevel
	where mainlevel.id = mainitem.levelid
	and mainitem.id = maingroup.mid
	and maingroup.groupid = maincate.groupid
	and maincate.mainid = itemcate.mainid
	order by mainlevel.code,mainitem.code,maingroup.code,itemcate.codeno
</cfquery>

<cfoutput>
<table>
	<tr>
		<th>Level one code</th>
		<th>Level one description</th>
		<th>Level two code</th>
		<th>Level two description</th>
		<th>Level three code</th>
		<th>Level three description</th>
		<th>Level four code</th>
		<th>Level four description</th>
		<th>Item code</th>
		<th>item name</th>
	</tr>
	<cfloop query="getall"> 
		<tr>
			<td>#getall.l1code#</td>
			<td>#getall.l1descp#</td>
			<td>#getall.l2code#</td>
			<td>#getall.l2descp#</td>
			<td>#getall.l3code#</td>
			<td>#getall.l3descp#</td>
			<td>#getall.l4code#</td>
			<td>#getall.l4descp#</td>
			<td>#getall.l5code#</td>
			<td>#getall.l5descp#</td>			
		</tr>
	
	</cfloop>

</table>
</cfoutput>
<!--- </cfsavecontent> --->

<!--- 
<cfif fileExists("/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls")>
	<cffile action = "delete"  file ="/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls" >
</cfif>
<cffile action = "write"  file ="/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls" output="#strExcelData#">

<cffile action = "read"  file ="/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls" variable ="getfile">

<!--- <cfheader name="Content-Length" value="#getfile.size#"> --->
<cfheader name="Content-Type" value="application/octet-stream">
<cfheader name="Content-Disposition" value="attachment;filename=/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls">
<cfheader name="Content-Location" value="/opt/railo/tomcat/webapps/ROOT/symphony/v33/master/material_r1/MaterialMaster.xls">


 --->







