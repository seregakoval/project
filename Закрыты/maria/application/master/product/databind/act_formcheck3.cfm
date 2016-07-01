<cfsilent>
	<cfset tabchr = Chr(13) & Chr(10)>
	<cfset val = "">

	<cfif isdefined("fuseaction") and trim(fuseaction) neq "">
		<cfif trim(code) eq "" and global_mstmaincateautonumber eq "manual">
			<cfset val = "Please Enter Code. #tabchr#">
		</cfif>
		<cfif fuseaction eq "submitmaincate"><!--- WHEN ADD NEW DATA --->
			<cfquery name="chkdublicate" datasource="#dbName#"><!--- check dublicate data CHANGE ACCORDING TO YOUR MASTER--->
				select *
				from maincate								<!--- ***CHANGEHERE : rename table --->
				where groupid = '#parentid#'
				<cfif global_mstmaincateautonumber eq "manual">
					and upper(code) = '#ucase(code)#'		<!--- ***CHANGEHERE : add or remove column --->
					or upper(description) = '#ucase(descp)#'			<!--- ***CHANGEHERE : add or remove column --->
				<cfelse>
					and upper(description) = '#ucase(descp)#'			<!--- ***CHANGEHERE : add or remove column --->
				</cfif>
			</cfquery>
			<cfif chkdublicate.RecordCount gt 0>
				<cfset val = "This Data already got!!! #tabchr#">
			</cfif>
		<cfelseif fuseaction eq "updatemaincate"><!--- WHEN EDIT DATA --->
			<cfquery name="chkdublicate" datasource="#dbName#"><!--- check dublicate data CHANGE ACCORDING TO YOUR MASTER --->
				select *
				from maincate									<!--- ***CHANGEHERE : rename table --->
				where
				groupid = '#parentid#'
				and (mainid != '#docid#'					<!--- ***CHANGEHERE : add or remove column & rename column--->
				and upper(code) = '#ucase(code)#')				<!--- ***CHANGEHERE : add or remove column & rename column--->
				or (upper(description) = '#ucase(descp)#' and mainid != '#docid#')		<!--- ***CHANGEHERE : rename column --->
			</cfquery>
			<cfif chkdublicate.RecordCount gt 0>
				<cfset val = "This Data already got!!! #tabchr#">
			</cfif>
		<cfelse><!--- WHEN WRONG ACTION --->
			<cfset val = "Something goes wrong in form action #tabchr#">
		</cfif>
	<cfelse>
		<cfset val = "Something goes wrong in form validation #tabchr#">
	</cfif>
</cfsilent><cfoutput><?xml version="1.0"?>
<returndata>
	<returnrow>
		<msgerror>#XmlFormat(trim(val))#</msgerror>
	</returnrow>
</returndata></cfoutput>