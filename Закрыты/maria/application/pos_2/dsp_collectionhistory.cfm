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
        #contentHolder { position: relative; height: 100vh; margin: 0px 10px; }

		.clear {
		    clear: both;
		}

		/* Table body */

		#table_body tr td {
		    background-color: #f5f9fc;
		    padding: 8px 0;
		}

		#table_body tr td input {
		    border: none;
		    width: 40px;
		    color: #434343;
		    text-align: right;
		    padding-right: 10px;
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

		/* Center area */

		#center_window {
		    width: calc(100% - 42px);
		    <!--- float: left; --->
		    margin-top: 20px;
		    padding: 0px 10px;
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
		    font-size: 1.2em;
		}

		.orange_button:hover {
		    cursor: pointer;
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
		    font-size: 13px;
		}

		.tab:hover {
		    cursor: pointer;
		}

		.selected_tab {
		    background-color: #f8f8f8;
		    font-weight: bold;
		}

		#item_tab {
		    margin-left: 1px;
		    font-size: 13px;
		}

		.hidden {
		    display: none;
		}

		/* iframe */

		#page03_item_table, #page03_history_table {
		    width: 100%;
		    height: calc(100vh - 10px);
		    border: none;
		}

		#page03_history_table {
		    height: calc(100vh - 300px);
		}

		/* Table body */

		#table_body tr td {
		    background-color: #f5f9fc;
		    padding: 8px 0;
		}

		#table_body tr td input {
		    border: none;
		    width: 40px;
		    color: #434343;
		    text-align: right;
		    padding-right: 10px;

		}

		/* Table header - item collection */

		.table_head, #table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		    font-size: 13px;
		}

		.table_head {
		    font-weight: bold;
		    font-size: 13px;
		}

		.table_head tr td {
		    background-color: #f8f8f8;
		    padding: 8px 0;
		}


    </style>

</head>

<body>
<cfoutput>
	 <div id="center_window">
            <div id="item_tab" class="tab selected_tab" onclick="switch_tab(this)">Item Collection</div>
            <div id="history_tab" class="tab" onclick="switch_tab(this)">Collection History</div>
            <div class="clear"></div>

			<div id="collection_history_content" class="hidden">
                <table class="table_head">
                    <tr>
                        <td width="10%">Trk##</td>
                        <td width="42%">Customer</td>
                        <td width="12%">Outlet</td>
                        <td width="12%">Type</td>
                        <td width="12%">Date</td>
                        <td width="12%">&nbsp;</td>
                    </tr>
                </table>
			</div>
           <div id="item_collection_content">

                <table class="table_head">
                    <tr>
                        <td width="5%" rowspan="2">##</td>
                        <td colspan="3">Item Details 1</td>
                        <td colspan="5">Quantity Details</td>
                        <td width="15%" rowspan="2">To Collect</td>
                    </tr>
                    <tr>
                        <td width="7%">TRX##</td>
                        <td width="7%">Code</td>
                        <td width="25%">Desc</td>
                        <td width="10%">Pur.Qty</td>
                        <td width="10%">Col.Qty</td>
                        <td width="10%">Bal.</td>
                        <td width="10%">Ex-Stock</td>
                        <td width="10%">Date Collect</td>
                    </tr>
                </table>
				<!-- This iframe has custom scrollbar -->
                <iframe src="dsp_collection.cfm?custid=#custid#"
                        id="page03_item_table"
                        frameBorder="1"
                        scrolling="yes"></iframe>
            </div>

	</div>

   <div id="contentHolder">
		<cfquery name="getsales" datasource="#dbname#" >
			select collect_hdr.*, branch.code as branchcode, branch.description as branchdesc from collect_hdr, branch where collect_hdr.branch = branch.id and
			collect_hdr.id != '0' <!--- and collect_hdr.custid = '#custid#' ---> and collect_hdr.custtype = '2' order by collect_hdr.trans_date desc limit 30
		</cfquery>

		<!--- <cfdump var="#getsales#"> --->
        <table id="table_body">
			<cfloop query="getsales">
				<cfif getsales.custtype EQ "1" >
					<cfset cust_id = "0" >
					<cfset thiscustname = "WALK IN" >
					<cfset thistype = "WALK IN" >
				<cfelseif getsales.custtype EQ "2">
					<cfset cust_id = getsales.custid >
					<cfquery name="getcust" datasource="#dbname#" >
						select name from customer
						where id = '#getsales.custid#'
					</cfquery>
					<cfset thiscustname = getcust.name >
					<cfset thistype = "MEMBER" >
				<cfelseif getsales.custtype EQ "3">
					<cfset cust_id = getsales.custid >
					<cfquery name="getcust" datasource="#dbname#" >
						select comname from company
						where comno = '#getsales.custid#'
					</cfquery>
					<cfset thiscustname = getcust.comname >
					<cfset thistype = "COMPANY" >
				</cfif>
				<tr>
	                <td width="10%"><i class="icon ion-printer"></i>&nbsp;#htmleditformat(getsales.colno)#</td>
	                <td width="40%">#htmleditformat(thiscustname)#</td>
	                <td width="12%">#getsales.branchdesc#</td>
	                <td width="12%">#thistype#</td>
	                <td width="12%">#dateformat(getsales.trans_date)#</td>
	                <td width="12%" class="button_container"><div class="delete_button"><i class="icon ion-trash-a"></i></div></td>
	            </tr>
			</cfloop>
       </table>
    </div>
	<div>
		<div id="submit_collection" class="orange_button ffff">Submit Collection</div>
    </div>

	<script src="js/show_menu.js"></script>
    <script>

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
                case "item_tab":
                    document.getElementById("item_collection_content").classList.remove('hidden');
                    document.getElementById("collection_history_content").classList.add('hidden');
                    document.getElementById("submit_collection").classList.remove('hidden');
                break;

                case "history_tab":
                    document.getElementById("collection_history_content").classList.remove('hidden');
                    document.getElementById("item_collection_content").classList.add('hidden');
                    document.getElementById("submit_collection").classList.add('hidden');
                break;

                default:
                break;
            }

        }
    </script>
</cfoutput>
</body>

</html>