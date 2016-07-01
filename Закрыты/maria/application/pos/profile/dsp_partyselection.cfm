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
<cfoutput>
function searchrecords(){
	var searchcode = document.itemform.searchchartcode.value;
	var searchtdesc = document.itemform.searchchartdesc.value;
	itemframe.location = "dsp_partyselectionlist.cfm?project=#project#&fd1=#fd1#&fd2=#fd2#&fd3=#fd3#&fd4=#fd4#&fd5=#fd5#&fd6=#fd6#&fd7=#fd7#&searchcode=" + searchcode + "&searchtdesc=" + searchtdesc ;
}
</script>
<body class="mainpage">
<form name="itemform" action="index.cfm" method="post" style="height:100%;">
<input type="hidden" name="fuseaction" value="">
<table class="basetable">
	<tr>
		<td colspan="100%" class="maintitle">
			SELECT PARTY
		</td>
	</tr>
	<tr>
		<td class="searchtitle2">
			<img align="absmiddle" src="/symphony/v33/images/spacer.gif" width=2 height=14>
			<img align="absmiddle" src="/symphony/v33/images/newimg/search1.png" alt="Search">			
			<input type="text" name="searchchartcode" value="Party Code" size="15" class="textboxsearch" onclick="if(this.value=='Party Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Party Code'};" onkeyup="searchrecords();">
			<input type="text" name="searchchartdesc" value="Party Name" size="30" class="textboxsearch" onclick="if(this.value=='Party Name'){this.value = ''};" onblur="if(this.value==''){this.value = 'Party Name'};" onkeyup="searchrecords();">
		</td>
	</tr>
	<tr>
		<td colspan="100%" style="height:530px;">
			<iframe id="itemframe" name="itemframe"  src="dsp_partyselectionlist.cfm?project=#project#&fd1=#fd1#&fd2=#fd2#&fd3=#fd3#&fd4=#fd4#&fd5=#fd5#&fd6=#fd6#&fd7=#fd7#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;"></iframe>
		</td>
	</tr>
</table>
</form>
</body>
</cfoutput>
</html>
