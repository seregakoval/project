<cfsilent>
	<cfset tabchr = Chr(13) & Chr(10)>
	<cfset val = "">

	<cfquery name="gethdr" datasource="#dbName#">
		select *
		from itemcate_temp
		where  itemid = '#formhdrid#'
	</cfquery>
	<cfif isdefined("docaction") and trim(docaction) neq "">
		<cfif docaction neq "edit"><!--- WHEN ADD NEW DATA --->
			<cfquery name="chkdublicate" datasource="#dbName#"><!--- check dublicate data CHANGE ACCORDING TO YOUR MASTER--->
				select itemcate.*,maincate.description as maindesc
				from itemcate,maincate								<!--- ***CHANGEHERE : rename table --->
				where  ( upper(itemcate.codeno) = '#ucase(gethdr.codeno)#'		<!--- ***CHANGEHERE : add or remove column --->
				or upper(itemcate.description) = '#ucase(gethdr.description)#')			<!--- ***CHANGEHERE : add or remove column --->
				and itemcate.mainid = '#val(gethdr.mainid)#'  <!--- if same mainid cannot have sames description --->
				and maincate.mainid = itemcate.mainid
			</cfquery>
			<cfif chkdublicate.RecordCount gt 0>
				<cfset val = "Data already In Use [#chkdublicate.codeno# - #chkdublicate.description# @ #chkdublicate.maindesc#]!!! #tabchr#">
			</cfif>
		<cfelseif docaction eq "edit"><!--- WHEN EDIT DATA --->
			<cfquery name="chkdublicate" datasource="#dbName#"><!--- check dublicate data CHANGE ACCORDING TO YOUR MASTER --->
				select itemcate.*,maincate.description as maindesc
				from itemcate,maincate									<!--- ***CHANGEHERE : rename table --->
				where  itemcate.itemid != '#formhdrid#'					<!--- ***CHANGEHERE : add or remove column & rename column--->
				and maincate.mainid = itemcate.mainid
				and itemcate.mainid = '#val(gethdr.mainid)#'  <!--- if same mainid cannot have sames description --->
				and ( upper(itemcate.codeno) = '#ucase(gethdr.codeno)#'				<!--- ***CHANGEHERE : add or remove column & rename column--->
				or  upper(itemcate.description) = '#ucase(gethdr.description)#' )		<!--- ***CHANGEHERE : rename column --->
			</cfquery>
			<cfif chkdublicate.RecordCount gt 0>
				<cfset val = "Data already In Use [#chkdublicate.codeno# - #chkdublicate.description# @ #chkdublicate.maindesc#]!!! #tabchr#">
			</cfif>
		<cfelse><!--- WHEN WRONG ACTION --->
			<cfset val = "Something goes wrong in form action #tabchr#">
		</cfif>

		<cfquery name="chkdublicatecode" datasource="#dbName#"><!--- check dublicate data CHANGE ACCORDING TO YOUR MASTER--->
			select itemcate.*
			from itemcate
			where upper(itemcate.codeno) = '#ucase(gethdr.codeno)#'	
			<cfif docaction eq "edit">
				and  itemcate.itemid != '#formhdrid#'
			</cfif>			
		</cfquery>
		
		<cfif chkdublicate.RecordCount neq 0>
			<cfset val = "Code already In Use #tabchr#">
		</cfif>


		<cfif trim(gethdr.codeno) eq "" and global_mstitemcateautonumber eq "manual">
			<cfset val = "Please Enter Item No #tabchr#">
		</cfif>

		<cfif trim(gethdr.costid) eq "">
			<cfset val = "Charge Code can not be empty!!! #tabchr#">
		</cfif>

		<cfif val(gethdr.stockunit) eq 0>
			<cfset val = "Stock Unit can not be empty!!! #tabchr#">
		</cfif>

		<cfset checker=gethdr.stockunit>
		<cfloop from="1" to="4" index="looper">
			<cfset val1=evaluate("gethdr.altunit"&"#looper#")>
			<cfset find=listfind(checker,"#val1#")>
			<cfif val1 is not "0">
				<cfif find is "0">
					<cfset checker=listappend(checker,"#val1#")>
				<cfelse>
					<cfset val = "No Duplicate Alternative Unit #tabchr#">
					<cfbreak>
				</cfif>
			</cfif>
		</cfloop>

		<cfif gethdr.pricebaseon eq "D" and gethdr.discon eq "P" >
			<cfloop from="1" to="5" index="looper" >
				<cfset cmp = evaluate("gethdr.discamt" & #looper#) >
				<cfif cmp greater than "100">
					<cfset val = "Discount Percent Cannot More Than 100%! #tabchr#">
				</cfif>
			</cfloop>
		</cfif>

		<cfset base = 0 >
		<cfloop from="1" to="5" index="looper" >
			<cfset cmp = val(evaluate("gethdr.discqty" & #looper#)) >
			<cfif cmp greater than base or cmp eq "0">
				<cfif cmp neq "0">
					<cfset base = #cmp# >
				</cfif>
			<cfelse>
				<cfset val = "Qty/Cost are not in order ! #tabchr#">
				<cfbreak>
			</cfif>
		</cfloop>

	<cfelse>
		<cfset val = "Something goes wrong in form validation #tabchr#">
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