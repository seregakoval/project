<cftransaction>

	<cfif fuseaction eq "deletemainlevel">
		<cfquery name="delete" datasource="#dbname#">
			delete from mainlevel
			where id='#formhdrid#'
		</cfquery>
		<script>
			parent.parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "updatemainlevel">
		<cfquery name="update" datasource="#dbname#">
			update mainlevel
			set description='#trim(descp)#',
				code = '#trim(code)#'
			where id='#docid#'
		</cfquery>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "submitmainlevel">
		<cf_v33_getmax columnname="id" dbname="#dbname#" tablename="mainlevel">
		<cfset maxid = maxno>

		<!--- <cfif trim(code) is "">
			<cf_v33_getmax columnname="code" dbname="#dbname#" tablename="mainlevel">
			<cfset code = maxno>
		</cfif>	 --->

		<!--- TO GET newref --->
		<cfinclude template="act_autonumber.cfm">

		<cfquery name="insert" datasource="#dbname#">
			insert into mainlevel
			(id,description,code,refnumber)
			values
			('#maxid#','#trim(descp)#','#trim(newref)#','#newno#')
		</cfquery>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>


	<cfif fuseaction eq "deletemainitem">
		<cfquery name="delete" datasource="#dbname#">
			delete from mainitem
			where id='#formhdrid#'
		</cfquery>
		<script>
			parent.parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "updatemainitem">
		<cfquery name="update" datasource="#dbname#">
			update mainitem
			set description='#trim(descp)#',
				code = '#trim(code)#'
			where id='#docid#'
		</cfquery>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "submitmainitem">
		<cf_v33_getmax columnname="id" dbname="#dbname#" tablename="mainitem">
		<cfset maxid = maxno>

		<!--- <cfif trim(code) is "">
			<cf_v33_getmax columnname="code" dbname="#dbname#" tablename="mainitem">
			<cfset code = maxno>
		</cfif> --->

		<!--- TO GET newref --->
		<cfinclude template="act_autonumber1.cfm">

		<cfquery name="insert" datasource="#dbname#">
			insert into mainitem
			(id,description,code,levelid,refnumber)
			values
			('#maxid#','#trim(descp)#','#trim(newref)#','#parentid#','#newno#')
		</cfquery>
		<script>
			//alert(parent.location);
			<cfoutput>
			parent.refreshactiveNode();
			</cfoutput>
		</script>
	</cfif>


	<cfif fuseaction eq "deletemaingroup">
		<cfquery name="delete" datasource="#dbname#">
			delete from maingroup
			where groupid='#formhdrid#'
		</cfquery>
		<script>
			parent.parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "updatemaingroup">
		<cfquery name="update" datasource="#dbname#">
			update maingroup
			set description='#trim(descp)#',
				scid='#supcategory#',
				code = '#trim(code)#'
			where groupid='#docid#'
		</cfquery>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "submitmaingroup">
		<cf_v33_getmax columnname="groupid" dbname="#dbname#" tablename="maingroup">
		<cfset maxid = maxno>

		<!--- <cfif trim(code) is "">
			<cf_v33_getmax columnname="code" dbname="#dbname#" tablename="maingroup">
			<cfset code = maxno>
		</cfif> --->

		<!--- TO GET newref --->
		<cfinclude template="act_autonumber2.cfm">

		<cfquery name="insert" datasource="#dbname#">
			insert into maingroup
			(groupid,description,scid,mid,code,refnumber)
			values
			('#maxid#','#trim(descp)#',<cfif supcategory NEQ "">'#supcategory#'<cfelse>null</cfif>,'#parentid#','#trim(newref)#','#newno#')
		</cfquery>

		<cfquery name="check" datasource="#dbname#">
			select * from suppcate
			where upper(description) = '#ucase(descp)#'
		</cfquery>

		<cfif check.recordcount eq 0>
			<cf_v33_getmax columnname="scid" dbname="#dbname#" tablename="suppcate">
			<cfset maxscid = maxno>
			<cfquery name="insertsupp" datasource="#dbname#">
				insert into suppcate
				(scid,description,code)
				values
				('#maxscid#','#trim(descp)#','#trim(code)#')
			</cfquery>
		</cfif>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>


	<cfif fuseaction eq "deletemaincate">
		<cfquery name="delete" datasource="#dbname#">
			delete from maincate
			where mainid='#formhdrid#'
		</cfquery>
		<script>
			parent.parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "updatemaincate">
		<cfquery name="update" datasource="#dbname#">
			update maincate
			set description='#trim(descp)#',
				costmethod='#costmethod#',
				groupid='#parentid#',
				code = '#trim(code)#',
				costid = '#trim(costid1)#',
				defaultsuppllytax = <cfif trim(defaultsuppllytax) neq "">'#trim(defaultsuppllytax)#'<cfelse>null</cfif> ,
				defaultpurchasetax = <cfif trim(defaultpurchasetax) neq ""> '#trim(defaultpurchasetax)#'<cfelse>null</cfif>
			where mainid='#docid#'
		</cfquery>
		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>

	<cfif fuseaction eq "submitmaincate">
		<cf_v33_getmax columnname="mainid" dbname="#dbname#" tablename="maincate">
		<cfset maxid = maxno>

		<!--- <cfset code = maxid> --->
		<!--- TO GET newref --->
		<cfinclude template="act_autonumber3.cfm">

		<cfquery name="insert" datasource="#dbname#">
			insert into maincate
			(mainid,groupid,description,costmethod,code,costid,defaultsuppllytax,defaultpurchasetax,refnumber)
			values
			('#maxid#','#parentid#','#trim(descp)#','#costmethod#','#trim(newref)#',<cfif costid1 NEQ "">'#costid1#'<cfelse>null</cfif>,
			<cfif trim(defaultsuppllytax) neq "">'#trim(defaultsuppllytax)#'<cfelse>null</cfif> ,
			<cfif trim(defaultpurchasetax) neq ""> '#trim(defaultpurchasetax)#'<cfelse>null</cfif>,
			'#newno#'
			)
		</cfquery>

		<script>
			parent.refreshactiveNode();
		</script>
	</cfif>



	<cfif fuseaction eq "submititemcate">

		<cfquery name="gethdr" datasource="#dbname#">
			select * from itemcate_temp
			where itemid = '#formhdrid#'
		</cfquery>

		<cfif docaction NEQ "edit">
			<cfinclude template="act_autonumber4.cfm">

			<cfquery name="updatehdr" datasource="#dbname#">
				update itemcate_temp
				set codeno = '#newref#',
				refnumber ='#newno#'
				where itemid='#formhdrid#'
			</cfquery>

			<cfquery name="inserthdr" datasource="#dbname#">
				insert into itemcate select * from itemcate_temp where itemid='#formhdrid#'
			</cfquery>


		<cfelseif docaction EQ "edit">

			<cfquery name="gethdr" datasource="#dbname#">
				select * from itemcate_temp where itemid = '#formhdrid#'
			</cfquery>
			<cfquery name="getcolumn" datasource="#dbname#">
				select column_name,data_type from information_schema.columns where table_name='itemcate'
			</cfquery>

			<cfquery name="updatepro" datasource="#dbname#">
				update itemcate set (#valuelist(getcolumn.column_name)#) =					<!--- change table name here--->
				(
				<cfloop query="getcolumn">
					<cfset thiscolval = evaluate("gethdr.#getcolumn.column_name#")>			<!--- change query name here--->
					<cfset findts = FindNoCase("timestamp",getcolumn.data_type)>
					<cfif findts EQ 0>
						<cfif trim(thiscolval) NEQ "">'#thiscolval#'<cfelse>null</cfif>
					<cfelse>
						<cfif trim(thiscolval) NEQ "">#thiscolval#<cfelse>null</cfif>
					</cfif>
					<cfif getcolumn.recordcount NEQ getcolumn.currentrow>,</cfif>
				</cfloop>
				)
				where itemid = '#formhdrid#'										<!--- change column name here--->
			</cfquery>
		</cfif>

		<script>
			//if window open from main page
			<cfoutput>
			if(top.window.opener.document.getElementById("searchframe")){
				top.window.opener.document.searchframe.location="dsp_searchlist4.cfm?thispagenumber=1&searchtype=1&parentid=#parentid#";
			}
			else{
				top.window.opener.document.location ="dsp_searchlist4.cfm?thispagenumber=1&searchtype=1&parentid=#parentid#";
			}
			</cfoutput>
			window.close();
		</script>
	</cfif>


	<cfif fuseaction eq "deleteitemcate">
		<cfquery name="delete" datasource="#dbname#">
			delete from itemcate
			where itemid='#formhdrid#'
		</cfquery>
	</cfif>
	
	
	<cfif fuseaction eq "updateunit">
		<cfquery name="update" datasource="#dbname#">
			update itemcate
				set stockunit = '#form.newunit#'
			where itemid='#formhdrid#'
			RETURNING  itemid,stockunit
		</cfquery>

		<cfquery name="update2" datasource="#dbname#">
			update inventory_hdr set unit = '#update.stockunit#' where inventory_hdr.itemid = '#update.itemid#'
		</cfquery>
		<cfquery name="update2" datasource="#dbname#">
			update inventory_det set unit = '#update.stockunit#' where inventory_det.itemid = '#update.itemid#'
		</cfquery>
		<script>
			alert("Data Change!");
			window.close();
		</script>
	</cfif>
</cftransaction>
