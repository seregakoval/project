<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
	<script language="JavaScript">
		function deleteact(deleteaction,deleteid){
		if (confirm("Delete Transaction?"))
			window.location = "act_delete_sales_ser_vl.cfm?deleteact=" + deleteaction + "&deleteid=" + deleteid + "&custid=<cfoutput>#custid#</cfoutput>" ;
		else
			return false;

		}

		function printcreditnote(type, id, cnid){
			window.open('/esaloon_him/pos/cancellation/dsp_printcreditnote_void.cfm?voidid1='+ id + '&cnid=' + cnid,'printcn','width=750,height=650,top=10,left=10,scrollbars=1');
		}
	</script>
    <style>

	div {
	      margin-top: 5px;
	     }

		/* perfect-scrollbar v0.6.7 */
	.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}

        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; width:100%; padding-top: 10px; }

		/* Table */
		#outer_table {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		    font-size: 13px;
		}

		#outer_table tr td {
		    padding: 10px 0;
		}

		.main_line {
		    background-color: #f5f9fc;
		}

		#inner_table {
		    width: 100%;
		}

		#orange_header {
		    color: #ff7d01;
		    text-decoration: underline;
		}

		.total_price {
		    text-align: right;
		    border-bottom-style: double;
		    border-bottom-width: 6px;
		    border-top-style: solid;
		    border-top-width: 2px;
		    border-color: #999;
		}

		.hidden {
		    display: none;
		}

		#show_all:hover, .expander:hover {
		    cursor: pointer;
		}

		/* Top center line of buttons */

		#buttons_line {
		    width: calc(100% - 60px);
		    float: left;
		    position: relative;
		    font-size: 1.2em;
		    color: #515e67;
		    padding-top: 10px;
		    padding-left: 20px;
		}

		.select_styled select {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    width: 100px;
		    border: 1px solid #ebebeb;
		    border-radius: 5px;
		    color: #515e67;
		    background: transparent;
		    padding-left: 5px;
		    height: 30px;

		}

		.select_styled {
		    display: block;
		    float: left;
		    height: auto;
		    overflow: hidden;
		    background: url(../img/new_arrow.png) no-repeat right white;
		    font-size: 13px;

		}

		/* Two orange buttons */

		.orange_button {
		    display: inline-block;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 0 10px;
		    border-radius: 5px;
		    padding-top: 8px;
		    height: 22px;
		    vertical-align: top;
		    font-size: 14px;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		#orange_search {
		    margin-right: 10px;
		}

		#orange_comments {
		    margin-right: 10px;
		}

		/* hide default arrow in IE */
		.select_styled select::-ms-expand {
		    display: none;
		}

		#doc_type {
		    width: 110px;
		    padding-bottom: 15px;
		}

		input {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    border: 1px solid #ebebeb;
		    border-radius: 5px;
		    color: #515e67;
		    margin-right: 8px;
		    padding-left: 5px;
		    height: 30px;
		    width: 100px;
		}

		#trx_no {
		    width: 80px;
		    margin-right: 8px;
		}

		#date_from, #date_to {
		    width: 130px;
		    margin: 0 10px;
		}

		/* Table */

	    tr, th {
		    color: #434343;
		    background-color: #f8f8f8;
		}

		tr td {
		    padding top: 10px;
		}

		.hidden {
		    display: none;
		}

		#show_all:hover, {
		    cursor: pointer;
		}

		.expander:hover {
			cursor: pointer;
		}

    </style>

</head>

<body>
<div></div>
<cfoutput>
	<cfparam name="searchno" default="Trx No">
	<cfparam name="searchcode" default="Code">
	<cfparam name="searchitem" default="Product">
	<cfparam name="searchtype" default="">
	<cfparam name="searchsd" default="">
	<cfparam name="searched" default="">
	 <div id="buttons_line">
        <div class="select_styled" id="doc_type">
            <select name="searchtype">
				<option value="">Doc Type</option>
				<option value="1">Gift Cert</option>
				<option value="2">Sales</option>
				<option value="3">Collection</option>
				<option value="4">Exchange</option>
				<option value="5">Void Sales</option>
			</select>
        </div>
		<div class="select_styled">
			<input type="Text" id="trx_no" name="searchno" value="#searchno#" onclick="if(this.value='Trx No')this.value='';" onblur="if(this.value=='')this.value='Trx No';">
			<input type="Text" name="searchcode"  value="#searchcode#" style="width:80px;" onclick="if(this.value='Code')this.value='';" onblur="if(this.value=='')this.value='Code';">
			<input type="Text" name="searchitem" value="#searchitem#" style="width:130px;" onclick="if(this.value='Product')this.value='';" onblur="if(this.value=='')this.value='Product';"><input type="Button" value="S" class="m3eAa" style="width:20px;" onclick="window.open('productlist.cfm','popproductlist','width=400,height=550,menu=no,scrollbars=yes,status=no,left=150,top=50;');">
			Date From
			<input type="Text" id="date_from" name="searchsd" value="#searchsd#" style="width:100px;" onKeyUp="DateFormat(this,this.value,event,false,'3')" onBlur="DateFormat(this,this.value,event,true,'3');">
			To
			<input type="Text" id="date_to" name="searched" value="#searched#" style="width:100px;" onKeyUp="DateFormat(this,this.value,event,false,'3')" onBlur="DateFormat(this,this.value,event,true,'3');">

		</div>
        <div class="orange_button" id="orange_search">Search</div>
        <div class="orange_button" id="orange_comments">Add Comments</div>
    </div>

	<cfquery name="getmaster" datasource="#dbname#">
		<cfif searchtype EQ 1 OR searchtype EQ "">
			select giftcert.create_date as date,giftcert.serialno as trxno,'Gift Cert' as trxtype,CAST(giftcert.price as TEXT) as docamt,giftcert.id as docid, 11 as ord,giftcert.branch as branch,'' as comments,status as cancelstatus
			from giftcert
			where true
			<cfif custid neq "">
				and giftcert.custid = '#custid#'
			</cfif>

			<cfif searchno neq "Trx No" and searchno neq "">
				and upper(giftcert.serialno) like '%#ucase(searchno)#%'
			</cfif>
			<cfif searchitem neq "Product" and searchitem neq "">
				and giftcert.id = giftcert_det.refid
				and giftcert_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.description) like '%#ucase(searchitem)#%'
			</cfif>
			<cfif searchcode neq "Code" and searchcode neq "">
				and giftcert.id = giftcert_det.refid
				and giftcert_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%'
			</cfif>
			<cfif searchsd neq "" and searched neq "">
				and giftcert.create_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
			</cfif>
		</cfif>


		<cfif searchtype EQ "">
			UNION
		</cfif>


		<cfif searchtype EQ 2 OR searchtype EQ "">
			select sales_hdr.trans_date as date,sales_hdr.salesno as trxno,'POS' as trxtype,CAST(sales_hdr.total as TEXT) as docamt,sales_hdr.id as docid, 1 as ord,sales_hdr.branch as branch,'' as comments,cancelstatus
			from sales_hdr
			where sales_hdr.custtype = '2'
			<cfif custid neq "">
				and sales_hdr.custid = '#custid#'
			<cfelse>
				and false
			</cfif>
			<cfif searchno neq "Trx No" and searchno neq "">
				and upper(sales_hdr.salesno) like '%#ucase(searchno)#%'
			</cfif>
			<cfif searchitem neq "Product" and searchitem neq "">
				and sales_hdr.id = sales_det.refid
				and sales_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.description) like '%#ucase(searchitem)#%'
			</cfif>
			<cfif searchcode neq "Code" and searchcode neq "">
				and sales_hdr.id = sales_det.refid
				and sales_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%'
			</cfif>
			<cfif searchsd neq "" and searched neq "">
				and sales_hdr.trans_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
			</cfif>
			GROUP BY sales_hdr.trans_date,sales_hdr.salesno,sales_hdr.total,sales_hdr.id,sales_hdr.branch,cancelstatus
		</cfif>


		<cfif searchtype EQ "">
			UNION
		</cfif>


		<cfif searchtype EQ 3 OR searchtype EQ "">
			select collect_hdr.trans_date as date,collect_hdr.colno as trxno,'Collection' as trxtype, '-' as docamt,collect_hdr.colnotrk as docid, 3 as ord,collect_hdr.branch as branch,'' as comments,0 as cancelstatus
			from collect_hdr
			where collect_hdr.custtype = '2'
			<cfif custid neq "">
				and collect_hdr.custid = '#custid#'
			<cfelse>
				and false
			</cfif>
			<cfif searchno neq "Trx No" and searchno neq "">
				and upper(collect_hdr.colno) like '%#ucase(searchno)#%'
			</cfif>
			<cfif searchitem neq "Product" and searchitem neq "">
				and collect_hdr.id = collect_det.refid
				and collect_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.description) like '%#ucase(searchitem)#%'
			</cfif>
			<cfif searchcode neq "Code" and searchcode neq "">
				and collect_hdr.id = collect_det.refid
				and collect_det.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%'
			</cfif>
			<cfif searchsd neq "" and searched neq "">
				and collect_hdr.trans_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
			</cfif>
			GROUP BY collect_hdr.trans_date, collect_hdr.colno,collect_hdr.colnotrk,collect_hdr.branch
		</cfif>


		<cfif searchtype EQ "">
			UNION
		</cfif>


		<cfif searchtype EQ 4 OR searchtype EQ "">
			select exchange_hdr.trans_date as date, exchange_hdr.salesno as trxno,'Exchange' as trxtype, '-' as docamt,exchange_hdr.id as docid, 4 as ord,exchange_hdr.branch as branch,'' as comments,0 as cancelstatus
			from exchange_hdr
			where exchange_hdr.custtype = '2'
			<cfif custid neq "">
				and exchange_hdr.custid = '#custid#'
			<cfelse>
				and false
			</cfif>
			<cfif searchno neq "Trx No" and searchno neq "">
				and upper(exchange_hdr.salesno) like '%#ucase(searchno)#%'
			</cfif>
			<cfif searchitem neq "Product" and searchitem neq "">
			and
				((exchange_hdr.id = exchange_det.refid
					and exchange_det.itemid = itemcate_pos.itemid
					and upper(itemcate_pos.description) like '%#ucase(searchitem)#%')
				 or
				 (exchange_hdr.id = exchange_retexc.refid
					and exchange_retexc.itemid = itemcate_pos.itemid
					and upper(itemcate_pos.description) like '%#ucase(searchitem)#%'))
			</cfif>
			<cfif searchcode neq "Code" and searchcode neq "">
			and
				((exchange_hdr.id = exchange_det.refid
					and exchange_det.itemid = itemcate_pos.itemid
					and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%')
				 or
				 (exchange_hdr.id = exchange_retexc.refid
					and exchange_retexc.itemid = itemcate_pos.itemid
					and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%'))
			</cfif>
			<cfif searchsd neq "" and searched neq "">
				and exchange_hdr.trans_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
			</cfif>
			GROUP BY exchange_hdr.trans_date,exchange_hdr.salesno,exchange_hdr.id,exchange_hdr.branch
		</cfif>

		<cfif searchtype EQ "">
			UNION
		</cfif>


		<cfif searchtype EQ 5 OR searchtype EQ "">
			select voidsales_log.trans_date  as date,sales_hdr.salesno as trxno,'Void Sales' as trxtype,'-' as docamt,voidsales_log.id as docid,5 as ord,voidsales_log.branch as branch,'' as comments,0 as cancelstatus
			from voidsales_log, sales_hdr
			where voidsales_log.salesid = sales_hdr.id
			<cfif custid neq "">
				and sales_hdr.custid = '#custid#'
				and sales_hdr.custtype = '2'
			</cfif>
			<cfif searchno neq "Trx No" and searchno neq "">
				and false
			</cfif>
			<cfif searchitem neq "Product" and searchitem neq "">
				and voidsales_log.id = voidsales_det_log.refid
				and voidsales_det_log.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.description) like '%#ucase(searchitem)#%'
			</cfif>
			<cfif searchcode neq "Code" and searchcode neq "">
				and voidsales_log.id = voidsales_det_log.refid
				and voidsales_det_log.itemid = itemcate_pos.itemid
				and upper(itemcate_pos.codeno) like '%#ucase(searchcode)#%'
			</cfif>
			<cfif searchsd neq "" and searched neq "">
				and voidsales_log.trans_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
			</cfif>
			GROUP BY voidsales_log.trans_date,sales_hdr.salesno,voidsales_log.id,voidsales_log.branch
		</cfif>

		UNION

		select date as date,'-' as trxno,trxtype as trxtype, '' as docamt,id as docid, 10 as ord, 0 as branch,comments as comments,0 as cancelstatus
		from usercomments
		where docid = '0'
		and trxtype = 'User Comments'
		<cfif custid neq ""> and usrid = '#custid#' </cfif>
		<cfif searchno neq "Trx No" and searchno neq ""> and false </cfif>
		<cfif searchsd neq "" and searched neq "">
			and usercomments.create_date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
		</cfif>


		UNION

		select date as date,'-' as trxno,'POINT' as trxtype, CAST(cashbin_log.amt as TEXT)as docamt,refid as docid, 11 as ord, 0 as branch,'' as comments,0 as cancelstatus
		from cashbin_log
		where refdoctype = 'POIN'
		<cfif custid neq ""> and usrid = '#custid#' </cfif>
		<cfif searchno neq "Trx No" and searchno neq ""> and false </cfif>
		<cfif searchsd neq "" and searched neq "">
			and cashbin_log.date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
		</cfif>

		union

		select date as date, '-' as trxtype,'Deposit' as trxtype, CAST(deposit.total as TEXT)as docamt, id as docid, 12 as ord, branch, remark as comments, 0 as cancelstatus
		from deposit
		where true
		<cfif custid neq ""> and usrid = '#custid#' </cfif>
		<cfif searchno neq "Trx No" and searchno neq ""> and false </cfif>
		<cfif searchsd neq "" and searched neq "">
			and deposit.date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
		</cfif>

		union

		select date as date, '-' as trxtype,'Delete Deposit' as trxtype, CAST(log_delete_deposit.total as TEXT)as docamt, ori_id as docid, 13 as ord, branch, remark as comments, 0 as cancelstatus
		from log_delete_deposit
		where true
		<cfif custid neq ""> and usrid = '#custid#' </cfif>
		<cfif searchno neq "Trx No" and searchno neq ""> and false </cfif>
		<cfif searchsd neq "" and searched neq "">
			and log_delete_deposit.date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
		</cfif>


		order by date desc ,trxno desc,ord
	</cfquery>



    <div id="contentHolder">
        <table id="outer_table" border="0">

		<tr height="30px" id="table_head2">
            <th style="width:9%;" id="show_all" onclick="expand_all()">Show All</th>
            <th style="width:9%">Date</th>
            <th style="width:9%;">Irx No</th>
            <th style="width:20%;">Irx Type</th>
            <th style="width:15%;">Doc Amt</th>
            <th style="width:36%;">Comments</th>
        </tr>
			<cfloop query="getmaster">
				<tr class="main_line">
	                <td class="expander"><i class="icon ion-chevron-down"></i></td>
	                <td>#dateformat(getmaster.date,"dd/mm/yyyy")#</td>
	                <td>#getmaster.trxno#</td>
	                <td>#getmaster.trxtype#</td>
	                <td>RM #getmaster.docamt#</td>
	                <td></td>
	            </tr>
	            <cfif getmaster.trxtype eq "Gift Cert">
		            <cfquery name="getdet" datasource="#dbname#">
						select * from giftcert_det where giftcert_det.refid = '#val(getmaster.docid)#' order by id
					</cfquery>

					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 5%;">No.</td>
		                            <td style="width: 10%;">Item Code</td>
		                            <td style="width: 18%;">Item Desc</td>
		                            <td style="width: 10%;">U. Price</td>
		                            <td style="width: 10%;">Qty</td>
		                        </tr>

		                        <cfset count = 0>
								<cfquery name="getredempt" datasource="#dbname#">
									select redemptvalue from giftcert where id = '#val(getmaster.docid)#'
								</cfquery>

								<cfif val(getredempt.redemptvalue) neq 0>
									<cfset count = count + 1>
									<tr>
										<td>#count#</td>
										<td colspan="2">Cash Redemption</td>
										<td colspan="2">RM #decimalformat(val(getredempt.redemptvalue))#</td>
									</tr>
								</cfif>
								<cfloop query="getdet">
									<cfset count = count + 1>
									<cfif getdet.itemtype eq "AL">
										<tr>
											<td>#count#</td>
											<td><i>Level 0</i></td>
											<td>Everything</td>
											<td>RM #decimalformat(getdet.amt)#</td>
											<td>#getdet.qty#</td>
										</tr>

									<cfelseif trim(getdet.itemtype) eq "PI" or trim(getdet.itemtype) eq "PS" or trim(getdet.itemtype) eq "I" or trim(getdet.itemtype) eq "S">
										<cfquery name="getcodename" datasource="#dbname#">
											select * from itemcate_pos where itemid = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getcodename.description,'"','\"',"ALL")>
										<tr>
											<td>#count#</td>
											<td>#getcodename.codeno#</td>
											<td>#thiscvtdesc#</td>
											<td>RM #decimalformat(getdet.amt)#</td>
											<td>#getdet.qty#</td>
										</tr>

									<cfelseif find("M",getdet.itemtype) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select * from mainitem_pos where id = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td>#count#</td>
											<td><i>Level 1</i></td>
											<td>#thiscvtdesc#</td>
											<td>RM #decimalformat(getdet.amt)#</td>
											<td>#getdet.qty#</td>
										</tr>


									<cfelseif find("G",getdet.itemtype) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select * from maingroup_pos
											where gr0id = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td>#count#</td>
											<td><i>Level 2</i></td>
											<td>#thiscvtdesc.description#</td>
											<td>RM #decimalformat(getdet.amt)#</td>
											<td>#getdet.qty#</td>
										</tr>

									<cfelseif find("C",getdet.itemtype) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select * from maincate_pos
											where mainid = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td>#count#</td>
											<td><i>Level 3</i></td>
											<td>#thiscvtdesc#</td>
											<td>RM #decimalformat(getdet.amt)#</td>
											<td>#getdet.qty#</td>
										</tr>

									</cfif>

								</cfloop>
		                	</table>
						</td>
					</tr>

				<cfelseif getmaster.trxtype eq "POS">
					<cfquery name="getdet" datasource="#dbname#">
						select sales_det.*,sales_summary.col_qty from sales_det,sales_summary where sales_det.refid = '#getmaster.docid#'
						and sales_det.id =  sales_summary.refid order by linerefid,id
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 5%;">No.</td>
		                            <td style="width: 30%;">Item Desc</td>
		                            <td style="width: 10%;">Type</td>
		                            <td style="width: 10%;">U. Price</td>
		                            <td style="width: 10%;">Qty</td>
		                            <td style="width: 10%;">Collect Qty</td>
		                            <td style="width: 10%;">Disc</td>
		                            <td style="width: 15%;">Total</td>
		                        </tr>
		                        <cfset total = 0>
								<cfset count = 0>

								<cfloop query="getdet">
									<cfset subtotal = getdet.price * getdet.qty>
									<cfif val(getdet.disc) neq 0 and (getdet.type neq "PI" AND getdet.type neq "PS")>
										<cfset totaldisc = getdet.disc>
										<cfif getdet.disctype eq "P">
											<cfset totaldisc = totaldisc & '%'>
											<cfset subtotal = subtotal * (100 - getdet.disc) / 100>
										<cfelse>
											<cfset subtotal = subtotal - getdet.disc>
										</cfif>
									<cfelse>
										<cfset totaldisc = "-">
									</cfif>

									<cfif trim(getdet.type) eq "I" or trim(getdet.type) eq "S">
										<cfquery name="getitem" datasource="#dbname#">
											select codeno,description from itemcate_pos where itemid = '#getdet.itemid#'
										</cfquery>
										<cfset count = count + 1>
										<cfif getdet.itemid EQ 0>
											<tr>
												<td>#count#</td>
												<td>#getdet.old_desc#</td>
												<td>#getdet.type#</td>
												<td>RM #decimalformat(getdet.price)#</td>
												<td>#getdet.qty#</td>
												<td>#getdet.col_qty#</td>
												<td>#totaldisc#</td>
												<td>RM #decimalformat(subtotal)#</td>
											</tr>
											<cfset total = total + subtotal>
										<cfelse>
											<cfset thiscvtdesc = replace(getitem.description,'"','\"',"ALL")>
											<tr>
												<td>#count#</td>
												<td>#getitem.codeno# - #thiscvtdesc#</td>
												<td>#getdet.type#</td>
												<td>RM #decimalformat(getdet.price)#</td>
												<td>#getdet.qty#</td>
												<td>#getdet.col_qty#</td>
												<td>#totaldisc#</td>
												<td>RM #decimalformat(subtotal)#</td>
											</tr>
											<cfset total = total + subtotal>
										</cfif>


									<cfelseif trim(getdet.type) eq "PI" or trim(getdet.type) eq "PS">
										<cfquery name="getitem" datasource="#dbname#">
											select codeno,description from itemcate_pos where itemid = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getitem.description,'"','\"',"ALL")>

										<tr>
											<td></td>
											<td><i>#getitem.codeno# - #thiscvtdesc#</i></td>
											<td><i>#getdet.type#</i></td>
											<td>&nbsp;</td>
											<td>#getdet.qty#</td>
											<td>#totaldisc#</td>
											<td>-</td>
										</tr>


									<cfelseif trim(getdet.type) eq "P">
										<cfset count = count + 1>
										<cfquery name="getpackage" datasource="#dbname#">
											select code,description from promotion_hdr where packageno = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getpackage.description,'"','\"',"ALL")>

										<tr>
											<td>#count#</td>
											<td>#getpackage.code# - #thiscvtdesc#</td>
											<td>#getdet.type#</td>
											<td>RM #decimalformat(getdet.price)#</td>
											<td>#getdet.qty#</td>
											<td>#totaldisc#</td>
											<td>RM #decimalformat(subtotal)#</td>
										</tr>
										<cfset total = total + subtotal>


									<cfelseif trim(getdet.type) eq "AL">
										<tr>
											<td></td>
											<td><i>Level 0 - Everything</i></td>
											<td><i>#getdet.type#</i></td>
											<td><i>#getdet.qty#</i></td>
											<td>#totaldisc#</td>
											<td>-</td>
										</tr>



									<cfelseif find("M",trim(getdet.type)) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select code,description from mainitem_pos where id = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td></td>
											<td><i>Level 1 - #thiscvtdesc#</i></td>
											<td><i>#getdet.type#</i></td>
											<td><i>#getdet.qty#</i></td>
											<td>#totaldisc#</td>
											<td>-</td>
										</tr>


									<cfelseif find("G",trim(getdet.type)) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select code,description from maingroup_pos where groupid = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td></td>
											<td><i>Level 2 - #thiscvtdesc#</i></td>
											<td><i>#getdet.type#</i></td>
											<td><i>#getdet.qty#</i></td>
											<td>#totaldisc#</td>
											<td>-</td>
										</tr>


									<cfelseif find("C",trim(getdet.type)) neq 0>
										<cfquery name="getname" datasource="#dbname#">
											select code,description from maincate_pos where mainid = '#getdet.itemid#'
										</cfquery>
										<cfset thiscvtdesc = replace(getname.description,'"','\"',"ALL")>
										<tr>
											<td></td>
											<td><i>Level 3 - #thiscvtdesc#</i></td>
											<td><i>#getdet.type#</i></td>
											<td><i>#getdet.qty#</i></td>
											<td>#totaldisc#</td>
											<td>-</td>
										</tr>
									</cfif>

									<cfif trim(getdet.remark) neq "">
										<tr>
											<td></td>
											<td colspan="7"><pre class=\"m3eAa\"><em>#replace(getdet.remark, chr(13) & chr(10), "<br>","ALL")#</em></pre></td>
										</tr>

									</cfif>
								</cfloop>

								<!--- <cfif session.v33.companylogin EQ "vl">
									<cfquery name="getcashbinused" datasource="#dbname#">
										select sum(pay_amt) as pay_amt from payment_hdr,payment_det
										where payment_hdr.refid = '#getmaster.docid#'
										and payment_hdr.id = payment_det.refid
										and payment_det.pay_type ='4'
										group by payment_hdr.id
										order by payment_hdr.id
										limit 1
									</cfquery>
									<cfif getcashbinused.recordcount NEQ 0>
										<cfset count = count + 1>
										<tr>
											<td>#count#</td>
											<td colspan="5" >Cash Bin Used</td>
											<td>RM-#decimalformat(getcashbinused.pay_amt)#</td>
										</tr>
										<cfset total = total - getcashbinused.pay_amt>
									</cfif>
								</cfif> --->

								<tr>
	                           		<td colspan="6"></td>
		                            <td class="total_price">RM #decimalformat(total)#</td>
		                            <td></td>
		                      	</tr>

		                      	<cfquery name="getvoucherno" datasource="#dbname#">
									select * from voucher_used where salesid = '#getmaster.docid#' order by id
								</cfquery>

								<cfif getvoucherno.recordcount neq 0>
									<tr><td colspan="100%">Voucher Used Summary</td></tr>
									<cfloop query="getvoucherno">
										<cfquery name="getvc" datasource="#dbname#">
											select * from voucher where id = '#getvoucherno.voucherid#'
										</cfquery>
										<tr><td colspan="4">#getvoucherno.currentrow#) #getvc.description#</td></tr>

										<cfif getvc.opt1 eq "A">
											<cfset count = count + 1>
											<tr>
												<td>#count#</td>
												<td colspan="5" >Discount Voucher @ #getvc.description#</td>
												<td>RM-#decimalformat(getvc.amt1)#</td>
											</tr>
											<cfset total = total - getvc.amt1>
										</cfif>
									</cfloop>
								</cfif>
		                	</table>
						</td>
					</tr>
				<cfelseif getmaster.trxtype eq "Collection">
					<cfquery name="getdet" datasource="#dbname#">
						select collect_det.*,itemcate_pos.description,itemcate_pos.codeno from collect_det, itemcate_pos
						where collect_det.refid IN (select id from collect_hdr where colnotrk = '#getmaster.docid#' and branch = '#getmaster.branch#')
						and collect_det.itemid = itemcate_pos.itemid
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 10%;">No.</td>
		                            <td style="width: 60%;">Item Desc</td>
		                            <td style="width: 15%;">Collect</td>
		                            <td style="width: 15%;">Bal</td>
		                        </tr>
		                        <cfloop query="getdet">
									<tr>
										<td>#getdet.currentrow#</td>
										<td>#getdet.codeno# - #getdet.description#</td>
										<td>#getdet.qty#</td>
										<td>#getdet.bal_qty#</td>
									</tr>
								</cfloop>
		                     </table>
						</td>
					</tr>

				<cfelseif getmaster.trxtype eq "Exchange">
					<cfquery name="getdet1" datasource="#dbname#">
						select exchange_retexc.*,itemcate_pos.description,itemcate_pos.codeno
						where exchange_retexc.refid = '#getmaster.docid#'
						and exchange_retexc.itemid = itemcate_pos.itemid
					</cfquery>
					<cfquery name="getdet2" datasource="#dbname#">
						select exchange_det.*,itemcate_pos.description,itemcate_pos.codeno
						where exchange_det.refid = '#getmaster.docid#'
						and exchange_det.itemid = itemcate_pos.itemid
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td colspan="4">Return/Exchange Items</td>
		                        </tr>
		                        <tr id="orange_header">
		                            <td style="width: 10%;">No.</td>
		                            <td style="width: 10%;">Item Desc</td>
		                            <td style="width: 10%;">Ret Qty</td>
		                            <td style="width: 10%;">Exc Qty</td>
		                        </tr>
		                        <cfloop query="getdet1">
									<tr>
										<td>#getdet1.currentrow#</td>
										<td>#getdet1.codeno# - #getdet1.description#</td>
										<td>#getdet1.ret_qty#</td>
										<td>#getdet1.exc_qty#</td>
									</tr>
								</cfloop>
								<tr id="orange_header">
									<td colspan="4">Exchange With Items</td>
								</tr>
								<tr id="orange_header">
									<td style="width: 5%;">No.</td>
									<td style="width: 65%;">Item Desc</td>
									<td style="width: 30%;" colspan="2">Qty</td>
								</tr>
								<cfloop query="getdet2">
									<tr>
										<td>#getdet2.currentrow#</td>
										<td>#getdet2.codeno# - #getdet2.description#</td>
										<td colspan="2">#getdet2.qty#</td>
									</tr>
								</cfloop>
		                    </table>
						</td>
					</tr>

				<cfelseif getmaster.trxtype eq "Void Sales">
					<cfquery name="getcreditnote" datasource="#dbname#">
						select * from creditnote_log where docid = '#getmaster.docid#' and doctype = 'VD'
					</cfquery>
					<cfquery name="getdet" datasource="#dbname#">
						select itemcate_pos.codeno,itemcate_pos.description ,voidsales_det_log.*,voidsales_log.remark
						from itemcate_pos, voidsales_det_log, voidsales_log
						where voidsales_det_log.refid = '#getmaster.docid#'
						and voidsales_det_log.itemid = itemcate_pos.itemid
						and voidsales_log.id = voidsales_det_log.refid
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 5%;">No.</td>
		                            <td style="width: 20%;">Item Code</td>
		                            <td style="width: 45%;">Item Desc</td>
		                            <td style="width: 15%;">Void Qty</td>
		                            <td style="width: 15%;">Bal Qty</td>
		                            <td style="width: 15%;"><img src="/esaloon_him/images/print.gif" onclick="printcreditnote(1, #getmaster.docid#,#getcreditnote.id#)" style="cursor:hand" title="Print Credit Note (void)"></td>
		                        </tr>

		                        <cfloop query="getdet">
									<tr>
										<td >#getdet.currentrow#</td>
										<td>#getdet.codeno#</td>
										<td>#getdet.description#</td>
										<td>#val(getdet.this_retqty + getdet.this_excqty)#</td>
										<td>#val(getdet.ori_purqty - getdet.this_retqty - getdet.this_excqty)#</td>
									</tr>
								</cfloop>
		                        <tr>
			                        <td colspan="5">Remark : #getdet.remark#</td>
								</tr>

		                    </table>
						</td>
					</tr>
				<cfelseif getmaster.trxtype eq "POINT">
					<cfquery name="getdet" datasource="#dbname#">
						select * from customer_pointexchange where customer_pointexchange.id = '#getmaster.docid#'
					</cfquery>
					<cfquery name="getbalcashbinamt" datasource="#dbname#">
						select * from cashbin_summary where cashbin_summary.custid = '#custid#'
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr>
									<td style="width: 20%;">Points C/F </td>
									<td style="width: 5%;">:</td>
									<td style="width: 20%;">#getdet.balpoint_before#&nbsp;</td>
									<td style="width: 10%;">&nbsp;</td>
									<td style="width: 20%;">&nbsp;</td>
									<td style="width: 5%;">&nbsp;</td>
									<td style="width: 20%;">&nbsp;</td>
								</tr>
								<tr>
									<td>Redeem Points</td>
									<td>:</td>
									<td>#getdet.points#&nbsp;</td>
									<td>&nbsp;</td>
									<td>Exchange Amt</td>
									<td>:</td>
									<td>#getdet.amt#&nbsp;</td>
								</tr>
								<tr>
									<td>Current Points</td>
									<td>:</td>
									<td>#getdet.balpoint_after#&nbsp;</td>
									<td>&nbsp;</td>
									<td>Current Cash Bin</td>
									<td>:</td>
									<td>#getbalcashbinamt.currentamt#&nbsp;</td>
								</tr>
		                    </table>
						</td>
					</tr>
				<cfelseif getmaster.trxtype eq "Deposit">
					<cfquery name="getdptamt" datasource="#dbname#">
						select payment_deposit_hdr.payno, payment_deposit_det.pay_amt, payment_deposit_det.pay_type from payment_deposit_det, payment_deposit_hdr
						where payment_deposit_hdr.id = payment_deposit_det.refid
						and payment_deposit_hdr.refid = '#getmaster.docid#'
					</cfquery>
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 5%;">No.</td>
		                            <td style="width: 10%;">Trx number</td>
		                            <td style="width: 10%;">Payment Mode</td>
		                            <td style="width: 10%;">Amount</td>
		                        </tr>
		                        <cfloop query="getdptamt">
									<tr>
										<td style="width: 5%;">#getdptamt.currentrow#.</td>
										<td style="width: 10%;">#getdptamt.payno#</td>
										<td style="width: 10%;">
											<cfif getdptamt.pay_type eq 1>Cash
											<cfelseif getdptamt.pay_type eq 2>Credit Card
											<cfelseif getdptamt.pay_type eq 3>Cheque
											<cfelseif getdptamt.pay_type eq 4>Cashbin
											<cfelseif getdptamt.pay_type eq 5>Debit
											<cfelseif getdptamt.pay_type eq 6>EPS
											</cfif>
										</td>
										<td style="width: 10%;">#decimalformat(getdptamt.pay_amt)#</td>
									</tr>
								</cfloop>

		                    </table>
						</td>
					</tr>








				<cfelseif getmaster.trxtype eq "">
					<tr class="expandable_line hidden">
						<td colspan="6">
							<table id="inner_table">
		                        <tr id="orange_header">
		                            <td style="width: 10%;">No.</td>
		                            <td style="width: 10%;">Item Desc</td>
		                            <td style="width: 10%;">Ret Qty</td>
		                            <td style="width: 10%;">Exc Qty</td>
		                        </tr>

		                    </table>
						</td>
					</tr>
				</cfif>



			</cfloop>




            <tr class="expandable_line hidden">
                <td colspan="6">
                    <table id="inner_table">
                        <tr id="orange_header">
                            <td style="width: 9%;">No.</td>
                            <td style="width: 18%;">Item Dose</td>
                            <td style="width: 15%;">Type</td>
                            <td style="width: 10%;">U. Price</td>
                            <td style="width: 10%;">Qty</td>
                            <td style="width: 10%;">Cottect Qty.</td>
                            <td style="width: 10%;">Dist</td>
                            <td style="width: 18%;">Total</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>TBB05 - TCM Bust Advance P (1 hr)</td>
                            <td>S</td>
                            <td>RM 480.00</td>
                            <td>1</td>
                            <td>0</td>
                            <td>-</td>
                            <td>RM 480.00</td>
                        </tr>
                        <tr>
                            <td colspan="6"></td>
                            <td class="total_price">RM 480.00</td>
                            <td></td>
                       </tr>
                    </table>
                </td>
            </tr>


        </table>
    </div>

    <script>
        /* Add event listeners to all expanders */
        var elements = document.getElementsByClassName("expander");
        for(var i = 0; i < elements.length; i++) {
            elements[i].addEventListener("click", function(){
                expand_this(this);
            });
        }

        /* Expands or collapses an element */
        function expand_this(elem) {
            var line = elem.parentElement.nextElementSibling;
            line.classList.toggle("hidden");
            if(line.classList.contains("hidden")) {
                elem.innerHTML = '<i class="icon ion-chevron-down"></i>';
            } else {
                elem.innerHTML = '<i class="icon ion-chevron-up"></i>';
            }
        }

    </script>
</cfoutput>
</div>
</body>

</html>
