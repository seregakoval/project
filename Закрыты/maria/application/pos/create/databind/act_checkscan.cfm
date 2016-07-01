<cfsilent>
<cfset  tabchr2 = Chr(13) & Chr(10)>
<cfset val = "">

<cfset thiscode = urldecode(trim(codeno))>
<!---cfset codelen = len(thiscode)>
		<cfif codelen LT 13>
		<cfset addno = 13 - codelen>
		<cfset thiscode = repeatstring("0",addno) & thiscode>
	</cfif--->	

<!--- <cfquery name="getitem" datasource="#dbname#">
	select inventory_hdr.currstkqty,itemcate_pos.* 
	from itemcate_pos left outer join inventory_hdr on (itemcate_pos.itemid = inventory_hdr.itemid
	and inventory_hdr.branch = '#session.him_session.branchid#')
	
	where upper(codeno) like '#ucase(thiscode)#'
	limit 1
</cfquery> --->


<cfquery name="getitem" datasource="#dbname#">
	select inventory_hdr.currstkqty,itemcate_pos.* 
	from itemcate_pos left outer join inventory_hdr on (itemcate_pos.itemid = inventory_hdr.itemid
	and inventory_hdr.branch = '#session.him_session.branchid#')
	
	where upper(altdesc) like '#ucase(thiscode)#'
	limit 1
</cfquery>

<cfset header = "count|itemid|itemtype">
<cfif getitem.itemtype eq 1 and getitem.currstkqty lte 0>
	<cfset val = "-#getitem.recordcount#|#getitem.itemid#|#getitem.itemtype#|#thiscode#">
<cfelse>
	<cfset val = "#getitem.recordcount#|#getitem.itemid#|#getitem.itemtype#|#thiscode#">
</cfif>
</cfsilent><cfoutput>#header#
#val#</cfoutput>
