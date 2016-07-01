<cftransaction>
	
<!--- 
REV 0. upgrade version 2015

	1. formhdrid replaces doc_id,ori_id,maxid
	2. in edit, update the entrydate,entryby after insert
	3. define clearly docaction & module for edit purposes
	4. insertdet with returning trans_no
	
	
	
	SQL changes :
	
	alter table stdjournalhdr add primary key (id);
	alter table stdjournaldet add primary key (rowno);
	alter table stdjournaldet add constraint fk_stdjournaldet_id foreign key (id) references stdjournalhdr (id);

--->
	
	
	
<cfif fuseaction eq "generate">

	<cfquery name="gethdrid" datasource="#dbname#">
		select nextval('seq_stdjournalhdr_id') as nextid 
	</cfquery>
	<cfset formhdrid = gethdrid.nextid>

	<cfquery name="inserthdr" datasource="#dbname#">
		insert into stdjournalhdr_temp
		(id,enteredby,module,entrydate,currency,rate)
		values
		('#formhdrid#','#session.v33.logno#','OP',#now()#,'0','1')
	</cfquery>
	
	<cfset formhdrid = formhdrid>
	<cfset transno = 0>
	<cfset docaction = "generate">

<cfelseif fuseaction eq "edit">

	<cfquery name="deletedet" datasource="#dbname#">
		delete from customer_temp where id =  '#custid#'
	</cfquery> 
	
	<cfquery name="inserthdr" datasource="#dbname#">
		insert into customer_temp select * from customer where id = '#custid#'
	</cfquery> 


</cfif>	

</cftransaction>
