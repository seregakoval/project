<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
	<script type="text/javascript" src="/symphony/v33/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/symphony/v33/component.js"></script>

	<script>
		function searchrec(searchtype,thispagenumber){
			// *** follow data required for serach
			var searchtype = searchtype; //DON'T CHANGE
			var thispagenumber = thispagenumber; // DON'T CHANGE
			// ***CHANGEHERE : remark or add as required the text field
			var searchcode = document.itemform.searchcode.value;
			var searchdesc = escape(document.itemform.searchdesc.value);
			var sortby = document.itemform.sortby.value;
			var parentid = document.itemform.parentid.value;

			var unk = new Date();
			// *** calling the search page
			// ***CHANGEHERE : remove or add variable as required &variablename=variable
			searchframe.location = "dsp_searchlist4.cfm?searchcode=" + searchcode + "&searchdesc=" + searchdesc + "&searchtype=" + searchtype + "&thispagenumber=" + thispagenumber + "&sortby=" + sortby + "&parentid=" + parentid + "&unk=" + unk;
		}

		function sortbyresult(sortby){
			var crntsort = document.itemform.sortby.value;
			 if(crntsort.indexOf(sortby) == -1){
			 	sortby = sortby;
			 }
			 else{
			 	var array = crntsort.split(/\s/);
			 	var hits = 0;
			 	var chkstr = "desc";
			 	var length = array.length;
			 	var i = 0;
			 	while (i < length) {
				   	if (chkstr === array[i]) {
				        hits += 1;
				    }
				    i += 1;

				}
			 	if(hits == 0){
			 		sortby = sortby + " desc";
			 	}
			 	else{
			 		sortby = sortby;
			 	}
			 }
			document.itemform.sortby.value=sortby;
			searchrec('1','1');
		}

		function addnew(){
			// ***CHANGEHERE : remove or add variable as required &variablename=variable
			<cfoutput>
			var url ="index.cfm?fuseaction=newitem&parentid=#parentid#";
			</cfoutput>
			WinItem = window.open(url,"popup","width=1120,height=600,scrollbars=yes, resizable=yes");
			WinItem.window.focus();
		}
	</script>
</head>
<cfoutput>
<body class="mainpage">
<form name="itemform" method="post" action="index.cfm" style="height:100%;" onsubmit="return validateform();">
	<input type="hidden" name="fuseaction" value="submit">
	<input type="hidden" name="docid" value="">
	<input type="hidden" name="sortby" value="">
	<input type="hidden" name="level" value="#level#">
	<input type="hidden" name="parentid" value="#parentid#">
	<table class="basetable">
		<tr><!--- START ADD ROW --->
			<td colspan="100%" style="border-bottom:0px solid ##cccccc;vertical-align:top;text-align:left;height:20px;" id="addnewcell">
				<div  class="addnewtable">
					<table style="margin-top:28px;margin-left:25px;position:absolute;">
						<!--- ***CHANGEHERE : add or remove <td>.....</td> as required --->
						<tr>
							<td>
								<input type="button" class="button2" value="Add New Item" name="btnsubmit" onclick="addnew();">
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr><!--- END ADD ROW --->
		<tr><!--- START SEARCH ROW --->
			<td colspan="100%" style="border-bottom:0px solid ##cccccc;vertical-align:top;text-align:left;">
				<table style="text-align:left;margin-left:5px;">
					<!--- ***CHANGEHERE : add or remove <td>.....</td> as required --->
					<tr>
						<td style="width:20px;">
							<img src="/symphony/v33/images/newimg/search1.png" class="imgtop">
						</td>
						<td style="width:60px;">
							<input maxlength="50" type="text" class="textboxsearch" style="width:70px;" name="searchcode" value="Code" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" onkeyup="searchrec('1','1');">
						</td>
						<td style="width:200px;">
							<input maxlength="150" type="text" class="textboxsearch" style="width:200px;" name="searchdesc" value="Description" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" onkeyup="searchrec('1','1');">
						</td>
						<!--- <td style="width:340px;text-align:right;">
							<img src="/symphony/v33/images/newimg/printer.png" class="printbutton" title="Print" onclick="printlist();">
						</td> --->
					</tr>
				</table>
			</td>
		</tr><!--- END SEARCH ROW --->
		<tr><!--- START BOTTOM IFRAME ROW --->
			<td colspan="100%" style="height:100%;margin:0;text-align:left;">
				<iframe id="searchframe" name="searchframe" seamless src="dsp_searchlist4.cfm?thispagenumber=1&searchtype=1&parentid=#parentid#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;vertical-align:top;"></iframe>
			</td>
		</tr><!--- END BOTTOM IFRAME ROW --->
	</table>
</form>
</body>
</cfoutput>
</html>
