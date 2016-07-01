<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../css/page01.css">
    <link rel="stylesheet" href="../css/ionicons.css">
	<script type="text/javascript" src="../component.js"></script>
	<script language="javascript" src="../date_picker_a.js"></script>
	<script language="JavaScript" src="../date_format.js"></script>

   <style>
        body {
            color: #47515a;
            font-size: .8em;
            line-height: 130%;
            margin: 0;
            padding: 0;
        }

        table {
            width: 100%;
        }

        .edit_button {
            display: inline-block;
        }

        .edit_button:hover {
            cursor: pointer;
        }

        table td{
            width: 20%;
        }
    </style>

	<script>

		addCalendar("Calendar1", "Select Date", "expire_date", "itemform");
		addCalendar("Calendar2", "Select Date", "lastvisitdate", "itemform");

		<cfoutput>

		function dataupdate(currvar,currfield)
		{
			currvar = standed_escape(currvar);
			var url="databind/act_dataupdate.cfm?custid=#custid#&currvar=" + currvar + "&currfield=" + currfield ;
			//prompt('',url);
			fn_getajaxreplyxml(url)	;
		}


        function submitconfirm(){ alert('vivi , can you see this ?');
            var custid = document.itemform.custid.value;
            var url = "databind/act_formcheck.cfm?custid=" + custid;
            //var  url = "databind/test.xml";
            //prompt('',url);
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.open("GET",url,false);
            xmlhttp.send();
            xmlDoc=xmlhttp.responseXML;
            //var xmlDoc = fn_getajaxreplyxml(url);
            //alert(xmlsting);
            //xmlDoc = $.parseXML(xmlsting);

            //prompt('',xmlDoc);
            var x=xmlDoc.getElementsByTagName("returnrow");
            //alert(x);
            for (i=0;i<x.length;i++){
                    //alert(i);
                    var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
                    if(msgerror == "ok"){
                            if (confirm("Submit Document?")){
                                    document.location = "index.cfm?fuseaction=submit&custid=" + custid  + "&docaction=edit";
                            }
                    }
                    else{
                            alert(msgerror);
                    }
            }

        }


		</cfoutput>
	</script>


</head>


	<cfquery name="getcust" datasource="#dbname#">
		select * from customer_temp
		where id = '#custid#'
	</cfquery>

	<cfif getcust.recordcount EQ 0>Missing Customer <cfabort></cfif>
<body>
<cfoutput>
<form name="itemform" id="itemform" method="post" action="index.cfm" >
<input type="hidden" name="custid" value="#custid#">


	<table>
	    <thead>
	        CUSTOMER DETAILS&nbsp;&nbsp;<div class="edit_button" onclick="submitconfirm();"><i class="icon ion-edit"></i></div>
	    </thead>
	    <tr>
	        <td>Customer Name</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="name" value="#getcust.name#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	        <td>Member Prefix</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="INFNT" value="INFNT" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	    </tr>
	    <tr>
	        <td>Customer No</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="custno" value="#getcust.custno#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	        <td>Member Prefix</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="HQ00001" value="HQ00001" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	    </tr>
	    <tr>
	        <td>Name on Card</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="name_on_card" value="#getcust.name_on_card#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	        <td>Passport No</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="passport" value="#getcust.passport#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	    </tr>
	    <tr>
	        <td>IC No</td>
	        <td>:&nbsp;<input type="text" class="textboxnormal" name="ic" value="#getcust.ic#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
	        <td>First Visit</td>
	        <td>:&nbsp;<input type="Text" class="textboxnormal" name="10/08/2013" value="10/08/2013" onkeyup="DateFormat(this,this.value,event,false,'3');" onblur="DateFormat(this,this.value,event,true,'3');dataupdate(this.value,this.name);" size="10"></td>
	    </tr>

			<cfquery name="getbranch" datasource="#dbname#">
				select * from branch
			</cfquery>

		<tr>
			<td>Branch </td>
			<td>:&nbsp;
				<select name="branch" class="textboxnormal"  onchange="dataupdate(this.value,this.name);">
					<option value="">Select a branch</option>
					<cfloop query="getbranch">
						<option value="#getbranch.id#" <cfif getbranch.id EQ getcust.branch>selected</cfif> >#getbranch.description#</option>
					</cfloop>
				</select>
			</td>
			<td>Last Visit</td>
			<td>:&nbsp;<input type="Text" class="textboxnormal" name="lastvisitdate" value="#dateformat(getcust.lastvisitdate,"dd-mm-yyyy")#" onkeyup="DateFormat(this,this.value,event,false,'3');" onblur="DateFormat(this,this.value,event,true,'3');dataupdate(this.value,this.name);" size="10"></td>
		</tr>
		<!--- <tr>
			<td>Branch</td>
			<td>:&nbsp;<input type="text" class="textboxnormal" name="branch" value="#getcust.branch#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
			<td>Last Visit</td>
			<td>:&nbsp;<input type="Text" class="textboxnormal" name="lastvisitdate" value="#dateformat(getcust.lastvisitdate,"dd-mm-yyyy")#" onkeyup="DateFormat(this,this.value,event,false,'3');" onblur="DateFormat(this,this.value,event,true,'3');dataupdate(this.value,this.name);" size="10"></td>
		</tr> --->
		<tr>
		   <td>Principal Customer</td>
		   <td>:&nbsp;<input type="text" class="textboxnormal" name="" value="" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
		   <td>Expiry Date</td>
		   <td>:&nbsp;<input type="Text" class="textboxnormal" name="expire_date" value="#dateformat(getcust.expire_date,"dd-mm-yyyy")#" onkeyup="DateFormat(this,this.value,event,false,'3');" onblur="DateFormat(this,this.value,event,true,'3');dataupdate(this.value,this.name);" size="10"></td>
		</tr>
	</table>

    <hr>

     <table>
         <thead>
             CONTACT DETAILS
         </thead>
         <tr>
             <td>Address</td>
             <td colspan="3">:&nbsp;<input type="text" class="textboxnormal" name="address1" value="#getcust.address1#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Post Code</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="postcode" value="#getcust.postcode#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>City</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="city" value="#getcust.city#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>State</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="state" value="#getcust.state#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Country</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="country" value="#getcust.country#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Tel (Home)</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="phone1" value="#getcust.phone1#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Tel (Office)</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="phone2" value="#getcust.phone2#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Tel (Mobile)</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="mobile" value="#getcust.mobile#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Email</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="email" value="#getcust.email#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Fax</td>
             <td colspan="3">:&nbsp;<input type="text" class="textboxnormal" name="fax" value="#getcust.fax#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
     </table>

     <hr>

     <table>
         <thead>
             CUSTOMER ANALYSIS
         </thead>
         <tr>
             <td>Sex</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="sex" value="#getcust.sex#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Marital Status</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="marital" value="#getcust.marital#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Occupation</td>
             <td colspan="3">:&nbsp;<input type="text" class="textboxnormal" name="occupation" value="#getcust.occupation#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Race</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="race" value="#getcust.race#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Religion</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="religion" value="#getcust.religion#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Preferred Language</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="language" value="#getcust.language#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Income Range</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="income" value="#getcust.income#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
         <tr>
             <td>Notes</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="remark" value="#getcust.remark#" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
             <td>Contract Source</td>
             <td>:&nbsp;<input type="text" class="textboxnormal" name="Billboard" value="Billboard" size="30" onkeyup="dataupdate(this.value,this.name);"></td>
         </tr>
     </table>
</form>
</cfoutput>
</body>

</html>
