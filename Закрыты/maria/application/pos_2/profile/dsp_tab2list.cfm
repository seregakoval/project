<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script>
		<cfoutput>
		function takeaction(detid,transno,opt){
			if(opt == "edit"){
				parent.location="dsp_tab2.cfm?formhdrid=#formhdrid#&action=edit&detid=" + detid + "&transno=" + transno;
			}
			else if(opt="dublicate"){
				parent.location="dsp_tab2.cfm?formhdrid=#formhdrid#&action=new&detid=" + detid + "&transno=" + transno;
			}
			
		}
		
		function deleterecord(detid)
		{	
			if (confirm("Delete This Record?"))
			{
				document.location="index.cfm?fuseaction=deleteitem&formhdrid=#formhdrid#&detid=" + detid;
				
			}
		}
		</cfoutput>
	</script>
</head>
<cfoutput>
<cfquery name="getdet" datasource="#dbname#">
	select * from stdjournaldet_temp
	where id = '#formhdrid#'
	order by rowno
</cfquery> 
<body class="entrypage">
	<table class="datatable" style="width:100%;">
		<tr>
			<td class="dataname" style="width:40px;">No</td>
			<td class="dataname">Project & Part</td>
			<td class="dataname">Acc Code & Name</td>
			<td class="dataname">Debit</td>
			<td class="dataname">GL Debit</td>
			<td class="dataname">Credit</td>
			<td class="dataname">GL Credit</td>
			<td class="dataname">GST Debit</td>
			<td class="dataname">Final Debit</td>
			<td class="dataname">GST Credit </td>
			<td class="dataname">Final Credit</td>
			<td class="dataname">Description</td>
			<td class="dataname">Party Code</td>
			<td class="dataname" >Action</td>
		</tr>
		<cfset tt1=0>
		<cfset tt2=0>
		<cfset tt3=0>
		<cfset tt4=0>
		<cfset tt5 = 0>
		<cfset tt6 = 0>
		<cfset tt7 = 0>
		<cfset tt8 = 0>
		
		<cfloop query="getdet">
			<cfquery name="getacc" datasource="#dbname#">
				select * from chartofaccount
				where id='#val(getdet.chartid)#'
			</cfquery> 
			<cfquery name="getpro" datasource="#dbname#">
				select * from project
				where projectid='#getdet.projectid#'
			</cfquery> 
			<cfquery name="getpart" datasource="#dbname#">
				select * from part
				where part_no='#getdet.part_no#'
			</cfquery> 
			<cfquery name="getparty" datasource="#dbname#">
				select partylist.code,company.comname from partylist,company
				where partylist.comno = company.comno
				and company.flag='1'
				and partylist.id = '#val(getdet.partyid)#'
			</cfquery> 
			
			<tr>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;">#getdet.currentrow#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;" title="#getpro.sdesp# / #getpart.part_code# - #getpart.part_desp#">#getpro.projectcode#</td>
				<td class="datavalue_#getdet.currentrow%2#" title="#getacc.acc_name#">#getacc.code#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.debit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.debitglamt,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.credit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.creditglamt,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberFormat(getdet.gst_amount_debit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberFormat(getdet.finaltotal_debit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberFormat(getdet.gst_amount_credit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberFormat(getdet.finaltotal_credit,'9,999.99')#</td>
				<td class="datavalue_#getdet.currentrow%2#">#getdet.descp#</td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;"><cfif getdet.partyid neq 0>#getparty.code#</cfif></td>
				<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;">
					<img src="/symphony/v33/images/newimg/edit8.png" class="imgtoplink" title="Edit this record" onclick="takeaction('#getdet.rowno#','#getdet.trans_no#','edit');">
					<img src="/symphony/v33/images/newimg/dublicate.png" class="imgtoplink" title="Duplicate this record" onclick="takeaction('#getdet.rowno#','#getdet.trans_no#','dublicate');">	
					<img src="/symphony/v33/images/newimg/dele.png" class="imgtoplink" title="Delete this record" onclick="deleterecord('#getdet.rowno#')">
				</td>
			</tr>		
			<cfset tt1 = tt1 + val(getdet.debit)>
			<cfset tt2 = tt2 + val(getdet.debitglamt)>
			<cfset tt3 = tt3 + val(getdet.credit)>
			<cfset tt4 = tt4 + val(getdet.creditglamt)>
			<cfset tt5 = tt5 + val(getdet.gst_amount_debit)>
			<cfset tt6 = tt6 + val(getdet.finaltotal_debit)>
			<cfset tt7 = tt7 + val(getdet.gst_amount_credit)>
			<cfset tt8 = tt8 + val(getdet.finaltotal_credit)>
		</cfloop>
		<tr>
			<td class="datasum" style="text-align:right;" colspan="3">TOTAL</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt1,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt2,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt3,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt4,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt5,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt6,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt7,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;">#numberformat(tt8,'9,999.99')#</td>
			<td class="datasum" style="text-align:right;" colspan="3">&nbsp;</td>
		</tr>
		
	</table>
</body>
</cfoutput>
</html>