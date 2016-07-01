<!DOCTYPE html>
<html style="height:100%;">
<head>
<title></title>
<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
</head>


<cfoutput>
<script language="JavaScript">
function searchrecords(){
	var searchcode = document.itemform.searchprocode.value;
	var searchtdesc = document.itemform.searchprodesc.value;
	searchframe.location = "dsp_selectsuplist.cfm?opt=#opt#&searchcode=" + searchcode + "&searchtdesc=" + searchtdesc ;
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
			<img align="absmiddle" src="/symphony/v33/images/newimg/search1.png" alt="Search">
			<input type="hidden" name="searchprocode" value="Code" size="15" class="textboxnormal" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" onkeyup="searchrecords();">
			<input type="text" name="searchprodesc" value="Description" size="30" class="textboxnormal" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" onkeyup="searchrecords();">			
		</td>
	</tr>  
	<tr>
		<td colspan="100%" style="height:535px;">
			<iframe id="searchframe" name="searchframe"  src="dsp_selectsuplist.cfm?opt=#opt#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;"></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>