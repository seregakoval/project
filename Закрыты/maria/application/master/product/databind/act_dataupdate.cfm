<cfsilent>
<cfset tabchr = Chr(13) & Chr(10)>
<cfset quotedstatus = "Y">

<cfif currfield eq "FileToUpload1">

</cfif>


<cfquery name="updatedata" datasource="#dbname#">
	update itemcate_temp
	<cfif quotedstatus EQ "N">
		set	#currfield# = <cfif trim(currvar) neq "">#currvar#<cfelse>null</cfif>
	<cfelse>
		set	#currfield# = <cfif trim(currvar) neq "">'#trim(currvar)#'<cfelse>null</cfif>
		<!--- set	#currfield# = <cfif trim(currvar) neq "">'#UrlDecode(trim(currvar),"utf-8")#'<cfelse>null</cfif> --->
	</cfif> 
	where itemid = '#formhdrid#'
</cfquery>

<!--- <cfif currfield eq "rate">
	<cfquery name="updatedet" datasource="#dbname#">
		update billdet_temp
		set glentryinvamt = amount * #trim(currvar)#,
		gst_amount = gst_doc * #trim(currvar)#,
		finaltotal =((amount * #trim(currvar)#) + (gst_doc * #trim(currvar)#)) - (retamt  * #trim(currvar)#),
		glentryretamt = retamt  * #trim(currvar)#
		where refid = '#formhdrid#'
	</cfquery>
</cfif> --->


</cfsilent><cfcontent  type="application/xml" reset="true" ><?xml version="1.0" encoding="UTF-8"?><cfoutput>
<returndata>
	<returnrow>
		<currfield>#currfield#</currfield>
		<currvar>#currvar#</currvar>
	</returnrow>
</returndata></cfoutput>
