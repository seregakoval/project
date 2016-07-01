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
			var searchdesc = document.itemform.searchdesc.value;
			var sortby = document.itemform.sortby.value;
			var parentid = document.itemform.parentid.value;
			
			var unk = new Date();
			// *** calling the search page
			// ***CHANGEHERE : remove or add variable as required &variablename=variable
			searchframe.location = "dsp_searchlist1.cfm?searchcode=" + searchcode + "&searchdesc=" + searchdesc + "&searchtype=" + searchtype + "&thispagenumber=" + thispagenumber + "&sortby=" + sortby + "&parentid=" + parentid + "&unk=" + unk;
		
		}
		
		// ***CHANGEHERE : remove or add variable as required
		function setedit(docid,code,descp){
			// ***CHANGEHERE : remove or add variable as required
			document.itemform.fuseaction.value="updatemainitem";
			document.itemform.docid.value=docid;
			document.itemform.code.value=code;
			document.itemform.descp.value=descp;
			document.itemform.btnsubmit.value="Edit";
		}
		
		function validateform(){
			var code = document.itemform.code.value.trim();
			var descp = document.itemform.descp.value.trim();
			var rtn = true;
			// ***CHANGEHERE : remove or add variable as required
			<cfoutput>
			if(((code == "" || code == "Code") && "#global_mstmainitemautonumber#" == "manual") || (descp == "" || descp == "Description")){
				alert("Code or Description Can not be empty!!!");
				rtn = false;			
			}
			else{
				var fuseaction = document.itemform.fuseaction.value;
				var docid = document.itemform.docid.value;
				// ***CHANGEHERE : remove or add variable as required &variablename=variable
				var url="databind/act_formcheck1.cfm?code=" + code + "&descp=" + descp + "&docid=" + docid + "&fuseaction=" + fuseaction;
				//prompt('',url);
				var xmlsting = fn_getajaxreplyxml(url);
				xmlDoc = $.parseXML(xmlsting);
				xml = $(xmlDoc);
	
				$(xml).find('returnrow').each(function(index){
					//start change as required
					var msgerror = $(this).find('msgerror').text();						  
					if(msgerror != ""){ 	
						alert("  SYSTEM SUBMISSION FORM CHECK  \n\n" + msgerror + "\n\n");	
						rtn = false;		
					}
			        //end change as required
				});
			}
			</cfoutput>
			return rtn;
		}
		
		
		function setdefault(){
			// ***CHANGEHERE : remove or add variable as required
			document.itemform.fuseaction.value="submitmainitem";
			document.itemform.docid.value="";
			document.itemform.code.value="Code";
			document.itemform.descp.value="Description";
			document.itemform.btnsubmit.value="Add";
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
	</script>
</head>
<cfoutput>
<body class="mainpage">
<form name="itemform" method="post" action="index.cfm" style="height:100%;" onsubmit="return validateform();">
	<input type="hidden" name="fuseaction" value="submitmainitem">	
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
							<td style="width:60px;">
								<input maxlength="50" type="text" class="textboxnormal" style="width:70px;" name="code" value="Code" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" <cfif global_mstmainitemautonumber neq "manual">readonly </cfif>>												
							</td>
							<td style="width:200px;">
								<input maxlength="150" type="text" class="textboxnormal" style="width:200px;" name="descp" value="Description" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" >
							</td>
							<td>
								<input type="submit" class="button2" value="Add" name="btnsubmit">
								<input type="button" class="buttonreset" value="Reset" name="btnclear" onclick="setdefault();">
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
							<input type="text" class="textboxsearch" style="width:70px;" name="searchcode" value="Code" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" onkeyup="searchrec('1','1');">												
						</td>
						<td style="width:200px;">
							<input type="text" class="textboxsearch" style="width:200px;" name="searchdesc" value="Description" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" onkeyup="searchrec('1','1');">
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
				<iframe id="searchframe" name="searchframe" seamless src="dsp_searchlist1.cfm?thispagenumber=1&searchtype=1&parentid=#parentid#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;vertical-align:top;"></iframe>
			</td>
		</tr><!--- END BOTTOM IFRAME ROW --->
	</table>
</form>
</body>
</cfoutput>
</html>
