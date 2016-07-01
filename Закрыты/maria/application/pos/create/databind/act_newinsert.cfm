 <cfsilent> 
<cfset tabchr = Chr(13) & Chr(10)>
<cfset val = "">
<cfset roundqty = 0>
<cfset idlist = 0>
<cfquery name="getsalesdetid" datasource="#dbname#">
	select nextval('seq_sales_det_id') as sid
</cfquery>
<cfset sid = getsalesdetid.sid>

<!--- <cf_eslnv20_getmax columnname="linerefid" dbname="#dbname#" tablename="sales_tmp_det"> --->
<cfquery name="getref" datasource="#dbname#">
	select nextval('seq_sales_det_linerefid') as linerefid
</cfquery>
<cfset linerefid = getref.linerefid>


<cfquery name="getsaleshdr_date" datasource="#dbname#">
	select trans_date::date as trans_date, custid From sales_tmp_hdr where id = '#nextid#'
</cfquery>
<cfset gststartdate = createdate(2015,04,01)>

<cfquery name="getpurlimit" datasource="#dbname#">
	select * from customer where id = '#getsaleshdr_date.custid#'
</cfquery>


<cfif DateDiff("d", #getsaleshdr_date.trans_date#, #gststartdate#) LTE 0>
	<cfquery name="getitem" datasource="#dbname#">
		select * from itemcate_pos where itemid ='#itemid#' 
	</cfquery>
<cfelse>
	<cfquery name="getitem" datasource="#dbname#">
		select * from itemcate_pos_before_gst where itemid ='#itemid#' 
	</cfquery>
</cfif>

<cfquery name="getpricing" datasource="#dbname#">
	select * from user_pricing
	where ct = '#val(getpurlimit.clitype)#'
	and class = '#val(getitem.class)#'
</cfquery>

<!--- GST --->
<cfquery name="getpayment" datasource="#dbname#">
	select * from payment_tmp_hdr where refid = '#nextid#'
</cfquery>
<!--- GST --->

<cfif getpricing.recordcount GT 0>
	<cfset pricinglist = valuelist(getpricing.class,',')>
<cfelse>
	<cfset pricinglist = 0>
</cfif>
<cfset this_disctype = "P">
<cfset this_disc = 0>
<cfif getpricing.recordcount neq "0">
	<cfset this_disctype = ucase(getpricing.disctype)>
	<cfset this_disc = val(getpricing.amt)>
</cfif>
<cfquery name="getsaleshdr_date" datasource="#dbname#">
	select trans_date::date as trans_date From sales_tmp_hdr where id = '#nextid#'
</cfquery>
<cfset gststartdate = createdate(2015,04,01)>

<cfif DateDiff("d", #getsaleshdr_date.trans_date#, #gststartdate#) LTE 0>
	<cfquery name="getitem2" datasource="#dbname#">
		select * from itemcate_pos 
		where itemid ='#itemid#' 
		and class in (#pricinglist#)
	</cfquery>
<cfelse>
	<cfquery name="getitem2" datasource="#dbname#">
		select * from itemcate_pos_before_gst 
		where itemid ='#itemid#' 
		and class in (#pricinglist#)
	</cfquery>
</cfif>

<cfif getitem2.recordcount eq "0">
	<cfset this_disctype = "P">
	<cfset this_disc = 0>
</cfif>

<cfquery name="getsameitem" datasource="#dbname#">
	select * from sales_tmp_det 
	where refid = '#nextid#'
	and itemid ='#getitem.itemid#'
	and price = '#val(evaluate("getitem.baseprice_" & session.him_session.branchid))#'
	and disc = '#this_disc#'
	and disctype = '#this_disctype#'
	and type='#itemtype#'
</cfquery>
<cfif getsameitem.recordcount NEQ 0>
	<cfset idlist = valuelist(getsameitem.id,',')>
</cfif>

<cfquery name="getsaleshdr" datasource="#dbname#">
	select * from sales_tmp_hdr
	where id = '#nextid#'
</cfquery>

<cfquery name="getolditem" datasource="#dbname#">
	select sum(qty - bal_qty) as qty from sales_tmp_det 
	where refid = '#nextid#'
	and itemid ='#getitem.itemid#'
	and id not in (#idlist#)
</cfquery>

<cfif trim(itemtype) EQ "I">
	<cfquery name="getcurqty" datasource="#dbname#">
		select currstkqty from inventory_hdr 
		where itemid ='#itemid#' 
		and branch = '#session.him_session.branchid#'
	</cfquery>
	<cfif getcurqty.currstkqty neq "">
		<cfset roundqty = listgetat(val(getcurqty.currstkqty),1,'.')>
	<cfelse>
		<cfset roundqty = 0>
	</cfif>
</cfif>




<cfif getsameitem.recordcount neq 0 and newline eq 0>
	<cfset quantity = evaluate(getsameitem.qty + 1)>
	<cfset roundqty = roundqty - val(getolditem.qty)>
	<cfif trim(itemtype) EQ "I">
		<cfif roundqty lte quantity>
			<cfset drawnqty = val(roundqty)>
			<cfset bal_qty = quantity - drawnqty>
		<cfelse>
			<cfset drawnqty = quantity>
			<cfset bal_qty = quantity - drawnqty>
		</cfif>
	<cfelseif trim(itemtype) EQ "S">
		<cfset drawnqty = 0>
		<cfset bal_qty = quantity>
	<cfelse>
		<cfset drawnqty = quantity>
		<cfset bal_qty = 0>
	</cfif>
	
	<!--- GST --->
	<cfquery name="getsaleshdr_date" datasource="#dbname#">
		select trans_date::date as trans_date From sales_tmp_hdr where id = '#nextid#'
	</cfquery>
	<cfset gststartdate = createdate(2015,04,01)>
	
	<cfif DateDiff("d", #getsaleshdr_date.trans_date#, #gststartdate#) LTE 0>
		<cfquery name="getitemdets" datasource="#dbname#">
			select itemid, defaultsuppllytax from itemcate_pos where itemid = '#itemid#'
		</cfquery>
	<cfelse>
		<cfquery name="getitemdets" datasource="#dbname#">
			select itemid, defaultsuppllytax from itemcate_pos_before_gst where itemid = '#itemid#'
		</cfquery>
	</cfif>
	
	<cfquery name="gettax1" datasource="#dbname#">
		select company.comno,company.comname as acc_name,partylist.*
		from company,partylist
		where company.comno = partylist.comno
		and company.flag='1'
		and partylist.id='#val(getitemdets.defaultsuppllytax)#'
	</cfquery>
	
	<cfif this_disctype eq "P">
		<cfset discamt = val(quantity) * val(this_disc) * val(evaluate('getitem.baseprice_' & session.him_session.branchid)) / 100>
		<cfset linetotal_gst = val(quantity) * val(evaluate('getitem.baseprice_' & session.him_session.branchid)) - val(discamt)>
		<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")>
		<cfset total_gst = ((linetotal_gst) * ((val(gettax1.taxrate))/100))> <!--- (qty * price - disc) * gst --->
		<cfset unit_gst = (total_gst) / val(quantity)> <!--- ((qty * price - disc) * gst) / qty --->
		<cfset linetotal_gst = ((linetotal_gst) * ((100+val(gettax1.taxrate))/100))> <!--- ((qty * price - disc) * gst) + price --->
		
		
	<cfelse>
		<cfset linetotal_gst = (quantity * val(evaluate('getitem.baseprice_' & session.him_session.branchid))) - val(this_disc)>
		<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")>
		<cfset total_gst = ((linetotal_gst)* ((val(gettax1.taxrate))/100))> <!--- (qty * price - disc) * gst --->
		<cfset unit_gst = (total_gst) / val(quantity)> <!--- ((qty * price - disc) * gst) / qty --->
		<cfset linetotal_gst = (linetotal_gst)* ((100+val(gettax1.taxrate))/100)> <!--- ((qty * price - disc) * gst) + price --->
		
	</cfif>
	
	
	<cfquery name="updatesalesdet" datasource="#dbname#">
		update sales_tmp_det
		set qty = '#quantity#',
		bal_qty = '#bal_qty#',
		gstunitprice = '#val(unit_gst)#',
		gstprice = '#val(total_gst)#',
		gsttotal = '#val(linetotal_gst)#'
		where id = '#getsameitem.id#'
	</cfquery>
	
	
	<cfquery name="update" datasource="#dbname#">
		update payment_line_hdr_temp set total = '#val(linetotal_gst)#' where refid = '#getsameitem.id#'
	</cfquery>
	<!--- GST --->
	
	<cfset samesame= 1>
	<cfset sid = getsameitem.id>
<cfelse>
	<cfset quantity = 1>
	<cfset roundqty = roundqty - val(getolditem.qty)>
	<cfif trim(itemtype) EQ "I">
		<cfif roundqty lte quantity>
			<cfset drawnqty = val(roundqty)>
			<cfset bal_qty = quantity - drawnqty>
		<cfelse>
			<cfset drawnqty = quantity>
			<cfset bal_qty = quantity - drawnqty>
		</cfif>
	<cfelseif trim(itemtype) EQ "S">
		<cfset drawnqty = 0>
		<cfset bal_qty = quantity>
	<cfelse>
		<cfset drawnqty = quantity>
		<cfset bal_qty = 0>
	</cfif>
	
	<!--- GST --->
	<cfquery name="getsaleshdr_date" datasource="#dbname#">
		select trans_date::date as trans_date From sales_tmp_hdr where id = '#nextid#'
	</cfquery>
	<cfset gststartdate = createdate(2015,04,01)>
	
	<cfif DateDiff("d", #getsaleshdr_date.trans_date#, #gststartdate#) LTE 0>
		<cfquery name="getitemdets" datasource="#dbname#">
			select itemid, defaultsuppllytax from itemcate_pos where itemid = '#itemid#'
		</cfquery>
	<cfelse>
		<cfquery name="getitemdets" datasource="#dbname#">
			select itemid, defaultsuppllytax from itemcate_pos_before_gst where itemid = '#itemid#'
		</cfquery>
	</cfif>
	
	<cfquery name="gettax1" datasource="#dbname#">
		select company.comno,company.comname as acc_name,partylist.*
		from company,partylist
		where company.comno = partylist.comno
		and company.flag='1'
		and partylist.id='#val(getitemdets.defaultsuppllytax)#'
	</cfquery>
	
	<cfif this_disctype eq "P">
		<cfset discamt = val(quantity) * val(this_disc) * val(evaluate('getitem.baseprice_' & session.him_session.branchid)) / 100>
		<cfset linetotal_gst = val(quantity) * val(evaluate('getitem.baseprice_' & session.him_session.branchid)) - val(discamt)>
		<cfset linetotal_gst = round(linetotal_gst * 100) /100>
		<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")>
		<cfset total_gst = ((linetotal_gst) * ((val(gettax1.taxrate))/100))> <!--- (qty * price - disc) * gst --->
		<cfset unit_gst = (total_gst) / val(quantity)> <!--- ((qty * price - disc) * gst) / qty --->
		<cfset linetotal_gst = ((linetotal_gst) * ((100+val(gettax1.taxrate))/100))> <!--- ((qty * price - disc) * gst) + price --->
		
	<cfelse>
		<cfset linetotal_gst = (quantity * val(evaluate('getitem.baseprice_' & session.him_session.branchid))) - val(this_disc)>
		<cfset linetotal_gst = round(linetotal_gst * 100) /100>
		<cfset linetotal_gst = numberformat(linetotal_gst,"999999999.99")>
		<cfset total_gst = ((linetotal_gst)* ((val(gettax1.taxrate))/100))> <!--- (qty * price - disc) * gst --->
		<cfset unit_gst = (total_gst) / val(quantity)> <!--- ((qty * price - disc) * gst) / qty --->
		<cfset linetotal_gst = (linetotal_gst)* ((100+val(gettax1.taxrate))/100)> <!--- ((qty * price - disc) * gst) + price --->
		
	</cfif>
	<!--- GST --->
	
	
	<cfquery name="insert" datasource="#dbname#">
		insert into sales_tmp_det
		(id,refid,branch,itemid,type,qty,bal_qty,price,disc,disctype,linerefid,personnel,personnel2, 
		gstpercent, gstunitprice, gstprice, gsttotal) <!--- GST --->
		values
		('#sid#','#nextid#','#session.him_session.branchid#','#itemid#','#itemtype#','#quantity#','#bal_qty#',
		'#val(evaluate("getitem.baseprice_" & session.him_session.branchid))#','#this_disc#','#this_disctype#','#linerefid#',
		'#getsaleshdr.personnel#','#getsaleshdr.personnel#'
		,'#val(gettax1.taxrate)#', '#val(unit_gst)#', '#val(total_gst)#', '#val(linetotal_gst)#')<!--- GST --->
	</cfquery>

	<cfquery name="insertpayhdr" datasource="#dbname#">
		insert into payment_line_hdr_temp
		(id,refid,custid,custtype,logno,branch,trans_date,payment,this_payment,total,personnel,personnel2, payment_hdr_id)
		values
		(nextval('seq_payment_line_hdr_id'),'#sid#','#getsaleshdr.custid#','#getsaleshdr.custtype#','#session.him_session.logno#',
		'#session.him_session.branchid#',now(), 0, 0, '#val(linetotal_gst)#', '#session.him_session.userid#','#session.him_session.userid#', '#getpayment.id#')
	</cfquery>
	<cfset samesame = 0>
</cfif>
<!---EDIT ON 311007 --->

<cfinclude template="act_updatesaleshdr.cfm">



<!--- END OF MODIFIED SCRIPT --->
<cfif this_disctype EQ "P">
	<cfset this_disc = this_disc & "%">
</cfif>

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