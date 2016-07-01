<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/ionicons.css">
    <!-- The next file is for the custom scrollbar -->
    <link href="css/perfect-scrollbar.min.css" rel="stylesheet">
    <style>
        /* Necessary styles for the custom scrollbar to work */
        #contentHolder { position: relative; height: 100vh; }

		body {
		    width: 100%;
		    font-family: MyriadPro;
		    font-size: 11px;
		    line-height: 130%;
		    margin: 0;
		    padding: 0;
		    color: #515e67;
		}

			/* Table */

		#outer_table {
		    width: 100%;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		}

		#outer_table tr td {
		    padding: 10px 0;
		}

		.main_line {
		    background-color: #f5f9fc;
		}

		.inner_table {
		    width: 100%;
		}

		.inner_table tr td {
		    padding: 3px 0 !important;
		}

		.orange_header {
		    color: #ff7d01;
		    text-decoration: underline;
		}

		.trash_icon {
		    color: #E03627;
		    font-size: 1.2em;
		    text-align: left;
		}
		
		.hidden {
		    display: none;
		}
		
		#show_all:hover, .expander:hover, .trash_icon i:hover {
		    cursor: pointer;
		}
		
		/* Top center line of buttons */

		#buttons_line {
		    width: calc(100% - 60px);
		    float: left;
		    position: relative;
		    font-size: 1.2em;
		    color: #515e67;
		    padding-top: 20px;
		    padding-left: 20px;
		}

		.select_styled select {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    width: 100%;
		    border: 1px solid #ebebeb;
		    border-radius: 5px;
		    color: #515e67;
		    background: transparent;
		    padding-left: 5px;
		    height: 30px;
		}

		.select_styled {
		    display: block;
		    float: left;
		    height: auto;
		    overflow: hidden;
		    background: url(../img/new_arrow.png) no-repeat right white;
		}
		
		
		/* hide default arrow in IE */
		.select_styled select::-ms-expand {
		    display: none;
		}

		#doc_type {
		    width: 120px;
		}

		input {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    border: 1px solid #ebebeb;
		    border-radius: 5px;
		    color: #515e67;
		    margin-left: 20px;
		    padding-left: 5px;
		    height: 30px;
		}

		#trx_no {
		    width: 80px;
		    margin-right: 30px;
		}

		#date_from, #date_to {
		    width: 130px;
		    margin: 0 10px;
		}

		/* Two orange buttons */

		.orange_button {
		    display: inline-block;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 0 10px;
		    border-radius: 5px;
		    padding-top: 8px;
		    height: 22px;
		    vertical-align: top;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		#orange_search {
		    margin-right: 10px;
		}
		
		/* Table */

		#table_head {
		    width: calc(100% - 40px);
		    float: left;
		    margin-top: 10px;
		    text-align: center;
		    color: #434343;
		    border-spacing: 1px;
		    font-weight: bold;
		}

		#table_head tr{
		    color: #434343;
		    background-color: #f8f8f8;
		}

		#table_head tr td {
		    padding: 10px 0;
		}
		
		
    </style>

</head>

<body>
<cfoutput>
	<cfparam name="searchno" default="Resources">
	<cfparam name="searchcode" default="Code">
	<cfparam name="searchitem" default="Product">
	<cfparam name="searchtype" default="">
	
	<cfparam name="searchsd" default="">
	<cfparam name="searched" default="">
	
	<cfset pageLimit = 30>
	<cfparam name="queryPage" default="1">
	<cfset queryOffest = (pagelimit * (val(queryPage) - 1))>
	
	<div id="buttons_line">

        <div class="select_styled" id="doc_type">
            <select name="searchtype">
				<option value="">Status</option>
				<option value="1">Finished</option>
				<option value="2">On Going</option>
            </select>
        </div>

        <input type="text" name="searchno" id="searchno" value="#searchno#" style="width: 150px;"onclick="if(this.value='Resources')this.value='';" onblur="if(this.value=='')this.value='Resources';">
        Date From
        <input type="date" name="searchsd" id="searchsd" value="#searchsd#">
        To
        <input type="date" id="searched" name="searched" value="#searched#">
        <div class="orange_button" id="orange_search">Search</div>
    </div>
	
	<cfquery name="getmaster" datasource="#dbname#">
		select crm_service_hdr.* from crm_service_hdr, resources 
		<!--- where custid = '#custid#' --->
		where true
		and crm_service_hdr.resource = resources.id
		<cfif searchno neq "Resources" and searchno neq "">
			and upper(resources.description) like '%#ucase(searchno)#%'
		</cfif>
		<cfif searchtype neq "">
			and crm_service_hdr.status = '#searchtype#'
		</cfif>
		<cfif searchsd neq "" and searched neq "">
			and crm_service_hdr.service_date::date BETWEEN #createdate(listgetat(searchsd,3,"/"),listgetat(searchsd,2,"/"),listgetat(searchsd,1,"/"))# AND #createdate(listgetat(searched,3,"/"),listgetat(searched,2,"/"),listgetat(searched,1,"/"))#
		</cfif>
		order by service_date desc
		limit '#pageLimit#' 
		offset '#queryOffest#'
	</cfquery>
	
	<table id="table_head">
        <tr>
            <td style="width: 8%;" id="show_all" onclick="expand_all()">Show All</td>
            <td style="width: 17%;">Service Start</td>
            <td style="width: 17%;">Service End</td>
            <td style="width: 17%;">Trmt ##</td>
            <td style="width: 17%;">Resources</td>
			<td style="width: 17%;">Ended By</td>
            <td style="width: 17%;">Status</td>
            <td style="width: 7%;">&nbsp;</td>
        </tr>
    </table>
        
    <div id="contentHolder">
        <table id="outer_table">
			<cfloop query="getmaster">
				
				
				<cfquery name="getusr2" datasource="#dbname#">
					select * from usr where usrid = '#val(getmaster.logno)#'
				</cfquery>
				<cfquery name="getres" datasource="#dbname#">
					select *  from resources where id = '#getmaster.resource#'
				</cfquery>
				
				 <tr class="main_line">
	                <td style="width: 8%;" class="expander"><i class="icon ion-chevron-down"></i></td>
	                <td style="width: 17%;">#dateformat(getmaster.service_date,"dd/mm/yyyy")#@#timeformat(getmaster.roomintime,"hh : MM tt")#</td>
	                <td style="width: 17%;"><cfif getmaster.roomouttime neq "">#dateformat(getmaster.service_date,"dd/mm/yyyy")#@#timeformat(getmaster.roomouttime,"hh : MM tt")#<cfelse>-</cfif></td>
	                <td style="width: 17%;">#getmaster.serno#</td>
	                <td style="width: 17%;">#getres.description#</td>
	                <td style="width: 17%;">#getusr2.name#</td>
	                <td style="width: 17%;"><cfif getmaster.status eq 2>Finished<cfelse>On Going</cfif></td>
	                <td style="width: 7%;"><i class="icon ion-printer"></i></td>
	            </tr>
	            
				<cfquery name="getdet" datasource="#dbname#">
					select * from crm_service_hdr where id = '#getmaster.id#'
				</cfquery>
				<cfquery name="getdet2" datasource="#dbname#">
					select * from crm_service_det where hdrid = '#getmaster.id#'
				</cfquery>
				<cfquery name="getusr" datasource="#dbname#">
					select usr.* from usr,crm_service_emp where usr.usrid = crm_service_emp.empid and crm_service_emp.serid = '#getdet.id#'
				</cfquery>
	            
	            <tr class="expandable_line hidden">
	                <td colspan="7">
	                    <table class="inner_table">
	                        <tr class="orange_header">
	                            <td style="width: 10%;">Service Time</td>
	                            <td style="width: 15%;">Employee</td>                        
	                            <td style="width: 10%;">Resource</td>
	                            <td style="width: 10%;">Finish Time</td>
	                            <td style="width: 7%;">Status</td>
	                            <td style="width: 7%;">Balance</td>
	                            <td style="width: 34%;"></td>
	                        </tr>
	                        <tr>
	                            <td>#timeformat(getdet.service_date)#</td>
	                            <td>#valuelist(getusr.name,"<br>")#</td>
	                            <td>#valuelist(getres.description,"<br>")#</td>
	                            <td>#timeformat(getdet.finish_date)#</td>
	                            <td><cfif getdet.status eq 0>On Going<cfelseif getdet.status eq 1>Done</cfif></td>
	                            <td>&nbsp;</td>
	                        </tr>
	                    </table>
	                    <table class="inner_table">
	                        <tr class="orange_header">
	                            <td colspan="3">Performed Services</td>
	                            <td></td>
	                            <td></td>    
	                        </tr>
	                        <cfloop query="getdet2">
								<cfquery name="getstaff" datasource="#dbname#">
									select name from usr, crm_service_steps where usr.usrid = crm_service_steps.staffid and crm_service_steps.hdrid = '#getdet2.id#' 
									and '#getdet2.hdrid#' = '#getmaster.id#'
								</cfquery>
								
								<cfquery name="getsales" datasource="#dbname#">
									select * from sales_hdr, sales_summary where sales_hdr.id = sales_summary.salesid 
									and sales_summary.id = <cfif getdet2.salessumid EQ "">null<cfelse>'#getdet2.salessumid#'</cfif>
								</cfquery>
								
								<cfquery name="getprevhdr" datasource="#dbname#">
					                select * from crm_service_hdr where service_date <= #getdet.service_date# and id != '#getdet.id#' and custid = '#getdet.custid#'
						        </cfquery>
						        
						        <cfquery name="getprevdet" datasource="#dbname#">
							    	select sum(qty) as qty From crm_service_det where salessumid = '#getdet2.salessumid#' 
							    	and <cfif valuelist(getprevhdr.id) neq "">hdrid in (#valuelist(getprevhdr.id)#)<cfelse> false </cfif>
					       		</cfquery>
					       		
						        <cfquery name="getsalessum" datasource="#dbname#">
					                select * from sales_summary where id = '#getdet2.salessumid#'
					       		</cfquery>
					       		<cfquery name="getitem" datasource="#dbname#">
									select * from itemcate_pos where itemid = '#val(getdet2.pid)#'
								</cfquery>
					       		
					       		<cfif getsales.salesno eq "">
									<cfset thissales = "-">
								<cfelse>
									<cfset thissales = getsales.salesno>
								</cfif>
								<tr>
		                            <td style="width: 30%;">#getdet2.currentrow#. (#getitem.codeno#) #getdet2.description#</td>
		                            <td style="width: 15%;">#val(getdet2.qty)# Session(s)</td>
		                            <td style="width: 15%;">Balance #val(getdet2.balqty)# Session(s)</td>
		                            <td style="width: 10%;">#thissales#</td>
		                            <td style="width: 30%;" class="trash_icon"><i class="icon ion-trash-a"></i></td>
		                        </tr>
								
							</cfloop>                     
	                    </table>
	                </td>
	            </tr>
	            
	            
	            
			</cfloop>
		
        </table>
    </div>
    
    <script>
        /* Add event listeners to all expanders */
        var elements = document.getElementsByClassName("expander");
        for(var i = 0; i < elements.length; i++) {
            elements[i].addEventListener("click", function(){
                expand_this(this);
            });    
        }   
        
        /* Expands or collapses an element */
        function expand_this(elem) {
            var line = elem.parentElement.nextElementSibling;
            line.classList.toggle("hidden");
            if(line.classList.contains("hidden")) {
                elem.innerHTML = '<i class="icon ion-chevron-down"></i>';    
            } else {
                elem.innerHTML = '<i class="icon ion-chevron-up"></i>';
            }
        }
        
        
        /* Expands everything */
        function expand_all(){

            /* These two lines get iframe content */
            var table_iframe = document.getElementById('page10_table');
            var iframeDocument = table_iframe.contentDocument || calendar_iframe.contentWindow.document;

            var list = iframeDocument.getElementsByClassName("expandable_line");
            var arrows = iframeDocument.getElementsByClassName("expander");

            if(all_expanded == false) {
                for(var j = 0; j < list.length; j++) {
                    list[j].classList.remove("hidden");
                    arrows[j].innerHTML='<i class="icon ion-chevron-up"></i>';
                }
                all_expanded = true;
                document.getElementById("show_all").innerHTML = "Hide All";
            } else {
                for(var j = 0; j < list.length; j++) {
                    list[j].classList.add("hidden");
                    arrows[j].innerHTML='<i class="icon ion-chevron-down"></i>';
                }
                all_expanded = false;
                document.getElementById("show_all").innerHTML = "Show All";
            }
        }
    </script>
                
    </script>
</cfoutput>   
</body>

</html>