<cfsilent>
<cfset tabchr = Chr(13) & Chr(10)>
<cfset val = "">
	<cfquery name="getdet" datasource="#dbname#">
		select * from sales_tmp_det where id = '#id#'
	</cfquery>
	
	
	<cfif currfield eq "qty">
		<cfquery name="getcurqty" datasource="#dbname#">
			select currstkqty from inventory_hdr  where itemid ='#getdet.itemid#'   and branch = '#session.him_session.branchid#'
		</cfquery>
		<cfif val(getcurqty.currstkqty) lte val(currvar)>
			<cfset col_qty = val(getcurqty.currstkqty)>
			<cfset bal_qty =  val(currvar) - col_qty>
		<cfelse>
			<cfset col_qty = val(currvar)>
			<cfset bal_qty = val(currvar) - col_qty>
		</cfif>
		<cfif val eq "">
			<cfquery name="update" datasource="#dbname#">
				update sales_tmp_det set qty = '#val(currvar)#', bal_qty = '#val(bal_qty)#'  where id='#id#'
			</cfquery>
		</cfif>
		
	<cfelseif currfield eq "price">
		<cfquery name="getitem" datasource="#dbname#">
			select * from itemcate_pos where itemid = '#getdet.itemid#'
		</cfquery>
		
		<cfif getitem.floorprice GT val(currvar)>
			<cfset val = "Floorprice is greater than price entered. #tabchr#">
		</cfif>
		
		<cfif val eq "">
			<cfquery name="update" datasource="#dbname#">
				update sales_tmp_det set price = '#val(currvar)#' where id='#id#'
			</cfquery>
		</cfif>
		
	<cfelseif currfield eq "disc">
		<cfset checkpercent = ListContains(currvar, "%")>
		<cfif checkpercent eq 0>
			<cfset disctype = "A">
			<cfset discamt = val(currvar)>
		<cfelse>
			<cfset disctype = "P">
			<cfset discamt = val(currvar)>
		</cfif>
		
		
		
		<cfif val eq "">
			<cfquery name="update" datasource="#dbname#">
				update sales_tmp_det set disc = '#val(currvar)#', disctype='#disctype#' where id='#id#'
			</cfquery>
		</cfif>
		
		
	<cfelseif currfield eq "col_qty">
		<cfquery name="getcurqty" datasource="#dbname#">
			select currstkqty from inventory_hdr 
            where itemid ='#getdet.itemid#' 
            and branch = '#session.him_session.branchid#'
		</cfquery>
		
		<cfif val(getcurqty.currstkqty) gte val(currvar) and val(getdet.qty) gte val(currvar)>
			<cfset col_qty = val(currvar)>
			<cfset currvar = val(getdet.qty) - val(col_qty)>
		<cfelse>
			<cfset col_qty = val(getdet.qty) - val(getdet.bal_qty)>
			<cfset currvar = val(getdet.qty) - val(col_qty)>
		</cfif>
		
		<cfif val eq "">
			<cfquery name="update" datasource="#dbname#">
				update sales_tmp_det set bal_qty = '#val(currvar)#' where id='#id#'
			</cfquery>
		</cfif>
		
	</cfif>
	
	
	<cfinclude template="act_maintenance_gst.cfm">
	<cfinclude template="act_updatesaleshdr.cfm">
	
	


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