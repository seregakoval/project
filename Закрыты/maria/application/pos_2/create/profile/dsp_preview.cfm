<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Symphony eTQM - web based project management application - doc control, purchasing,store, project, project accounting, costing module</title>
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
</head>
<cfoutput>
<cfquery name="gethdr" datasource="#dbname#">
	select * from stdjournalhdr
	where id = '#formhdrid#'
</cfquery> 

<cfquery name="getdet" datasource="#dbname#">
	select * from stdjournaldet
	where id = '#formhdrid#'
</cfquery> 

<cfquery name="getentry" datasource="#dbname#">
	select * from login
	where logno='#gethdr.enteredby#'
</cfquery> 

<cfquery name="getgl" datasource="#dbname#">
	select * from glentry2
	where trans_no='GLCD#getdet.trans_no#'
</cfquery> 

<body class="tabentrypage" style="background-color:##ffffff;">
	<table class="previewmaintable" border="0">
		<tr>
			<td colspan="100%" class="maintitle">
			&nbsp; <cfif journaltype eq "OP">RECURRING JOURNAL<cfelseif journaltype eq "AC">ACCURAL JOURNAL<cfelseif journaltype eq "WP">WIP POSTING<cfelse>#journaltype# JOURNAL</cfif>
			</td>
		</tr>
	</table>
	<br>
	<table class="documenttable" style="width:80%;"   align="center">
		<tr>
			<td style="width:10px;"></td><!--- LEFT MARGIN --->
			<td><!--- CONTENT --->
				<table class="previewtable" style="width:80%;">
					<tr>
						<td colspan="4" class="documenttitle" style="text-align:left;">RECURRING JOURNAL</td>
						<td class="documennumber" style="text-align:left;">TRX No</td>
						<td class="documennumber" style="text-align:left;">:</td>
						<td class="documennumber" style="text-align:left;">GLCD-#getdet.trans_no#</td>
					
					</tr>
					
					<tr>
						<td class="previewnamecell">Journal Date </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#dateformat(gethdr.journaldate,global_dateformat)#</td>
						<td style="width:175px;"></td>
						<td class="previewnamecell" style="width:130px;"></td>
						<td style="width:5px;" class="previewnamecell"></td>
						<td class="previewvaluecell"></td>
					</tr>
					<tr>
						<td class="previewnamecell">Journal No. </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#htmleditformat(gethdr.journalno)#</td>
						<td></td>
						<td class="previewnamecell" style="width:130px;">Doc Reference ## </td>
						<td style="width:5px;" class="previewnamecell">:</td>
						<td class="previewvaluecell">#htmleditformat(gethdr.refno)#</td>
					</tr>
					<cfquery name="getcur" datasource="#dbname#">
						select description from currency
						where ccid='#gethdr.currency#'
					</cfquery>
					<tr>
						<td class="previewnamecell">Posting Date </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#dateformat(gethdr.postdate,global_dateformat)#</td>
						<td></td>
						<td class="previewnamecell">Other Reference </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#htmleditformat(gethdr.otrref)#</td>
					</tr>
					<tr>
						<td class="previewnamecell">Category </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#gethdr.category#</td>
						<td></td>
						<td class="previewnamecell">Currency / Rate </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#getcur.description# #gethdr.rate#</td>
					</tr>
					<tr>
						<td class="previewnamecell">Entry By </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#getentry.loginid#</td>
						<td></td>
						<td class="previewnamecell">Entry Date </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell">#dateformat(gethdr.entrydate,global_dateformat)#</td>
					</tr>
					<tr>
						<td class="previewnamecell">Remark </td>
						<td class="previewnamecell">:</td>
						<td class="previewvaluecell" colspan="5">#htmleditformat(gethdr.remark)#</td>
					</tr>
				</table>
			
				<table class="previewmaintable">
					<tr>
						<td class="previewtitle1">Line Items</td>
					</tr>
				</table>
				<table class="datatable" style="width:100%;">
					<tr>
						<td class="dataname" style="width:40px;">&nbsp;</td>
						<td class="dataname">Description</td>
						<td class="dataname">Account Code</td>
						<td class="dataname">Account Name</td>
						<td class="dataname">GST Code</td>
						<td class="dataname">Debit</td>
						<td class="dataname">Credit</td>
						<td class="dataname">GST Debit </td>
						<td class="dataname">GST Credit </td>
						<td class="dataname">Final Debit </td>
						<td class="dataname">Final Credit </td>
						<td class="dataname">Party Code</td>
						<td class="dataname">Party Name</td>
					</tr>
					
					<cfset counter=1>
					<cfset ttdr=0>
					<cfset ttcr=0>
					<cfloop query="getdet">
					<cfset ttdr=ttdr + val(getdet.debit)>
					<cfset ttcr=ttcr + val(getdet.credit)>
					
					<cfquery name="getacc" datasource="#dbname#">
						select * from chartofaccount
						where id='#getdet.chartid#'
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
						and partylist.id = '#getdet.partyid#'
					</cfquery> 
					<cfquery name="getcharge" datasource="#dbname#">
						select * from cost
						where costid='#getdet.codeid#'
					</cfquery> 
					<cfquery name="getgst" datasource="#dbname#">
						select company.comno,company.comname as acc_name,partylist.*
						from company,partylist
						where company.comno = partylist.comno
						 and company.flag='1'
						<cfif getdet.gst_accid neq "">
							and partylist.id='#getdet.gst_accid#'
						<cfelse>
							and false
						</cfif>
					</cfquery>
					
					<tr>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;">#getdet.currentrow#</td>
						<td class="datavalue_#getdet.currentrow%2#">					
						#getcharge.chargecode#
						#getcharge.description#
						#htmleditformat(getdet.descp)#
						Project  #getpro.sdesp#
						Part  #getpart.part_desp#
						</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;">#getacc.code#&nbsp;</td>
						<td class="datavalue_#getdet.currentrow%2#">#getacc.acc_name#&nbsp;</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:left;">#htmleditformat(getgst.code)#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.debit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.credit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.gst_amount_debit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.gst_amount_credit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.finaltotal_debit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:right;">#numberformat(getdet.finaltotal_credit,'9,999.99')#</td>
						<td class="datavalue_#getdet.currentrow%2#" style="text-align:center;">#getparty.code#&nbsp;</td>
						<td class="datavalue_#getdet.currentrow%2#">#getparty.comname#&nbsp;</td>
					</tr>	
					</cfloop>	
					<tr>
						<td class="datasum" colspan="5" style="text-align:right;" >Total</td>
						<td class="datasum" style="text-align:right;" >#numberformat(ttdr,'9,999.99')#</td>
						<td class="datasum" style="text-align:right;" >#numberformat(ttcr,'9,999.99')#</td>
						<td class="datasum" colspan="6">&nbsp;</td>
					</tr>
				</table>			
			</td>
		</tr>
	</table>	
				<table class="previewmaintable">
					<tr>
						<td style="text-align:center;"><input type="Button" name="back" value="OK" class="btncanceloff" onmouseover="this.className='btncancelon'" onmouseout="this.className='btncanceloff'" onClick="window.close();"></td>	
					</tr>
				</table>

</body>
</cfoutput>
</html>
