<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ssui/css/page11.css">
    <link rel="stylesheet" href="/ssui/css/ionicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css">
	<script language="JavaScript" src="/ssui/js/component.js"></script>
    
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.js"></script>    
    <script>
		function selected_option(opt){
			unk = new Date(); 
			var nextid = document.getElementById("nextid").value ;  
			var packageno = document.getElementById("packageno").value ;  
			var levelnumber = document.getElementById("levelnumber").value ;  
			var url ="package_insertselectedoption.cfm?nextid="+nextid+"&packageno="+packageno+"&levelnumber="+levelnumber+"&opt=" + opt; 
			//prompt('',url) ;
			window.location = url ;
		}
	</script>
    <!-- The next file is for the custom scrollbar -->
    <link href="/ssui/css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }
        
        /* Necessary styles for the horizontal scrolling of products name */
        .scrollable .mCSB_dragger_bar {
            display: none;
        }        
    </style>    
</head>	

<body>
	<cfoutput>
		<div id="contentHolder">
			
			<cfquery name="selectactive" datasource="#dbname#">
				select * from sales_tmp_promotion where refid= '#nextid#' and status = '1' order by levelnumber
			</cfquery>

			
			<!--- LOOP FROM 1,2,3.... to end , but break for selection, then come in again --->
			<cfloop query="selectactive">
			
				<cfset findand = find("&",selectactive.formula)>
				<cfset findor = find("|",selectactive.formula)>
				
				<!--- ************************************************* --->
				<!---  NO FORMULA 
				cannot find any more symbol means this is just a single character of A   ,   B   ,    C 
				--->
				<!--- ************************************************* --->
				<cfif findand EQ 0 and findor EQ 0>
			
					
					<cfquery name="update" datasource="#dbname#"><!--- update status, so that it won't come in again --->
						update sales_tmp_promotion set status = '0' where id='#selectactive.id#'
					</cfquery>
					<!--- <div class="one_product">
						<h3>Choose Item</h4>
					</div> --->
					

					<cfset thispackageno=selectactive.packageno>
					<cfset thisgroupno=trim(selectactive.formula)>
					<cfinclude template="package_selectitem.cfm">
					
					<cflocation url="package_selectcontrol.cfm?nextid=#nextid#">
				
					<!--- ************************************************* --->		
					<!--- ( WITH FORMULA )
					expand the formula, break it down 
					--->
					<!--- ************************************************* --->
				<cfelse>
										
					<!--- if found formula, 
						1) check if it is  & or  | 
						2) if &, go repeat steps
						3) if |, go ask user to choose
					--->
					
					<!--- break down the level to  A , B, (B|C) , B&(E|F), E --->
					<cf_eslnv20_processformula formula="#replace(selectactive.formula," ","","ALL")#">	
					
					<cfquery name="update" datasource="#dbname#"><!--- update status, so that it won't come in again --->
						update sales_tmp_promotion set status = '0' where id='#selectactive.id#'
					</cfquery>
					<div class="one_product">
						<!--- PART A. If found | , get the user to select  --->
						<cfif defaultsymbol EQ "|">
							<h3>PLEASE CHOOSE GROUP</h3>
							<input type="hidden" name="nextid" id="nextid" value="#nextid#">
							<input type="hidden" name="packageno" id="packageno" value="#selectactive.packageno#">
							<input type="hidden" name="levelnumber" id="levelnumber" value="#selectactive.levelnumber#">
							<cfloop from="1" to="#val(arraylen(optionArray))#" index="lop">
								<div class="line_wrapper services_width">
					                <p class="scrollable" data-mcs-theme="minimal-dark">#trim(optionArray[lop])#</p>
					                <div class="grey_button" onclick="selected_option('#trim(optionArray[lop])#');"> S </div>
					                <div class="clear"></div>
					            </div>
							</cfloop>

							<cfabort>
						
						<!--- PART B. If found & , USER NO NEED TO SELECT, put all selection to database for next step  --->
						<cfelseif defaultsymbol EQ "&">
						
							<cfloop from="1" to="#val(arraylen(optionArray))#" index="lop">
								<cfquery name="getnext" datasource="#dbname#">
									select nextval('seq_sales_tmp_promotion_id') as id
								</cfquery>
								<cfquery name="insertsession" datasource="#dbname#">
									insert into sales_tmp_promotion
									(id,refid,packageno,formula,symbol,status,levelnumber)
									values
									('#getnext.id#','#nextid#','#selectactive.packageno#','#trim(optionArray[lop])#','#defaultsymbol#',1,'#selectactive.levelnumber#.#getnext.id#')
								</cfquery>
							</cfloop>							
							<cflocation url="package_selectcontrol.cfm?nextid=#nextid#">
							
						<cfelse><!--- Cannot be no symbol. When enter into this cfif, means a symbol is found --->
							<h4><img src="/ssui/img/gift.png">Missing Symbol</h4> <cfabort>
						</cfif>
					</div>
					
				</cfif>			
			
			
			</cfloop>
		
		
		</div>
		
		
		
		
		
		
		
		
		<!--- 
		RULES for the formula :
		1) The formula must be considered by level. e.g. A & B (one level), A & (B|C) (two level, because B|C need to be analyse separately)
		2) Each Level must have the same symbol. e.g. A&B&C (correct), A&B|C (wrong), A & (B|C&D) (wrong at second level)
		--->
		
		<cfinclude template="package_insertintodb.cfm">
		<script>
			//alert(parent.document.getElementById("main_table_wrapper").contentWindow.location) ;
			//parent.document.getElementById("totalsales").innerHTML = totalsales ;
			parent.document.getElementById("main_table_wrapper").contentWindow.location.reload();
			<cfoutput>document.location.href = "dsp_pop_package.cfm?nextid=#nextid#"</cfoutput>
		</script>
		
	</cfoutput>
</body>

















	
			
