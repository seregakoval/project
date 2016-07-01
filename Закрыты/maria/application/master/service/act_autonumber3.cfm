
<cfif global_mstmaincateautonumber eq "runningno">

	<cfquery name="getmaxref" datasource="#dbname#">
		select max(refnumber) as maxref from maincate
	</cfquery>
	<cfset newno = val(getmaxref.maxref) + 1>
	<cfset newref = "#numberformat(newno,"00000")#">

<cfelseif global_mstmaincateautonumber eq "runningno2">

	<cfquery name="getmaxref" datasource="#dbname#">
		select max(refnumber) as maxref from maincate
	</cfquery>
	<cfset newno = val(getmaxref.maxref) + 1>
	<cfset newref = "#numberformat(newno,"0000")#">


<!--- FOR MANUAL ENTRY, GET FROM HEADER --->
<cfelse>
	<cfset newno = 0>
	<cfset newref = code>
</cfif>
