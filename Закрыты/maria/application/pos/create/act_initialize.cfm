
<cfquery name="getsalesid" datasource="#dbname#">
	select nextval('seq_sales_hdr_id') as nextid
</cfquery>
<cfquery name="getpayid" datasource="#dbname#">
	select nextval('seq_payment_hdr_id') as nextpaymentid
</cfquery>

<cfset nextid = getsalesid.nextid>
<cfset nextpaymentid = getpayid.nextpaymentid>

<cfset posrecby = "">

<cfif #type# eq 2><!--- CUSTOMER SALES --->
	<cfquery name="getcust" datasource="#dbname#">
		select * from customer where id = '#custid#'
	</cfquery>
	<cfset posrecby = getcust.cust_rec>

	<cfquery name="getnooftime" datasource="#dbname#">
		select * from sales_hdr
		where custid = '#getcust.id#'
		and custtype = '2'
		and status = '0'
	</cfquery>
	<cfset thiscustid="#getcust.id#">
	<cfset thiscustname="#getcust.name#">
	<cfset thisnotime="#getnooftime.recordcount#">
	
<cfelse><!--- WALKIN--->
	<!--- NO NEED QUERY AS THIS IS WALKIN --->
	<cfquery name="getcust" datasource="#dbname#">
		select * from customer
		where id = '#custid#'
	</cfquery>
	<cfset thiscustid="0">
	<cfset thiscustname="WALK IN">
	<cfset thisnotime="0">
</cfif>
<cfset session.him_session.pos.create.clitype = getcust.clitype>
<cfquery name="insert" datasource="#dbname#">
	insert into sales_tmp_hdr
	(id,branch,custid,custname,custtype,trans_date,disctype,discmark,status,logno,personnel,comm_rep,frequency,recby,cash_disc,voucher_disc,sales_status)
	values
	('#nextid#','#session.him_session.branchid#','#thiscustid#','#thiscustname#','#type#',now(),'A','D',0,'#session.him_session.logno#','#session.him_session.userid#',0,<cfif thisnotime neq 0>2<cfelse>1</cfif>,<cfif val(posrecby) neq 0>#posrecby#<cfelse>null</cfif>,0,0,0)
</cfquery>

<cfquery name="insertpayhdr" datasource="#dbname#">
	insert into payment_tmp_hdr
	(id,refid,custid,custtype,logno,branch,trans_date,payment,this_payment,total,personnel)
	values
	('#nextpaymentid#','#nextid#','#thiscustid#','#type#','#session.him_session.logno#','#session.him_session.branchid#',now(),0,0,0,'#session.him_session.userid#')
</cfquery>
