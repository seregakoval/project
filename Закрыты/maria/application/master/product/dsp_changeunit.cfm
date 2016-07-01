<!DOCTYPE html>
<html style="width:100%;height:98%;">
<head>
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
	<script>
		function validateform(){
			if (confirm("Submit Document?")){
				return true;
			}
			return false;
		}
	</script>
</head>	
<cfoutput>
<cfquery name="getData" datasource="#dbName#">
	select itemcate.codeno,itemcate.description,stockunit,unit.description as unitname
	from itemcate
		left outer join unit on (unit.unitid = itemcate.stockunit)
	where itemcate.itemid = '#formhdrid#'
</cfquery>
<cfquery name="getunit" datasource="#dbName#">
	select * from unit
</cfquery>
   
<body class="mainpage2">
	<form name="itemform" id="itemform" method="post" action="index.cfm?fuseaction=updateunit" style="height:100%;" onsubmit="return validateform();">
	<input type="hidden" name="formhdrid" value="#formhdrid#">
	<table class="basetable" style="height:100%;"> 
		<tr>
			<td colspan="100%" class="searchtitle1">
				<!--- ***CHANGEHERE : change name accordingly --->
				&nbsp;Change Stock Unit    <!--- CHANGE ACCORDING TO YOUR MASTER --->
			</td>
		</tr>
		<tr>
			<td style="text-align:left;vertical-align:top;padding:10px;">
				<table class="entrytitletable">
					<tr>
						<td class="formnamecell" style="width:150px;">Item Code / Name</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell">#getData.codeno# #getData.description#</td>
					</tr>
					<!--- <tr>
						<td class="formnamecell" style="width:150px;">Item Name</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell">#getData.description#</td>
					</tr> --->
					<tr>
						<td class="formnamecell" style="width:150px;">Current Stock Unit</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell">#getData.unitname#</td>
					</tr>
					<tr>
						<td class="formnamecell" style="width:150px;">Change Stock Unit To</td>
						<td class="formnamecell" style="width:5px;">:</td>
						<td class="formvaluecell">		
							<select name="newunit" class="textboxnormal" style="width:100px;">
								<cfloop query="getunit">
									<option value="#getunit.unitid#" <cfif getData.stockunit eq getunit.unitid>selected="true"</cfif>>#getunit.description#</option>
								</cfloop>	
							</select>		
							<input type="submit" name="mainsubmit" value="Submit" class="btnsubmitoff" onmouseover="this.className='btnsubmiton'" onmouseout="this.className='btnsubmitoff'" >
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</cfoutput>
</html>