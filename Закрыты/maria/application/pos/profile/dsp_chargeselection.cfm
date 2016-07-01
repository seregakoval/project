<!DOCTYPE html>
<html style="height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/newcss3acc.css">
</head>

<script language="JavaScript" src="../../form_tab.js"></script>

<script language="JavaScript">
function searchrecords(){
	var searchcostcode = document.itemform.searchcostcode.value;
	var searchcostdescription = document.itemform.searchcostdescription.value;
	var searchtype = document.itemform.searchtype.value;
	var pro = document.itemform.pro.value;
	itemframe.location = "dsp_chargeselectionlist.cfm?searchcostcode=" + searchcostcode + "&searchcostdescription=" + searchcostdescription + "&displaylevel=4" + "&searchtype=" + searchtype + "&pro=" + pro;
}
</script>

<cfoutput>
<body class="mainpage" >
<form name="itemform" action="index.cfm" method="post" style="height:100%;">
<input type="hidden" name="fuseaction" value="">
<input type="Hidden" name="pro" value="#pro#">
<table class="basetable">
	<tr>
		<td colspan="100%" class="maintitle">
			CHARGE CODE SELECTION
		</td>
	</tr>
	<tr>
		<td  class="searchtitle2">
			<img align="absmiddle" src="/symphony/v33/images/spacer.gif" width=2 height=14>
			<img align="absmiddle" src="/symphony/v33/images/newimg/search1.png" alt="Search">
			<select name="searchtype" class="textboxsearch" onchange="searchrecords();">
				<option value="contain">Contains</option>
				<option value="start">Start With</option>
			</select>
			<input type="text" name="searchcostcode" value="Cost Code" size="15" class="textboxsearch" onclick="if(this.value=='Cost Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Cost Code'};" onkeyup="searchrecords();">
			<input type="text" name="searchcostdescription" value="Cost Description" size="30" class="textboxsearch" onclick="if(this.value=='Cost Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Cost Description'};" onkeyup="searchrecords();">
		</td>
	</tr>
	<tr>
		<td colspan="100%" style="height:530px;">
			<iframe id="itemframe" name="itemframe"  src="dsp_chargeselectionlist.cfm?pro=#pro#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;"></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>
