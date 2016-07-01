<cfsilent>
<cfset tabchr = Chr(13) & Chr(10)>
<cfset val = "">
<cfquery name="checkhdr" datasource="#dbname#">
	select * from customer_temp 
	where id = '#custid#'
</cfquery>	
	
<cfif checkhdr.name eq "">
	<cfset val = val & "Name Must Be Entered.#tabchr#">
</cfif>	

<cfif trim(val) eq "">
	<cfset val = "ok">
</cfif>
</cfsilent><cfcontent  type="application/xml" reset="true" ><?xml version="1.0" encoding="UTF-8"?><cfoutput>
<returndata>
	<returnrow>
		<msgerror>#XmlFormat(trim(val))#</msgerror>
	</returnrow>
</returndata></cfoutput>
