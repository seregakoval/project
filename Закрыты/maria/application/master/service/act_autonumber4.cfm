

<cfif global_mstitemcateautonumber eq "runningno">

	<cfquery name="getmaxref" datasource="#dbname#">
		select max(refnumber) as maxref from itemcate
	</cfquery>
	<cfset newno = val(getmaxref.maxref) + 1>
	<cfset newref = "#numberformat(newno,"00000")#">


<!--- FOR MANUAL ENTRY, GET FROM HEADER --->
<cfelse>
	<cfset newno = 0>
	<cfset newref = gethdr.codeno>
</cfif>
