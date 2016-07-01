<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../mastercss3.css">
	<script type="text/javascript" src="../../component.js"></script>

	<script>
	<cfoutput>
		function dataupdate(currvar,currfield){
			currvar = encodeURI(currvar);//for special character like symbols
			currvar = standed_escape(currvar);
			var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
			//prompt('',url);
			fn_getajaxreplyxml(url)	;
		}
	</cfoutput>
	function searchselection(pagelink){
		WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
		WinItem.window.focus();
	}
</script>
</head>
<cfoutput>
<cfquery name="retrieve" datasource="#dbname#">
	select * from itemcate_temp
	where
	<cfif formhdrid neq "">
		itemid='#formhdrid#'
	<Cfelse>
		false
	</cfif>
</cfquery>
<cfquery name="getunit" datasource="#dbname#">
	select * from unit
	order by description
</cfquery>
<cfquery name="getcost" datasource="#dbname#">
	select * from cost
	where
	<cfif retrieve.costid neq "">
		costid = '#retrieve.costid#'
	<cfelse>
		false
	</cfif>
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
<table class="entrytitletable2">
	<tr>
		<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Alt Desc</td>
		<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
		<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
			<textarea class="textbox1" cols="75" rows="3" name="altdesc"  onblur="dataupdate(this.value,this.name);">#retrieve.altdesc#</textarea>
		</td>
	</tr>
	<tr>
		<td class="formnamecell" style="width:150px;">Stock Unit</td>
		<td class="formnamecell" style="width:5px;">:</td>
		<td class="formvaluecell">
			<select name="stockunit" class="textboxnormal" style="width:110px;"  onchange="dataupdate(this.value,this.name);">
				<option value="">Select</option>
				<cfloop query="getunit">
					<option value="#getunit.unitid#" <cfif getunit.unitid eq retrieve.stockunit>selected="true"</cfif>>#getunit.description#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="formnamecell" style="width:130px;">Unit Weight</td>
		<td class="formnamecell" style="width:5px;">:</td>
		<td class="formvaluecell"><input type="text" name="unitweight" value=<cfif retrieve.unitweight neq "">"#retrieve.unitweight#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
	</tr>
	<tr>
		<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Item Type</td>
		<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
		<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
			<select name="itemtype" class="textboxnormal" style="width:180px;" onchange="dataupdate(this.value,this.name);">
				<option value="1" <cfif retrieve.itemtype eq 1>selected="true"</cfif>>Manufactured Part</option>
				<option value="2" <cfif retrieve.itemtype eq 2>selected="true"</cfif>>Cochran Proprietary Items</option>
				<option value="3" <cfif retrieve.itemtype eq 3>selected="true"</cfif>>Market Price Items</option>
				<option value="4" <cfif retrieve.itemtype eq 4>selected="true"</cfif>>General Catalogue Items</option>
				<option value="5" <cfif retrieve.itemtype eq 5>selected="true"</cfif>>Purchased Nonstock Items & Diverse Works Related Jobs</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Charge Code</td>
		<td class="formnamecell" >:</td>
		<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
			<input type="text" class="textboxnormal" style="width:180px;" name="costname" value="#getcost.description#" readonly>
			<input type="hidden" name="costid1" value="#retrieve.costid#">
			<input type="button" class="button3" value="S" name="sbutton" onclick="searchselection('dsp_selectcost.cfm');">
		</td>
	</tr>
	<cfif retrieve.graphic neq "">
		<tr>
			<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Current Graphic</td>
			<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
			<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
				<cfset path = Replace(#retrieve.graphic#, " ", "_","ALL") >
				<a href="../../../uploaded/#htmleditFormat(path)#" target="_blank" >#htmleditformat(retrieve.graphic)#</a>
			</td>
		</tr>
	</cfif>
	<!--- <tr>
		<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Insert Graphic</td>
		<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
		<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
			<input type="file" name="FileToUpload1" maxlength="50" CLASS="textbox1" style="width:400px;" onchange="dataupdate(this.value,this.name);">
		</td>
	</tr> --->


</table>
</form>
</body>
</cfoutput>
</html>
