<!DOCTYPE html>
<html style="height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
</head>


<cfoutput>
<script language="JavaScript">
function searchrecords(){
	var searchcode = document.itemform.searchprocode.value;
	var searchtdesc = document.itemform.searchprodesc.value;
	searchframe.location = "dsp_selectgstlist.cfm?searchcode=" + searchcode + "&searchtdesc=" + searchtdesc ;
}
</script>


<body class="mainpage" >
<form name="itemform" action="index.cfm" method="post" style="height:100%;">
<table class="basetable">
	<tr>
		<td colspan="100%" class="maintitle">
			SELECT TAX
		</td>
	</tr>
	<tr>
		<td class="searchtitle2">
			<img align="absmiddle" src="/symphony/v33/images/spacer.gif" width=2 height=14>
			<img align="absmiddle" src="/symphony/v33/images/newimg/search1.png" alt="Search">
			<input type="text" name="searchprocode" value="Code" size="15" class="textboxsearch" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" onkeyup="searchrecords();">
			<input type="text" name="searchprodesc" value="Description" size="30" class="textboxsearch" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" onkeyup="searchrecords();">			
		</td>
	</tr>  
	<tr>
		<td colspan="100%" style="height:530px;">
			<iframe id="searchframe" name="searchframe"  src="dsp_selectgstlist.cfm" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;"></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>