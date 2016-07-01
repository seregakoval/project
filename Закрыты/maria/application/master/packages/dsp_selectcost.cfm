<!DOCTYPE html>
<html style="height:100%;">
<head>
<title></title>
<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
<script language="JavaScript" src="/symphony/v33/form_tab.js"></script>
</head>


<cfoutput>
<script language="JavaScript">
function searchrecords(){
	var searchcostcode = document.itemform.searchprocode.value;
	var searchprodesc = document.itemform.searchprodesc.value;
	projectframe.location = "dsp_selectcostlist.cfm?iid=0&displaylevel=4&searchcostcode=" + searchcostcode + "&searchprodesc=" + searchprodesc + "&pro=";
}
</script>


<body class="mainpage" >
<form name="itemform" action="index.cfm" method="post" style="height:100%;">
<table class="basetable">
	<tr>
		<td colspan="100%" class="searchtitle1">
			SELECT LIST
		</td>
	</tr>
	<tr>
		<td class="searchtitle2">
			<img align="absmiddle" src="/symphony/v33/images/spacer.gif" width=2 height=14>
			<img align="absmiddle" src="/symphony/v33/images/newimg/search.png" alt="Search">
			<input type="text" name="searchprocode" value="Cost Code" size="15" class="textboxnormal" onclick="if(this.value=='Cost Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Cost Code'};" onkeyup="searchrecords();">
			<input type="text" name="searchprodesc" value="Cost Description" size="30" class="textboxnormal" onclick="if(this.value=='Cost Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Cost Description'};" onkeyup="searchrecords();">
		</td>
	</tr>
	<tr>
		<td colspan="100%" style="height:535px;">
			<iframe id="projectframe" name="projectframe"  src="dsp_selectcostlist.cfm?iid=0&displaylevel=1" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;"></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>