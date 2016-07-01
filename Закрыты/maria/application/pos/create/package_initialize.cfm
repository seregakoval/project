<cfquery name="getpackage" datasource="#dbname#">
	select * from promotion_hdr where packageno = '#itemid#'
</cfquery>
<!--- THIS TABLE TO STORE THE FORMULA SELECTION --->
<cfquery name="deletesession" datasource="#dbname#">
	delete from sales_tmp_promotion where refid='#nextid#'
</cfquery>
<!--- THIS TABLE TO STORE THE FINAL ITEM SELECTED --->
<cfquery name="deletesession" datasource="#dbname#">
	delete from sales_tmp_promotion_item where salesid='#nextid#'
</cfquery>
<cfquery name="insertsession" datasource="#dbname#">
	insert into sales_tmp_promotion
	(id,refid,packageno,formula,symbol,status)
	values
	(nextval('seq_sales_tmp_promotion_id'),'#nextid#','#itemid#','#getpackage.formula#',null,1)
</cfquery>

<script language="JavaScript">
	//window.parent.loadwindow2("package_packageinfo.cfm?" + new Date().getTime(),550,400);
	//parent.parent.loadwindow2("package_packageinfo.cfm?" + new Date().getTime(),650,400);
</script>

<cfinclude template="package_selectcontrol.cfm">