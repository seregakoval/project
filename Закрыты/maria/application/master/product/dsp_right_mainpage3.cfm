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
			searchframe.location = "dsp_searchlist3.cfm?searchcode=" + searchcode + "&searchdesc=" + searchdesc + "&searchtype=" + searchtype + "&thispagenumber=" + thispagenumber + "&sortby=" + sortby + "&parentid=" + parentid + "&unk=" + unk;

		}

		// ***CHANGEHERE : remove or add variable as required
		function setedit(docid,code,descp,costmethod,costid,costname,tax1name,tax2name,tax1id,tax2id){
			// ***CHANGEHERE : remove or add variable as required
			document.itemform.fuseaction.value="updatemaincate";
			document.itemform.docid.value=docid;
			document.itemform.code.value=code;
			document.itemform.descp.value=descp;
			document.itemform.costmethod.value=costmethod;
			document.itemform.btnsubmit.value="Edit";
			document.itemform.costid1.value=costid;
			document.itemform.costname.value=costname;
			document.itemform.purtaxname.value=tax1name;
			document.itemform.suptaxname.value=tax2name;
			document.itemform.defaultpurchasetax.value=tax1id;
			document.itemform.defaultsuppllytax.value=tax2id;
		}

		function validateform(){
			var code = document.itemform.code.value.trim();
			var descp = document.itemform.descp.value.trim();
			var costid = document.itemform.costid1.value.trim();
			var rtn = true;
			// ***CHANGEHERE : remove or add variable as required
			<cfoutput>
			if(((code == "" || code == "Code") && "#global_mstmaincateautonumber#" == "manual")){
				alert("Code Can not be empty!!!");
				rtn = false;
			}
			else if(descp == "" || descp == "Description"){
				alert("Description Can not be empty!!!");
				rtn = false
			}
			else if(costid == ""){
				alert("Charge Code Can not be empty!!!");
				rtn = false;
			}
			else{
				var fuseaction = document.itemform.fuseaction.value;
				var docid = document.itemform.docid.value;
				var parentid = document.itemform.parentid.value;
				// ***CHANGEHERE : remove or add variable as required &variablename=variable
				var url="databind/act_formcheck3.cfm?code=" + code + "&descp=" + escape(descp) + "&docid=" + docid + "&fuseaction=" + fuseaction + "&parentid=" + parentid;
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
					else{
						var fuseaction = document.itemform.fuseaction.value;
						var defaultpurchasetax = document.itemform.defaultpurchasetax.value;
						var defaultsuppllytax = document.itemform.defaultsuppllytax.value;
						var costmethod = document.itemform.costmethod.value;
						var level = document.itemform.level.value;
						document.location = "index.cfm?fuseaction=" + fuseaction + "&code=" + code + "&descp=" + escape(descp) + "&costid1=" + costid + "&parentid=" + parentid + "&defaultpurchasetax=" + defaultpurchasetax + "&defaultsuppllytax=" + defaultsuppllytax + "&costmethod=" + costmethod + "&docid=" + docid + "&level=" + level;
					}
			        //end change as required
				});
			}
			</cfoutput>
			return rtn;
		}

		function setdefault(){
			// ***CHANGEHERE : remove or add variable as required
			document.itemform.fuseaction.value="submitmaincate";
			document.itemform.docid.value="";
			document.itemform.code.value="Code";
			document.itemform.descp.value="Description";
			document.itemform.costmethod.value="fifo";
			document.itemform.btnsubmit.value="Add";
			document.itemform.costid1.value="";
			document.itemform.costname.value="Charge Code";
			document.itemform.purtaxname.value="Default Pur. TAX";
			document.itemform.suptaxname.value="Default Sup. TAX";
			document.itemform.defaultpurchasetax.value="";
			document.itemform.defaultsuppllytax.value="";
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

		function searchselection(pagelink){
			WinItem = window.open(pagelink,"popup2","height=600,width=560,scrollbars=yes, resizable=yes");
			WinItem.window.focus();
		}

		function ClearField(a,b,c){
			document.itemform.elements[a].value = "";
			document.itemform.elements[b].value = "";
			document.itemform.elements[c].value = "";
		}
	</script>
</head>
<cfoutput>
<body class="mainpage">
<form name="itemform" method="post" action="index.cfm" style="height:100%;" >
	<input type="hidden" name="fuseaction" value="submitmaincate">	<!--- ***CHANGEHERE : change action  as required --->
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
								<input maxlength="50" type="text" class="textboxnormal" style="width:60px;" name="code" value="Code" onclick="if(this.value=='Code'){this.value = ''};" onblur="if(this.value==''){this.value = 'Code'};" <cfif global_mstmaincateautonumber neq "manual">readonly </cfif>>
							</td>
							<td style="width:90px;">
								<input maxlength="150" type="text" class="textboxnormal" style="width:90px;" name="descp" value="Description" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" >
							</td>
							<td>
								<!--- <select name="costmethod" class="textboxnormal" style="width:80px;">
									<option value="fifo">FIFO</option>
									<option value="lifo">LIFO</option>
									<option value="purated">Purated</option>
								</select> --->
								<input type="hidden" name="costmethod" value="fifo">
							</td>
							<td style="width:160px;">
								<input type="hidden" name="purtaccode" value="Code" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);">
								<input type="text" name="purtaxname" value="Default Pur. TAX" CLASS="textbox1" style="width:100px;" readonly>
								<input type="hidden" name="defaultpurchasetax" value="">
								<input type="button" class="button3" value="S"  onclick="searchselection('dsp_selectgst2.cfm');">
								<input type="button" class="button3" value="R"  onclick="ClearField('purtaccode','purtaxname','defaultpurchasetax');">
							</td>
							<td style="width:160px;">
								<input type="hidden" name="suptaxcode" value="Code" CLASS="textbox1" style="width:60px;" onblur="dataupdate(this.value,this.name);">
								<input type="text" name="suptaxname" value="Default Sup. TAX" CLASS="textbox1" style="width:100px;" readonly>
								<input type="hidden" name="defaultsuppllytax" value="">
								<input type="button" class="button3" value="S"  onclick="searchselection('dsp_selectgst.cfm');">
								<input type="button" class="button3" value="R"  onclick="ClearField('suptaxcode','suptaxname','defaultsuppllytax');">
							</td>
							<td style="width:130px;">
								<input type="text" class="textboxnormal" style="width:80px;" name="costname" value="Charge Code" readonly>
								<input type="hidden" name="costid1" value="">
								<input type="button" class="button3" value="S" name="sbutton" onclick="searchselection('dsp_selectcost.cfm');">
							</td>
							<td>
								<input type="button" class="button2" value="Add" name="btnsubmit" onclick="validateform();">
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
						<td style="width:150px;">
							<input type="text" class="textboxsearch" style="width:150px;" name="searchdesc" value="Description" onclick="if(this.value=='Description'){this.value = ''};" onblur="if(this.value==''){this.value = 'Description'};" onkeyup="searchrec('1','1');">
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
				<iframe id="searchframe" name="searchframe" seamless src="dsp_searchlist3.cfm?thispagenumber=1&searchtype=1&parentid=#parentid#" style="height:100%;width:100%;border:0px solid ##647796;overflow:auto;vertical-align:top;"></iframe>
			</td>
		</tr><!--- END BOTTOM IFRAME ROW --->
	</table>
</form>
</body>
</cfoutput>
</html>
