<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
</head>	
<cfoutput>
<body class="mainpage2">
	<table class="basetable" style="height:100%;"> 
		<tr>
			<td colspan="100%" class="searchtitle1">
				<!--- ***CHANGEHERE : change name accordingly --->
				&nbsp;Master File | Material Setup    <!--- CHANGE ACCORDING TO YOUR MASTER --->
			</td>
		</tr>
		<tr>
			<td style="border-right:0px solid ##cccccc;vertical-align:top;text-align:left;width:380px;height:100%;">
				<div style="height:100%;width:380px;border:0px solid ##647796;overflow:auto;vertical-align:top;">
					<cfinclude template="dsp_tree.cfm">
				</div>
			</td>
			<td style="vertical-align:top;text-align:left;height:100%;">
				<iframe id="dataframe" name="dataframe" seamless src="dsp_right_mainpage.cfm?level=&parentid=" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;vertical-align:top;"></iframe>
			</td>
		</tr>
	</table>
</body>
</cfoutput>
</html>