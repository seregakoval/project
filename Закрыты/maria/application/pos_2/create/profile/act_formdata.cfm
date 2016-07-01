<cftransaction>
<cfif fuseaction eq "addnewitem">
	<cfquery name="insertdet" datasource="#dbname#">
		insert into stdjournaldet_temp
		(rowno,id,chartid,codeid,debit,debitglamt,credit,creditglamt,descp,projectid,part_no,trans_no,partyid,
		gst_accid,gst_percent,gst_amount_debit,gst_amount_credit,finaltotal_debit,finaltotal_credit,
		gst_doc_debit,gst_doc_credit,finaldoc_debit,finaldoc_credit)
		values
		(nextval('seq_stdjournaldet_rowno'),'#formhdrid#','#val(form.accid)#','#val(form.chargeid)#',
		'#val(form.debit)#','#val(form.gldebit)#','#val(form.credit)#','#val(form.glcredit)#','#form.remark#',
		'#val(form.projectid)#','#val(form.part_no)#','#transno#','#val(form.partyid)#',
		<cfif form.gst_acccode neq "">'#form.gst_acccode#'<cfelse>null</cfif>,
		'#val(form.gst_percent)#',
		'#val(form.gst_amount_debit)#','#val(form.gst_amount_credit)#',
		'#val(form.finaltotal_debit)#','#val(form.finaltotal_credit)#',
		'#val(form.gst_doc_debit)#','#val(form.gst_doc_credit)#',
		'#val(form.finaldoc_debit)#','#val(form.finaldoc_credit)#')
	</cfquery> 	
	
	
<cfelseif fuseaction eq "editlineitem">
	<cfquery name="update" datasource="#dbname#">
		update stdjournaldet_temp
		set chartid='#val(form.accid)#',
		codeid='#val(form.chargeid)#',
		debit='#val(form.debit)#',
		debitglamt='#val(form.gldebit)#',
		credit='#val(form.credit)#',
		creditglamt='#val(form.glcredit)#',
		descp='#form.remark#',
		projectid='#val(form.projectid)#',
		part_no='#val(form.part_no)#',
		trans_no='#transno#',
		partyid='#val(form.partyid)#',
		gst_accid = <cfif form.gst_acccode neq "">'#form.gst_acccode#'<cfelse>null</cfif>,
		gst_percent = '#val(form.gst_percent)#',
		gst_amount_debit = '#val(form.gst_amount_debit)#',
		gst_amount_credit = '#val(form.gst_amount_credit)#',
		finaltotal_debit = '#val(form.finaltotal_debit)#',
		finaltotal_credit = '#val(form.finaltotal_credit)#',
		gst_doc_debit = '#val(form.gst_doc_debit)#',
		gst_doc_credit = '#val(form.gst_doc_credit)#',
		finaldoc_debit = '#val(form.finaldoc_debit)#',
		finaldoc_credit = '#val(form.finaldoc_credit)#'
		where rowno='#detid#'
	</cfquery> 

<cfelseif fuseaction eq "dupitem">

	<cfquery name="dropidx" datasource="#dbname#">
		alter table stdjournaldet_temp drop CONSTRAINT stdjournaldet_temp_pkey
	</cfquery>
	
	<cfquery name="insertdet" datasource="#dbname#">
		insert into stdjournaldet_temp select * from stdjournaldet_temp where id='#detid#'
		returning xmin
	</cfquery> 	

	<cfquery name="update" datasource="#dbname#">
		update stdjournaldet_temp 
		set id = nextval('seq_stdjournaldet_rowno')
		where xmin = '#insertdet.xmin#'
	</cfquery> 	
	
	<cfquery name="createidx" datasource="#dbname#">
		 alter table stdjournaldet_temp ADD PRIMARY KEY  (rowno);
	</cfquery>

<cfelseif fuseaction eq "deleteitem">
	<cfquery name="delete" datasource="#dbname#">
		delete from stdjournaldet_temp
		where rowno='#detid#'
	</cfquery> 
	
	
	
	
<cfelseif fuseaction eq "submit">	
	

	<cfif docaction eq "edit">

		<cfquery name="deletedet" datasource="#dbname#">
			delete from customer where id = '#custid#'
		</cfquery> 
		<cfquery name="inserthdr" datasource="#dbname#">
			insert into customer select * from customer_temp where id = '#custid#'
		</cfquery> 
		
		
	<cfelse>
		
		<cfquery name="deletedet" datasource="#dbname#">
			delete from stdjournaldet where id='#formhdrid#'
		</cfquery>
		<cfquery name="deletedet" datasource="#dbname#">
			delete from stdjournalhdr where id='#formhdrid#'
		</cfquery>
		
		<cfquery name="inserthdr" datasource="#dbname#">
			insert into stdjournalhdr select * from stdjournalhdr_temp where id = '#formhdrid#'
		</cfquery> 
		
		<cfquery name="insertdet" datasource="#dbname#">
			insert into stdjournaldet select * from stdjournaldet_temp where id = '#formhdrid#'
		</cfquery>

	</cfif>
	
	
	
<cfelseif fuseaction eq "delete">	
	<cfloop list="#del#" index="looper">
		
		<cfquery name="deletedet" datasource="#dbname#">
			delete from stdjournaldet
			where id='#looper#'
		</cfquery>
		
		<cfquery name="deletehdr" datasource="#dbname#">
			delete from stdjournalhdr
			where id='#looper#'
		</cfquery>
	</cfloop>	
<cfelseif fuseaction eq "cancel">
	<cfif del is "">
		<cfset error=1>
		<cfset msgarray=#arraynew(1)#>
		<cfset msgArray[1]="You Have Not Selected Any Item Yet.">
		<cfinclude template="../../dsp_css.cfm">
		<cfinclude template="../../dsp_error.cfm">
	</cfif>
	
	<cfloop list="#del#" index="looper">		
		<cfquery name="update" datasource="#dbname#">
			update stdjournalhdr
			set status='5'
			where id='#looper#'	
		</cfquery>	
	</cfloop>
	
	
	
</cfif>

</cftransaction>
