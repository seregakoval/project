<cfswitch expression="#fuseaction#">
	
	<cfcase value="generate">
		<cfinclude template="act_initialize.cfm">
		<cfinclude template="dsp_tabmain.cfm">
	</cfcase>
	
	<cfcase value="addnewitem">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_tab2.cfm">
	</cfcase>
	
	<cfcase value="editlineitem">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_tab2.cfm">
	</cfcase>
	
	<cfcase value="deleteitem">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_tab2list.cfm">
	</cfcase>
	
	<cfcase value="edit">
		<cfinclude template="act_initialize.cfm">
		<cfinclude template="dsp_editprofile.cfm">
	</cfcase>
	
	<cfcase value="submit">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_profile.cfm">
	</cfcase>
	
	<cfcase value="delete">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_mainpagelist.cfm">
	</cfcase>
	
	<cfcase value="cancel">
		<cfinclude template="act_formdata.cfm">
		<cfinclude template="dsp_mainpagelist.cfm">
	</cfcase>
	
	<cfcase value="viewdetail">
		<cfinclude template="dsp_preview.cfm">
	</cfcase>
	
	<cfdefaultcase>
		<cfinclude template="dsp_mainpage.cfm">
	</cfdefaultcase>
</cfswitch>
