<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script type="text/javascript" src="../../component.js"></script>
	<cfquery name="gethdr" datasource="#dbname#">
		select * from stdjournalhdr_temp
		where id = '#formhdrid#'
	</cfquery> 

	<cfoutput>
	<script>
		function fn_selectaction(add){
			document.itemform.fuseaction.value=add;
		} 
		function actionselection(opt){
			if (opt == 'button1'){
				unk = new Date();
				WinItem = window.open("dsp_selectproject2.cfm?unk=" + unk,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
				WinItem.window.focus();
			} 
			else if (opt == 'button3'){
				unk = new Date();
				if (document.itemform.projectid.value == ''){
					alert('Must Select Project Part First!');
				} else {
					var pro = document.itemform.projectid.value;
					WinItem = window.open("dsp_chargeselection.cfm?pro=" + pro +"&unk=" + unk,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
					WinItem.window.focus();					
				}
			}
		
		}
		function popWinParty(PCd,PID,PNm,CNm,CNo,CId,ProID,Acc){
			pagelink = "dsp_partyselection.cfm?searchdesc=&displaytype=1&searchlevel=1&searchtype=&project=" + ProID + "&fd1=" + PCd + "&fd2=" + PID + "&fd3=" + PNm + "&fd4=" + CNm+ "&fd5=" + CNo+ "&fd6=" + CId+ "&fd7=" + Acc;
			//popup = window.open(pagelink,"popup","height=380,width=500,scrollbars=yes,resizable=yes");popup.window.focus();
			WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
				WinItem.window.focus();
		}
		
		function ClearField(a,b,c){
			document.itemform.elements[a].value = "";
			document.itemform.elements[b].value = "";
			document.itemform.elements[c].value = "";
		}
		
		function checkaddnew(){
			if (document.itemform.projectid.value == ''){
				alert('Project Part Cannot be Empty');
				document.itemform.projectname.focus();
				return false;
			}
			if (document.itemform.accid.value == ''){
				alert('Account Code be Empty');
				document.itemform.accname.focus();
				return false;
			}
			if (document.itemform.debit.value == ''){
				alert('Debit Cannot be Empty');
				document.itemform.debit.focus();
				return false;
			}
			if (document.itemform.credit.value == ''){
				alert('Credit Cannot be Empty');
				document.itemform.credit.focus();
				return false;
			}
			if (document.itemform.debit.value != 0 && document.itemform.credit.value != 0){
				alert('Cannot Enter Credit and Debit Together');
				document.itemform.debit.focus();
				return false;
			}
			if (document.itemform.gldebit.value != 0 && document.itemform.glcredit.value != 0){
				alert('Cannot Enter GL Credit and GL Debit Together');
				document.itemform.gldebit.focus();
				return false;
			}
			if (document.itemform.gst_amount_debit.value != 0 && document.itemform.gst_amount_credit.value != 0){
				alert('Cannot Enter GST Credit and GST Debit Together');
				document.itemform.gst_amount_debit.focus();
				return false;
			}
			return true;
		}
		
		function updatedebit(){
			var db = document.itemform.debit.value * #gethdr.rate#;
			document.itemform.gldebit.value = Number(parseFloat(db)).toFixed(2);
			calculategstamont("1");
			calculate_finaldoc_debit();
		}
		function updatecredit(){
			var cr = document.itemform.credit.value * #gethdr.rate#;
			document.itemform.glcredit.value =  Number(parseFloat(cr)).toFixed(2);
			calculategstamont("2");
			calculate_finaldoc_credit();
		}
		
		function calculategstamont(opt){
			var gltot = 0;
			if (opt == "1" ){
				gltot_debit = document.itemform.gldebit.value;
			}
			else if(opt == "2"){
				gltot_credit = document.itemform.glcredit.value;
			}
			else{
				gltot_debit = document.itemform.gldebit.value;
				gltot_credit = document.itemform.glcredit.value;
			}
			
			var gstpercent = document.itemform.gst_percent.value;
			// do debit
			if ( (opt == 1) || (opt == 3)) {
				var gstamt = (gltot_debit * gstpercent) / 100.0;
				gstamt = parseFloat(gstamt).toFixed(2);
				var gstfinal = parseFloat(gltot_debit) + parseFloat(gstamt);
				document.itemform.gst_doc_debit.value = Number(parseFloat(gstamt)).toFixed(2);
				//document.itemform.gst_finaltotal_debit.value = Number(parseFloat(gstfinal)).toFixed(2);
				changegst_doc_debit();
			}
			// do credit
			if ( (opt == 2) || (opt == 3)) {
				var gstamt = (gltot_credit * gstpercent) / 100.0;
				gstamt = parseFloat(gstamt).toFixed(2);
				var gstfinal = parseFloat(gltot_credit) + parseFloat(gstamt);
				document.itemform.gst_doc_credit.value = Number(parseFloat(gstamt)).toFixed(2);
				//document.itemform.gst_finaltotal_credit.value = Number(parseFloat(gstfinal)).toFixed(2);
				changegst_doc_credit();
			}
		}
		
		function cleargst(){
			document.itemform.gstcode.value ="";
			document.itemform.gstname.value ="";
			document.itemform.gst_acccode.value ="";
			document.itemform.gst_percent.value ="0.00";
			document.itemform.gst_amount_debit.value ="0.00";
			document.itemform.gst_amount_credit.value ="0.00";
			calculategstamont("3");
		}
		
		function searchselection(pagelink){
			WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
			WinItem.window.focus();
		}
		
		function changegst_doc_debit(){
			document.itemform.gst_amount_debit.value = Number(parseFloat(document.itemform.gst_doc_debit.value) * #gethdr.rate# ).toFixed(2);
			document.itemform.finaldoc_debit.value =  Number(parseFloat(document.itemform.gst_doc_debit.value) + parseFloat(document.itemform.debit.value)).toFixed(2) ;
			document.itemform.finaltotal_debit.value = Number(parseFloat(document.itemform.finaldoc_debit.value) * #gethdr.rate# ).toFixed(2);
			change_finaltotal_debit();
		}
		function change_finaldoc_debit(){
			document.itemform.debit.value =  Number(parseFloat(document.itemform.finaldoc_debit.value) - parseFloat(document.itemform.gst_doc_debit.value)).toFixed(2) ;
			document.itemform.finaltotal_debit.value = Number(parseFloat(document.itemform.finaldoc_debit.value) * #gethdr.rate# ).toFixed(2);
			change_finaltotal_debit();
		}
		function change_finaltotal_debit(){
			document.itemform.gldebit.value =  Number(parseFloat(document.itemform.finaltotal_debit.value) - parseFloat(document.itemform.gst_amount_debit.value)).toFixed(2) ;
		}
		function calculate_finaltotal_debit(){
			document.itemform.finaltotal_debit.value =  Number(parseFloat(document.itemform.gldebit.value) + parseFloat(document.itemform.gst_amount_debit.value)).toFixed(2) ;
		}
		function calculate_finaldoc_debit(){
			document.itemform.finaldoc_debit.value =  Number(parseFloat(document.itemform.debit.value) + parseFloat(document.itemform.gst_doc_debit.value)).toFixed(2) ;
			calculate_finaltotal_debit();
		}
		
		function changegst_doc_credit(){
			document.itemform.gst_amount_credit.value = Number(parseFloat(document.itemform.gst_doc_credit.value) * #gethdr.rate# ).toFixed(2);
			document.itemform.finaldoc_credit.value =  Number(parseFloat(document.itemform.gst_doc_credit.value) + parseFloat(document.itemform.credit.value)).toFixed(2) ;
			document.itemform.finaltotal_credit.value = Number(parseFloat(document.itemform.finaldoc_credit.value) * #gethdr.rate# ).toFixed(2);
			change_finaltotal_credit();
		}
		function change_finaldoc_credit(){
			document.itemform.credit.value =  Number(parseFloat(document.itemform.finaldoc_credit.value) - parseFloat(document.itemform.gst_doc_credit.value)).toFixed(2) ;
			document.itemform.finaltotal_credit.value = Number(parseFloat(document.itemform.finaldoc_credit.value) * #gethdr.rate# ).toFixed(2);
			change_finaltotal_credit();
		}
		function change_finaltotal_credit(){
			document.itemform.glcredit.value =  Number(parseFloat(document.itemform.finaltotal_credit.value) - parseFloat(document.itemform.gst_amount_credit.value)).toFixed(2) ;
		}
		function calculate_finaltotal_credit(){
			document.itemform.finaltotal_credit.value =  Number(parseFloat(document.itemform.glcredit.value) + parseFloat(document.itemform.gst_amount_credit.value)).toFixed(2) ;
		}
		function calculate_finaldoc_credit(){
			document.itemform.finaldoc_credit.value =  Number(parseFloat(document.itemform.credit.value) + parseFloat(document.itemform.gst_doc_credit.value)).toFixed(2) ;
			calculate_finaltotal_credit();
		}
		
		function resizeIframe(frameid) {
			//WIDTH
			if (frameid == 'mainframe2') {
				document.getElementById(frameid).style.width = ( document.body.clientWidth - 21 ) + "px";
			}
			  //HEIGHT
			var height=window.innerWidth;//Firefox
			if (document.body.clientHeight)
			{
			    height=document.body.clientHeight;//IE
			}
		   	//height -= document.getElementById(frameid).offsetTop;
			height -= 210; /* whatever you set your body bottom margin/padding to be */
			document.getElementById(frameid).style.height = height +"px";
			//alert( height);		        
	   }
	   window.onresize = function() {resizeIframe('mainframe2');};
	</script>
	</cfoutput>
</head>
<cfoutput>
<cfquery name="getdet" datasource="#dbname#">
	select stdjournaldet_temp.*,
	aaa.code,aaa.acc_name,
	bbb.sdesp,
	ccc.part_desp,
	ddd.partycode,ddd.partyname,
	eee.chargecode,eee.description
	from stdjournaldet_temp
		left outer join (select chartofaccount.* from chartofaccount ) as aaa on (aaa.id = stdjournaldet_temp.chartid)	
		left outer join (select project.* from project ) as bbb on (bbb.projectid = stdjournaldet_temp.projectid)	
		left outer join (select part.* from part ) as ccc on (ccc.part_no = stdjournaldet_temp.part_no)
		left outer join (select partylist.id,partylist.code as partycode,company.comname as partyname
						 from partylist,company
						 where partylist.comno = company.comno
						 and company.flag='1'						
						)as ddd on(ddd.id = stdjournaldet_temp.partyid)						
	left outer join (select cost.* from cost ) as eee on (eee.costid = stdjournaldet_temp.codeid)
	where stdjournaldet_temp.id = '#formhdrid#'
	<cfif isdefined("action")>
		and stdjournaldet_temp.rowno = '#trim(detid)#'	
	<cfelse>
		and false
	</cfif>	
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
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
<input type="Hidden" name="fuseaction">
<input type="hidden" name="formhdrid" value="#formhdrid#">
<input type="hidden" name="transno" value="#transno#">
<cfif getdet.recordcount eq 0>
	<cfquery name="getproj" datasource="#dbname#">
		select * from project where projectid='2'
	</cfquery>
	<cfquery name="getpart" datasource="#dbname#">
		select * from part where part_no='2'
	</cfquery>
	<cfset projname = getproj.sdesp>
	<cfset projid = 2 >
	<cfset partname = getpart.part_desp>
	<cfset partno = 2 >
<cfelse>
	<cfset projname = getdet.sdesp>
	<cfset projid = getdet.projectid >
	<cfset partname = getdet.part_desp>
	<cfset partno = getdet.part_no >
</cfif>
<cfif isdefined("action") and trim(action) eq "edit"><!--- if it is a edit record --->
	<!--- <cfdump var="#getdet#">  --->
	<input type="Hidden" name="detid" value="#detid#">
</cfif>
	<table class="entrytitletable2" style="height:100%;width:100%;">
		<tr>
			<td class="namecell" style="width:280px;">Account Code / Name</td>
			<td class="namecell" colspan="2">Party Code / Name</td>
			<td class="namecell">Debit</td>
			<td class="namecell">GL Debit</td>
			<td class="namecell">Credit</td>
			<td class="namecell">GL Credit</td>
		</tr>
		<tr>
			<td class="valuecell">
				<input type="text" onfocus="this.select();" name="acccode" value="#getdet.code#" class="textboxmust" style="width:60px;"  title="Account Code" onkeyup="acceptkey();">
				<input type="text" onfocus="this.select();" name="accname" value="#getdet.acc_name#" class="search_txbox" style="width:170px;"  readonly title="Account Name" onclick="searchselection('dsp_chartselection.cfm');">
				<!---input type="button" name="selectchart" value="S" title="Select Account" class="btns"  onclick="searchselection('dsp_chartselection.cfm');"--->
				<input type="Hidden" name="accid" value="#getdet.chartid#">
			</td>
			<td class="valuecell" colspan="2">
				<input type="text" onfocus="this.select();" name="partycode" value="#getdet.partycode#" class="textboxnormal" style="width:60px;" readonly title="Party Code">
				<input type="text" onfocus="this.select();" name="partyname" value="#getdet.partyname#" class="search_txbox" style="width:150px;" readonly title="Party Name" onClick="popWinParty('partycode','partyid','partyname','accname','acccode','accid','projectid',accid.value);">
				<!---input type="button" value="S" name="B3" title="Select Party" class="btns"  onClick="popWinParty('partycode','partyid','partyname','accname','acccode','accid','projectid',accid.value);"--->
				<input type="button" value="R" name="B8" CLASS="btnreset" title="Reset Party" onClick="ClearField('partycode','partyid','partyname');">
				<input type="Hidden" name="partyid" value="#getdet.partyid#">
			</td>
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="debit" value="#numberFormat(val(getdet.debit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Debit Amount" onkeyup="updatedebit();allowdecimal(this);" ></td>
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="gldebit" value="#numberFormat(val(getdet.debitglamt),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Debit GL Amount" onkeyup="allowdecimal(this);"></td>
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="credit" value="#numberFormat(val(getdet.credit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Credit Amount" onkeyup="updatecredit();allowdecimal(this);"></td>
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="glcredit" value="#numberFormat(val(getdet.creditglamt),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Credit GL Amount" onkeyup="allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="namecell">Project / Part</td>
			<td class="namecell" style="width:390px;">GST Code / Name</td>
			<td class="namecell" >GST %</td>
			<td class="namecell" colspan="4" style="background-color:##EEEEEE;">&nbsp;</td>
		</tr>
		<tr>
			<td class="valuecell">
				<input type="text" onfocus="this.select();" name="projectname" value="#projname#" class="textboxmust"style="width:60px;" title="Project" onkeyup="acceptkey2();">
				<input type="text" onfocus="this.select();" name="partname" value="#partname#" class="search_txbox" style="width:170px;"  readonly title="Part" onclick="actionselection('button1');">
				<!---input type="button" name="selectproject" value="S" title="Select Project" class="btns"  onclick="actionselection('button1');"--->
				<input type="Hidden" name="projectid" value="#projid#">
				<input type="Hidden" name="part_no" value="#partno#">
			</td>
			<td class="valuecell">
				<input type="text" onfocus="this.select();" name="gstcode" value="#getgst.code#" class="textboxnormal" style="width:60px;" readonly title="GST Code">
				<input type="text" onfocus="this.select();" name="gstname" value="#getgst.acc_name#" class="search_txbox" style="width:150px;" readonly title="GST Name" onclick="searchselection('dsp_selectgst.cfm');">
				<!---input type="button" name="selectcharge" value="S" class="btns"  onclick="searchselection('dsp_selectgst.cfm');"--->
				<input type="button" value="R" name="B7" CLASS="btnreset" onClick="cleargst();">
				<input type="Hidden" name="gst_acccode" value="#getdet.gst_accid#">
			</td>
			<td class="valuecell" ><input type="text" onfocus="this.select();" name="gst_percent" readonly="yes" value="#getdet.gst_percent#" class="textboxnormal" style="width:40px;text-align:right;" maxlength="20" title="GST Percent" onkeyup="calculategstamont('3');allowdecimal(this);"></td>	
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="gst_doc_debit" value="#numberFormat(val(getdet.gst_doc_debit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="GST Amount" onkeyup="changegst_doc_debit();allowdecimal(this);"></td>	
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="gst_amount_debit" value="#numberFormat(val(getdet.gst_amount_debit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="calculate_finaltotal_debit();allowdecimal(this);"></td>	
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="gst_doc_credit" value="#numberFormat(val(getdet.gst_doc_credit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="GST Amount" onkeyup="changegst_doc_credit();allowdecimal(this);"></td>	
			<td class="valuecell" style="background-color:##EEEEEE;"><input type="text" onfocus="this.select();" name="gst_amount_credit" value="#numberFormat(val(getdet.gst_amount_credit),'9.99')#" class="textboxnormal" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="calculate_finaltotal_credit();allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="namecell">Description</td>
			<td class="namecell">Charge Code / Desc</td>
			<td class="namecell" >&nbsp;</td>
			<td class="namecell" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td class="valuecell" rowspan="2"><textarea onfocus="this.select();" onfocus="this.select();" name="remark" class="textareanormal" cols="40" rows="3" wrap="soft" title="Remarks">#getdet.descp#</textarea></td>
			<td class="valuecell">
				<input type="text" onfocus="this.select();" name="chargecode" value="#getdet.chargecode#" class="textboxnormal" style="width:60px;" readonly title="Charge Code">
				<input type="text" onfocus="this.select();" name="chargename" value="#getdet.description#" class="search_txbox" style="width:150px;" readonly title="Charge Description" onclick="actionselection('button3');">
				<!---input type="button" name="selectcharge" value="S" title="Select Charge Code" class="btns"  onclick="actionselection('button3');"--->
				<input type="button" value="R" name="B7" CLASS="btnreset" title="Reset Charge Code" onClick="ClearField('chargecode','chargename','chargeid');">
				<input type="Hidden" name="chargeid" value="#getdet.codeid#">
			</td>
			<td class="namecell" >Final Amt</td>
			<td class="valuecell"><input type="text" onfocus="this.select();" name="finaldoc_debit" value="#numberFormat(val(getdet.finaldoc_debit),'9.99')#" class="textboxreadonly" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="change_finaldoc_debit();allowdecimal(this);"></td>	
			<td class="valuecell"><input type="text" onfocus="this.select();" name="finaltotal_debit" value="#numberFormat(val(getdet.finaltotal_debit),'9.99')#" class="textboxreadonly" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="change_finaltotal_debit();allowdecimal(this);"></td>	
			<td class="valuecell"><input type="text" onfocus="this.select();" name="finaldoc_credit" value="#numberFormat(val(getdet.finaldoc_credit),'9.99')#" class="textboxreadonly" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="change_finaldoc_credit();allowdecimal(this);"></td>	
			<td class="valuecell"><input type="text" onfocus="this.select();" name="finaltotal_credit" value="#numberFormat(val(getdet.finaltotal_credit),'9.99')#" class="textboxreadonly" style="width:60px;text-align:right;" maxlength="20" title="Final Total" onkeyup="change_finaltotal_credit();allowdecimal(this);"></td>	
		</tr>
		<tr>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">
				<cfif isdefined("action") and trim(action) eq "edit"><!--- if it is a edit record --->
					<input type="submit" name="addnew" value="EDIT" title="Edit Item" class="btngray" onclick="fn_selectaction('editlineitem');return checkaddnew();">
				<cfelse>
					<input type="submit" name="addnew" value="ADD" title="Add Item" class="btngray" onclick="fn_selectaction('addnewitem');return checkaddnew();">
				</cfif>

			</td>
		</tr>
		<tr>
			<td class="valuecell" colspan="7" style="text-align:right;">  
				
			</td>
		</tr>
		<tr>
			<td colspan="7">   
				<iframe id="mainframe2" name="mainframe2" src="dsp_tab2list.cfm?formhdrid=#formhdrid#" style="border:0px solid red;overflow:auto;" onload="resizeIframe('mainframe2');"></iframe>
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>
