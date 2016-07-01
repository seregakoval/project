<cfif isdefined("fuseaction")>
	<cfswitch expression="#fuseaction#">

		<cfcase value="deletemainlevel">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_searchlist.cfm">
		</cfcase>
		<cfcase value="updatemainlevel">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage.cfm">
		</cfcase>
		<cfcase value="submitmainlevel">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage.cfm">
		</cfcase>


		<cfcase value="deletemainitem">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_searchlist1.cfm">
		</cfcase>
		<cfcase value="updatemainitem">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage1.cfm">
		</cfcase>
		<cfcase value="submitmainitem">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage1.cfm">
		</cfcase>


		<cfcase value="deletemaingroup">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_searchlist2.cfm">
		</cfcase>
		<cfcase value="updatemaingroup">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage2.cfm">
		</cfcase>
		<cfcase value="submitmaingroup">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage2.cfm">
		</cfcase>


		<cfcase value="deletemaincate">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_searchlist3.cfm">
		</cfcase>
		<cfcase value="updatemaincate">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage3.cfm">
		</cfcase>
		<cfcase value="submitmaincate">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_right_mainpage3.cfm">
		</cfcase>

		<cfcase value="newitem">
			<cfinclude template="act_initialize.cfm">
			<cfinclude template="dsp_tabmain.cfm">
		</cfcase>
		<cfcase value="submititemcate">
			<cfinclude template="act_formdata.cfm">
		</cfcase>
		<cfcase value="edititem">
			<cfinclude template="act_initialize.cfm">
			<cfinclude template="dsp_tabmain.cfm">
		</cfcase>
		<cfcase value="updateitemcate">
			<cfinclude template="act_formdata.cfm">
		</cfcase>
		<cfcase value="deleteitemcate">
			<cfinclude template="act_formdata.cfm">
			<cfinclude template="dsp_searchlist4.cfm">
		</cfcase>
		
		<cfcase value="export">
			<cfinclude template="dsp_export.cfm">
		</cfcase>
		
		<cfcase value="changeunit">
			<cfinclude template="dsp_changeunit.cfm">
		</cfcase>
		<cfcase value="updateunit">
			<cfinclude template="act_formdata.cfm">
		</cfcase>

		<cfdefaultcase>
			<cfinclude template="dsp_mainpage.cfm">
		</cfdefaultcase>
	</cfswitch>
<cfelse>
	<cfinclude template="dsp_mainpage.cfm">
</cfif>