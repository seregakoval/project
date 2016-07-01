<cfquery name="getnext" datasource="#dbname#">
	select nextval('seq_sales_tmp_promotion_id') as id
</cfquery>
<cfquery name="insertsession" datasource="#dbname#">
	insert into sales_tmp_promotion
	(id,refid,packageno,formula,symbol,status,levelnumber)
	values
	('#getnext.id#','#nextid#','#packageno#','#opt#',null,1,'#levelnumber#.#getnext.id#')
</cfquery>

<cflocation url="package_selectcontrol.cfm?nextid=#nextid#">