<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
	<script type="text/javascript" src="/symphony/v33/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/symphony/v33/component.js"></script>
	<script>
		
		function deleterecode(formhdrid,thispagenumber,parentid){
			var url="databind/act_checkdelete1.cfm?formhdrid=" + formhdrid ;
			//prompt('',url);
			var xmlsting = fn_getajaxreplyxml(url);
			xmlDoc = $.parseXML(xmlsting);
			xml = $(xmlDoc);

			$(xml).find('returnrow').each(function(index){
				//start change as required
				var msgerror = $(this).find('msgerror').text();
					  
				if(msgerror == ""){ 	
					if(confirm("Are you sure you want to delete this record?")){
						var unk = new Date();
						document.location="index.cfm?fuseaction=deletemainitem&formhdrid=" + formhdrid + "&thispagenumber=" + thispagenumber + "&parentid=" + parentid + "&unk=" + unk;
					}				
				}
				else{
					alert("  SYSTEM SUBMISSION FORMCHECK  \n\n" + msgerror + "\n\n");
				} 
		        //end change as required
			});	  					
		}
		
		
	</script>
</head>
<cfoutput>
<!--- ***CHANGEHERE : add or remove td as required --->
<cfparam name="searchcode" default="">
<cfparam name="searchdesc" default="">
<cfparam name="parentid" default="">
<cfparam name="searchtype" default=""><!--- 1 = NORMAL SEARCH 2 = NEXT PREVIOUS BUTTONS 3 = PRINT REPORT --->
<cfparam name="sortby" default="">

<cfset setskip = (global_mastersetlimit * (thispagenumber - 1))><!--- DON'T CHANGE --->

<cfquery name="getrecodecount" datasource="#dbName#"><!--- CHANGE ACCORDING TO YOUR MASTER --->
	select count(*) as noofrecode 
	from mainitem 					 <!--- ***CHANGEHERE : rename table --->
	where true 
	<!--- ***CHANGEHERE : add or remove <cfif>....</cfif> as required --->
	<cfif searchcode NEQ "" and trim(searchcode) NEQ "Code">
		and upper(code) like '%#ucase(searchcode)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif searchdesc NEQ "" and trim(searchdesc) NEQ "Description">	
		and upper(description) like '%#ucase(searchdesc)#%'				<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif parentid NEQ "">
		and levelid='#parentid#'
	<cfelse>
		and false
	</cfif>
</cfquery>

<cfquery name="getData" datasource="#dbName#"><!--- CHANGE ACCORDING TO YOUR MASTER --->
	select * 
	from mainitem 		<!--- ***CHANGEHERE : rename table --->
	where true 
	<!--- ***CHANGEHERE : add or remove <cfif>...</cfif> as required --->
	<cfif searchcode NEQ "" and trim(searchcode) NEQ "Code">
		and upper(code) like '%#ucase(searchcode)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif searchdesc NEQ "" and trim(searchdesc) NEQ "Description">	
		and upper(description) like '%#ucase(searchdesc)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif parentid NEQ "">
		and levelid='#parentid#'
	<cfelse>
		and false
	</cfif>
	
	<cfif trim(sortby) neq "">
		order by #trim(sortby)#
	<cfelse>
		order by description		 <!--- ***CHANGEHERE : rename column --->
	</cfif>
		
	<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST, SO NO NEED LIMIT --->
		limit #global_mastersetlimit#<!--- DON'T CHANGE --->
		offset #setskip#<!--- DON'T CHANGE --->
	</cfif>
</cfquery>

<cfset totalpages=Ceiling(getrecodecount.noofrecode/global_mastersetlimit)><!--- DON'T CHANGE --->
<body class="mainpage" style="text-align:left;">
<form name="itemform" method="post" action="" style="height:100%;">
	<input type="hidden" name="thispagenumber" value="#thispagenumber#">
	<table class="datatable" style="width:80%;text-align:left;margin-left:5px;">
		<tr>
			<!--- ***CHANGEHERE : add or remove <td> as required --->
			<td class="datatableheadercell" style="width:50px;">No</td>
			<!--- ***CHANGEHERE : rename column for sort by --->
			<td class="datatableheadercellsortby" style="width:80px;" onclick="parent.sortbyresult('code');">Code</td><!--- ***CHANGEHERE : rename column --->
			<td class="datatableheadercellsortby" style="text-align:left;padding-left:5px;" onclick="parent.sortbyresult('description');">Description</td><!--- ***CHANGEHERE : rename column --->
			<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST --->
				<td class="datatableheadercell" style="width:60px;">Action</td>
			</cfif>
		</tr>
		<cfloop query="getData">
			<!--- ***CHANGEHERE : add or remove <td> as required --->
			<tr>
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;">#getData.currentRow#</td>
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;color:##292929;">#getData.code#</td><!--- ***CHANGEHERE : rename column --->
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:left;color:##292929;">#getData.description#</td><!--- ***CHANGEHERE : rename column --->
				<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST --->
					<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;">
						<img src="/symphony/v33/images/newimg/edit8.png" class="imgtoplink" title="Edit this record" onclick="parent.setedit('#getData.id#','#getData.code#','#encodeForJavaScript(getData.description)#');">		<!--- ***CHANGEHERE : rename column & remove or add variable name --->				
						<img src="/symphony/v33/images/newimg/dele.png" class="imgtoplink" title="Delete this record" onclick="deleterecode('#getData.id#','#thispagenumber#','#parentid#');">					<!--- ***CHANGEHERE : rename column --->
					</td>
				</cfif>
			</tr>
		</cfloop>
		<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST --->
			<cfif totalpages gt 1><!--- START PAGINATION THIS LINE MUST BE THE LAST LINE IN TABLE--->
				<tr><!--- DON'T CHANGE BELOW CORDING --->
					<td class="datatabledatacell_#((getData.RecordCount+1)%2)#" colspan="100%">
						<table style="width:100%;">
							<tr>
								<td style="text-align:center;font-weight:bold;vertical-align:middle;">
									<cfif thispagenumber gt 1>
										<img src="/symphony/v33/images/newimg/prev.png" class="imgtoplink" title="Previous" onclick="parent.searchrec('2','#thispagenumber-1#');">
										<!--- <a href="javascript:void(0);" class="nevelink" onclick="parent.searchrec('2','#thispagenumber-1#');">&lt;&lt;&nbsp;Previous</a>	 --->
									<cfelse>
										<img src="/symphony/v33/images/newimg/prev.png" class="imgtoplink" title="Previous">		 			
									</cfif>
									&nbsp;&nbsp;
									#thispagenumber# of #totalpages#
									&nbsp;&nbsp;
									<cfif thispagenumber lt totalpages>
										<img src="/symphony/v33/images/newimg/next.png" class="imglink" title="Previous" onclick="parent.searchrec('2','#thispagenumber+1#');">
										<!--- <a href="javascript:void(0);" class="nevelink" onclick="parent.searchrec('2','#thispagenumber+1#');">Next&nbsp;&gt;&gt;</a> --->
									<cfelse>
										<img src="/symphony/v33/images/newimg/next.png" class="imglink" title="Previous">					
									</cfif>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</cfif><!--- END PAGINATION THIS LINE MUST BE THE LAST LINE IN TABLE--->
		</cfif>
	</table>	
</form>
</body>
<cfif searchtype eq "3"><!--- IF THE SEARCH TYPE IS PRINTING NEED TO DISPLAY PRINT DIALOG --->
	<script>
		window.print(); 
	</script>
</cfif>
</cfoutput>
</html>