<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
	<script type="text/javascript" src="/symphony/v33/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/symphony/v33/component.js"></script>

	<script>
		function searchselection(pagelink){
			WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
			WinItem.window.focus();
		}

		function closewindow(){
			if(confirm("Close Window?")){
				window.close();
			}
		}

		function fn_pack_rep(){
			var this_box=document.itemform.selmanu;
			var this_str="";

			for (var x=0; x < this_box.options.length; x++){
				if (this_str==""){
					this_str=this_box.options[x].value;
				}
				else {
					this_str=this_str + "," + this_box.options[x].value;
				}
			}
			document.itemform.manufacturer.value=this_str;
		}

		function validateform(){
			var code = document.itemform.codeno.value;
			var descp = document.itemform.description.value;
			//var costid1 = document.itemform.costid1.value;
			var rtn = true;
			// ***CHANGEHERE : remove or add variable as required
			 <cfoutput>
			if(((code == "" || code == "Code") && "#global_mstitemcateautonumber#" == "manual") || (descp == "" || descp == "Description")){
				alert("Code or Description Can not be empty!!!");
				rtn = false;
			}
			else{

				var formhdrid = document.itemform.formhdrid.value;
				var docaction = document.itemform.docaction.value;
				var parentid = document.itemform.parentid.value;
				var url="databind/act_formcheck4.cfm?formhdrid=" + formhdrid  + "&docaction=" + docaction + "&parentid=" + parentid;
				//prompt('',url);

				xmlDoc=fn_getajaxreplyxmldoc(url);
				var x=xmlDoc.getElementsByTagName("returnrow");
				//alert(x);
				for (i=0;i<x.length;i++){
					//alert(i);
					var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
					if(msgerror == "ok"){
						if (confirm("Submit Document?")){
							var codeno = document.itemform.codeno.value;
							document.location = "index.cfm?fuseaction=submititemcate&formhdrid=" + formhdrid + "&docaction=" + docaction + "&parentid=" + parentid + "&codeno=" + codeno;
						}
					}
					else{
						alert(msgerror);
					}
				}
			}
			</cfoutput>
			return rtn;
		}

		function ClearField(a,b,c){
			document.itemform.elements[a].value = "";
			document.itemform.elements[b].value = "";
			document.itemform.elements[c].value = "";
		}


		<cfoutput>
		function changetab(tabid){
			if(tabid == "1"){
				document.getElementById("tab1").className = "tabon";
				//document.getElementById("tab2").className = "taboff";
				document.getElementById("tab3").className = "taboff";
				document.getElementById("tab4").className = "taboff";
				document.getElementById("tab5").className = "taboff";
				mainframe.location="dsp_tab1.cfm?formhdrid=#formhdrid#&parentid=#parentid#";
			}
			else if(tabid == "2"){
				document.getElementById("tab1").className = "taboff";
				//document.getElementById("tab2").className = "tabon";
				document.getElementById("tab3").className = "taboff";
				document.getElementById("tab4").className = "taboff";
				document.getElementById("tab5").className = "taboff";
				mainframe.location="dsp_tab2.cfm?formhdrid=#formhdrid#&parentid=#parentid#";
			}
			else if(tabid == "3"){
				document.getElementById("tab1").className = "taboff";
				//document.getElementById("tab2").className = "taboff";
				document.getElementById("tab3").className = "tabon";
				document.getElementById("tab4").className = "taboff";
				document.getElementById("tab5").className = "taboff";
				mainframe.location="dsp_tab3.cfm?formhdrid=#formhdrid#&parentid=#parentid#";
			}
			else if(tabid == "4"){
				document.getElementById("tab1").className = "taboff";
				//document.getElementById("tab2").className = "taboff";
				document.getElementById("tab3").className = "taboff";
				document.getElementById("tab4").className = "tabon";
				document.getElementById("tab5").className = "taboff";
				mainframe.location="dsp_tab4.cfm?formhdrid=#formhdrid#&parentid=#parentid#";
			}
			else if(tabid == "5"){
				document.getElementById("tab1").className = "taboff";
				//document.getElementById("tab2").className = "taboff";
				document.getElementById("tab3").className = "taboff";
				document.getElementById("tab4").className = "taboff";
				document.getElementById("tab5").className = "tabon";
				mainframe.location="dsp_tab5.cfm?formhdrid=#formhdrid#&parentid=#parentid#";
			}
		}

		function dataupdate(currvar,currfield){
			currvar = encodeURIComponent(currvar);//for special character like symbols
			//currvar = standed_escape(currvar);
			var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
			//prompt('',url);
			fn_getajaxreplyxml(url)	;
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
			height -= 220; /* whatever you set your body bottom margin/padding to be */
			document.getElementById(frameid).style.height = height +"px";
			//alert( height);
	   }
	   window.onresize = function() { resizeIframe('mainframe');};
	</script>
</head>
<cfoutput>
<Cfquery name="retrieve" datasource="#dbname#">
	select * from itemcate_temp
	where
	<cfif formhdrid neq "">
		itemid='#formhdrid#'
	<Cfelse>
		false
	</cfif>
</cfquery>
<cfquery name="getmain" datasource="#dbname#">
	select * from maincate
	where mainid ='#parentid#'
	order by mainid
</cfquery>

<cfquery name="getunit" datasource="#dbname#">
	select * from unit
	order by description
</cfquery>



<body class="mainpage">
	<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">

	<input type="hidden" name="fuseaction" value="submititemcate">	<!--- ***CHANGEHERE : change action  as required --->
	<input type="hidden" name="serialnostatus" value="0" >
	<input type="hidden" name="parentid" value="#parentid#">
	<input type="hidden" name="formhdrid" value="#formhdrid#">
	<input type="hidden" name="docaction" value="#docaction#">

	<table class="entrytitletable">
		<tr>
			<td colspan="100%" class="searchtitle1">
				<!--- ***CHANGEHERE : change name accordingly --->
				&nbsp;Item Master   <!--- CHANGE ACCORDING TO YOUR MASTER --->
			</td>
		</tr>
		<tr>
			<td colspan="100%" style="text-align:left;vertical-align:top;padding:10px;">
				<table class="entrytitletable">
					<tr>
						<td class="formnamecell" style="width:150px;">Item No.</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell"><input type="text" name="codeno" value="#retrieve.codeno#" CLASS="textboxnormal" style="width:150px;" <cfif global_mstitemcateautonumber neq "manual">readonly </cfif>  onblur="dataupdate(this.value,this.name);"> <cfif global_mstitemcateautonumber neq "manual">(Autogenerate)</cfif></td>
						<td class="formnamecell" style="width:130px;">Item Description</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell"><input type="text" name="description" value="#htmleditformat(retrieve.description)#" CLASS="textboxnormal" style="width:350px;"  onblur="dataupdate(this.value,this.name);"></td>
					</tr>
					<tr>
						<td class="formnamecell">Obsolete Item</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell" colspan="4"><!--- ***CHANGEHERE : change colspan accordingly --->
							<input type="Radio" name="obsoletestatus" value="1" <cfif retrieve.obsoletestatus neq 0>checked</cfif>  onclick="dataupdate(this.value,this.name);">No
							<input type="Radio" name="obsoletestatus" value="0" <cfif retrieve.obsoletestatus eq 0>checked</cfif> onclick="dataupdate(this.value,this.name);">Yes
						</td>
					</tr>
					<tr>
						<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Extended Description</td>
						<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
						<td class="formvaluecell" colspan="4"><!--- ***CHANGEHERE : change colspan accordingly --->
							<textarea class="textbox1" cols="75" rows="3" name="extended"  onblur="dataupdate(this.value,this.name);">#retrieve.extended#</textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><!--- ============= --->
			<td colspan="100%" style="text-align:left;vertical-align:bottom;padding-top:10px;">
				<table style="width:100%;border-collapse:collapse;border-spacing:0px;text-align:left;">
					<tr>
						<td class="tabspacer"></td><!--- spacer --->
						<td class="tabon" id="tab1" onclick="changetab('1');">General Details</td>
						<!--- <td class="tabspacer"></td><!--- spacer --->
						<td class="taboff" id="tab2" onclick="changetab('2');">Manufacture</td> --->
						<td class="tabspacer"></td><!--- spacer --->
						<td class="taboff" id="tab3" onclick="changetab('3');">Cost Details</td>
						<td class="tabspacer"></td><!--- spacer --->
						<td class="taboff" id="tab4" onclick="changetab('4');">Tax Details</td>
						<td class="tabspacer"></td><!--- spacer --->
						<td class="taboff" id="tab5" onclick="changetab('5');">Asset Details</td>
						<td style="border-bottom:1px solid ##cccccc;">&nbsp;</td><!--- spacer --->
						<td style="border-bottom:1px solid ##cccccc;width:350px;text-align:right;padding-right:15px;padding-bottom:5px;">
							<input type="button" name="mainescape" value="Cancel" class="btncanceloff" onmouseover="this.className='btncancelon'" onmouseout="this.className='btncanceloff'" onclick="return escapeconfirm();">
							<input type="button" name="mainsubmit" value="Submit" class="btnsubmitoff" onmouseover="this.className='btnsubmiton'" onmouseout="this.className='btnsubmitoff'" onclick="return validateform();">
						</td>
					</tr>
				</table>
			</td>
		</tr><!--- ============ --->
		<tr>
			<td colspan="100%" class="tabframerow">
				<iframe id="mainframe" name="mainframe" src="dsp_tab1.cfm?formhdrid=#formhdrid#&parentid=#parentid#" style="border: 0px ##CCC solid;overflow:auto;" onload="resizeIframe('mainframe');" ></iframe>
			</td>
		</tr>
	</table>
	</form>
</body>
</cfoutput>
</html>
