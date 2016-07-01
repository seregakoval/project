

<cfif global_mstmainlevelautonumber eq "runningno">

	<cfquery name="getmaxref" datasource="#dbname#">
		select max(refnumber) as maxref from mainlevel
	</cfquery>
	<cfset newno = val(getmaxref.maxref) + 1>			
	<cfset newref = "#numberformat(newno,"00000")#">


<!--- FOR MANUAL ENTRY, GET FROM HEADER --->
<cfelse>
	<cfset newno = 0>
	<cfset newref = code>
</cfif>
