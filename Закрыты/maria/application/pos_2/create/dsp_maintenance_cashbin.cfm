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
		    padding: 8px 0;
		}

		#second_table {
		    width: 100%;
		    text-align: left;
		    color: #434343;
		    border-spacing: 1px;
		}

		#second_table tr td {
		    padding: 2px 0;
		    font-size: 13px;
		}

		.date_cell {
		    padding-left: 40px !important;
		}

		.price_cell {
		    text-align: right;
		    padding-right: 10px !important;
		}
    </style>

</head>

<body>
<cfoutput>
   <div id="contentHolder">
		<cfquery name="getcashlog" datasource="#dbname#">
			select cashbin_log.*,1 as ord from cashbin_log
			<!--- where usrid = '#custid#' --->
			where true
			and trim(refdoctype) LIKE 'OPEN'
			
			UNION
			
			select cashbin_log.*,0 as ord from cashbin_log
			<!--- where usrid = '#custid#' --->
			where true
			and trim(refdoctype) LIKE 'FOC'
			
			UNION
	
			select cashbin_log.*,0 as ord from cashbin_log
	       <!---  where usrid = '#custid#' --->
			where true
	        and trim(refdoctype) LIKE 'FLEX'	
	
			UNION
	
            select cashbin_log.*,0 as ord from cashbin_log
           <!---  where usrid = '#custid#' --->
			where true
            and refdoctype LIKE 'PLAT'
	
			UNION
	
            select cashbin_log.*,0 as ord from cashbin_log
           <!---  where usrid = '#custid#' --->
			where true
            and refdoctype LIKE 'DPT'
	
			UNION
			
			select cashbin_log.*,2 as ord from cashbin_log, cashbin_summary
			<!--- where usrid = '#custid#' --->
			where true
			and (refdoctype NOT LIKE 'OPEN' 
			and refdoctype NOT LIKE 'FOC' 
			and refdoctype NOT LIKE 'PLAT' 
			and refdoctype NOT LIKE 'DPT' 
			and refdoctype NOT LIKE 'FLEX'
			and refdoctype NOT LIKE 'DEPO'
			and refdoctype NOT LIKE 'GIFP'
			and trim(refdoctype) NOT LIKE 'MMP')
			and cashbin_log.cashbinsumid = cashbin_summary.id
            and cashbin_summary.type != 'DP'
			
			UNION
			
			select cashbin_log.*,2 as ord from cashbin_log, cashbin_summary
			<!--- where cashbin_log.usrid = '#custid#' --->
			where true
			and cashbin_log.refdoctype in ('DEPO','POSP','MMP','GIFP','ADJ','SDP','GCDP')
			and cashbin_log.cashbinsumid = cashbin_summary.id
			and cashbin_summary.type != 'DP' 
			 
			UNION
			 
			select cashbin_log.*,2 as ord from cashbin_log
			<!--- where cashbin_log.usrid = '#custid#' --->
			where true
			and cashbin_log.refdoctype in ('POSP','EXTR', 'CANC', 'POIN')
			and cashbin_log.cashbinsumid is null
			
			<!--- order by ord,date --->
			order by id, date
			
			limit 30
		</cfquery>
		
        <table id="second_table" border="0">
			<cfloop query="getcashlog">
				<cfswitch expression="#trim(getcashlog.refdoctype)#">
					<cfcase value="DEPO">
						<cfset word = "Deposit">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					<cfcase value="DEL">
						<cfset word = "Cashbin Deletion">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					<cfcase value="EXTR">
						<cfquery name="getsaleshdr" datasource="#dbname#">
							select * from sales_hdr where id = '#getcashlog.refid#'
						</cfquery>
						<cfset word = "Extra Payment">
						<cfset word2="#getsaleshdr.salesno#">
						<cfset word3="-">
					</cfcase>
					
					<cfcase value="CANC">
						<cfquery name="get" datasource="#dbname#">
							select salesno from sales_hdr where id = <cfif getcashlog.amt LT 0 >'#getcashlog.refid#'<cfelse>'#getcashlog.refid2#'</cfif>
						</cfquery>
						<cfset word = "Cancellation">
						<cfset word2 = "#get.salesno#">
						<cfif getcashlog.amt LT 0>
							<cfset word3 = "Delete Extra Payment">
						<cfelse>
							<cfset word3 = "From Void Sales">
						</cfif>
					</cfcase>
					
					<cfcase value="POSP">
						<cfquery name="get" datasource="#dbname#">
							select salesno from sales_hdr where id = '#getcashlog.refid2#'
						</cfquery>
						<cfquery name="get2" datasource="#dbname#">
							select payno from payment_hdr where id = '#getcashlog.refid#'
						</cfquery>	
						<cfset word = "POS Payment">			
						<cfset word2 = "#get.salesno#">
						<cfset word3 = "#get2.payno#">
					</cfcase>
		
					<cfcase value="GIFP">
						<cfquery name="get" datasource="#dbname#">
							select serialno from giftcert
							where id = '#getcashlog.refid2#'
						</cfquery>
						<cfquery name="get2" datasource="#dbname#">
							select payno from payment_giftcert_hdr
							where id = '#getcashlog.refid#'
						</cfquery>
						<cfset word = "Gift Cert Payment">			
						<cfset word2 = "#get.serialno#">
						<cfset word3 = "#get2.payno#">
					</cfcase>
		
					<cfcase value="OPEN">
						<cfset word = "Open Balance">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					<cfcase value="FOC ">
						<cfset word = "Open Balance (FOC)">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					<cfcase value="GIFT">
						<cfset word = "Gift Cert">
						<cfquery name="get" datasource="#dbname#">
							select serialno,refid from giftcert
							where id = '#getcashlog.refid#'
						</cfquery>
						<cfquery name="get2" datasource="#dbname#">
							select description from giftcert_template
							where id = '#val(get.refid)#'
						</cfquery>
						
						<cfset word2 = "#get2.description#">
						<cfset word3 = "#get.serialno#">
					</cfcase>
					<cfcase value="POIN">
						<cfset word = "Points Exchange">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					
					<cfcase value="FLEX">
						<cfset word = "Flexi Value">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfcase>
					
					<cfdefaultcase>
						<cfset word = "-">
						<cfset word2 = "-">
						<cfset word3 = "-">
					</cfdefaultcase>	
				</cfswitch>
				<cfquery name="getcreateby" datasource="#dbname#">
					select * from usr where <cfif getcashlog.create_by neq "">usrid = '#getcashlog.create_by#'<cfelse>usrid is null</cfif>
				</cfquery>
				<cfset word4 = "#getcreateby.name#">
				<tr>
	                <td width="10%" class="date_cell">#dateformat(getcashlog.date,"dd/mm/yyyy")#</td>
	                <td width="15%">#word#</td>
	                <td width="15%">#word2#</td>
	                <td width="10%">#word3#</td>
	                <td width="10%"> #word4#</td>
	               
	                <td width="5%" class="price_cell">RM #decimalformat(getcashlog.amt)#</td>
	                <td width="15%"><i class="icon ion-printer"></i></td>
	            </tr>
			</cfloop>
	           
       </table>
    </div>
</cfoutput>
</body>

</html>