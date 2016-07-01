<cfsilent>
	<cfset tabchr = Chr(13) & Chr(10)>
	<cfset val = "">	
	
	<cfif isdefined("formhdrid") and trim(formhdrid) neq "">	
		<cfquery name="getuse1" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select * from mainitem
			where levelid='#formhdrid#'
			<!--- and false ---><!--- ***CHANGEHERE : unremark it --->
		</cfquery>
		
		<cfif getuse1.RecordCount gt 0>
			<cfset val = val & "Cannot Delete Record - Record had been used.#tabchr#">
		</cfif>		
	<cfelse>
		<cfset val = "Something goes wrong #tabchr#">	
	</cfif>
</cfsilent><cfoutput><?xml version="1.0"?>
<returndata>
	<returnrow>
		<msgerror>#XmlFormat(trim(val))#</msgerror>
	</returnrow>
</returndata></cfoutput>