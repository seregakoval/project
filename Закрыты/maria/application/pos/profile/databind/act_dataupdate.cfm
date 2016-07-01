<cfsilent>
<cfset tabchr = Chr(13) & Chr(10)>
<cfset quotedstatus = "Y">

<cfif currfield eq "journaldate" or currfield eq "expire_date" or currfield eq "lastvisitdate">
	<cfif isdate(currvar)>
		<cfset currvar = createdatetime(listgetat(currvar,3,'-'),listgetat(currvar,2,'-'),listgetat(currvar,1,'-'),hour(now()),minute(now()),second(now()))>
	<cfelse>
		<cfset currvar = "">
	</cfif>
	<cfset quotedstatus = "N">
</cfif>


<cfquery name="updatedata" datasource="#dbname#">
	update customer_temp
	<cfif quotedstatus EQ "N">
		set	#currfield# = <cfif trim(currvar) neq "">#currvar#<cfelse>null</cfif>
	<cfelse>
		set	#currfield# = <cfif trim(currvar) neq "">'#UrlDecode(trim(currvar))#'<cfelse>null</cfif>
	</cfif>
	where id = '#custid#'
</cfquery>

</cfsilent><cfcontent  type="application/xml" reset="true" ><?xml version="1.0" encoding="UTF-8"?><cfoutput>
<returndata>
	<returnrow>
		<currfield>#currfield#</currfield>
		<currvar>#currvar#</currvar>
	</returnrow>
</returndata></cfoutput>