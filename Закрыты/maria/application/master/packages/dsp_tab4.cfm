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
		function ClearField(a,b,c){
			document.itemform.elements[a].value = "";
			document.itemform.elements[b].value = "";
			document.itemform.elements[c].value = "";
			dataupdate('',c);
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
	select company.comno,company.comname as acc_name,partylist.*
	from company,partylist
	where company.comno = partylist.comno
	 and company.flag='1'
	<cfif retrieve.defaultpurchasetax neq "">
		and partylist.id='#retrieve.defaultpurchasetax#'
	<cfelse>
		<cfif getmain.defaultpurchasetax neq "">
			and partylist.id='#getmain.defaultpurchasetax#'
		<cfelse>
			and false
		</cfif>
	</cfif>
</cfquery>

<cfquery name="gettax2" datasource="#dbname#">
	select company.comno,company.comname as acc_name,partylist.*
	from company,partylist
	where company.comno = partylist.comno
	 and company.flag='1'
	<cfif retrieve.defaultsuppllytax neq "">
		and partylist.id='#retrieve.defaultsuppllytax#'
	<cfelse>
		<cfif getmain.defaultsuppllytax neq "">
			and partylist.id='#getmain.defaultsuppllytax#'
		<cfelse>
			and false
		</cfif>
	</cfif>
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
	<table class="entrytitletable2">
		<tr>
			<td class="formnamecell" style="width:200px;">Default Sup. TAX Code</td>
			<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
			<td class="formvaluecell">
				<input type="text" name="suptaxcode" value="#gettax2.code#" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="text" name="suptaxname" value="#gettax2.acc_name#" CLASS="textbox1" style="width:100px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="hidden" name="defaultsuppllytax" value="#retrieve.defaultsuppllytax#">
				<input type="button" class="button3" value="S"  onclick="searchselection('dsp_selectgst.cfm?formhdrid=#formhdrid#');">
				<input type="button" class="button3" value="R"  onclick="ClearField('suptaxcode','suptaxname','defaultsuppllytax');">
			</td>
		</tr>
		<tr>
			<td class="formnamecell">Default Pur. TAX Code</td>
			<td class="formnamecell">:</td>
			<td class="formvaluecell">
				<input type="text" name="purtaccode" value="#gettax1.code#" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="text" name="purtaxname" value="#gettax1.acc_name#" CLASS="textbox1" style="width:100px;" onblur="dataupdate(this.value,this.name);" readonly="true">
				<input type="hidden" name="defaultpurchasetax" value="#retrieve.defaultpurchasetax#">
				<input type="button" class="button3" value="S"  onclick="searchselection('dsp_selectgst2.cfm?formhdrid=#formhdrid#');">
				<input type="button" class="button3" value="R"  onclick="ClearField('purtaccode','purtaxname','defaultpurchasetax');">
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>
