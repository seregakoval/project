<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script type="text/javascript" src="../../component.js"></script>
	<script language="javascript" src="../../date_picker_a.js"></script>
	<script language="JavaScript" src="../../date_format.js"></script>
	
	<script>
		addCalendar("Calendar1", "Select Date", "journaldate", "itemform");
		addCalendar("Calendar2", "Select Date", "postdate", "itemform");
		
		<cfoutput>
			function dataupdate(currvar,currfield){
				currvar = standed_escape(currvar);
				var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
				//prompt('',url);
				fn_getajaxreplyxml(url)	;
			}
		
			function getexrate(ccid){
				var url = "databind/act_getcurrencyrate.cfm?formhdrid=#formhdrid#&ccid=" + ccid ;
				//prompt('',url);
				
				xmlDoc=fn_getajaxreplyxmldoc(url);
				var x=xmlDoc.getElementsByTagName("currency");  
				//alert(x);
				for (i=0;i<x.length;i++){
					//alert(i);
					var ccid = x[i].getElementsByTagName("ccid")[0].childNodes[0].nodeValue;
					var rate = x[i].getElementsByTagName("rate")[0].childNodes[0].nodeValue;					
					document.itemform.rate.value = rate;	 				
				}			
			}
			
			function updaterevers(){
				if(document.itemform.reverse.checked){
					dataupdate('1','reverse');
				}
				else{
					dataupdate('0','reverse');
				}
			}
			function get_date() 
			{
				document.itemform.postdate.value=document.itemform.journaldate.value
			}
			// FORMAT THE POSTDATE IF THE DOCDATE IS NOT PROPERLY FORMATTED
			function dateformatpost() {
				DateFormat(document.itemform.postdate,document.itemform.postdate.value,event,true,'3')	
			}
			
			
		</cfoutput>
	</script>
</head>
<cfoutput>
<cfquery name="gethdr" datasource="#dbname#">
	select * from stdjournalhdr_temp
	where id = '#formhdrid#'
</cfquery> 
<cfquery name="getcur" datasource="#dbname#">
 	select * 
	from currency
	order by ccid
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
	<table class="entrytitletable2">
		<tr>
			<td style="width:140px;height:23px;" class="namecell">Other Ref </td>
			<td style="width:5px;" class="namecell">:</td>
			<td style="width:600px;" class="valuecell"><input type="text" onfocus="this.select();"  name="otrref" value="#gethdr.otrref#" style="width:100px;" class="textboxnormal" onBlur="dataupdate(this.value,this.name);"></td>
			<td style="width:150px;" class="namecell">Journal Date </td>
			<td style="width:5px;" class="namecell">:</td>
			<td class="valuecell">
				<input type="text" onfocus="this.select();"  name="journaldate" value="#dateformat(gethdr.journaldate,global_dateformat)#" class="textboxmust" style="width:80px;" onKeyUp="DateFormat(this,this.value,event,false,'3');get_date();" onBlur="DateFormat(this,this.value,event,true,'3');dateformatpost();dataupdate(this.value,this.name);">
				&nbsp;<a href="javascript:showCal('Calendar1')"><img  src="../../images/newimg/calander.png" title="Click To Select Journal Date" class="imgtoplink"></a>
			</td>
		</tr>
		<tr>
			<td class="namecell">Our Doc Ref No</td>
			<td class="namecell">:</td>
			<td class="valuecell"><input type="text" onfocus="this.select();"  name="refno" value="#gethdr.refno#" style="width:100px;" class="textboxnormal" onBlur="dataupdate(this.value,this.name);"></td>
			<td class="namecell">Posting Date </td>
			<td class="namecell">:</td>
			<td class="valuecell">
				<input type="text" onfocus="this.select();"  name="postdate" value="#dateformat(gethdr.postdate,global_dateformat)#" class="textboxmust" style="width:80px;" onKeyUp="DateFormat(this,this.value,event,false,'3')" onBlur="DateFormat(this,this.value,event,true,'3');dataupdate(this.value,this.name);">
				&nbsp;<a href="javascript:showCal('Calendar2')"><img  src="../../images/newimg/calander.png" title="Click To Select Posting Date" class="imgtoplink"></a> 
			</td>
		</tr>
		<tr>
			<td class="namecell">Currency / Rate</td>
			<td class="namecell">:</td>
			<td class="valuecell">
				<select name="currency" class="textboxmust" style="width:55px;" onchange="getexrate(this.value);">
					<cfloop query="getcur">
						<option value="#getcur.ccid#" <cfif gethdr.currency eq getcur.ccid>selected</cfif> >#getcur.description#</option>
					</cfloop>											
				</select>	
				<input type="text" onfocus="this.select();" name="rate" style="width:42px;text-align:right;" CLASS="textboxmust" value="#trim(gethdr.rate)#" onblur="allowpositivedecimal(this);dataupdate(this.value,this.name);">	
			</td>
			<cfif journaltype eq "Salary" or journaltype eq "OP">
				<td class="namecell"><input type="Hidden" name="category" value="-"> </td>
				<td class="namecell"></td>
				<td class="valuecell"></td>
			<cfelse>
				<td class="namecell">Category </td>
				<td class="namecell">:</td>
				<td class="valuecell">
					<select name="category" class="textboxnormal" onchange="dataupdate(this.value,this.name);">
						<CFLOOP list="-,Credit Note,Contra,Debit Note,Invoice,Payment,Cash,Cheque,Interest" index ="looper">
							<cfif looper eq gethdr.category>
								<option value="#looper#" selected>#looper#</option>
							<cfelse>
								<option value="#looper#">#looper#</option>
							</cfif>
						</cfloop>
					</select>
				</td>
			</cfif>			
		</tr>
		<tr>
			<td class="namecell">Remarks</td>
			<td class="namecell">:</td>
			<td class="valuecell" rowspan="2" colspan="4"><textarea  name="remark" class="textareanormal" cols="50" rows="3" wrap="soft" onblur="dataupdate(this.value,this.name);">#gethdr.remark#</textarea></td>			
		</tr>
		<tr>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
			<td class="namecell">&nbsp;</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>     
