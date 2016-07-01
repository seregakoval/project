<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script language="javascript" src="../../date_picker_a.js"></script>
	<script language="JavaScript" src="../../date_format.js"></script>
	<script language="JavaScript" src="../../component.js"></script>
	
	<script>
		addCalendar("Calendar1", "Select Date", "checkdate", "itemform");
		addCalendar("Calendar2", "Select Date", "checkdate1", "itemform");
		
		
		function generate2(){
			var journaltype = document.itemform.journaltype.value;
			powindow = window.open('index.cfm?fuseaction=generate&journaltype=' + journaltype,'powindow','width=1120,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');
			powindow.window.focus();
		}
		function importpj(){
			//var journaltype = document.itemform.journaltype.value;
			var stdid = document.itemform.stdid.value;
			if (stdid == ''){
				alert('Recurring Journal Must Be Selected');
				return false;
			} else {
				powindow = window.open('index.cfm?fuseaction=importpj&journaltype=&id=' + stdid,'powindow','width=870,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');powindow.window.focus();
			}
		}
		
		function searchselection(pagelink){
			WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
			WinItem.window.focus();
		}


		function search(thispagenumber){
			// *** follow data required for serach 
			var thispagenumber = thispagenumber; // DON'T CHANGE
			
			
			var searchpronm = document.itemform.searchpronm.value;
			var searchpro = document.itemform.searchpro.value;
			var searchpart = document.itemform.searchpart.value;
			var searchby = document.itemform.searchby.value;
			var dntype = document.itemform.dntype.value;
			var docno = document.itemform.docno.value;
			var datetype = document.itemform.datetype.value;
			var checkdate = document.itemform.checkdate.value;
			var checkdate1 = document.itemform.checkdate1.value;
			var journaltype = document.itemform.journaltype.value;
		 
			var surl = "dsp_mainpagelist.cfm?searchpronm=" + searchpronm + "&searchpro=" + searchpro + "&searchpart=" + searchpart + "&searchby=" + searchby + "&dntype=" + dntype + "&docno=" + docno + "&datetype=" + datetype + "&checkdate=" + checkdate + "&checkdate1=" + checkdate1 + "&thispagenumber=" + thispagenumber + "&journaltype=" + journaltype;
			 
			searchframe.location=surl;
		}
		
		function resizeIframe(frameid) {
			//WIDTH
			document.getElementById(frameid).style.width = ( document.body.clientWidth - 20 ) + "px";
			//HEIGHT
			var height=window.innerWidth;//Firefox
			if (document.body.clientHeight)
			{
			    height=document.body.clientHeight;//IE
			}
		   	//height -= document.getElementById(frameid).offsetTop;
			height -= 90; /* whatever you set your body bottom margin/padding to be */
			document.getElementById(frameid).style.height = height +"px";
			//alert( height);		        
	   }
	   window.onresize = function() { resizeIframe('searchframe');}; 
		
	</script>
</head>
<cfoutput>

<cfset date1 = "#dateformat(createdate(year(now()),month(now()),1),"dd-mm-yyyy")#">
<cfset date2 = "#dateformat(now(),"dd-mm-yyyy")#">


<body class="mainpage">
<cfinclude template="../dsp_accmenu.cfm">
<form name="itemform" id="itemform" method="post" action="index.cfm">
	<input type="Hidden" name="journaltype" value="#journaltype#">
	<table class="mainpagetable">
		<tr>
			<td colspan="100%" class="maintitle2">
				<!--- ***CHANGEHERE : change name accordingly --->
				&nbsp;Accounting Module | Recurring Journal  <!--- CHANGE ACCORDING TO YOUR MASTER --->
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="mainsearchrow" style="text-align:left;padding-top:8px;">
				<table class="mainsearchtable">
					<tr>
						<td class="mainsearchcell">
							<input name="genarate" type="button" value="Create Recurring Journal" class="btnorangeon" onclick="generate2();">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="mainsearchrow" style="text-align:left;"> 
				<table class="mainsearchtable">
					<tr>
						<td class="mainsearchcell" style="width:22px;">
							<img align="absmiddle" src="/symphony/v33/images/newimg/search1.png" alt="Search">
						</td>
						<td class="mainsearchcell">							
							<input type="text" onfocus="this.select();" name="searchpronm" value="Select Project" class="search_txbox"  style="width:250px;" onclick="searchselection('dsp_selectproject1.cfm');" readonly>	
						</td>
						<td class="mainsearchcell">
							<!---input type="button" name="selectitemdet" value="S" class="btns" onclick="searchselection('dsp_selectproject1.cfm');"--->
							<input type="Hidden" name="searchpro" value="">
							<input type="Hidden" name="searchpart" value="">
						</td>
						<td class="mainsearchcell">
							<select name="searchby" class="textboxnormal"  style="width:75px;">
								<option value="1">All User</option>
								<option value="0">My</option>
							</select>
						</td>
						<td class="mainsearchcell">
							<select name="dntype" class="textboxnormal" style="width:125px;">
								<option value="">Select Doc ##</option>
								<option value="1">Journal ##</option>
								<option value="trn">GLCD-</option>
							</select>
						</td>
						<td class="mainsearchcell">
							<input type="text" onfocus="this.select();"  name="docno" value="" class="textboxnormal" style="width:75px;">
						</td>
						<td class="mainsearchcell">
							<select name="datetype"  class="textboxnormal" style="width:75px;">
								<option value="inv">Journal Date</option>
								<option value="entry">Entry Date</option>
								<option value="post" selected>Posting Date</option>
							</select>
						</td>
						<td class="mainsearchcell">
							From
							<input type="text" onfocus="this.select();" name="checkdate" value="#date1#" class="textboxmust" style="width:80px;" onKeyUp="DateFormat(this,this.value,event,false,'3');" onBlur="DateFormat(this,this.value,event,true,'3');">
							&nbsp;<a href="javascript:showCal('Calendar1')"><img  src="../../images/newimg/calander.png" title="Click To Select Journal Date" class="imgtoplink"></a>
						</td>
						<td class="mainsearchcell">
							To
							<input type="text" onfocus="this.select();" name="checkdate1" value="#date2#" class="textboxmust" style="width:80px;" onKeyUp="DateFormat(this,this.value,event,false,'3');" onBlur="DateFormat(this,this.value,event,true,'3');">
							&nbsp;<a href="javascript:showCal('Calendar2')"><img  src="../../images/newimg/calander.png" title="Click To Select Journal Date" class="imgtoplink"></a>						
						</td>
						<td class="mainsearchcell">
							<input name="searchall" type="button" value="Go!" class="btnnormaloff" onmouseover="this.className='btnnormalon'" onmouseout="this.className='btnnormaloff'" onclick="search('1');">
							<input name="clearall" type="button" value="R" class="btnnormaloff" onmouseover="this.className='btnnormalon'" onmouseout="this.className='btnnormaloff'" onclick="fn_clearform('itemform','searchframe','dsp_mainpagelist.cfm?thispagenumber=1&journaltype=#journaltype#');">
						</td>
					</tr>					
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="100%">
				<iframe id="searchframe" name="searchframe" src="dsp_mainpagelist.cfm?thispagenumber=1&journaltype=#journaltype#" style="border:0px ##CCC solid;overflow:auto;" onload="resizeIframe('searchframe');" seamless></iframe>
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>