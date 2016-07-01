<cfset formula = replace(attributes.formula," ","","ALL")>
<cfset rerunflag = 1>
<cfset count = 0>

<!--- REMOVE THE UNNECESSARY BRACKET --->
<cfloop condition="rerunflag EQ 1">
	<cfset count = count + 1>

	<cfset bracketlevel_pointing2 = 0>
	<cfset bracketCoverage = 0>
	<cfloop from="1" to="#len(formula)#" index="innercount">
		<cfset thisArrayChar = mid(formula,innercount,1)>
		<cfif innercount EQ 1 and thisArrayChar NEQ "(">
			<cfbreak><!--- NO NEED TO CHECK SINCE IT DOES NOT START WITH A BRACKET , NEXT--->
		</cfif>
		<cfset bracketCoverage = bracketCoverage + 1>
		
		<cfif thisArrayChar EQ "(">
			<cfset bracketlevel_pointing2 = bracketlevel_pointing2 + 1>
		<cfelseif thisArrayChar EQ ")">
			<cfset bracketlevel_pointing2 = bracketlevel_pointing2 - 1>
		</cfif>

		<cfif bracketlevel_pointing2 EQ 0 and thisArrayChar EQ ")">
			<cfbreak><!--- DETECTED END OF BRACKET --->
		</cfif>
	</cfloop>
	<!--- which means the bracket is covering the entire array, remove the brackets and do it again --->
	<cfif bracketCoverage EQ len(formula)>
		<cfset formula = RemoveChars(formula,1,1)><!--- remove first bracket --->
		<cfset formula = RemoveChars(formula,len(formula),1)><!--- remove last bracket --->
		<cfset rerunflag = 1>
	<cfelse>
		<cfset rerunflag = 0>
	</cfif>
	<cfif count GT 1000>error<cfabort></cfif>
</cfloop>



<cfset optionArray = arraynew(1)>
<cfset bracketlevel_consider = -1> <!--- this is to monitor which bracket level the loop is refering to --->

<cfset defaultsymbol = ""><!--- & (and), | (or) --->
	
<cfset newFormula = "">
<cfset bracketlevel_pointing = 0> <!--- pointer that run along the whole formula, level of the character now --->
<cfset bracketlevel_consider = bracketlevel_consider + 1><!--- each list loop go to the next level --->
<cfif bracketlevel_consider EQ 0>
	<cfset levelgate = "open">
	<cfset arrayNumber = 1>
	<cfset optionArray[arrayNumber] = "">
<cfelse>
	<cfset levelgate = "close">
	<cfset arrayNumber = 0>
</cfif>

<cfloop from="1" to="#len(formula)#" index="innercount">
	<cfset thisFormulaChar = mid(formula,innercount,1)>
	
	<cfif thisFormulaChar EQ "(">
		<cfset bracketlevel_pointing = bracketlevel_pointing + 1>
	<cfelseif thisFormulaChar EQ ")">
		<cfset bracketlevel_pointing = bracketlevel_pointing - 1>
	</cfif>
	
	<!--- --->
	<cfif (thisFormulaChar EQ "|" or thisFormulaChar EQ "&") and bracketlevel_pointing EQ bracketlevel_consider>
		<cfset levelgate = "close">
		<cfif bracketlevel_pointing eq 0>
			<cfset defaultsymbol = thisFormulaChar>
		</cfif>
	<!---cfelseif (thisFormulaChar EQ "&") and bracketlevel_pointing EQ bracketlevel_consider>
		<cfset levelgate = "close">
		<cfset arrayNumber = 0><!--- clear the array --->
		<cfset newFormula = formula><!--- since it's an "&", take everything back for next level checking, NOTHING TO REMOVE --->
		<cfbreak---><!--- if detected an "&" no need to check anymore --->
	</cfif>
	
	<!--- WHEN DETECTED END OF A GROUP OF 'OR', CLOSE THE GATE INTO THE ARRAY, START TO ASK QUESTION --->
	<cfif levelgate EQ "open" and bracketlevel_pointing LT bracketlevel_consider>
		<cfset levelgate = "close">
		<cfset newFormula = newFormula & "*">
		<cfif len(formula) NEQ innercount>
			<cfset newFormula = newFormula & right(formula,len(formula)- innercount)><!--- put in the balance of character into newformula --->
		</cfif>
		<cfbreak>
		<!--- if array not empty go and ask question --->
	</cfif>
		
	<!--- IF GATE IS OPEN INSERT INTO ARRAY --->
	<cfif levelgate EQ "open">			
		<cfset optionArray[arrayNumber] = optionArray[arrayNumber] & thisFormulaChar>
	<!--- ELSE INSERT INTO THE NEW FORMULA --->
	<cfelse>
		<cfif bracketlevel_pointing LT bracketlevel_consider>
			<cfset newFormula = newFormula & thisFormulaChar>
		</cfif>
	</cfif>

	<cfif levelgate EQ "close" and bracketlevel_pointing EQ bracketlevel_consider>
		<cfset levelgate = "open">
		<cfset arrayNumber = arrayNumber + 1>
		<cfset optionArray[arrayNumber] = "">
	</cfif>
	
</cfloop>

<cfif arrayNumber GT 0>
	<cfloop from="1" to="#arrayNumber#" index="thisArrayNo">
		<cfset rerunflag = 1>
		<cfset count = 0>
		<cfloop condition="rerunflag EQ 1">
			<cfset count = count + 1>
		
			<cfset bracketlevel_pointing2 = 0>
			<cfset bracketCoverage = 0>
			<cfloop from="1" to="#len(optionArray[thisArrayNo])#" index="innercount">
				<cfset thisArrayChar = mid(optionArray[thisArrayNo],innercount,1)>
				<cfif innercount EQ 1 and thisArrayChar NEQ "(">
					<cfbreak><!--- NO NEED TO CHECK SINCE IT DOES NOT START WITH A BRACKET , NEXT--->
				</cfif>
				<cfset bracketCoverage = bracketCoverage + 1>
				
				<cfif thisArrayChar EQ "(">
					<cfset bracketlevel_pointing2 = bracketlevel_pointing2 + 1>
				<cfelseif thisArrayChar EQ ")">
					<cfset bracketlevel_pointing2 = bracketlevel_pointing2 - 1>
				</cfif>
	
				<cfif bracketlevel_pointing2 EQ 0 and thisArrayChar EQ ")">
					<cfbreak><!--- DETECTED END OF BRACKET --->
				</cfif>
			</cfloop>
			<!--- which means the bracket is covering the entire array, remove the brackets and do it again --->
			<cfif bracketCoverage EQ len(optionArray[thisArrayNo])>
				<cfset optionArray[thisArrayNo] = RemoveChars(optionArray[thisArrayNo],1,1)><!--- remove first bracket --->
				<cfset optionArray[thisArrayNo] = RemoveChars(optionArray[thisArrayNo],len(optionArray[thisArrayNo]),1)><!--- remove last bracket --->
				<cfset rerunflag = 1>
			<cfelse>
				<cfset rerunflag = 0>
			</cfif>
			<cfif count GT 1000>error<cfabort></cfif>
		</cfloop>
		
		
	</cfloop>
</cfif>	
	
<cfset caller.optionArray = optionArray>
<cfset caller.defaultsymbol = defaultsymbol> 

