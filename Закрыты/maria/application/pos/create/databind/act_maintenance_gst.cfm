	<cfquery name="getgst" datasource="#dbname#">
		select * from sales_tmp_det where refid='#nextid#'
	</cfquery>
	<cfdump var="#getgst#">
	
	<cfloop query="getgst">
		<cfif getgst.disctype eq "P">
			<cfset discamt = val(getgst.qty) * val(getgst.disc) * val(getgst.price) / 100> 
			<cfset linetotal_gst = val(getgst.qty) * val(getgst.price) - val(discamt)>
			<cfset linetotal_gst = round(linetotal_gst * 100) /100> 
			<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")> 
			
			<cfset total_gst = ((linetotal_gst) * ((val(getgst.gstpercent))/100))> <!--- (qty * price - disc) * gst ---> 
			<cfset unit_gst = (total_gst) / val(getgst.qty)> <!--- ((qty * price - disc) * gst) / qty --->
			<cfset linetotal_gst = ((linetotal_gst) * ((100+val(getgst.gstpercent))/100))> <!--- ((qty * price - disc) * gst) + price --->
			
		<cfelse>
			<cfset linetotal_gst = (getgst.qty * val(getgst.price)) - val(getgst.disc)>
			<cfset linetotal_gst = round(linetotal_gst * 100) /100>
			<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")>
			
			<cfset total_gst = ((linetotal_gst)* ((val(getgst.gstpercent))/100))> <!--- (qty * price - disc) * gst --->
			<cfset unit_gst = (total_gst) / val(getgst.qty)> <!--- ((qty * price - disc) * gst) / qty --->
			<cfset linetotal_gst = (linetotal_gst)* ((100+val(getgst.gstpercent))/100)> <!--- ((qty * price - disc) * gst) + price --->
			
		</cfif>
		
		<cfquery name="updatesalesdet" datasource="#dbname#">
			update sales_tmp_det
			set 
			gstunitprice = '#val(unit_gst)#',
			gstprice = '#val(total_gst)#',
			gsttotal = '#val(linetotal_gst)#'
			where id = '#getgst.id#'
		</cfquery>
		
		<cfquery name="update" datasource="#dbname#">
			update payment_line_hdr_temp set total = '#val(linetotal_gst)#' where refid = '#getgst.id#'
		</cfquery>
	
	</cfloop>