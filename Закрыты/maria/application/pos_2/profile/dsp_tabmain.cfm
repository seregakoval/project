<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script type="text/javascript" src="../../component.js"></script>
	<title>Symphony eTQM </title>
	<script>
		<cfoutput>
		function escapeconfirm(){
			if (confirm("Exit Document?"))
				window.close();
			else
				return false;
		}	
		
		
		function dataupdate(currvar,currfield){
			currvar = standed_escape(currvar);
			var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
			//prompt('',url);
			fn_getajaxreplyxml(url)	;
		}
		
		
		function changetab(tabid){
			var transno = document.itemform.transno.value;
			if(tabid == "1"){
				document.getElementById("tab1").className = "tabon";
				document.getElementById("tab2").className = "taboff";
				mainframe.location="dsp_tab1.cfm?formhdrid=#formhdrid#&journaltype=#journaltype#";
			}
			else if(tabid == "2"){
				document.getElementById("tab1").className = "taboff";
				document.getElementById("tab2").className = "tabon";
				mainframe.location="dsp_tab2.cfm?formhdrid=#formhdrid#&transno=" + transno;
			}
		}
		
		
		function submitconfirm(){
			var formhdrid = document.itemform.formhdrid.value;
			var url = "databind/act_formcheck.cfm?pageinfo=receivemain&formhdrid=" + formhdrid;
			//var  url = "databind/test.xml";
			//prompt('',url);
			if (window.XMLHttpRequest)
		   	{// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
		   	}
		   	else
		   	{// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		   	}
			xmlhttp.open("GET",url,false);
			xmlhttp.send();
			xmlDoc=xmlhttp.responseXML;
			//var xmlDoc = fn_getajaxreplyxml(url);
			//alert(xmlsting);
			//xmlDoc = $.parseXML(xmlsting);
			
			//prompt('',xmlDoc);
			var x=xmlDoc.getElementsByTagName("returnrow");  
			//alert(x);
			for (i=0;i<x.length;i++){
				//alert(i);
				var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
				if(msgerror == "ok"){
					if (confirm("Submit Document?")){			
						var formhdrid = document.itemform.formhdrid.value;
						var transno = document.itemform.transno.value;
						var journaltype = document.itemform.journaltype.value;
						var docaction = document.itemform.docaction.value;
						document.location = "index.cfm?fuseaction=submit&journaltype=" + journaltype + "&formhdrid=" + formhdrid  + "&transno=" + transno + "&docaction=" + docaction;
					}
				}
				else{
					alert(msgerror);
				}			
			}
			 
		}
		</cfoutput>
		
		function resizeIframe(frameid) {
			//WIDTH
			document.getElementById(frameid).style.width = ( document.body.clientWidth - 30 ) + "px";
			//HEIGHT
			var height=window.innerWidth;//Firefox
			if (document.body.clientHeight)
			{
			    height=document.body.clientHeight;//IE
			}
		   	//height -= document.getElementById(frameid).offsetTop;
			height -= 180; /* whatever you set your body bottom margin/padding to be */
			document.getElementById(frameid).style.height = height +"px";
			//alert( height);		        
	   }
	   window.onresize = function() { resizeIframe('mainframe');};  
	</script>
</head>
<cfoutput>
<cfquery name="gethdr" datasource="#dbname#">
	select * from stdjournalhdr_temp
	where id = '#formhdrid#'
</cfquery> 
<cfquery name="getdet" datasource="#dbname#">
	select * from stdjournaldet_temp
	where id = '#formhdrid#'
</cfquery> 
<cfquery name="getentry" datasource="#dbname#">
	select * from login
	where logno='#gethdr.enteredby#'
</cfquery> 
<body class="mainpage">
<form name="itemform" id="itemform" method="post" action="index.cfm" >
<input type="Hidden" name="fuseaction">
<input type="hidden" name="formhdrid" value="#formhdrid#">
<input type="hidden" name="transno" value="#transno#">
<input type="hidden" name="journaltype" value="#journaltype#">
<input type="hidden" name="docaction" value="#docaction#">
<table class="entrytitletable">
	<tr>
		<td colspan="100%" class="maintitle">
			<!--- ***CHANGEHERE : change name accordingly --->
			&nbsp;STANDARD JOURNAL ENTRY   <!--- CHANGE ACCORDING TO YOUR MASTER --->
		</td>
	</tr>
	<tr><!--- ================================== --->
		<td colspan="100%" style="text-align:left;vertical-align:top;padding:10px;">
			<table class="entrytitletable">
				<tr>
					<td style="width:100px;" class="namecell">Description </td>
					<td style="width:5px;" class="namecell">:</td>
					<td style="width:660px;" class="valuecell"><input type="Text" onfocus="this.select();" name="journalno" value="#gethdr.journalno#" style="width:250px;" class="textboxmust" onBlur="dataupdate(this.value,this.name);"></td>					
				</tr>
			</table>
		</td>
	</tr><!--- ================================= --->	
	<tr><!--- ============= --->
		<td colspan="100%" style="text-align:left;vertical-align:bottom;padding-top:10px;">
			<table style="width:100%;border-collapse:collapse;border-spacing:0px;text-align:left;">
				<tr>
					<td class="tabspacer"></td><!--- spacer --->
					<td class="tabon" id="tab1" onclick="changetab('1');">Journal Details</td>
					<td class="tabspacer"></td><!--- spacer --->
					<td class="taboff" id="tab2" onclick="changetab('2');">Journal Items</td>
					<td style="border-bottom:1px solid ##cccccc;">&nbsp;</td><!--- spacer --->
					<td style="border-bottom:1px solid ##cccccc;width:350px;text-align:right;padding-right:15px;padding-bottom:5px;">
						<input type="button" name="mainescape" value="Cancel" class="btncanceloff" onmouseover="this.className='btncancelon'" onmouseout="this.className='btncanceloff'" onclick="return escapeconfirm();">
						<input type="button" name="mainsubmit" value="Submit" class="btnsubmitoff" onmouseover="this.className='btnsubmiton'" onmouseout="this.className='btnsubmitoff'" onclick="submitconfirm();">
					</td>
				</tr>				
			</table>	
		</td>
	</tr><!--- ============ --->
	<tr>
		<td colspan="100%" class="tabframerow">
			<iframe id="mainframe" name="mainframe" src="dsp_tab1.cfm?formhdrid=#formhdrid#&journaltype=#journaltype#" style="border: 0px ##CCC solid;overflow:auto;" onload="resizeIframe('mainframe');" ></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>
