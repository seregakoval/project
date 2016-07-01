<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../mastercss3.css">
	<script type="text/javascript" src="../../component.js"></script>

	<script>
		<cfoutput>
			function dataupdate(currvar,currfield){
				currvar = standed_escape(currvar);
				var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
				//prompt('',url);
				fn_getajaxreplyxml(url)	;
			}
		</cfoutput>

		function ClearField(a,b,c){
			document.itemform.elements[a].value = "";
			document.itemform.elements[b].value = "";
			document.itemform.elements[c].value = "";
			dataupdate('',c);
		}
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
<cfquery name="getmain" datasource="#dbname#">
	select * from maincate
	where mainid ='#parentid#'
	order by mainid
</cfquery>
<cfquery name="gettax1" datasource="#dbname#">
	select chartofaccount.*
	from chartofaccount
	where true
	<cfif retrieve.assetchargeid2 neq "">
		and chartofaccount.id='#retrieve.assetchargeid2#'
	<cfelse>
		and false
	</cfif>
</cfquery>

<cfquery name="gettax2" datasource="#dbname#">
	select chartofaccount.*
	from chartofaccount
	where true
	<cfif retrieve.assetchargeid1 neq "">
		and chartofaccount.id='#retrieve.assetchargeid1#'
	<cfelse>
		and false
	</cfif>
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
	<table class="entrytitletable2">
		<tr>
			<td class="formnamecell" style="width:200px;">Depreciation Methode</td>
			<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
			<td class="formvaluecell">
				<select name="depreciation" class="textbox1" style="width:220px;" onchange="dataupdate(this.value,this.name);">
					<option value="">Select Depreciation Methode</option>
					<option value="1" <cfif retrieve.depreciation eq 1>selected="true"</cfif>>Type 1</option>
					<option value="2" <cfif retrieve.depreciation eq 2>selected="true"</cfif>>Type 2</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="formnamecell">Qty Management</td>
			<td class="formnamecell">:</td>
			<td class="formvaluecell">
				<select name="qtymanagement" class="textbox1" style="width:220px;" onchange="dataupdate(this.value,this.name);">
					<option value="">Select Methode</option>
					<option value="1" <cfif retrieve.qtymanagement eq 1>selected="true"</cfif>>Serial</option>
					<option value="2" <cfif retrieve.qtymanagement eq 2>selected="true"</cfif>>Bulk</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:200px;">Asset Account</td>
			<td class="formnamecell">:</td>
			<td class="formvaluecell">
				<input type="text" name="assettaxcode1" value="#gettax2.code#" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="text" name="assettaxname1" value="#gettax2.acc_name#" CLASS="textbox1" style="width:100px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="hidden" name="assetchargeid1" value="#retrieve.assetchargeid1#">
				<input type="button" class="button3" value="S"  onclick="searchselection('dsp_chartselection.cfm?formhdrid=#formhdrid#');">
				<input type="button" class="button3" value="R"  onclick="ClearField('assettaxcode1','assettaxname1','assetchargeid1');">
			</td>
		</tr>
		<tr>
			<td class="formnamecell">Depreciation Account</td>
			<td class="formnamecell">:</td>
			<td class="formvaluecell">
				<input type="text" name="assettaxcode2" value="#gettax1.code#" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="text" name="assettaxname2" value="#gettax1.acc_name#" CLASS="textbox1" style="width:100px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="hidden" name="assetchargeid2" value="#retrieve.assetchargeid2#">
				<input type="button" class="button3" value="S"  onclick="searchselection('dsp_chartselection1.cfm?formhdrid=#formhdrid#');">
				<input type="button" class="button3" value="R"  onclick="ClearField('assettaxcode2','assettaxname2','assetchargeid2');">
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>
