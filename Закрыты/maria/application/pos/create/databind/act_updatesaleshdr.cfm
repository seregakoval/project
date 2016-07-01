	<cfquery name="getsaleshdr2" datasource="#dbname#">
		select * from sales_tmp_hdr where id = '#nextid#'
	</cfquery>
	<cfquery name="gettotal" datasource="#dbname#">
		select * from sales_tmp_det where refid='#nextid#'
	</cfquery>
	
	<cfset doctotal = 0>
	<cfset doctotal_gst = 0> <!--- GST --->
	<cfloop query="gettotal">
		<cfif gettotal.disctype EQ "P">
			<cfset linediscount = val(gettotal.disc) * val(gettotal.price) * val(gettotal.qty) / 100>
		<cfelse>
			<cfset linediscount = val(gettotal.disc)>
		</cfif>
		<cfif trim(gettotal.type) EQ "I" or trim(gettotal.type) EQ "S" or trim(gettotal.type) EQ "P">
			<cfset total = gettotal.qty * gettotal.price - linediscount>
			
			<cfset doctotal = doctotal + total>
			<cfset doctotal_gst = doctotal_gst + val(gettotal.gsttotal)><!--- GST --->
			
			<cfif gettotal.id EQ nextid>
				<cfset thislinetotal = total>
			</cfif>
		<cfelse>
			<cfset doctotal = doctotal + 0>
		</cfif>
	</cfloop>
	<cfset doctotal = doctotal - getsaleshdr2.voucher_disc -  getsaleshdr2.cash_disc>
	
	<cfset doctotal_gst = numberformat(val(doctotal_gst),"9999.99")>
	<cfset lastdigit = right(doctotal_gst,1)>
	<cfif lastdigit EQ 1 >
		<cfset rounding = -0.01>
		<cfset rounded_doctotal = val(doctotal_gst) - 0.01> 
	<cfelseif lastdigit EQ 2>
		<cfset rounding = -0.02>
		<cfset rounded_doctotal = val(doctotal_gst) - 0.02> 
	<cfelseif lastdigit EQ 3>
		<cfset rounding = 0.02>
		<cfset rounded_doctotal = val(doctotal_gst) + 0.02> 
	<cfelseif lastdigit EQ 4>
		<cfset rounding = 0.01>
		<cfset rounded_doctotal = val(doctotal_gst) + 0.01> 
	<cfelseif lastdigit EQ 5>
		<cfset rounding = 0>
		<cfset rounded_doctotal = val(doctotal_gst)> 
	<cfelseif lastdigit EQ 6>
		<cfset rounding = -0.01>
		<cfset rounded_doctotal = val(doctotal_gst) - 0.01> 
	<cfelseif lastdigit EQ 7>
		<cfset rounding = -0.02>
		<cfset rounded_doctotal = val(doctotal_gst) - 0.02> 
	<cfelseif lastdigit EQ 8>
		<cfset rounding = 0.02>
		<cfset rounded_doctotal = val(doctotal_gst) + 0.02> 
	<cfelseif lastdigit EQ 9>
		<cfset rounding = 0.01>
		<cfset rounded_doctotal = val(doctotal_gst) + 0.01> 
	<cfelse>
		<cfset rounding = 0>
		<cfset rounded_doctotal = val(doctotal_gst) > 
	</cfif>
	<cfset doctotal = val(rounded_doctotal)>
	
	<cfquery name="updatehdr" datasource="#dbname#">
		update sales_tmp_hdr set total = '#val(rounded_doctotal)#', rounding = '#val(rounding)#' where id = '#nextid#'
	</cfquery>
	<cfquery name="updatepaymenthdr" datasource="#dbname#">
		update payment_tmp_hdr set total = '#rounded_doctotal#' where refid = '#nextid#'
	</cfquery>
	
	
	<cfquery name="getsaleshdr_gst" datasource="#dbname#">
		select * from sales_tmp_hdr where id = '#nextid#'
	</cfquery>
	
	<cfset totalsales = val(getsaleshdr_gst.total)>