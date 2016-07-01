<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>

		.clear {
		    clear: both;
		}

				/* perfect-scrollbar v0.6.7 */
		.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}

        /* Necessary styles for the custom scrollbar to work */
        #contentHolder {
        position: relative; height: 100vh; margin-top:-4px;
            overflow-y: scroll;
            width: 100%;
            max-height: 710px;
        }

		/* Table body */

		#table_body tr td {
		    background-color: #f5f9fc;
		    padding: 8px 0;
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

		/* Custom Checkbox */

		input[type=checkbox].css-checkbox {
		    position:absolute;
		    z-index:-1000;
		    left:-1000px;
		    overflow: hidden;
		    clip: rect(0 0 0 0);
		    height:1px;
		    width:1px;
		    margin:-1px;
		    padding:0;
		    border:0;
		}

		input[type=checkbox].css-checkbox + label.css-label {
		    padding-left:18px;
		    height:15px;
		    display:inline-block;
		    line-height:15px;
		    background-repeat:no-repeat;
		    background-position: 0 0;
		    vertical-align:middle;
		    cursor:pointer;
		}

		input[type=checkbox].css-checkbox:checked + label.css-label {
		    background-position: 0 -15px;
		}

		label.css-label {
		    background-image:url("../img/checkbox5.png");
		    -webkit-touch-callout: none;
		    -webkit-user-select: none;
		    -khtml-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		}


		/* Center area */

		#center_window {
		    /*width: calc(100% - 42px);*/
		    <!--- float: left; --->
		    margin-top: 20px;
		    /*padding: 0 1px;*/
		}

		.orange_button {
		    display: block;
		    float: right;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 5px 10px;
		    border-radius: 5px;
		    margin-right: 20px;
		    margin-top: 20px;
		    font-size: 12px;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		/* iframe */

		#page05_balance_table, #page05_history_table {
		    width: 100%;
		    margin-top:-4px;
		    /*height: calc(100vh - 5px);*/
		    height:100%;
            /*border: 1px solid #F8F8F8;*/
            border:none;
		}
    @media (max-width:1200px){
    #page05_balance_table, #page05_history_table {
           height: 1458px;
    }
    }
		/* Two tabs */

		.tab {
		    float: left;
		    color: #434343;
		    font-size: 1.2em;
		    padding: 7px 20px;
		    border-top-left-radius: 5px;
		    border-top-right-radius: 5px;
		    margin-right: 2px;
		    border: 2px solid #f8f8f8;
		    font-size: 14px;
		}

		.tab:hover {
		    cursor: pointer;
		}

		.selected_tab {
		    background-color: #f8f8f8;
		    font-weight: bold;
		}

		#balance_tab {
		    margin-left: 1px;
		    font-size: 14px;
		}

		.hidden {
		    display: none;
		}


		/* Table header - item collection */

		.table_head, #table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		        margin-top: -3px;
		    /*border-spacing: 1px;*/
		    font-size: 12px;
		}
		.table_head {
		    font-weight: bold;
		}

		.table_head tr td {
		    background-color: #f8f8f8;
		    padding: 8px 0;
		}

        #payment_history_content{position:relative;top:-2px;overflow:scroll;height:1180px;}
        #balance_content{position:relative;top:-2px;}
    </style>

</head>

<body>
<cfoutput>
<div class="main">
	<div id="center_window">
            <div id="balance_tab" class="tab selected_tab" onclick="switch_tab(this)">Outstanding Balance</div>
            <div id="history_tab" class="tab" onclick="switch_tab(this)">Payment History</div>
            <div class="clear"></div>


			<div id="payment_history_content" class="hidden">
                <table class="table_head">
                    <tr>
                        <td width="9%">Print</td>
                        <td width="29%">Receipt No ##</td>
                        <td width="14%">Sales No ##</td>
                        <td width="14%">Date</td>
                        <td width="14%">Customer</td>
                        <td width="14%">Payment</td>
                        <td width="14%">&nbsp;</td>
                    </tr>
                </table>
                <!-- This iframe has custom scrollbar -->
                <iframe src="dsp_paymenthistory.cfm?custid=#custid#"
                        id="page05_history_table"
                        frameBorder="1"
                        scrolling="yes"></iframe>
            </div>
	</div>


   <div id="contentHolder">
   <div id="balance_content">
                   <table class="table_head">
                       <tr>
                           <td width="5%" rowspan="2">No</td>
                           <td colspan="3">Payments</td>
                           <td colspan="3">Sales Details</td>
                           <td width="15%" rowspan="2">Make Payment</td>
                       </tr>
                       <tr>
                           <td width="10%">Inv ##</td>
                           <td width="14%">Doc Amt</td>
                           <td width="14%">Paid Amt</td>
                           <td width="14%">Amt Payable</td>
                           <td width="13%">Entry By</td>
                           <td width="15%">Date</td>
                       </tr>
                   </table>
   			</div>
		<cfquery name="getsales" datasource="#dbname#" >
			select sales_hdr.id,1 as type
			from sales_hdr,payment_hdr
			where sales_hdr.id != '0'
			and payment_hdr.refid = sales_hdr.id
			and sales_hdr.status = '0'
			and (payment_hdr.pay_status = 'N' or payment_hdr.pay_status = 'P')
			and sales_hdr.custtype = '2'
			<!--- and sales_hdr.custid = '#custid#' --->

			group by sales_hdr.id,sales_hdr.status, sales_hdr.custtype,sales_hdr.salesno ,sales_hdr.custid,sales_hdr.custname,
			sales_hdr.trans_date, sales_hdr.branch, payment_hdr.total, payment_hdr.payment , payment_hdr.pay_status
			
			limit 30
		</cfquery>

		<cfparam name="custid" default="">

		<cfquery name="getdetail" datasource="#dbname#" >
			select totdocamt,paidamt,salesid
			from sales_summary
			where salesid IN (#valuelist(getsales.id)#)
			group by salesid,totdocamt,paidamt,salesid
			order by salesid
		</cfquery>

		<cfset totaldocamt = 0>
		<cfset totalpaidamt = 0>

		<cfloop query="getdetail">
			<cfset totaldocamt = totaldocamt + totdocamt>
			<cfset totalpaidamt = totalpaidamt + paidamt>
		</cfloop>



        <table id="table_body">
			<cfloop query="getdetail">
				<cfquery name="getsales" datasource="#dbname#">
					select * from sales_hdr where id = '#getdetail.salesid#' order by id
				</cfquery>
				<cfquery name="getuser" datasource="#dbname#">
					select * from usr where usrid = '#getsales.personnel#'
				</cfquery>
				<tr>
	                <td width="5%">
	                    <input type="checkbox" class="css-checkbox">
	                    <label class="css-label"></label>
	                </td>
	                <td width="10%">#htmleditformat(getsales.salesno)#</td>
	                <td width="14%">#decimalformat(getdetail.totdocamt)#</td>
	                <td width="14%">#decimalformat(getdetail.paidamt)#</td>
	                <td width="14%">#decimalformat(val(getdetail.totdocamt - getdetail.paidamt))# <input type="Hidden" id="dueamt_#getdetail.currentrow#" value="#val(getdetail.totdocamt - getdetail.paidamt)#"></td>
	                <td width="13%">#htmleditformat(getuser.name)#</td>
	                <td width="15%"><input class="date_input" type="texts" value="#dateformat(now(),'dd/mm/yyyy')#"><i class="icon ion-calendar"></i></td>
	                <td width="15%">R.M&nbsp;&nbsp;&nbsp;<input id="payamtid_#getdetail.currentrow#" name="payamt_#getsales.id#" type="text" value="0.00" onclick="this.select();"><i class="icon ion-social-usd"></i></td>
	            </tr>
			</cfloop>

        </table>
    </div>
    </div>
	<div>
		<div id="add_payment" class="orange_button">Add Payment</div>
	</div>

    <script>

        var checkboxes = document.getElementsByClassName("css-checkbox");
        var labels = document.getElementsByClassName("css-label");

        /* Add ids for all checkboxes and "for" for labels */

        for(var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].setAttribute("id", "cb" + i);
            labels[i].setAttribute("for", "cb" + i);
        }

        /* Add event listeners to all checkboxes */
        for(var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].addEventListener("change", function(){
                highlight_line(this);
            });
        }

        function highlight_line(elem) {
            var line = elem.parentElement.parentElement.children;
            if(elem.checked) {
                for(var i = 0; i < line.length; i++) {
                    line[i].style.backgroundColor = "white";
                }
            } else {
                for(var i = 0; i < line.length; i++) {
                    line[i].style.backgroundColor = "##f5f9fc";
                }
            }
        }


         function switch_tab(elem){

            var a = document.getElementsByClassName('tab');
            // loop through all 'tab' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'selected_tab' if it exists
                a[i].classList.remove('selected_tab')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('selected_tab');

            switch (elem.id) {
                case "balance_tab":
                    document.getElementById("balance_content").classList.remove('hidden');
                    document.getElementById("payment_history_content").classList.add('hidden');
                    document.getElementById("add_payment").classList.remove('hidden');
                break;

                case "history_tab":
                    document.getElementById("payment_history_content").classList.remove('hidden');
                    document.getElementById("balance_content").classList.add('hidden');
                    document.getElementById("add_payment").classList.add('hidden');
                break;

                default:
                break;
            }

        }
    </script>
</cfoutput>
</body>

</html>