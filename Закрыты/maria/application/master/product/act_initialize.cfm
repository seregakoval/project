<cftransaction>

<cfif fuseaction eq "newitem">
	<cfquery name="gethdrid" datasource="#dbname#">
		select nextval('seq_itemcate_itemid') as nextid
	</cfquery>
	<cfset formhdrid = gethdrid.nextid>

	<cfquery name="getmaincostid" datasource="#dbname#">
		select * from maincate where mainid = '#parentid#'
	</cfquery>
	<cfquery name="insert" datasource="#dbname#">
		insert into itemcate_temp(itemid,mainid,obsoletestatus, costid)   
		values ('#formhdrid#','#parentid#','1', <cfif getmaincostid.costid NEQ ""> '#getmaincostid.costid#'<cfelse>null</cfif>)
	</cfquery>

	<cfset docaction = "new">


<cfelseif fuseaction eq "edititem">
	<cfquery name="gethdr" datasource="#dbname#">
		select * from itemcate
		where itemid = '#formhdrid#'
	</cfquery>

	<!--- delete temp tables --->
	<cfquery name="del1" datasource="#dbname#">
		delete from itemcate_temp where itemid ='#formhdrid#'
	</cfquery>

	<!--- insert into temp table --->
	<cfquery name="inserthdr" datasource="#dbname#">
		insert into itemcate_temp select * from itemcate where itemid ='#formhdrid#'
	</cfquery>

	<cfset docaction = "edit">
</cfif>

</cftransaction>