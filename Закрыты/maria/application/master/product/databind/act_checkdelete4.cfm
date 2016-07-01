<cfsilent>
	<cfset tabchr = Chr(13) & Chr(10)>
	<cfset val = "">	
	
	<cfif isdefined("formhdrid") and trim(formhdrid) neq "">	
		<cfquery name="checkrecord3" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select itemid from assemblydet
			where itemid ='#formhdrid#'
			and trim(itemtype) = 'M' 
		</cfquery>
		
		<cfquery name="checkrecord2" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select itemid from componentdet
			where itemid ='#formhdrid#'
			and trim(type) = 'M' 
		</cfquery>
		
		<cfquery name="checkrecord1" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select itemid from inventory_det
			where itemid ='#formhdrid#'
		</cfquery>
		
		<cfquery name="checkrecord4" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select itemid from inventory_ns_det
			where itemid ='#formhdrid#'
		</cfquery>
		
		<cfquery name="checkrecord5" datasource="#dbname#"><!--- THIS ONE NEED TO CHANGE ACORDING TO YOUR MASTER --->
			select itemid from podet
			where itemid ='#formhdrid#'
		</cfquery>
		
		<cfif checkrecord1.recordcount IS NOT "0" or checkrecord2.recordcount IS NOT "0" or checkrecord3.recordcount IS NOT "0" or checkrecord4.recordcount IS NOT "0" or checkrecord5.recordcount IS NOT "0">
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