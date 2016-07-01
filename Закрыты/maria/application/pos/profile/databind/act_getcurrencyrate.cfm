<cfsilent><cfquery name="getrate" datasource="#dbname#">
		select * 
		from currency
		where 
		<cfif isdefined("ccid") and trim(ccid) neq "">
			ccid='#ccid#'
		<cfelse>
			false
		</cfif>
	</cfquery>
	<cfif getrate.RecordCount eq 1>
		<cfquery name="update" datasource="#dbname#">
			update stdjournalhdr_temp
			set currency ='#ccid#',
			rate ='#getrate.rate#'
			where id ='#formhdrid#'
		</cfquery>
		<cfquery name="updatedet" datasource="#dbname#">
			update stdjournaldet_temp
			set debitglamt = debit * #getrate.rate#,
			creditglamt = credit * #getrate.rate#,
			gst_amount_debit = gst_doc_debit  * #getrate.rate#,
			gst_amount_credit = gst_doc_credit * #getrate.rate#,
			finaltotal_debit = finaldoc_debit * #getrate.rate#,
			finaltotal_credit = finaldoc_credit * #getrate.rate#			
			where id = '#formhdrid#'
		</cfquery>
	</cfif>
</cfsilent><cfcontent  type="application/xml" reset="true" ><?xml version="1.0" encoding="UTF-8"?><cfoutput>
<currency>
	<ccid>#xmlformat(ccid)#</ccid>
	<rate>#xmlformat(getrate.rate)#</rate>	
</currency>
</cfoutput>