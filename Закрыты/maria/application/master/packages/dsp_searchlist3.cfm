<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<LINK rel="STYLESHEET" type="text/css" href="/symphony/v33/mastercss3.css">
	<script type="text/javascript" src="/symphony/v33/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/symphony/v33/component.js"></script>
	<script>
		
		function deleterecode(formhdrid,thispagenumber,parentid){
			var url="databind/act_checkdelete3.cfm?formhdrid=" + formhdrid ;
			//prompt('',url);
			var xmlsting = fn_getajaxreplyxml(url);
			xmlDoc = $.parseXML(xmlsting);
			xml = $(xmlDoc);

			$(xml).find('returnrow').each(function(index){
				//start change as required
				var msgerror = $(this).find('msgerror').text();
					  
				if(msgerror == ""){ 	
					if(confirm("Are you sure you want to delete this recode?")){
						var unk = new Date();
						document.location="index.cfm?fuseaction=deletemaincate&formhdrid=" + formhdrid + "&thispagenumber=" + thispagenumber + "&parentid=" + parentid + "&unk=" + unk;
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
	from maincate 					 <!--- ***CHANGEHERE : rename table --->
	where true 
	<!--- ***CHANGEHERE : add or remove <cfif>....</cfif> as required --->
	<cfif searchcode NEQ "" and trim(searchcode) NEQ "Code">
		and upper(code) like '%#ucase(searchcode)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif searchdesc NEQ "" and trim(searchdesc) NEQ "Description">	
		and upper(description) like '%#ucase(searchdesc)#%'				<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif parentid NEQ "">
		and groupid='#parentid#'
	<cfelse>
		and false
	</cfif>
</cfquery>

<cfquery name="getData" datasource="#dbName#"><!--- CHANGE ACCORDING TO YOUR MASTER --->
	select * 
	from maincate 		<!--- ***CHANGEHERE : rename table --->
	where true 
	<!--- ***CHANGEHERE : add or remove <cfif>...</cfif> as required --->
	<cfif searchcode NEQ "" and trim(searchcode) NEQ "Code">
		and upper(code) like '%#ucase(searchcode)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif searchdesc NEQ "" and trim(searchdesc) NEQ "Description">	
		and upper(description) like '%#ucase(searchdesc)#%'			<!--- ***CHANGEHERE : rename column --->
	</cfif>
	<cfif parentid NEQ "">
		and groupid='#parentid#'
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
			<td class="datatableheadercell" style="width:150px;">Default Pur. TAX</td>
			<td class="datatableheadercell" style="width:150px;">Default Sup. TAX</td>
			<td class="datatableheadercell" style="width:10px;">Stock Item</td>
			<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST --->
				<td class="datatableheadercell" style="width:60px;">Action</td>
			</cfif>
		</tr>
		<cfloop query="getData">
			<cfquery name="getcost" datasource="#dbName#">
				select * 
				from cost
				<cfif getData.costid NEQ "">
                	where costid='#getData.costid#'
                <cfelse>
                	where false
                </cfif>
			</cfquery>
			<cfquery name="gettax1" datasource="#dbname#">
				select company.comno,company.comname as acc_name,partylist.*
				from company,partylist
				where company.comno = partylist.comno
				 and company.flag='1'
				<cfif getdata.defaultpurchasetax neq "">
					and partylist.id='#getdata.defaultpurchasetax#'
				<cfelse>
					and false
				</cfif>	
			</cfquery>
			<cfquery name="gettax2" datasource="#dbname#">
				select company.comno,company.comname as acc_name,partylist.*
				from company,partylist
				where company.comno = partylist.comno
				 and company.flag='1'
				<cfif getdata.defaultsuppllytax neq "">
					and partylist.id='#getdata.defaultsuppllytax#'
				<cfelse>
					and false
				</cfif>	
			</cfquery>
			<!--- ***CHANGEHERE : add or remove <td> as required --->
			<tr>
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;">#getData.currentRow#</td>
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;color:##292929;">#getData.code#</td><!--- ***CHANGEHERE : rename column --->
				<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:left;color:##292929;">#getData.description#</td><!--- ***CHANGEHERE : rename column --->
				<td class="datatabledatacell_#(getData.currentRow%2)#">#gettax1.acc_name#</td>
				<td class="datatabledatacell_#(getData.currentRow%2)#">#gettax2.acc_name#</td>
				<td class="datatabledatacell_#(getData.currentRow%2)#"><cfif getData.tostore EQ "1">Yes<cfelse>No</cfif></td>
				<cfif searchtype neq "3"><!--- THIS TYPE MEAN PRINT LIST --->
					<td class="datatabledatacell_#(getData.currentRow%2)#" style="text-align:center;">
						<img src="/symphony/v33/images/newimg/edit8.png" class="imgtoplink" title="Edit this recorde" onclick="parent.setedit('#getData.mainid#','#getData.code#','#encodeForJavaScript(getData.description)#','#getData.costmethod#','#getData.costid#','#getcost.description#','#gettax1.acc_name#','#gettax2.acc_name#','#getData.defaultpurchasetax#','#getData.defaultsuppllytax#');">		<!--- ***CHANGEHERE : rename column & remove or add variable name --->				
						<img src="/symphony/v33/images/newimg/dele.png" class="imgtoplink" title="Delete this recorde" onclick="deleterecode('#getData.mainid#','#thispagenumber#','#parentid#');">					<!--- ***CHANGEHERE : rename column --->
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