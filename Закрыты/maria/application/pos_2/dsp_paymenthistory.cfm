<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
		/* perfect-scrollbar v0.6.7 */
		.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}

        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }

		/* Table body */

		#table_body tr td {
		    background-color: #f5f9fc;
		    padding: 8px 0;
		    font-size: 12px;
		}

		#table_body tr td input {
		    border: 1px solid #ebebeb;
		    border-radius: 5px;
		    width: 40px;
		    color: #434343;
		    text-align: right;
		    padding-right: 10px;
		    font-size: 1em;
		}

		#table_body tr td i {
		    font-size: 1.2em;
		    padding-left: 5px;
		}

		.date_input {
		    width: 80px !important;
		}

		/* Delete button on collection history page */

		.delete_button {
		    border: 1px solid #dfe5e5;
		    border-radius: 5px;
		    background-color: white;
		    color: #e03627;
		    font-size: 1.3em;
		    width: 40px;
		    padding: 3px 0;
		    margin: 0 auto;
		}

		.delete_button:hover {
		    cursor: pointer;
		}

		.button_container {
		    padding: 0 !important;
		}
    </style>
</head>

<body>
<cfoutput>
	<cfquery name="get" datasource="#dbname#">
		select 
		payment_hdr.refid,
		payment_hdr.id,
		payment_hdr.custid,
		payment_hdr.branch,
		payment_hdr.custtype,
		payment_hdr.this_payment,
		payment_hdr.paynotrk,
		payment_hdr.trans_date,
		payment_hdr.payno
		from payment_hdr
		where payment_hdr.payno is not null
		<!--- and payment_hdr.custid = '#custid#' --->
		and payment_hdr.custtype = '2'
		order by payment_hdr.paynotrk desc limit 30
	</cfquery>

	
   <div id="contentHolder">
        <table id="table_body">
			<cfloop query="get">
				<cfif get.custtype eq 1>
					<cfset custname = "Walk In">
				<cfelseif get.custtype eq 2>	
					<cfquery name="getname" datasource="#dbname#">
						select * from customer where id = '#get.custid#'
					</cfquery>
					<cfset custname = getname.name>	
				<cfelseif get.custtype eq 3>
					<cfquery name="getname" datasource="#dbname#">
						select * from company where comno = '#get.custid#'
					</cfquery>
					<cfset custname = getname.comname>	
				</cfif>
			
				<cfquery name="getsalesno" datasource="#dbname#">
					select sales_hdr.*,payment_hdr.* from sales_hdr,payment_hdr where payment_hdr.refid = sales_hdr.id and payment_hdr.refid = '#get.refid#' limit 1
				</cfquery>
				<tr>
	                <td width="9%"><i class="icon ion-printer"></i></td>
	                <td width="29%">#get.payno#</td>
	                <td width="14%">#valuelist(getsalesno.salesno)#</td>
	                <td width="14%">#dateformat(get.trans_date,"dd/mm/yyyy")#</td>
	                <td width="14%">#custname#</td>
	                <td width="14%">#decimalformat(get.this_payment)#</td>
	                <td width="14%" class="button_container"><div class="delete_button"><i class="icon ion-trash-a"></i></div></td>
	            </tr>
			</cfloop>
	            
           
       </table>
    </div>
</cfoutput>
</body>

</html>