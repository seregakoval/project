<cfsilent>
<cfset rtndata="">
<cfif isdefined("nodeid") and trim(nodeid) neq "">
	<cfset itmlavel = listgetAt(trim(nodeid),2,"_")><!--- GET LAVEL FROM NODE ID --->
	<cfset hdrid = listgetAt(trim(nodeid),3,"_")><!--- GET PARENT ID FROM NODE ID --->

	<!--- LOAD LAVEL 1 ITEAMS --->
	<cfif trim(itmlavel) eq "l1"><!--- IF LAVEL ONE ITEMS --->
		<cfquery name="getl1" datasource="#dbname#" >
			select * from mainitem_pos
			WHERE levelid ='#hdrid#'
			and itemtype = '2'
			order by description
		</cfquery>
		<cfset rtndata="<ul>"><!--- START OF NEW UNORDER LIST --->
		<cfloop query="getl1">
			<cfquery name="getchildcount" datasource="#dbname#"> <!--- *****CHANGE HERE count number of child for this parent node only from clouse and where clouse--->
				select count(*) as noofchiled
				from maingroup_pos
				where mid = '#getl1.id#'
				and itemtype = '2'
			</cfquery>
			<cfif getchildcount.noofchiled gt 0>
				<cfset cssclass="class='jstree-closed'">
			<cfelse>
				<cfset cssclass= "">
			</cfif>
			<cfset rtndata = rtndata & "<li #cssclass# id='node_l2_#getl1.id#'><a href='##' onclick='loaddataframe(2,#getl1.id#);'>#getl1.description#</a></li>"><!--- *****CHANGE HERE make sure to define unique id --->
		</cfloop>
		<cfset rtndata = rtndata & "</ul>"> <!--- END OF NEW UNORDER LIST --->

	<!--- LOAD LAVEL 2 ITEAMS --->
	<cfelseif trim(itmlavel) eq "l2">
		<cfquery name="getl2" datasource="#dbname#" >
			select * from maingroup_pos
			WHERE mid ='#hdrid#'
			and itemtype = '2'
			order by description
		</cfquery>
		<cfset rtndata="<ul>"><!--- START OF NEW UNORDER LIST --->
		<cfloop query="getl2">
			<cfquery name="getchildcount" datasource="#dbname#"> <!--- *****CHANGE HERE count number of child for this parent node only from clouse and where clouse--->
				select count(*) as noofchiled
				from  maincate_pos
				where groupid = '#getl2.groupid#'
				and itemtype = '2'
			</cfquery>
			<cfif getchildcount.noofchiled gt 0>
				<cfset cssclass="class='jstree-closed'">
			<cfelse>
				<cfset cssclass= "">
			</cfif>
			<cfset rtndata = rtndata & "<li #cssclass# id='node_l3_#getl2.groupid#'><a href='##' onclick='loaddataframe(3,#getl2.groupid#);'>#getl2.description#</a></li>"><!--- *****CHANGE HERE make sure to define unique id --->
		</cfloop>
		<cfset rtndata = rtndata & "</ul>"> <!--- END OF NEW UNORDER LIST --->

	<!--- LOAD LAVEL 3 ITEAMS --->
	<cfelseif trim(itmlavel) eq "l3">
		<cfquery name="getl3" datasource="#dbname#" >
			select * from maincate_pos
			WHERE groupid ='#hdrid#'
			and itemtype = '2'
			order by description
		</cfquery>
		<cfset rtndata="<ul>"><!--- START OF NEW UNORDER LIST --->
		<cfloop query="getl3">
			<cfset rtndata = rtndata & "<li id='node_l4_#getl3.mainid#'><a href='##' onclick='loaddataframe(4,#getl3.mainid#);'>#getl3.description#</a></li>"><!--- *****CHANGE HERE make sure to define unique id --->
		</cfloop>
		<cfset rtndata = rtndata & "</ul>"> <!--- END OF NEW UNORDER LIST --->

	</cfif>

<cfelse>
	<cfquery name="getmainitem" datasource="#dbname#" >
		select * from mainlevel_pos
		where itemtype = '2'
		order by description
	</cfquery>


	<cfset rtndata="<ul>"><!--- START OF NEW UNORDER LIST --->
	<cfloop query="getmainitem">
		<cfquery name="getchildcount" datasource="#dbname#"> <!--- *****CHANGE HERE count number of child for this parent node only from clouse and where clouse--->
			select count(*) as noofchiled
			from mainitem_pos
			where levelid = '#getmainitem.id#'
			and itemtype = '2'
		</cfquery>
		<cfif getchildcount.noofchiled gt 0>
			<cfset cssclass="class='jstree-closed'">
		<cfelse>
			<cfset cssclass= "">
		</cfif>
		<cfset rtndata = rtndata & "<li #cssclass# id='node_l1_#getmainitem.id#'><a href='##' onclick='loaddataframe(1,#getmainitem.id#);'>#getmainitem.description#</a></li>"><!--- *****CHANGE HERE make sure to define unique id --->
	</cfloop>
	<cfset rtndata = rtndata & "</ul>"> <!--- END OF NEW UNORDER LIST --->
</cfif>


</cfsilent><cfoutput>#rtndata#</cfoutput>
