<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
		
		@font-face {
		    font-family: MyriadPro;
		    src: url("../fonts/MyriadPro-Regular.otf") format("opentype");
		    src: url("../fonts/MyriadPro-Regular.woff") format("woff");
		}
		
		.clear {
		    clear: both;
		}
		html{height:100%;}
		body {
		    height:100%;
		    width: 100%;
		    font-family: MyriadPro;
		    font-size: 11px;
		    line-height: 130%;
		    margin: 0;
		    padding: 0;
		    color: #515e67;
		}
		
		/* perfect-scrollbar v0.6.7 */
		/*.ps-container{-ms-touch-action:none;overflow:hidden !important}.ps-container.ps-active-x>.ps-scrollbar-x-rail,.ps-container.ps-active-y>.ps-scrollbar-y-rail{display:block}.ps-container.ps-in-scrolling{pointer-events:none}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container>.ps-scrollbar-x-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;bottom:3px;height:8px}.ps-container>.ps-scrollbar-x-rail>.ps-scrollbar-x{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;bottom:0;height:8px}.ps-container>.ps-scrollbar-y-rail{display:none;position:absolute;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;opacity:0;-webkit-transition:background-color 0.2s linear,opacity 0.2s linear;-moz-transition:background-color 0.2s linear,opacity 0.2s linear;-o-transition:background-color 0.2s linear,opacity 0.2s linear;transition:background-color 0.2s linear,opacity 0.2s linear;right:3px;width:8px}.ps-container>.ps-scrollbar-y-rail>.ps-scrollbar-y{position:absolute;background-color:#aaa;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;border-radius:4px;-webkit-transition:background-color 0.2s linear;-moz-transition:background-color 0.2s linear;-o-transition:background-color 0.2s linear;transition:background-color 0.2s linear;right:0;width:8px}.ps-container:hover.ps-in-scrolling{pointer-events:none}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-x>.ps-scrollbar-x-rail>.ps-scrollbar-x{background-color:#999}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail{background-color:#eee;opacity:0.9}.ps-container:hover.ps-in-scrolling.ps-y>.ps-scrollbar-y-rail>.ps-scrollbar-y{background-color:#999}.ps-container:hover>.ps-scrollbar-x-rail,.ps-container:hover>.ps-scrollbar-y-rail{opacity:0.6}.ps-container:hover>.ps-scrollbar-x-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-x-rail:hover>.ps-scrollbar-x{background-color:#999}.ps-container:hover>.ps-scrollbar-y-rail:hover{background-color:#eee;opacity:0.9}.ps-container:hover>.ps-scrollbar-y-rail:hover>.ps-scrollbar-y{background-color:#999}*/

        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100%;max-height:350px;overflow-y: scroll; }
        @media(max-width:1366px){
              #contentHolder{max-height:130px;}
        }
		/* Table body */

		#table_body tr td {
		    padding: 8px 0;
		}
		
		/* Center area */

		#center_window {
		    /*width: calc(100% - 42px);*/
		    <!--- float: left; --->
		    margin-top: 20px;
		    padding: 0 1px;
		}
		
		.buttons_line {
		    margin-left: 20px;
		}
		
		.orange_button {
		    display: block;
		    float: left;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 8px 15px 0 15px;
		    border-radius: 5px;
		    margin-right: 10px;
		    font-size: 1.2em;
		    height: 22px;
		}
		
		.blue_button {
		    box-sizing: border-box;
		    display: block;
		    float: left;
		    color: #515F6A;
		    background-color: #f5f9fc;
		    text-align: left;
		    padding: 8px 0 0 15px;
		    border: 1px solid #e9e9e9;
		    border-radius: 5px;
		    margin-right: 10px;
		    font-size: 1.1em;
		    height: 30px;
		    width: 120px;
		}
		
		.orange_button:hover, .blue_button {
		    cursor: pointer;
		}
		
		.s_button {
		    font-size: 1.8em;
		}
		
		.buttons_line p {
		    display: inline-block;
		    float: left;
		    margin: 0 10px;
		    padding-top: 8px;
		    font-size: 1.1em;
		    height: 30px;
		    color: #393945;
		}
		
		/* Custom Select */

		.cash_ob_select {
		    float: left;
		    width: 150px;
		}
		
		.cash_ob_select select {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    width: 100%;
		    border: 1px solid #e9e9e9;
		    border-radius: 5px;
		    font-size: 1.1em;
		    color: #393945;
		    background: transparent;
		    padding-left: 5px;
		    height: 30px;
		}
		
		.cash_ob_select {
		    display: block;
		    float: left;
		    height: auto;
		    overflow: hidden;
		    background: url(../img/new_arrow.png) no-repeat right white;
		    border-radius: 5px;
		}
		
		/* hide default arrow in IE */
		.styled-select select::-ms-expand {
		    display: none;
		}
		
		#available_points {
		    margin-right: 100px;
		}
		
		#pts_to_rm {
		    margin: 0;
		}
		
		#iframes_wrapper {
		    margin-top: 20px;
		}
		
		
		/* Table header - item collection */

		.table_head, #table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		}
		
		.table_head tr td {
		    background-color: #f8f8f8;
		    padding: 8px 0;
		    font-weight: bold;

		}
		
		/* Table body */

		#cash_value {
		    text-align: left;
		    padding-left: 40px;
		    font-weight: bold;
		}
		
		#page07_second_table {
			width: 100%;
		   /* height: calc(100vh - 5px);*/
		    /*height: 1100px;*/
		    height:100%;
		    max-height:250px;
            border: 1px solid #F8F8F8;
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
	<div id="center_window">

            <div class="buttons_line">
                <div class="orange_button">
                    <i class="icon ion-play"></i>
                </div>
                <div class="blue_button">
                    Add Product
                </div>
                <input type=text style="width: 130px;" class="input-style">
                <input type=text style="width: 200px;" class="input-style">
                <div class="orange_button s_button">
                    S
                </div>
                <p>Qty</p>
                <input type=text value="1" style="width: 60px;" class="input-style">
                <p>U/Price</p>
                <input type=text value="0.00" style="width: 60px;" class="input-style">
                <div class="clear"></div>
            </div>
            <div class="buttons_line">
                <div class="orange_button">
                    <i class="icon ion-play"></i>
                </div>
                <div class="blue_button">
                    Add Service
                </div>
                <input type=text style="width: 130px;" class="input-style">
                <input type=text style="width: 200px;" class="input-style">
                <div class="orange_button s_button">
                    S
                </div>
                <p>Qty</p>
                <input type=text value="1" style="width: 60px;" class="input-style">
                <p>U/Price</p>
                <input type=text value="0.00" style="width: 60px;" class="input-style">
                <div class="clear"></div>
            </div>
            <div class="buttons_line">
                <div class="orange_button">
                    <i class="icon ion-play"></i>
                </div>
                <div class="blue_button">
                    Add Gift Cert
                </div>
                <input type=text style="width: 200px;" class="input-style">
                <p>(Gift Cert Serial No)</p>
                <div class="clear"></div>
            </div>
            <div class="buttons_line">
                <div class="orange_button">
                    <i class="icon ion-play"></i>
                </div>
                <div class="blue_button">
                    Add Cash OB
                </div>
                <p>Amt</p>
                <input type=text style="width: 200px;" class="input-style">
                <div class="cash_ob_select ht">
                    <select>
                        <option value="option1">Platinum</option>
                        <option value="option2">Gold</option>
                        <option value="option3">Silver</option>
                        <option value="option4">Bronze</option>
                    </select>
                </div>
                <div class="clear"></div>
            </div>
            <div class="buttons_line">
                <div class="orange_button">
                    <i class="icon ion-play"></i>
                </div>
                <div class="blue_button">
                    Points Exchange
                </div>
                <p id="available_points">Available points: <span>0.00</span></p>
                <p>Convert</p>
                <input type=text style="width: 200px;" value="0.00" class="input-style">
                <p id="pts_to_rm">PTS to RM <span>0.00</span></p>
                <div class="clear"></div>
            </div>

            <div id="iframes_wrapper">
                <table class="table_head">
                    <tr>
                                            <td width="8.8%" style="background-color: rgb(245, 249, 252);">Sales ID</td>
                                            <td width="9%" style="background-color: rgb(245, 249, 252);">Sales Date</td>
                                            <td width="8.8%" style="background-color: rgb(245, 249, 252);">Code</td>
                                            <td width="8.8%" style="background-color: rgb(245, 249, 252);">Type</td>
                                            <td width="21.5%" style="background-color: rgb(245, 249, 252);">Item</td>
                                            <td width="9%" style="background-color: rgb(245, 249, 252);">Total</td>
                                            <td width="9%" style="background-color: rgb(245, 249, 252);">Bal</td>
                                            <td width="8.9%" style="background-color: rgb(245, 249, 252);">Value</td>
                                            <td width="10.7%" style="background-color: rgb(245, 249, 252);">Branch</td>
                                            <td width="15%" style="background-color: rgb(245, 249, 252);">Action</td>
                                        </tr>
                </table>
			</div>
	</div>
	
	
	
	<div id="contentHolder">
		<cfquery name="get2" datasource="#dbname#">
			select sales_summary.id, sales_summary.type, sales_summary.itemid, sales_summary.pur_qty, sales_summary.col_qty, sales_summary.exc_qty, sales_summary.ret_qty, 
			sales_summary.salesid, sales_summary.refid, sales_summary.refdoc, sales_summary.totalprice/sales_summary.pur_qty as unitprice, sales_summary.up_date,
			branch.description as branch
			<!--- <cfif session.him_session.companylogin is "vl"> ,old_desc </cfif> --->
			from sales_summary, branch
			where ( type = 'S' or type = 'PS' or type = 'AL' or type ='MS' or type ='CS' or type ='GS')
			<!--- and custid = '#custid#' --->
			and branch.id = sales_summary.branch
			and sales_summary.pur_qty > 0
	        order by up_date desc limit 30
		</cfquery>


        <table id="table_body">

       			<cfif trim(get2.type) eq "S" or trim(get2.type) eq "PS" or trim(get2.type) eq "I" or trim(get2.type) eq "PI" >
       				<cfquery name="getlevel4" datasource="#dbname#">
       					select * from itemcate_pos where itemid = '#get2.itemid#'
                       </cfquery>

       				<cfset itemcode = getlevel4.codeno>
       				<cfset itemdesc = getlevel4.description>

       			<cfelseif get2.type eq "AL">
       				<cfset itemcode = "Lvl 0">
       				<cfset itemdesc = "Everything">

       			<cfelseif get2.type eq "CS" or get2.type eq "CI">
                       <cfquery name="getlevel3" datasource="#dbname#">
       					select * from maincate_pos where mainid = '#val(getlevel4.mainid)#'
                       </cfquery>
       				<cfset itemcode = "Service Lvl 3">
       				<cfset itemdesc = getlevel3.description>

       			<cfelseif get2.type eq "GS" or get2.type eq "GI" >
       				<cfquery name="getlevel2" datasource="#dbname#">
       					select * from maingroup_pos where groupid = '#val(getlevel3.groupid)#'
                       </cfquery>
       				<cfset itemcode = "Service Lvl 2">
       				<cfset itemdesc = getlevel2.description>

       			<cfelseif get2.type eq "MS" or get2.type eq "MI">
                       <cfquery name="getlevel1" datasource="#dbname#">
       					select * from mainitem_pos where id = '#val(getlevel2.mid)#'
                       </cfquery>
       				<cfset itemcode = "Service Lvl 1">
       				<cfset itemdesc = getlevel1.description>

       			</cfif>

       			<cfif get2.refdoc eq 1>
       				<cfquery name="getsalesno" datasource="#dbname#">
       					select id,salesno from sales_hdr where id = '#get2.salesid#'
       				</cfquery>
       				<cfset hdrno = getsalesno.salesno>

       			<cfelseif get2.refdoc eq 2>
       				<cfquery name="getno" datasource="#dbname#">
                       	select * from giftcert where id = '#get2.salesid#'
       				</cfquery>
                       <cfset hdrno = "GIFT CERT - <BR>#getno.serialno#">

       			<cfelseif get2.refdoc eq 3>
       				<cfset hdrno = "MAINT">

       			<cfelseif get2.refdoc eq 5>
       				<cfset hdrno = "REDEEM">

       			<cfelse>
       				<cfset hdrno = "">

       			</cfif>
       			<cfset balance = val(get2.pur_qty - get2.col_qty - get2.ret_qty - get2.exc_qty)>

       			<cfloop query="get2">
       				<tr>
       	                <td width="9%">#hdrno#</td>
       	                <td width="9%">#dateformat(get2.up_date,"dd/mm/yyyy")#</td>
       	                <td width="9%">#itemcode#</td>
       	                <td width="9%">#get2.type#</td>
       	                <td width="22%">#itemdesc#</td>
       	                <td width="9%">#val(get2.pur_qty)#</td>
       	                <td width="9%">#val(balance)#</td>
       	                <td width="9%">#decimalformat(val(get2.unitprice))#</td>
       	                <td width="11%">#get2.branch#</td>
       	                <td width="11%"></td>
       	            </tr>
       			</cfloop>



               </table>



    </div>
	<iframe src="dsp_maintenance_cashbin.cfm?custid=#custid#"
                id="page07_second_table"
                frameBorder="1"
                scrolling="yes"></iframe>
    <script>

    /* Color even table cells */

    var lines = document.getElementsByTagName("tr");
    for(var i = 0; i < lines.length; i+=2) {
        for(var j = 0; j < lines[i].children.length; j++) {
            lines[i].children[j].style.backgroundColor = "##f5f9fc";
        }
    }

    </script>
</cfoutput>
</body>

</html>