<cfif isdefined("fuseaction")>
	<cfswitch expression="#fuseaction#">
		<cfcase value="createsales">
			<cfinclude template="act_initialize.cfm">
			<cfinclude template="dsp_posmain_new.cfm">
		</cfcase>
		
		<cfcase value="selectpackage">
			<cfinclude template="package_initialize.cfm">
		</cfcase>
		
	</cfswitch>
</cfif>