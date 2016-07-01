<cfquery name="getnext" datasource="#dbname#">
	select nextval('seq_sales_tmp_promotion_item_id') as id
</cfquery>

<cfif itemtype EQ 1>
	<cfset thisitemtype = "PI">
<cfelseif itemtype EQ 2>
	<cfset thisitemtype = "PS">
</cfif>
<cfquery name="insertsession" datasource="#dbname#">
	insert into sales_tmp_promotion_item
	( id, refid,salesid,groupitemid , itemid, itemtype , qty , unitprice)
	values
	('#getnext.id#','#groupid#','#nextid#','#groupitemid#','#itemid#','#thisitemtype#',1,'#unitprice#')
</cfquery>

<cfoutput>
<cflocation url="package_selectitem.cfm?nextid=#nextid#&thispackageno=#thispackageno#&thisgroupno=#thisgroupno#&stepno=#stepno#">
</cfoutput>