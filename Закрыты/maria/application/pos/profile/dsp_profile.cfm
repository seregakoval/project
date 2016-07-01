<cfparam name="custid" default="">
<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../css/ionicons.css">

	<style>

		@font-face {
		    font-family: MyriadPro;
		    src: url("../fonts/MyriadPro-Regular.otf") format("opentype");
		    src: url("../fonts/MyriadPro-Regular.woff") format("woff");
		}

		.clear {
		    clear: both;
		}

		body {
		    width: 100%;
		    font-family: MyriadPro;
		    font-size: .7em;
		    line-height: 130%;
		    margin: 0;
		    padding: 60px 30px;
		}

        table {
            width: 100%;
        }

        table td{
            width: 20%;
        }

		/* Center table */

		#main_table_wrapper {
		    float: left;
		    padding: 50px 30px;
		    color: #47515a;
		    width: calc(100% - 40px - 60px); /* -right panel width and -left and right padding */
		    height: calc(100vh - 40px - 30px - 100px);

		}

		#main_table table {
		    width: 100%;
		}

		.edit_button {
		    display: inline-block;
		}

		.edit_button:hover {
		    cursor: pointer;
		}

		#main_table table td{
		    width: 20%;
		}

		hr {
		    display: block;
		    height: 1px;
		    border: 0;
		    border-top: 1px solid #cfcfcf;
		    margin: 10px 0;
		    padding: 0;
		}
    </style>


	<script>
		<cfoutput>
		function goedit() {

			window.self.location.href = 'index.cfm?fuseaction=edit&custid=#custid#';

		}
		</cfoutput>

	</script>
</head>

	 <cfquery name="getcust" datasource="#dbname#">
		select customer.*,branch.description from customer
		 	left outer join branch on(customer.branch = branch.id)
		<cfif custid NEQ "">
			where customer.id = '#custid#'
		<cfelse>
			where false
		</cfif>
	</cfquery>

<body>
	<cfoutput>
     		<table class="main_table">
                <thead>
                    CUSTOMER DETAILS&nbsp;&nbsp;<div class="edit_button" onclick="goedit();"><i class="icon ion-edit"></i></div>
                </thead>
                <tr>
                    <td>Customer Name</td>
                    <td>:&nbsp;#getcust.name#</td>
                    <td>Member Prefix</td>
                    <td>:&nbsp;INFNT</td>
                </tr>
                <tr>
                    <td>Customer No</td>
                    <td>:&nbsp;#getcust.custno#</td>
                    <td>Member Prefix</td>
                    <td>:&nbsp;HQ00001</td>
                </tr>
                <tr>
                    <td>Name on Card</td>
                    <td>:&nbsp;#getcust.name_on_card#</td>
                    <td>Passport No</td>
                    <td>:&nbsp;#getcust.passport#</td>
                </tr>
                <tr>
                    <td>IC No</td>
                    <td>:&nbsp;#getcust.ic#</td>
                    <td>First Visit</td>
                    <td>:&nbsp;10/08/2013</td>
                </tr>
                <tr>
                    <td>Branch</td>
                    <td>:&nbsp;#getcust.description#</td>
                    <td>Last Visit</td>
                    <td>:&nbsp;#dateformat(getcust.lastvisitdate,"dd-mm-yyyy")#</td>
                </tr>
                <tr>
                    <td>Principal Customer</td>
                    <td>:</td>
                    <td>Expiry Date</td>
                    <td>:&nbsp;#dateformat(getcust.expire_date,"dd-mm-yyyy")#</td>
                </tr>
            </table>

            <hr>

            <table class="main_table">
                <thead>
                    CONTACT DETAILS
                </thead>
                <tr>
                    <td>Address</td>
                    <td colspan="3">:&nbsp;#getcust.address1#</td>
                </tr>
                <tr>
                    <td>Post Code</td>
                    <td>:&nbsp;#getcust.postcode#</td>
                    <td>City</td>
                    <td>:&nbsp;#getcust.city#</td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>:&nbsp;#getcust.state#</td>
                    <td>Country</td>
                    <td>:&nbsp;#getcust.country#</td>
                </tr>
                <tr>
                    <td>Tel (Home)</td>
                    <td>:&nbsp;#getcust.phone1#</td>
                    <td>Tel (Office)</td>
                    <td>:&nbsp;#getcust.phone2#</td>
                </tr>
                <tr>
                    <td>Tel (Mobile)</td>
                    <td>:&nbsp;#getcust.mobile#</td>
                    <td>Email</td>
                    <td>:&nbsp;#getcust.email#</td>
                </tr>
                <tr>
                    <td>Fax</td>
                    <td colspan="3">:&nbsp;#getcust.fax#</td>
                </tr>
            </table>

            <hr>

            <table class="main_table">
                <thead>
                    CUSTOMER ANALYSIS
                </thead>
                <tr>
                    <td>Sex</td>
                    <td>:&nbsp;#getcust.sex#</td>
                    <td>Marital Status</td>
                    <td>:&nbsp;#getcust.marital#</td>
                </tr>
                <tr>
                    <td>Occupation</td>
                    <td colspan="3">:&nbsp;#getcust.occupation#</td>
                </tr>
                <tr>
                    <td>Race</td>
                    <td>:&nbsp;#getcust.race#</td>
                    <td>Religion</td>
                    <td>:&nbsp;#getcust.religion#</td>
                </tr>
                <tr>
                    <td>Preferred Language</td>
                    <td>:&nbsp;#getcust.language#</td>
                    <td>Income Range</td>
                    <td>:&nbsp;#getcust.income#</td>
                </tr>
                <tr>
                    <td>Notes</td>
                    <td>:&nbsp;#getcust.remark#</td>
                    <td>Contract Source</td>
                    <td>:&nbsp;Billboard</td>
                </tr>
            </table>

</cfoutput>
</body>

</html>
