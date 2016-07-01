<cftransaction>

<cfquery name="getselected" datasource="#dbname#">
	select * from sales_tmp_promotion_item
	where salesid = '#nextid#'
</cfquery>
<cfquery name="getref" datasource="#dbname#">
	select nextval('seq_sales_det_linerefid') as linerefid
</cfquery>
<cfquery name="getsaleshdr" datasource="#dbname#">
	select * from sales_tmp_hdr
	where id='#nextid#'
</cfquery>

<cfloop query="getselected">
	
	<cfif itemtype EQ "PI">
		<cfquery name="getolditem" datasource="#dbname#">
			select sum(qty - bal_qty) as qty from sales_tmp_det 
			where refid = '#nextid#'
			and itemid ='#getselected.itemid#'
			and type IN ('I','S','PI','PS')
		</cfquery>
		<cfquery name="getcurqty" datasource="#dbname#">
			select currstkqty - #val(getolditem.qty)# as currstkqty from inventory_hdr 
			where itemid ='#getselected.itemid#'
			and branch = '#session.him_session.branchid#'
		</cfquery>
		
		<cfif getcurqty.currstkqty LTE getselected.qty>
			<cfset drawnqty = listgetat(val(getcurqty.currstkqty),1,'.')>
			<cfset bal_qty = getselected.qty - drawnqty>
		<cfelse>
			<cfset drawnqty = getselected.qty>
			<cfset bal_qty = getselected.qty - drawnqty>
		</cfif>
		
	<cfelseif itemtype EQ "PS">
		<cfset drawnqty = 0>
		<cfset bal_qty = getselected.qty>
	<cfelse>
		Missing Type <cfabort>
	</cfif>
	

	
	<cfquery name="insertsalesdet" datasource="#dbname#">
		insert into sales_tmp_det
		(id,refid,branch,itemid,type,qty,bal_qty,price,disc,disctype,remark,linerefid,personnel)
		values
		(nextval('seq_sales_det_id'),'#nextid#','#session.him_session.branchid#','#getselected.itemid#','#getselected.itemtype#','#getselected.qty#','#bal_qty#',
		'#getselected.unitprice#','0','P',null,'#getref.linerefid#','#getsaleshdr.personnel#') 
	</cfquery>

</cfloop>


<!--- SVENNI --->
<cfquery name="getpackage" datasource="#dbname#">
	select * from sales_tmp_promotion where refid = '#nextid#'
</cfquery>
<!--- INSERT THE TYPE P --->
<cfquery name="insertsalesdet" datasource="#dbname#">
	insert into sales_tmp_det
	(id,refid,branch,itemid,type,qty,bal_qty,price,disc,disctype,remark,linerefid,personnel)
	values
	(nextval('seq_sales_det_id'),'#nextid#','#session.him_session.branchid#','#getpackage.packageno#','P','1','0',
	'0','0','P',null,'#getref.linerefid#','#getsaleshdr.personnel#') 
</cfquery>


<!--- need to pass in nextid,sid , return rounded_doctotal--->
<cfset sid=0>
<cfinclude template="databind/act_calculatedoctotal.cfm">

</cftransaction>



done