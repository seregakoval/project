
<!DOCTYPE html>

<html style="height: 100%;">
<head>
	<title>Untitled</title>
	
	<link rel="STYLESHEET" type="text/css" href="/icall/application/newcss3.css">
	
	
	<script language="javascript" src="/eCRM/databind/mac.js"></script>
	
	<script language="javascript" src="/icall/application/date_picker_a.js"></script>
	<script language="JavaScript1.2" src="/icall/application/date_format.js"></script>
	
	<script LANGUAGE="JavaScript">
	
		addCalendar("Calendar1", "Select Date", "incidentdate", "itemform");
		
		function openpage(arg,arg2){
				unk = new Date();
				if(arg == 'support'){
					
					var thisuser=document.forms["itemform"]["membercode"].value;
					powindow = window.open('http://control-room.pixajoy.com.my/cpadmin/Customer/Customer_Detail.aspx?mode=view&ID=' + thisuser,'powindow','width=850,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');powindow.window.focus();
						
				}
				if(arg == 'listtemp'){
					powindow = window.open('ticket_create/index.cfm?fuseaction=listtemp&unk=' + unk+'','powindow','width=850,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');powindow.window.focus();
					
				}
				}
				
		function actionselection(opt){
			if (opt == 'button2'){			
				unk = new Date();
				powindow = window.open('dsp_nameselectionnew.cfm','powindow','width=850,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');powindow.window.focus();
			}
		}
		function changetickettype(tickettype){
			if(tickettype == 1){
				parent.masterframe.location = "index.cfm?fuseaction=transfercustomize&formhdrid=261585";
			}		
		}
		function databind(currfield,currvar)
		{
			//alert('fff');
			var xmlhttp;	
			var fid=document.getElementById("fid").value; 	
			currvar = escape(currvar);
			currvar = currvar.replace(/[\r\n]+/g, '%0D%0A');
		 	if (window.XMLHttpRequest)
		   	{// code for IE7+, Firefox, Chrome, Opera, Safari
		   		xmlhttp=new XMLHttpRequest();
		   	}
		 	else
		   	{// code for IE6, IE5
		   		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		   	}	 
		   	//this unk for distrory the IE cache.
		   	unk = new Date();	
		   	var url="databind/act_ajaxdataupdate.cfm?currfield="+currfield+'&currvar='+currvar+'&formhdrid='+fid + '&unk=' + unk;
		   	//prompt('dd',url);
		 	xmlhttp.open("GET",url,true);
		 	xmlhttp.send();
		}
		
		function formvalidation(){
			var x1=document.forms["itemform"]["custname"].value;
			var x2=document.forms["itemform"]["email"].value;
			var x3=document.forms["itemform"]["contact_no3"].value;
			if(x1==null || x1==""){
				alert("Name must be filled out");
				document.forms["itemform"]["custname"].focus();
				return false;
			}
			if(x3==null || x3==""){
				alert("Mobile must be filled out");
				document.forms["itemform"]["contact_no3"].focus();
				return false;
			}
		}
		function formvalidation_bk()
		{
			var x1=document.forms["itemform"]["selectedstateid"].value;
			var x2=document.forms["itemform"]["selectedparlimentid"].value;
			var x3=document.forms["itemform"]["selecteddunid"].value;
			var x4=document.forms["itemform"]["selectedpdmid"].value;
			var x5=document.forms["itemform"]["status"].value;
			var tickettype=document.forms["itemform"]["tickettype"].value;
		
		
			if(x5==null || x5==""){
				alert("Status must be filled out");
				return false;
			}
			if (tickettype=="1") {
				if (x1==null || x1=="" || x2==null || x2=="" || x3==null || x3=="" || x4==null || x4=="") {
					alert("Location must be filled out");
					return false;
				}
			}
			if (tickettype=="0") {
				if (x1==null || x1=="") {
					alert("State must be filled out");
					return false;
				}
			}
		
		}
		
	       function getreason2(reason1id,reason2id,fldname)
	       {
	               // selected reason1 , selected reason 2 , field name
	               var xmlhttp;
	               var formhdrid=document.getElementById("fid").value;
	               if (window.XMLHttpRequest)
	               {// code for IE7+, Firefox, Chrome, Opera, Safari
	                       xmlhttp=new XMLHttpRequest();
	               }
	               else
	               {// code for IE6, IE5
	                       xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	               }
	               xmlhttp.onreadystatechange=function()
	               {
	                       if (xmlhttp.readyState==4 && xmlhttp.status==200)
	               {
	                       document.getElementById("divreason" + fldname + "b").innerHTML=xmlhttp.responseText;
	               }
	               }
	               var d = new Date();
	               //this flgbrak is to distroy the cash in IE when call ajax
	               var url="databind/act_ajaxgetreason2.cfm?flgbrak=" + d + "&reason1id=" + reason1id + '&reason2id=' + reason2id + '&fldname=' + fldname + '&formhdrid=' + formhdrid;
	               //prompt('dd',url);
	               xmlhttp.open("GET",url,true);
	               xmlhttp.send();
	       }
	
	
	
	
	       function getreason3(reason2id,reason3id,fldname)
	       {
	               // selected reason1 , selected reason 2 , field name
	               var xmlhttp;
	               var formhdrid=document.getElementById("fid").value;
	               if (window.XMLHttpRequest)
	               {// code for IE7+, Firefox, Chrome, Opera, Safari
	                       xmlhttp=new XMLHttpRequest();
	               }
	               else
	               {// code for IE6, IE5
	                       xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	               }
	               xmlhttp.onreadystatechange=function()
	               {
	                       if (xmlhttp.readyState==4 && xmlhttp.status==200)
	               {
	                       document.getElementById("divreason" + fldname + "c").innerHTML=xmlhttp.responseText;
	               }
	               }
	               var d = new Date();
	               //this flgbrak is to distroy the cash in IE when call ajax
	               var url="databind/act_ajaxgetreason3.cfm?flgbrak=" + d + "&reason2id=" + reason2id + '&reason3id=' + reason3id + '&fldname=' + fldname + '&formhdrid=' + formhdrid;
	               //prompt('dd',url);
	               xmlhttp.open("GET",url,true);
	               xmlhttp.send();
	       }
	
	
		function displaydepartment(resolutionid){
			var xmlhttp;			
			var formhdrid=document.getElementById("fid").value; 		
		 	if (window.XMLHttpRequest)
		   	{// code for IE7+, Firefox, Chrome, Opera, Safari
		   		xmlhttp=new XMLHttpRequest();
		   	}
		 	else
		   	{// code for IE6, IE5
		   		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		   	}	
		   	xmlhttp.onreadystatechange=function()
	   		{
	   			if (xmlhttp.readyState==4 && xmlhttp.status==200)
	     		{
	     			if(resolutionid == 2){
						document.getElementById("dipdiv").style.display = "block";
					}
					else{
						document.getElementById("dipdiv").style.display = "none";
						document.getElementById('department').selectedIndex=0;
					}
	     		}
	   		} 	
	   		var d = new Date();	
	   		//this flgbrak is to distroy the cash in IE when call ajax
		   	var url="databind/act_ajaxchangedepartment.cfm?flgbrak=" + d + "&resolutionid=" + resolutionid + '&formhdrid=' + formhdrid; 
		   	//prompt('dd',url);
		 	xmlhttp.open("GET",url,true);
		 	xmlhttp.send();	
		}
		
		function testpop(){
			unk = new Date();
			phoneno=document.getElementById("caller_no").value;
			window.showModalDialog("/icall/application/dsp_incomingcall.cfm?phoneno=" + phoneno + "&targetno=" + phoneno + "&unk=" + unk, window, "dialogHeight: 170px; dialogWidth: 320px; scroll : no;");
		}
		
		function printticket(formhdrid){
					powindow = window.open('dsp_printticket.cfm?formhdrid='+formhdrid,'powindow','width=850,height=600,top=20,left=50,scrollbars=yes,resizable=yes,status=no');
					powindow.window.focus();
					powindow.window.print();
			}	
	
	
	
		function callOut(){
			unk = new Date();
			window.showModalDialog("/icall/application/ticket_create/dsp_projectselection2.cfm?unk=" + unk, window, "dialogHeight: 450px; dialogWidth: 1250px; scroll : no;");
			//window.showModalDialog("dsp_callout.cfm?unk=" + unk, window, "dialogHeight: 300px; dialogWidth: 550px;status:no", window);
		}
	
	
		function checkselection(id) {
		//alert(id);
		if (id == '1') { callOut() }	
	
		}

</script>

<style>
		
		.page2{
			margin-top:0px;
			margin-left:0px;
			margin-right:0px;
			background-color:rgb(245,245,245);
			font-family:"Times New Roman";
		}
		
		.hedcell{
			height:35px;
			border-bottom: 1px solid rgb(197,197,197); 
		}
			
		.spanbutton{
			font-family:Helvetica;
			font-size:18px;
			font-weight:bold;
			color:#1F0F00;
			text-transform:capitalize;	
			padding-left:50px;
			padding-right:50px;
			padding-top:5px;
			padding-bottom:5px;
		}
		
		.table1{
			border: 1px solid rgb(197,197,197);
			border-radius:5px;
			background-color:#ffffff;
			padding:5px;
		}
		
		.tablecaptioncell{
			font-family:verdana;
			font-size:12px;
			font-weight:bold;
			color:#0D0D0D;
			padding:2px;
		}
		
		.tableinputcell{	
			padding:2px;
		}
		
		.textbox {
		    border: 1px solid rgb(197,197,197);
		    border-radius: 1px;
			background-color:#ffffff;
			color: #998976;
			vertical-align:middle;
			padding:3px;
		}
		
		.dropdown{
		 	font-weight:normal;
		 	color:#998976;
		 	background-color:#ffffff;
		 	border:1px solid rgb(197,197,197);
		 	border-radius:1px;
		 	width:190px;
		 	padding:3px;
		}
		
		.tablecaptioncell{
			font-family:verdana;
			font-size:12px;
			font-weight:bold;
			color:#0D0D0D;
			padding:2px;
		}
		
		.tabledatacel1{	
			font-family: Verdana;	
			font-size: 11px;
			font-weight: bold;
			text-align:left;
			text-transform: capitalize;
			color: #1F0F00;	
			background: #E1E1E1;
			border-top: 1px solid #D8D8D8;
			border-bottom: 1px solid #D8D8D8;
			border-left: 0px solid #D8D8D8;
			border-right: 0px solid #D8D8D8;
			padding-left:5px;
			padding-right:5px;
			padding-top:10px;
			padding-bottom:10px;
		}
		
		.buttonsubmit {
			font-size: 12px;
		    border: 1px solid #BFC6CD;
		    border-radius: 8px;
		    background-color:rgb(86,86,86);
			color: #FFFFFF;
			padding-top:10px;	
			padding-bottom:10px;
			padding-left:30px;
			padding-right:30px;
			cursor:pointer;
		}
		
</style>
	
</head>




<body class="page2" style="height: 98%;">
	
<form action="index.cfm?fuseaction=submit&formhdrid=261585"  name="itemform" onsubmit="return formvalidation();" method="post">
<input type="Hidden" name="fid" id="fid" value="261585">	
	
	<table width="100%" border="0">
		<tr>
			<td class="hedcell">
				<span class="spanbutton" ondblclick="testpop();">New ticket</span>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%" align="left" border="0">
					<tr>
						<td width="15%" valign="top">
							<table width="98%" align="center" cellpadding="0" cellspacing="0" class="table1" border="0">
								<tr>
									<td class="tablecaptioncell">Name</td>
									<td class="tablecaptioncell">Gender</td>
								</tr>
								<tr>
									<td class="tableinputcell">
										<input type="Text" class="textbox" id="custname" name="custname" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
									<td class="tableinputcell">
										<select name="gender" class="dropdown" onchange="databind(this.name,this.value);" style="width:90px;">
											<option value="">-Select-</option>
											<option value="Male" >Male</option>
											<option value="Female" >Female</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<td class="tablecaptioncell" colspan="100%">Member Code</td>
								</tr>
								<tr>
									<td class="tableinputcell" valign="middle" colspan="100%">
										<select name="membercode" class="dropdown" onchange="databind(this.name,this.value);" style="width:250px;">
											
												<option value="">-Select-</option>
											
										</select>
									</td>
								</tr>
								<tr>	
									<td>
										<input type="Text" class="textbox" id="membercode2" name="membercode2" size="40" onblur="databind(this.name,this.value);" value="">
									</td>

								</tr>
								
								<tr>
									<td class="tablecaptioncell" colspan="100%">Caller Number</td>
								</tr>
								<tr>
									<td class="tableinputcell" valign="middle" colspan="100%">
										<input type="Text" class="textbox" id="caller_no" name="caller_no" size="40" onblur="databind(this.name,this.value);" value="">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">Contact Number <span class="notetext">Home</span></td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="contact_no" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">Contact Number <span class="notetext">Office</span></td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="contact_no2" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">Contact Number <span class="notetext">Mobile</span></td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="contact_no3" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">E-mail</td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="email" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">Address</td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="address1" size="40" onblur="databind(this.name,this.value);" value=""> 
									</td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<input type="Text" class="textbox" name="address2" size="40" onblur="databind(this.name,this.value);" value="">
									</td>
								</tr>
								<tr>
									<td class="tablecaptioncell" colspan="100%">Language/Notes</td>
									<tr>
									<td class="tableinputcell" colspan="100%">
											<textarea rows="3" cols="50" class="textaria" name="description" onBlur="databind(this.name,this.value);"></textarea>
									</td>
								</tr>
								</tr>
										
													
							</table>
							<br>
							<table width="98%" align="center" cellpadding="0" cellspacing="0" class="table1">	
								<tr>
									<td class="tablecaptioncell">Status</td>
									
									<td class="tablecaptioncell" colspan="100%">Channel</td>
								</tr>


								<tr>
									<td class="tableinputcell">
										<!--updated by piumi 15.04.2014 @9.51p.m.--->
										<select name="status" class="dropdown" onchange="databind(this.name,this.value);" required >
										<!--end modification by piumi 15.04.2014 @9.51p.m.--->
											<option value="">-Select Status-</option>
											<option value="2" >Pending</option>
											<option value="1" >Open</option>
											<option value="3" >Close</option>
											
										</select>
									</td>
									
									<td class="tableinputcell">
										<select name="calltype" class="dropdown" onchange="databind(this.name,this.value);">
											<option value="">-Select Channel-</option>
											
												<option value="1" >Call In</option>
											
												<option value="2" >Facebook</option>
											
												<option value="3" >SH/SQ Website</option>
											
												<option value="4" >Walk In</option>
											
												<option value="5" >Fax/Mailing</option>
											
										</select>
									</td>
								</tr>	
								<tr>
									<td class="tablecaptioncell" >Action</td>
									
								</tr>
								<tr>
									<td class="tableinputcell" >
										
										<select name="action" id="action" class="dropdown" onchange="checkselection(this.value);databind(this.name,this.value);">
											<option value="">-Select Action-</option>											
											<option value="1">Escalation
											<option value="2">Explanation Given (1 Resolituon)
											<option value="3">Compliment
										</select>
									</td>
									<td class="tableinputcell">
										<div id="reason2"></div>
									</td>
								</tr>	
								<tr>
									
								</tr>
								<tr>
									
									<td class="tableinputcell" >
										<div id="dipdiv" style="display:none;">
											<select name="department" id="department" class="dropdown" onchange="databind(this.name,this.value);">
												<option value="">-Select Department-</option>										
												
													<option value="1" >Media Sales</option>
												
													<option value="2" >Marketing - Specialty</option>
												
													<option value="3" >Marketing - Branding</option>
												
													<option value="4" >Marketing - Promotions</option>
												
													<option value="5" >Marketing - PR</option>
												
													<option value="6" >HCM</option>
												
													<option value="7" >IT</option>
												
													<option value="8" >Human Resource</option>
												
													<option value="9" >Concession</option>
												
													<option value="10" >Programming</option>
												
													<option value="11" >Finance</option>
												
													<option value="12" >Business Development</option>
												
													<option value="13" >Maintenance</option>
												
													<option value="14" >Field Operation</option>
												
													<option value="15" >Supervisor</option>
												
											</select>
										</div>
									</td>
								</tr>											
								
							</table>
							<br>
							
						</td>
						<td width="2px"></td>
						<td valign="top" >
							<table width="98%" align="center" cellpadding="0" cellspacing="0" class="table1" >
                                 
								<tr>
                                    <td rowspan="100%" width="10px"></td>
                                    <td class="tablecaptioncell" height="100%" width="280px">&nbsp;</td>
                                    <td class="tablecaptioncell" height="100%">&nbsp;</td>
                              	</tr>
                                <tr>
                                   <td class="tablecaptioncell" colspan="2">
                                       <table width="100%">
                                            <tr>
                                                 <td>Reason</td>
                                                 <td>Tier 1</td>
                                                 <td>Tier 2</td>                                                         
                                            </tr>
                                            <tr>
                                                 <td>
                                                     <select name="reason1a" id="reason1a" class="dropdown" onchange="getreason2(this.value,'','1');databind(this.name,this.value);">
                                                         <option value="">-Select Reason-</option>               
                                                        
                                                         <option value="2" >Complaint</option>
                                                        
                                                         <option value="1" >Enquiry</option>
                                                        
                                                     </select>
                                                 </td>
                                                 <td class="tableinputcell">
                                                         <div id="divreason1b"></div>
                                                 </td>
                                                 <td class="tableinputcell">
                                                         <div id="divreason1c"></div>
                                                 </td>                                                                   
                                            </tr>
                                            <tr>
                                                  <td>
                                                       <select name="reason2a" id="reason2a" class="dropdown" onchange="getreason2(this.value,'','2');databind(this.name,this.value);">
                                                             <option value="">-Select Reason-</option>               
                                                             
                                                             <option value="2" >Complaint</option>
                                                             
                                                             <option value="1" >Enquiry</option>
                                                               
                                                       </select>
                                                  </td>
                                                  <td class="tableinputcell">
                                                          <div id="divreason2b"></div>
                                                  </td>
                                                  <td class="tableinputcell">
                                                          <div id="divreason2c"></div>
                                                  </td>                                                                   
                                            </tr>
                                              <tr>
                                                    <td>
                                                         <select name="reason3a" id="reason3a" class="dropdown" onchange="getreason2(this.value,'','3');databind(this.name,this.value);">
                                                              <option value="">-Select Reason-</option>               
                                                                 
                                                              <option value="2" >Complaint</option>
                                                                 
                                                              <option value="1" >Enquiry</option>
                                                                 
                                                         </select>
                                                    </td>
                                                    <td class="tableinputcell">
                                                            <div id="divreason3b"></div>
                                                    </td>
                                                    <td class="tableinputcell">
                                                            <div id="divreason3c"></div>
                                                    </td>                                                                   
                                            </tr>
                                             <tr>
                                                 <td>
                                                       <select name="reason4a" id="reason4a" class="dropdown" onchange="getreason2(this.value,'','4');databind(this.name,this.value);">
                                                        	<option value="">-Select Reason-</option>               
                                                                                
                                                             <option value="2" >Complaint</option>
                                                                                
                                                             <option value="1" >Enquiry</option>
                                                                                
                                                        </select>
                                                  </td>
                                                  <td class="tableinputcell">
                                                             <div id="divreason4b"></div>
                                                   </td>
                                               	   <td class="tableinputcell">
                                                              <div id="divreason4c"></div>
                                                   </td>                                                                   
                                              </tr>
                                              <tr>
                                                    <td>
                                                           <select name="reason5a" id="reason5a" class="dropdown" onchange="getreason2(this.value,'','5');databind(this.name,this.value);">
                                                               <option value="">-Select Reason-</option>               
                                                                   
                                                               <option value="2" >Complaint</option>
                                                                   
                                                               <option value="1" >Enquiry</option>
                                                                   
                                                           </select>
                                                      </td>
                                                      <td class="tableinputcell">
                                                              <div id="divreason5b"></div>
                                                      </td>
                                                      <td class="tableinputcell">
                                                              <div id="divreason5c"></div>
                                                       </td>                                                                   
                                               </tr>
                                       </table>
	
									</td>
								</tr>

								<tr>
									<td class="tablecaptioncell" height="100%" colspan="100%">Remarks</td>
								</tr>
								<tr>
									<td class="tableinputcell" colspan="100%">
										<textarea rows="10" cols="90" class="textaria" name="description" onBlur="databind(this.name,this.value);"></textarea>
									</td>
								</tr>
								
								<tr>
									<td class="tableinputcell" colspan="100%">
										
									</td>
								</tr>
								<tr>
									<td colspan="100%">
								
										<table width="100%" border="0">		
											<tr>
												<td>
													<table width="100%" align="left" border="0">
														<tr>
															<td>
																<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
																	<tr>
																		<td class="tabledatacel1">Status</td>
																		<td class="tabledatacel1">Caller Number</td>
																		
																		<td class="tabledatacel1">Description </td>
																		<td class="tabledatacel1">Name Agent</td>
																		<td class="tabledatacel1">Date Time</td>
																		<td class="tabledatacel1">Print</td>
																	</tr>	
																</table>							
															</td>						
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="100%" height="230px">
								</tr>
							</table>
							<br>
							<table width="98%" align="center" cellpadding="0" cellspacing="0" border="0" height="75px">
								<tr>
									<td align="right" valign="bottom">
										<INPUT type="submit" name="submit" class="buttonsubmit"  value="Submit New">
									</td>
								</tr>
							</table>							
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	
</body>

<script LANGUAGE="JavaScript">

        getreason2('','','1');
        getreason2('','','2');
        getreason2('','','3');
        getreason2('','','4');
        getreason2('','','5');


        getreason3('','','1');
        getreason3('','','2');
        getreason3('','','3');
        getreason3('','','4');
        getreason3('','','5');


	displaydepartment('');
</script>


</html>

			
		

