<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">

	<style>
		body {
		    width: 100%;
		    font-family: MyriadPro;
		    font-size: 11px;
		    line-height: 130%;
		    margin: 0;
		    padding: 0;
		    color: #515e67;
		}

		#point_statement_body {
		    width: 100%;
		    text-align: left;
		    color: #434343;
		    border-spacing: 1px;
		}

		#point_statement_body tr td {
		    padding: 8px 0 8px 20px;
		}
		
		/* Center area */

		#center_window {
		    width: calc(100% - 42px);
		    float: left;
		    margin-top: 1px;
		    padding: 0 1px;
		}

		/* Tables*/

		#point_statement_head {
		    width: 100%;
		    text-align: left;
		    color: #434343;
		    border-spacing: 1px;    
		}
		
		#point_statement_head tr td {
		    background-color: #f8f8f8;
		    padding: 8px 0 8px 20px;
		    font-weight: bold;
		}
		
		/* Tables*/

		.table_head, #table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		}

		.table_head tr td {
		    background-color: #f8f8f8;
		    padding: 0;
		    font-weight: bold;
		}
		
		
		
	</style>
</head>

<body>
<cfoutput>
	 <div id="center_window">
         <table id="point_statement_head">
             <tr>
                 <td width="100%" colspan="2">Point Statement</td>
             </tr>
         </table>
	    <table id="point_statement_body">
		    <cfquery name="getobp" datasource="#dbname#">
				select sum(points) as points,sum(used) as used,sum(balance) as balance from customer_points where custid = '#val(custid)#' and points > 0
			</cfquery>
	        <tr>
	            <td width="15%">Total Point Balance</td>
	            <td width="85%">#val(getobp.balance)#</td>
	        </tr>
	    </table>
	    
	    <table class="table_head">
             <tr>
                 <td width="10%">Customer name</td>
                 <td width="5%">Type</td>
                 <td width="10%">Date/Time</td>
                 <td width="10%">Outlet</td>
                 <td width="25%">Description</td>
                 <td width="8%">Total Points</td>
                 <td width="8%">Used Points</td>
                 <td width="8%">Balance Points</td>
                 <td width="8%">Total<br>Transaction<br>Amount</td>
                 <td width="8%">Total<br>Transaction<br>Amount<br>(w/o CB)</td>
             </tr>
         </table>
		<cfquery name="getobp" datasource="#dbname#">
			select sum(points) as points,sum(used) as used,sum(balance) as balance from customer_points where salesid = '0' and custid = '#val(custid)#' and points > 0
		</cfquery>
		<cfquery name="getsuplimentary" datasource="#dbname#">
			select * from customer where cust_principal = '#custid#'
		</cfquery>
		<cfquery name="gettrans" datasource="#dbname#">
			select sum(customer_points.points) as points,sum(customer_points.used) as used,sum(customer_points.balance) as balance,
			sales_hdr.id,sales_hdr.trans_date::date as docdate,branch.description,sales_hdr.salesno,sales_hdr.total,sales_hdr.custid as customerid
			from sales_hdr, branch, customer_points
			where sales_hdr.branch = branch.id
			and sales_hdr.id = customer_points.salesid
			<!--- <cfif getsuplimentary.recordcount GT 0>
				and sales_hdr.custid in (select id from customer where cust_principal = '#custid#' union select id from customer where id = '#custid#')
			<cfelse>
				and sales_hdr.custid = '#custid#'
			</cfif> --->
			and sales_hdr.custtype = '2'
			group by sales_hdr.id,sales_hdr.trans_date,branch.description,sales_hdr.salesno,sales_hdr.total,sales_hdr.custid
			order by sales_hdr.trans_date
			limit 30
		</cfquery>
	     <table id="table_body">
		     
            <tr>
                <td width="10%"></td>
                <td width="5%"></td>
                <td width="10%"></td>
                <td width="10%">OPEN BALANCE</td>
                <td width="25%">&nbsp;</td>
                <td width="8%">#val(getobp.points)#</td>
                <td width="8%">#val(getobp.used)#</td>
                <td width="8%">#val(getobp.balance)#</td>
                <td width="8%"></td>
                <td width="8%"></td>
            </tr>
			<cfloop query="gettrans">
				<cfquery name="getcust" datasource="#dbname#">
					select * from customer where id = '#gettrans.customerid#'
				</cfquery>
				<cfquery name="getpayment" datasource="#dbname#">
					select payment_hdr.* from payment_hdr, sales_hdr where sales_hdr.id = payment_hdr.refid and sales_hdr.id = '#gettrans.id#'
				</cfquery>
				<tr>
	                <td width="10%">#getcust.name#</td>
	                <td width="5%"><cfif gettrans.customerid eq custid>P<cfelse>S</cfif></td>
	                <td width="10%">#dateformat(gettrans.docdate,"dd/mm/yyyy")#</td>
	                <td width="10%">#gettrans.description#</td>
	                <td width="25%">#salesno#<cfif gettrans.points LT 0>(Cancel)</cfif></td>
	                <td width="8%">#val(gettrans.points)#</td>
	                <td width="8%">#val(gettrans.used)#</td>
	                <td width="8%">#val(gettrans.balance)#</td>
	                <td width="8%">#decimalformat(val(total))#</td>
	                <td width="8%">#decimalformat(val(getpayment.this_payment))#</td>
	            </tr>
	            
			</cfloop>
	            
       </table>
     </div>
	    
</cfoutput>		    
</body>

</html>