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
        #contentHolder { position: relative; height: 100vh;   }

		/* Table header - item collection */

		.table_head, #table_body {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		    font-size: 13px;
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
    </style>

</head>

<body>
<cfoutput>
   <div id="contentHolder">
		<!--- <cfset session.him_session.branchid = 0> --->
		
		<cfquery name="getsalessum" datasource="#dbname#">
			select sales_summary.refdoc,
			sales_summary.up_date as up_date,
			sales_summary.id as id,
			sales_summary.salesid as salesid,
			sales_summary.itemid as itemid,
			sales_summary.type as type,
			sales_summary.pur_qty as pur_qty,
			sales_summary.exc_qty as exc_qty,
			sales_summary.ret_qty as ret_qty,
			sales_summary.col_qty as col_qty,
			sales_hdr.salesno as salesno,
			itemcate_pos.codeno as codeno,
			itemcate_pos.description as description,
			inventory_hdr.currstkqty as qty
			from itemcate_pos, sales_summary
			LEFT OUTER JOIN sales_hdr ON (sales_summary.salesid = sales_hdr.id)
			LEFT OUTER JOIN inventory_hdr ON (sales_summary.itemid = inventory_hdr.itemid and inventory_hdr.branch = '#session.him_session.branchid#')
			<!--- where sales_summary.custid = '#custid#' --->
			where true
			and sales_summary.custtype = '2'
			<!--- and sales_summary.branch = #session.him_session.branchid# --->
			and sales_summary.col_status != 'F'
			and (sales_summary.type like 'I ' or sales_summary.type like 'PI')
			and sales_summary.itemid = itemcate_pos.itemid
			and itemcate_pos.class not in (15)
			and itemcate_pos.flushitem != '1'
			<!--- and itemcate_pos.codeno !='EXTRA' --->
			and (itemcate_pos.codeno not like 'EXTRA%')
			and
			(
			 	(sales_summary.pur_qty - sales_summary.col_qty - sales_summary.exc_qty) > 0	
					or 
				(sales_summary.col_qty - sales_summary.ret_qty) > 0
			)
			
			UNION
			
			select sales_summary.refdoc,sales_summary.up_date as up_date,sales_summary.id as id,sales_summary.salesid as salesid,sales_summary.itemid as itemid,sales_summary.type as type,sales_summary.pur_qty as pur_qty,
			sales_summary.exc_qty as exc_qty,sales_summary.ret_qty as ret_qty,sales_summary.col_qty as col_qty,sales_hdr.salesno as salesno,
			mainitem_pos.code as codeno, '(Level 1) ' || mainitem_pos.description as description,0 as qty
			from mainitem_pos, sales_summary LEFT OUTER JOIN sales_hdr ON (sales_summary.salesid = sales_hdr.id)
			<!--- where sales_summary.custid = '#custid#' --->
			where true
			and sales_summary.custtype = '2'
            <!--- and sales_summary.branch = #session.him_session.branchid# --->
			and sales_summary.col_status != 'F'
			and (sales_summary.type like 'MI')
			and
			(
			 	(sales_summary.pur_qty - sales_summary.col_qty - sales_summary.exc_qty) > 0	
					or 
				(sales_summary.col_qty - sales_summary.ret_qty) > 0
			)
			and sales_summary.itemid = mainitem_pos.id
			
			UNION
			
			select sales_summary.refdoc,sales_summary.up_date as up_date,sales_summary.id as id,sales_summary.salesid as salesid,sales_summary.itemid as itemid,sales_summary.type as type,sales_summary.pur_qty as pur_qty,
			sales_summary.exc_qty as exc_qty,sales_summary.ret_qty as ret_qty,sales_summary.col_qty as col_qty,sales_hdr.salesno as salesno,
			maingroup_pos.code as codeno,'(Level 2) ' || maingroup_pos.description as description,0 as qty
			from maingroup_pos, sales_summary LEFT OUTER JOIN sales_hdr ON (sales_summary.salesid = sales_hdr.id)
			<!--- where sales_summary.custid = '#custid#' --->
			where true
			and sales_summary.custtype = '2'
                        and sales_summary.branch = #session.him_session.branchid#
			and sales_summary.col_status != 'F'
			and (sales_summary.type like 'GI')
			and sales_summary.itemid = maingroup_pos.groupid
			and
			(
			 	(sales_summary.pur_qty - sales_summary.col_qty - sales_summary.exc_qty) > 0	
					or 
				(sales_summary.col_qty - sales_summary.ret_qty) > 0
			)
			
			UNION
			
			select sales_summary.refdoc,sales_summary.up_date as up_date,sales_summary.id as id,sales_summary.salesid as salesid,sales_summary.itemid as itemid,sales_summary.type as type,sales_summary.pur_qty as pur_qty,
			sales_summary.exc_qty as exc_qty,sales_summary.ret_qty as ret_qty,sales_summary.col_qty as col_qty,sales_hdr.salesno as salesno,
			maincate_pos.code as codeno,'(Level 3) ' || maincate_pos.description as description,0 as qty
			from maincate_pos, sales_summary LEFT OUTER JOIN sales_hdr ON (sales_summary.salesid = sales_hdr.id)
			<!--- where sales_summary.custid = '#custid#' --->
			where true
			and sales_summary.custtype = '2'
            <!--- and sales_summary.branch = #session.him_session.branchid# --->
			and sales_summary.col_status != 'F'
			and (sales_summary.type like 'CI')
			and sales_summary.itemid = maincate_pos.mainid
			and
			(
			 	(sales_summary.pur_qty - sales_summary.col_qty - sales_summary.exc_qty) > 0	
					or 
				(sales_summary.col_qty - sales_summary.ret_qty) > 0
			)
			
			UNION
			
			select sales_summary.refdoc,sales_summary.up_date as up_date,sales_summary.id as id,sales_summary.salesid as salesid,sales_summary.itemid as itemid,sales_summary.type as type,sales_summary.pur_qty as pur_qty,
			sales_summary.exc_qty as exc_qty,sales_summary.ret_qty as ret_qty,sales_summary.col_qty as col_qty,sales_hdr.salesno as salesno,
			'-' as codeno,'(Level 0) All Items' as description,0 as qty
			from sales_summary LEFT OUTER JOIN sales_hdr ON (sales_summary.salesid = sales_hdr.id)
			<!--- where sales_summary.custid = '#custid#' --->
			where true
			and sales_summary.custtype = '2'
            <!--- and sales_summary.branch = #session.him_session.branchid# --->
			and sales_summary.col_status != 'F'
			and (sales_summary.type like 'AL')
			and
			(
			 	(sales_summary.pur_qty - sales_summary.col_qty - sales_summary.exc_qty) > 0	
					or 
				(sales_summary.col_qty - sales_summary.ret_qty) > 0
			)
			
			order by salesid,up_date limit 30
		</cfquery>
		
		<input type="Hidden" name="salessumid_#getsalessum.currentrow#" value="#getsalessum.id#">
		<input type="Hidden" name="salesid_#getsalessum.currentrow#" value="#getsalessum.salesid#">
		<input type="Hidden" name="itemid_#getsalessum.currentrow#" value="#getsalessum.itemid#">
		<input type="Hidden" name="itemtype_#getsalessum.currentrow#" value="#getsalessum.type#">
		<cfset balqty = val(val(getsalessum.pur_qty) - val(getsalessum.exc_qty) - val(getsalessum.ret_qty)) - val(val(getsalessum.col_qty) - val(getsalessum.ret_qty))>
		<input type="Hidden" name="balqty_#getsalessum.currentrow#" value="#balqty#">
		
		
        <table id="table_body">
			<cfloop query="getsalessum">
				<tr>
	                <td width="5%">#getsalessum.currentrow#</td>
	                <td width="7%"><cfif getsalessum.refdoc eq 2>GIFTCERT<cfelseif getsalessum.salesno neq "">#getsalessum.salesno#<cfelse>OB</cfif></td>
	                <td width="7%"><cfif #getsalessum.codeno# neq "">#getsalessum.codeno#<cfelse>-</cfif></td>
	                <td width="25%">#getsalessum.description#</td>
	                <td width="10%">#val(getsalessum.pur_qty - getsalessum.exc_qty - getsalessum.ret_qty)#</td>
	                <td width="10%">#val(getsalessum.col_qty - getsalessum.ret_qty)#</td>
	                <td width="10%">#val(val(getsalessum.pur_qty - getsalessum.exc_qty - getsalessum.ret_qty) - val(getsalessum.col_qty - getsalessum.ret_qty))#</td>
	                <td width="10%">#val(getsalessum.qty)#</td>
	                <td width="10%">
						<script language="JavaScript">
							addCalendar("Calendar#getsalessum.currentrow#", "Select Date", "colldate_#getsalessum.currentrow#", "itemform");
						</script>
						<input type="text" id="colldate_#getsalessum.currentrow#" name="colldate_#getsalessum.currentrow#" size="7" maxlength="10" value="#dateformat(now(),'dd/mm/yyyy')#" class="m3eAa" onKeyUp="DateFormat(this,this.value,event,false,'3')" onBlur="DateFormat(this,this.value,event,true,'3');">
						<i class="icon ion-calendar"></i>
					</td>
	                <td width="15%">
		                <cfif getsalessum.type eq "I " or  getsalessum.type eq "PI">
			                <input onclick="this.select();" type="text" onkeypress="checkInt(this,event)" onblur="checkChange(this);checkValue(this,#getsalessum.currentrow#);" name="thisqty_#getsalessum.currentrow#" style="text-align:right" size="1" class="m3eAa" value="0"><br>
						<cfelse>
							<input readonly onclick="this.select();selectDetails(#getsalessum.currentrow#,'#getsalessum.itemid#','#getsalessum.type#','#val(val(getsalessum.pur_qty - getsalessum.exc_qty - getsalessum.ret_qty) - val(getsalessum.col_qty - getsalessum.ret_qty))#');" type="text" name="thisqty_#getsalessum.currentrow#" style="text-align:right" size="2" class="m3eAa" value="0"><br>
						</cfif>
					</td>
	            </tr>
			</cfloop>
	           

        </table>
    </div>
</cfoutput>
<input type="hidden" name="maxrow" value="#getsalessum.recordcount#">

	<script language="JavaScript">
		function selectDetails(rowno,itemid,type,balqty){
			var popup = window.open('dsp_processPackageGroupItem.cfm?rowno='+rowno+'&itemid='+itemid+'&type='+type+'&balqty='+balqty+'&'+ new Date().getTime(),'popservice','width=500,height=500,left=100,top=100,scrollbars=yes');
			popup.focus();
		}
	</script>
</body>

</html>