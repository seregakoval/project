<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../newcss3acc.css">
	<script type="text/javascript" src="../../component.js"></script>
	<script>
		function edit(formhdrid){
			powindow = window.open('index.cfm?fuseaction=edit&journaltype=' + '&formhdrid=' + formhdrid,'powindow','width=1120,height=600,top=20,left=50,scrollbars=no,resizable=yes,status=no');
			powindow.window.focus();
		}	
		
		function topWindow(url){
			powindow = window.open(url,'powindow','width=1120,height=600,top=20,left=50,scrollbars=yes,resizable=yes,status=no');
			powindow.window.focus();
		}
		
		function deleterecord(del)
		{	
			if (confirm("Delete This Record?")){			
				document.location = "index.cfm?thispagenumber=1&fuseaction=delete&del=" + del ;
			}
		}
		
		function cancelrecord(del)
		{	
			if (confirm("Cancel This Record?")){			
				document.location = "index.cfm?thispagenumber=1&fuseaction=cancel&del=" + del ;
			}
		}
	</script>
</head>
<cfoutput>
<cfparam name="journaltype" default="OP"> <!--- ***CHANGE THIS ACORDING TO YOUR JOURNAL TYPE --->
<cfparam name="searchpronm" default="">
<cfparam name="searchpro" default="">
<cfparam name="searchpart" default="">
<cfparam name="searchby" default="0">
<cfparam name="dntype" default="1">
<cfparam name="docno" default="">
<cfparam name="datetype" default="entry">
<cfparam name="orderby" default="">
<cfparam name="checkdate" default="#dateformat(createdate(year(now()),month(now()),1),"dd-mm-yyyy")#">
<cfparam name="checkdate1" default="#dateformat(now(),"dd-mm-yyyy")#">


<cfif datetype neq "" and checkdate neq "" and checkdate1 neq "">
	<cfset date1=createdatetime(listgetat(checkdate,3,"-"),listgetat(checkdate,2,"-"),listgetat(checkdate,1,"-"),0,0,0)>
	<cfset date2=createdatetime(listgetat(checkdate1,3,"-"),listgetat(checkdate1,2,"-"),listgetat(checkdate1,1,"-"),23,59,59)>

	<cfset compare=datecompare(date2,date1)>
	<cfif compare EQ -1>
		<script>
			alert("Selected [To Date] Earlier Than [From Date].");
		</script>
	</cfif>
<cfelse>
	<cfset date1=now()>
	<cfset date2=now()>
</cfif>

<cfset setskip = (global_accsetlimit * (thispagenumber - 1))><!--- DON'T CHANGE --->

<cfquery name="getRecord" datasource="#dbName#">
	select distinct stdjournalhdr.id, stdjournalhdr.entrydate, stdjournalhdr.postdate,
	stdjournalhdr.journaldate,login.loginid,stdjournalhdr.status,
	stdjournalhdr.journalno, stdjournaldet.trans_no
	from stdjournalhdr,login, stdjournaldet
	where stdjournalhdr.id=stdjournaldet.id
	and stdjournalhdr.enteredby=login.logno
	
	<cfif datetype is "entry">
		AND (stdjournalhdr.entrydate between #date1# AND #date2#)
	<cfelseif datetype is "inv">
		AND (stdjournalhdr.journaldate between #date1# AND #date2#)
	<cfelseif datetype is "post">
		AND (stdjournalhdr.postdate between #date1# AND #date2#)
	</cfif>
	
	<cfif searchpro is not "" >
		AND stdjournaldet.projectid ='#searchpro#'
	</cfif>
	
	<cfif dntype is "1">
		<cfif docno is not "">
			and upper(stdjournalhdr.journalno) LIKE '%#ucase(trim(docno))#%'
		</cfif>
	<cfelseif dntype is "trn">
		<cfif docno is not "">
			and stdjournaldet.trans_no = '#val(trim(docno))#'
		</cfif>	
	</cfif>
	
	<cfif searchby is "0">
		and stdjournalhdr.enteredby='#session.v33.logno#'
	</cfif>
	
	order by stdjournaldet.trans_no desc

</cfquery> 

<cfquery name="getst" datasource="#dbname#">
	select id,paystatus from stdjournaldet
	where (paystatus in ('1', '2')
	or osstatus in ('1', '2') )
</cfquery>
<cfset idlist = valuelist(getst.id,"|")>
<cfset stlist = valuelist(getst.paystatus,"|")>
<!--- <cfdump var="#getRecord#" > --->
<cfset totalpages=Ceiling(getRecord.recordcount/global_accsetlimit)><!--- DON'T CHANGE --->
<cfset startrow = (setskip + 1)><!--- DON'T CHANGE --->
<cfset endrow = (startrow + global_accsetlimit)><!--- DON'T CHANGE --->
<body class="mainpage">
<form name="itemform" method="post" action="">
<input type="hidden" name="thispagenumber" value="#thispagenumber#">
<table class="datatable" style="width:100%;">
	<tr>
		<td class="dataname" style="width:30px;">&nbsp;</td>
		<td class="dataname" style="width:300px;text-align:left;">Description</td>
		<td class="dataname" style="width:100px;">Journal Date</td>
		<td class="dataname" style="width:100px;">Entry By</td>
		<td class="dataname" style="width:100px;">Entry Date</td>
		<td class="dataname" style="width:100px;">Status</td>
		<td class="dataname">&nbsp;</td>
		<td class="dataname" style="width:100px;">Action</td>
	</tr>
	<cfloop query="getRecord" startrow="#startrow#" endrow="#endrow#">
		<cfif getRecord.status EQ 1>
			<cfset DocStatus = "Saved">
		<cfelseif getRecord.status EQ 5>
			<cfset DocStatus = "Cancelled">
		<cfelse>
			<cfset DocStatus = "Submitted">
		</cfif>
		
		<cfset findst = listfind(idlist,getRecord.id,"|")>
		<tr>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:left;">&nbsp;</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:left;">#getRecord.journalno#</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">#dateformat(getRecord.journaldate,global_dateformat)#</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">#htmleditformat(getRecord.loginid)#</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">#dateformat(getRecord.entrydate,global_dateformat)#</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">#DocStatus#</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">&nbsp;</td>
			<td class="datavalue_#getRecord.currentrow%2#" style="text-align:center;">
				
				<cfif findst EQ "0" and getRecord.status neq 5>
					<img src="../../images/newimg/edit8.png" title="Edit (#getRecord.journalno#)" class="imgtoplink" onclick="edit('#getRecord.id#');">
				<cfelse>
					<img src="../../images/newimg/editoff.png" title="Non Editable (#getRecord.journalno#)" class="imgtoplink">
				</cfif>
				<img src="/symphony/v33/images/newimg/view.png" class="imgtoplink" title="View" onclick="topWindow('index.cfm?fuseaction=viewdetail&formhdrid=#getRecord.id#&journaltype=#journaltype#');">
				<img src="/symphony/v33/images/newimg/dele.png" class="imgtoplink" title="Delete this record" onclick="deleterecord('#getRecord.id#')">
				<img src="/symphony/v33/images/newimg/cancel1.png" class="imgtoplink" title="Cancel this record" onclick="cancelrecord('#getRecord.id#')">
			</td>
		</tr>
	</cfloop>
	<cfif totalpages gt 1><!--- START PAGINATION THIS LINE MUST BE THE LAST LINE IN TABLE--->
		<tr><!--- DON'T CHANGE BELOW CORDING --->
			<td class="datavalue_#((getRecord.RecordCount+1)%2)#" colspan="8">
				<table style="width:100%;text-align:center;margin-left:auto;margin-right:auto;">
					<tr>
						<td style="text-align:center;font-weight:bold;vertical-align:middle;">
							<cfif thispagenumber gt 1>
								<img src="/symphony/v33/images/newimg/prev.png" class="imgtoplink2" title="Previous" onclick="parent.search('#thispagenumber-1#');">
							<cfelse>
								<img src="/symphony/v33/images/newimg/prev.png" class="imgtoplink2" title="Previous">		 			
							</cfif>
							&nbsp;&nbsp;
							#thispagenumber# of #totalpages#
							&nbsp;&nbsp;
							<cfif thispagenumber lt totalpages>
								<img src="/symphony/v33/images/newimg/next.png" class="imglink" title="Previous" onclick="parent.search('#thispagenumber+1#');">
							<cfelse>
								<img src="/symphony/v33/images/newimg/next.png" class="imglink" title="Previous">					
							</cfif>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</cfif><!--- END PAGINATION THIS LINE MUST BE THE LAST LINE IN TABLE--->
</table>
</form>
</body>
</cfoutput>
</html>