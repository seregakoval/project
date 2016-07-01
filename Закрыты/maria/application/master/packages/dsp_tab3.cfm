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
<cfquery name="getqt" datasource="#dbname#">
   select comname from company
	<cfif retrieve.qtcombct neq "">
		where company.comno ='#retrieve.qtcombct#'
	<cfelse>
		where false
	</cfif>
</cfquery>
<cfquery name="getpo" datasource="#dbname#">
   select comname from company
	<cfif retrieve.pocombct neq "">
		where company.comno ='#retrieve.pocombct#'
	<cfelse>
		where false
	</cfif>
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
	<table class="entrytitletable2">
		<tr>
			<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Pricing Based</td>
			<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
			<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
				<select name="pricebaseon" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
			      	<option value="D" <cfif retrieve.pricebaseon eq "D">selected="true"</cfif>>Discount</option>
					<option value="M" <cfif retrieve.pricebaseon neq "D">selected="true"</cfif>>Markup</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount On Cost By</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell">
				<select name="discon" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
					<option value="P" <cfif retrieve.discon neq "A">selected="true"</cfif>>Percentage</option>
					<option value="A" <cfif retrieve.discon eq "A">selected="true"</cfif>>Amount</option>
				</select>
			</td>
			<td class="formnamecell" style="width:130px;">Pricing Determine By</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell">
				<select name="disctype" class="textboxnormal" style="width:105px;" onchange="dataupdate(this.value,this.name);">
					<option value="C" <cfif retrieve.disctype eq "C">selected="true"</cfif>>Customer</option>
			  	  	<option value="Q" <cfif retrieve.disctype eq "Q">selected="true"</cfif>>Qty Purchased</option>
			  	  	<option value="P" <cfif retrieve.disctype neq "C" and retrieve.disctype neq "Q">selected="true"</cfif>>Cost Purchased</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount/Markup 1 </td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discamt1" value=<cfif retrieve.discamt1 neq "">"#retrieve.discamt1#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
			<td class="formnamecell" style="width:130px;">Cost/Qty 1</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discqty1" value=<cfif retrieve.discqty1 neq "">"#retrieve.discqty1#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount/Markup 2 </td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discamt2" value=<cfif retrieve.discamt2 neq "">"#retrieve.discamt2#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
			<td class="formnamecell" style="width:130px;">Cost/Qty 2</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discqty2" value=<cfif retrieve.discqty2 neq "">"#retrieve.discqty2#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount/Markup 3 </td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discamt3" value=<cfif retrieve.discamt3 neq "">"#retrieve.discamt3#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
			<td class="formnamecell" style="width:130px;">Cost/Qty 3</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discqty3" value=<cfif retrieve.discqty3 neq "">"#retrieve.discqty3#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount/Markup 4 </td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discamt4" value=<cfif retrieve.discamt4 neq "">"#retrieve.discamt4#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
			<td class="formnamecell" style="width:130px;">Cost/Qty 4</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discqty4" value=<cfif retrieve.discqty4 neq "">"#retrieve.discqty4#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="formnamecell" style="width:150px;">Discount/Markup 5 </td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discamt5" value=<cfif retrieve.discamt5 neq "">"#retrieve.discamt5#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
			<td class="formnamecell" style="width:130px;">Cost/Qty 1</td>
			<td class="formnamecell" style="width:5px;">:</td>
			<td class="formvaluecell"><input type="text" name="discqty5" value=<cfif retrieve.discqty5 neq "">"#retrieve.discqty5#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
		</tr>
		<tr>
			<td class="formnamecell" colspan="100%" >
				<table style="margin:0 auto;text-align:center;">
					<tr>
						<td class="formnamecell" style="width:150px;">Alternative Unit</td>
						<td class="formnamecell" style="width:350px;">Alternative Factor</td>
					</tr>
					<tr>
						<td class="formvaluecell">
							<select name="altunit1" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
								<option value="0">None</option>
								<cfloop query="getunit">
									<option value="#getunit.unitid#" <cfif getunit.unitid eq retrieve.altunit1>selected="true"</cfif>>#getunit.description#</option>
								</cfloop>
							</select>
						</td>
						<td class="formvaluecell"><input type="text" name="altfactor1" value=<cfif retrieve.altfactor1 neq "">"#retrieve.altfactor1#"<cfelse>"0"</cfif>  CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formvaluecell">
							<select name="altunit2" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
								<option value="0">None</option>
								<cfloop query="getunit">
									<option value="#getunit.unitid#" <cfif getunit.unitid eq retrieve.altunit2>selected="true"</cfif>>#getunit.description#</option>
								</cfloop>
							</select>
						</td>
						<td class="formvaluecell"><input type="text" name="altfactor2" value=<cfif retrieve.altfactor2 neq "">"#retrieve.altfactor2#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formvaluecell">
							<select name="altunit3" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
								<option value="0">None</option>
								<cfloop query="getunit">
									<option value="#getunit.unitid#" <cfif getunit.unitid eq retrieve.altunit3>selected="true"</cfif>>#getunit.description#</option>
								</cfloop>
							</select>
						</td>
						<td class="formvaluecell"><input type="text" name="altfactor3" value=<cfif retrieve.altfactor3 neq "">"#retrieve.altfactor3#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formvaluecell">
							<select name="altunit4" class="textboxnormal" style="width:100px;" onchange="dataupdate(this.value,this.name);">
								<option value="0">None</option>
								<cfloop query="getunit">
									<option value="#getunit.unitid#" <cfif getunit.unitid eq retrieve.altunit4>selected="true"</cfif>>#getunit.description#</option>
								</cfloop>
							</select>
						</td>
						<td class="formvaluecell"><input type="text" name="altfactor4" value=<cfif retrieve.altfactor4 neq "">"#retrieve.altfactor4#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formnamecell">Base Price</td>
						<td class="formvaluecell"><input type="text" name="baseprice" value=<cfif retrieve.baseprice neq "">"#retrieve.baseprice#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formnamecell">Standard Cost</td>
						<td class="formvaluecell"><input type="text" name="stdcost" value=<cfif retrieve.stdcost neq "">"#retrieve.stdcost#"<cfelse>"0"</cfif> CLASS="textbox1" style="width:100px;text-align:right;" onblur="dataupdate(this.value,this.name);allowdecimal(this);"></td>
					</tr>
					<tr>
						<td class="formnamecell">Best Cost To Date QT</td>
						<td class="formvaluecell">
							<input type="text" name="qtbct" value="#retrieve.qtbct#" CLASS="textbox1" style="width:100px;" readonly="true">
							<input type="text" name="com_desc2" value="#getqt.comname#" CLASS="textbox1" style="width:160px;" readonly="true">
							<input type="Hidden" name="qtcombct" value="#retrieve.qtcombct#">
							<input type="button" class="button3" value="S" name="sbutton" onclick="searchselection('dsp_selectsup.cfm?opt=1');">
						</td>
					</tr>
					<cfif global_costtodatepo eq "1">
						<tr>
							<td class="formnamecell">Best Cost To Date PO</td>
							<td class="formvaluecell">
								<input type="text" name="pobct" value="#retrieve.pobct#" CLASS="textbox1" style="width:100px;" readonly="true">
								<input type="text" name="com_desc1" value="#getpo.comname#" CLASS="textbox1" style="width:160px;" readonly="true">
								<input type="Hidden" name="pocombct" value="#retrieve.pocombct#">
								<input type="button" class="button3" value="S" name="sbutton" onclick="searchselection('dsp_selectsup.cfm?opt=2');">
							</td>
						</tr>
					</cfif>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>
