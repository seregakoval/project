<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<LINK rel="STYLESHEET" type="text/css" href="../../mastercss3.css">
	<script type="text/javascript" src="../../component.js"></script>

	<script>
		<cfoutput>
			function dataupdate(currvar,currfield){
				currvar = standed_escape(currvar);
				var url="databind/act_dataupdate.cfm?formhdrid=#formhdrid#&pageinfo=receivemain&currvar=" + currvar + "&currfield=" + currfield ;
				//prompt('',url);
				fn_getajaxreplyxml(url)	;
			}
		</cfoutput>
		sortitems = 1;  // Automatically sort items within lists? (1 or 0)

		function move(fbox,tbox) {
			for(var i=0; i<fbox.options.length; i++) {
				if(fbox.options[i].selected && fbox.options[i].value != "") {
					var no = new Option();
					no.value = fbox.options[i].value;
					no.text = fbox.options[i].text;
					tbox.options[tbox.options.length] = no;
					fbox.options[i].value = "";
					fbox.options[i].text = "";
	  			}
			}
			BumpUp(fbox);
			if (sortitems) SortD(tbox);
		}

		function BumpUp(box)  {
			for(var i=0; i<box.options.length; i++) {
				if(box.options[i].value == "")  {
					for(var j=i; j<box.options.length-1; j++)  {
						box.options[j].value = box.options[j+1].value;
						box.options[j].text = box.options[j+1].text;
					}
					var ln = i;
					break;
	  			}
			}
			if(ln < box.options.length)  {
				box.options.length -= 1;
				BumpUp(box);
		  		}
		}

		function SortD(box)  {
			var temp_opts = new Array();
			var temp = new Object();
			for(var i=0; i<box.options.length; i++)  {
				temp_opts[i] = box.options[i];
			}
			for(var x=0; x<temp_opts.length-1; x++)  {
				for(var y=(x+1); y<temp_opts.length; y++)  {
					if(temp_opts[x].text > temp_opts[y].text)  {
						temp = temp_opts[x].text;
						temp_opts[x].text = temp_opts[y].text;
						temp_opts[y].text = temp;

						temp1 = temp_opts[x].value;
						temp_opts[x].value = temp_opts[y].value;
						temp_opts[y].value = temp1;
	     			}
	  			}
			}
			for(var i=0; i<box.options.length; i++)  {
				box.options[i].text = temp_opts[i].text;
		  		}
		}

	</script>
</head>
<cfoutput>
<cfquery name="retrieve" datasource="#dbname#">
	select * from itemcate_temp
	where
	<cfif formhdrid neq "">
		itemid='#formhdrid#'
	<Cfelse>
		false
	</cfif>
</cfquery>
<cfquery name="getmain" datasource="#dbname#">
	select * from maincate
	where mainid ='#parentid#'
	order by mainid
</cfquery>
<cfquery name="getmanufac" datasource="#dbname#">
	select * from manufacturer
	<!--- where groupid = '#getmain.groupid#' --->
	order by description
</cfquery>
<body class="tabentrypage">
<form name="itemform" id="itemform" method="post" action="index.cfm" style="height:100%;">
	<input type="hidden" name="manufacturer" value="">
	<table class="entrytitletable2">
		<tr>
			<td class="formnamecell" style="vertical-align:text-top;padding-top:4px;">Manufacturer</td>
			<td class="formnamecell" style="width:5px;vertical-align:text-top;">:</td>
			<td class="formvaluecell"><!--- ***CHANGEHERE : change colspan accordingly --->
				<table><!--- manufacturer select table start --->
					<tr>
						<td>
							<cfif #getmanufac.recordcount# is not "0">
								<select name="allmanu" size="6" multiple display="hi" class="textbox1" style="width:220px;">
									<CFLOOP query="getmanufac">
										<cfset got = "0" >
										<CFLOOP list="#retrieve.manufacturer#" index="looper">
											<cfif #looper# eq #getmanufac.id# >
												<cfset got = "1" >
											</cfif>
										</CFLOOP>
										<cfif got eq "0">
											<option value="#getmanufac.id#">#htmleditformat(getmanufac.description)#</option>
										</cfif>
									</CFLOOP>
								<select>
							<cfelse>
								<select name="allmanu" size="6" multiple value="valluser" display="hi" class="textbox1" style="width:180px;">
									<option value="">No Manufacturer Available</option>
								<select>
							</cfif>
						</td>
						<td>
							<input type="Button" name="rev" class="button3" value=">>" onclick="move(this.form.allmanu,this.form.selmanu);"> <BR>
					  		<input type="Button" name="add" class="button3" onclick="move(this.form.selmanu,this.form.allmanu);" value="<<">
						</td>
						<td>
							<select name="selmanu" size="6" multiple display="hi" class="textbox1" style="width:180px;">
								<CFLOOP list="#retrieve.manufacturer#" index="looper">
								<cfquery name="getfac" datasource="#dbname#">
									select * from manufacturer
									where id = '#looper#'
								</cfquery>
								<option value="#getfac.id#">#htmleditformat(getfac.description)#</option>
								</CFLOOP>
							<select>
						</td>
					</tr>
				</table><!--- manufacturer select table end --->
			</td>
		</tr>
	</table>
</form>
</body>
</cfoutput>
</html>
