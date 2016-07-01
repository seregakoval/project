<cfquery name="gettotal" datasource="#dbname#">
	select * from sales_tmp_det
	where refid='#nextid#'
</cfquery>

<cfset doctotal = 0>
<cfloop query="gettotal">
	<cfif gettotal.disctype EQ "P">
		<cfset linediscount = val(gettotal.disc) * val(gettotal.price) * val(gettotal.qty) / 100>
	<cfelse>
		<cfset linediscount = val(gettotal.disc)>
	</cfif>
	<cfif trim(gettotal.type) EQ "I" or trim(gettotal.type) EQ "S" or trim(gettotal.type) EQ "P">
		<cfset total = gettotal.qty * gettotal.price - linediscount>
		<cfset doctotal = doctotal + total>
		<cfif gettotal.id EQ sid>
			<cfset thislinetotal = total><!--- total for the this line --->
		</cfif>
	<cfelse>
		<cfset doctotal = doctotal + 0>
	</cfif>
</cfloop>
<cfset doctotal = doctotal - getsaleshdr.voucher_disc -  getsaleshdr.cash_disc>

<!--- START OF MODIFIED SCRIPT (30 Jan 2009) --->
<cfset finaldocamt = decimalformat(val(doctotal))>
<cfset lastdigit = right(finaldocamt,1)>
<cfif lastdigit EQ 1 >
	<cfset rounding = -0.01>
	<cfset rounded_doctotal = val(doctotal) - 0.01> 
<cfelseif lastdigit EQ 2>
	<cfset rounding = -0.02>
	<cfset rounded_doctotal = val(doctotal) - 0.02> 
<cfelseif lastdigit EQ 3>
	<cfset rounding = 0.02>
	<cfset rounded_doctotal = val(doctotal) + 0.02> 
<cfelseif lastdigit EQ 4>
	<cfset rounding = 0.01>
	<cfset rounded_doctotal = val(doctotal) + 0.01> 
<cfelseif lastdigit EQ 5>
	<cfset rounding = 0>
	<cfset rounded_doctotal = val(doctotal)> 
<cfelseif lastdigit EQ 6>
	<cfset rounding = -0.01>
	<cfset rounded_doctotal = val(doctotal) - 0.01> 
<cfelseif lastdigit EQ 7>
	<cfset rounding = -0.02>
	<cfset rounded_doctotal = val(doctotal) - 0.02> 
<cfelseif lastdigit EQ 8>
	<cfset rounding = 0.02>
	<cfset rounded_doctotal = val(doctotal) + 0.02> 
<cfelseif lastdigit EQ 9>
	<cfset rounding = 0.01>
	<cfset rounded_doctotal = val(doctotal) + 0.01> 
<cfelse>
	<cfset rounding = 0>
	<cfset rounded_doctotal = val(doctotal) > 
</cfif>

<cfquery name="updatehdr" datasource="#dbname#">
        update sales_tmp_hdr
        set total = '#val(rounded_doctotal)#',
        rounding = '#val(rounding)#'
        where id = '#nextid#'
</cfquery>
<cfquery name="updatepaymenthdr" datasource="#dbname#">
        update payment_tmp_hdr
        set total = '#rounded_doctotal#'
        where refid = '#nextid#'
</cfquery>