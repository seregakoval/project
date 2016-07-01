<cfsilent>
<cfset tabchr = Chr(13) & Chr(10)>
<cfset val = "">
	
	<cfquery name="getsalesdet" datasource="#dbname#">
		select * from sales_tmp_det
		where id in (#passid#)
	</cfquery>
	<cfset all_linerefid_list = valuelist(getsalesdet.linerefid)>
	
	<cfquery name="getallid" datasource="#dbname#">
		select id from sales_tmp_det
		where linerefid in (#all_linerefid_list#)
	</cfquery>
	<cfset allidlist = valuelist(getallid.id)>

	<cfquery name="delete" datasource="#dbname#">
		delete from sales_tmp_det
		where linerefid in (#all_linerefid_list#)
	</cfquery>
	
	<cfinclude template="act_updatesaleshdr.cfm">
	
	
<!--- <cfset val = val & "#getsalesdet.recordcount#|1|#allidlist#|#decimalformat(rounded_doctotal)#|#tabchr#">
<cfset headertext = "count|alert|passid|doctotal">
</cfsilent><cfoutput>#headertext##tabchr##val#</cfoutput> --->


<cfif trim(val) eq "">
	<cfset val = "ok">
</cfif>

</cfsilent><cfcontent  type="application/xml" reset="true" ><?xml version="1.0" encoding="UTF-8"?><cfoutput>
<returndata>
	<returnrow>
		<msgerror>#XmlFormat(trim(val))#</msgerror>
		<totalsales>#XmlFormat(trim(decimalformat(val(totalsales))))#</totalsales>
	</returnrow>
</returndata></cfoutput>