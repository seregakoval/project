<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }

		/* perfect-scrollbar v0.6.7 */
		.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}

		/* Table */

		#table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		}

		#table_body tr td {
		    background-color: #f5f9fc;
		    padding: 10px 0;
		    font-size: 13px;
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
		    background-image:url("img/checkbox5.png");
		    -webkit-touch-callout: none;
		    -webkit-user-select: none;
		    -khtml-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		}
		
		/* Two orange buttons */

		.orange_button {
		    display: inline-block;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 0 10px;
		    border-radius: 5px;
		    padding-top: 5px;
		    height: 22px;
		    vertical-align: top;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		#orange_submit {
		    margin-right: 10px;
		}
		
		
		/* Table */

		#table_head {
		   /* width: calc(100% - 40px);*/
		    <!--- float: left; --->
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		    font-weight: bold;
		    margin-top: 10px;
		    font-size: 13px;
		}


		#table_head tr td {
		    background-color: #f8f8f8;
		    padding: 10px 0;
		}
		.input-style{
        		    border: 1px solid #e9e9e9;
                    border-radius: 5px;
                    font-size: 1.1em;
                    color: #393945;
                    background: transparent;
                    padding-left: 5px;
                    height: 25px;
        		}
		
    </style>
</head>

<body>
<cfoutput>
		<div id="buttons_line">
            Service Date:
            <input type="date" id="date_from" value="26/06/2014" class="input-style">
            <div class="orange_button" id="orange_submit">Submit</div>
        </div>
		
		<table id="table_head">
            <tr>
                            <td style="width: 5.4%;"></td>
                            <td style="width: 10.3%;">Sales ID</td>
                            <td style="width: 10.25%;">Debit ID</td>
                            <td style="width: 10.2%;">Code</td>
                            <td style="width: 30.95%;">Item</td>
                            <td style="width: 10.2%;">U. Price</td>
                            <td style="width: 10.2%;">Total</td>
                            <td style="width: 10.2%;">On-Going</td>
                            <td style="width: 10%;">Bal</td>
                            <td style="width: 10%;">Sales Date</td>
                        </tr>
        </table>
		<cfquery name="getdet" datasource="#dbname#">
			select sales_summary.refdoc,sales_summary.id,sales_summary.type,sales_summary.itemid,sales_summary.pur_qty,sales_summary.col_qty,sales_summary.ret_qty,sales_summary.exc_qty,
			sales_summary.salesid,sales_summary.refid,sales_summary.unitprice,sales_summary.disc,sales_summary.totalprice,sales_summary.disctype
			from sales_summary, sales_hdr
			where (sales_summary.type = 'S' or sales_summary.type = 'PS' or sales_summary.type = 'AL' or sales_summary.type ='MS' or sales_summary.type ='CS' or sales_summary.type ='GS')
			<!--- and sales_summary.custid = '#val(custid)#' --->
			and (sales_summary.pur_qty - sales_summary.col_qty - sales_summary.ret_qty - sales_summary.exc_qty) > '0'
			and sales_summary.salesid = sales_hdr.id
			and sales_hdr.status = '0'
			and sales_summary.refdoc = '1'
			and sales_summary.enddate is null
			
			UNION
			
			select sales_summary.refdoc,sales_summary.id,sales_summary.type,sales_summary.itemid,sales_summary.pur_qty,sales_summary.col_qty,sales_summary.ret_qty,sales_summary.exc_qty,
			sales_summary.salesid,sales_summary.refid ,sales_summary.unitprice,sales_summary.disc,sales_summary.totalprice,sales_summary.disctype
			from sales_summary
			where (sales_summary.type = 'S' or sales_summary.type = 'PS' or sales_summary.type = 'AL' or sales_summary.type ='MS' or sales_summary.type ='CS' or sales_summary.type ='GS')
			<!--- and sales_summary.custid = '#val(custid)#' --->
			and (sales_summary.pur_qty - sales_summary.col_qty - sales_summary.ret_qty - sales_summary.exc_qty) > '0'
			and sales_summary.refdoc in (2,3)
			and sales_summary.enddate is null
			
			UNION
			
			select sales_summary.refdoc,sales_summary.id,sales_summary.type,sales_summary.itemid,sales_summary.pur_qty,sales_summary.col_qty,sales_summary.ret_qty,sales_summary.exc_qty,
			sales_summary.salesid,sales_summary.refid ,sales_summary.unitprice,sales_summary.disc,sales_summary.totalprice,sales_summary.disctype
			from sales_summary
			where (sales_summary.type = 'S' or sales_summary.type = 'PS' or sales_summary.type = 'AL' or sales_summary.type ='MS' or sales_summary.type ='CS' or sales_summary.type ='GS')
			<!--- and sales_summary.custid = '#val(custid)#' --->
			and (sales_summary.pur_qty - sales_summary.col_qty - sales_summary.ret_qty - sales_summary.exc_qty) > '0'
		
			UNION
			
			select sales_summary.refdoc,sales_summary.id,sales_summary.type,sales_summary.itemid,sales_summary.pur_qty,sales_summary.col_qty,sales_summary.ret_qty,sales_summary.exc_qty,
			sales_summary.salesid,sales_summary.refid ,sales_summary.unitprice,sales_summary.disc,sales_summary.totalprice,sales_summary.disctype
			from sales_summary
			where (sales_summary.type = 'S' or sales_summary.type = 'PS' or sales_summary.type = 'AL' or sales_summary.type ='MS' or sales_summary.type ='CS' or sales_summary.type ='GS')
			<!--- and sales_summary.custid = '#val(custid)#' --->
			and sales_summary.refdoc = '5'
			and (sales_summary.pur_qty - sales_summary.col_qty - sales_summary.ret_qty - sales_summary.exc_qty) > '0'
			
			order by id
			limit 30
		</cfquery>

    <div id="contentHolder">
        <table id="table_body">
			<cfloop query="getdet">
				
				<cfif getdet.refdoc eq 2>
					<cfquery name="getno" datasource="#dbname#">
						select * from giftcert where id = '#getdet.salesid#'
					</cfquery>
					<cfset hdrno = "GIFT CERT - #getno.serialno#">
					<cfset hdrdate = getno.create_date>
				<cfelse>
					<cfquery name="getsalesno" datasource="#dbname#">
						select * from sales_hdr where id = '#getdet.salesid#'
					</cfquery>
					<cfset hdrno = getsalesno.salesno>
					<cfset hdrdate = getsalesno.trans_date>
				</cfif>
				
				
				<cfquery name="getlevel4" datasource="#dbname#">
					select * from itemcate_pos where itemid = '#getdet.itemid#'
				</cfquery>
				<cfquery name="getlevel3" datasource="#dbname#">
					select * from maincate_pos where mainid = '#getlevel4.mainid#'
				</cfquery>
				<cfquery name="getlevel2" datasource="#dbname#">
					select * from maingroup_pos where groupid = '#getlevel3.groupid#'
				</cfquery>	
				<cfquery name="getlevel1" datasource="#dbname#">
					select * from mainitem_pos where id = '#getlevel2.mid#'
				</cfquery>
				
				<cfif trim(getdet.type) eq "S" or trim(getdet.type) eq "PS">
					<cfset itemcode = getlevel4.codeno>
					<cfset itemdesc = getlevel4.description>
					
				<cfelseif getdet.type eq "AL">
					<cfset itemcode = "(Level 0) ">
					<cfset itemdesc = "(Level 0) Everything">
					
				<cfelseif getdet.type eq "CS">
					<cfset itemcode = "(Service Level 3) ">
					<cfset itemdesc = "(Service Level 3) " & getlevel1.description & " - " & getlevel2.description & " - " & getlevel3.description>
				
				<cfelseif getdet.type eq "GS">
					<cfset itemcode = "(Service Level 2) ">
					<cfset itemdesc = "(Service Level 2) " & getlevel1.description & " - " & getlevel2.description >
				
				<cfelseif getdet.type eq "MS">
					<cfset itemcode = "(Service Level 1) ">
					<cfset itemdesc = "(Service Level 1) " & getlevel1.description>
				
				</cfif>
				
				<cfquery name="getongoing" datasource="#dbname#">
					select sum(crm_service_det.qty) as qty from crm_service_det,crm_service_hdr
					where crm_service_det.salessumid = '#getdet.id#'
					and crm_service_det.hdrid = crm_service_hdr.id
					and crm_service_hdr.status = '0';
				</cfquery>
				
				<cfset balqty = val(getdet.pur_qty - getdet.col_qty - getdet.ret_qty - getdet.exc_qty)>
				
	            <tr>
	                <td width="5%">
	                    <input type="checkbox" class="css-checkbox">
	                    <label class="css-label"></label>
	                </td>
	                <td width="10%">#hdrno#</td>
	                <td width="10%">#getdet.id#</td>
	                <td width="10%">#itemcode#</td>
	                <td width="30%">#itemdesc#</td>
	                <td width="10%">#getdet.unitprice#</td>
	                <td width="10%">#val(getdet.pur_qty)#</td>
	                <td width="10%">#val(getongoing.qty)#</td>
	                <td width="10%">#balqty#</td>
	                <td width="10%">#dateformat(hdrdate,"dd/mm/yyyy")#</td>
	            </tr>
			</cfloop>
        </table>
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
    </script>
</cfoutput>	
</body>

</html>