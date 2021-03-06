<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
		    font-size: 11px;
		    line-height: 130%;
		    margin: 0;
		    padding: 0;
		    color: #515e67;
		}

		/* Header styles */

		header {
		    background: #434343;
		    color: white;
		    padding: 5px;
		}

		#top_left{
		    padding: 7px 0;
		    float: left;
		    position: relative;
		}

		#home{
		    background: #202224;
		    width: 1.5em;
		    height: 1.5em;
		    border: 1px solid #ddddde;
		    border-radius: 50%;
		    margin: auto;
		    position: absolute;
		    top: 0;
		    bottom: 0;
		    text-align: center;
		    font-size: 1.4em;
		}

		#home i {
		    display: inline-block;
		    vertical-align: -30%;
		}

		#home:hover {
		    cursor: pointer;
		}

		h1 {
		    display: inline;
		    padding-left: 2em;
		    font-size: 1.4em;
		    margin: 0;
		}

		#top_right {
		    display:inline-block;
		    position:relative;
		    float: right;
		    height: auto;
		}

		#top_right img {
		    height: 30px;
		    width: 30px;
		}

		#greeting{
		    display:inline-block;
		    float: left;
		    margin: 6px 13px 0 0;
		    padding: 3px 6px;
		    color: black;
		    background-color: white;
		    border-radius: 5px;
		}

		/* Right-pointing arrow */

		.arrow_box {
			position: relative;
			background: #ffffff;
		}
		.arrow_box:after {
			left: 100%;
			top: 50%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-left-color: #ffffff;
			border-width: 5px;
			margin-top: -5px;
		}

		#top_right img {
		    display: block;
		    float: right;
		    border-radius: 50%;
		}

		#top_right a {
		    color: black;
		    position:absolute;
		    bottom:0;
		    right:0;
		    background-color: white;
		    border-radius: 50%;
		    text-align: center;
		    width: 12px;
		    height: 12px;
		}

		/* Top right openable menu */

		#top_nav {
		    position: fixed;
		    z-index: 2;
		    right: 10px;
		    top: 55px;
		    background-color: white;
		    margin: 0;
		    padding: 0;
		    box-shadow: 2px 2px 1px #828282,
		                -2px 2px 1px #828282,
		                2px 2px 1px #828282;
		}

		#top_nav:after {
		    bottom: 100%;
			left: 80%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-bottom-color: #ffffff;
			border-width: 8px;
			margin-top: -8px;
		}

		#top_nav li {
		    list-style: none;
		    border-bottom: 2px solid #ededed;
		}

		#top_nav li a {
		    display: inline-block;
		    width: calc(100% - 20px);
		    text-decoration: none;
		    color: #47515a;
		    padding: 10px;
		    font-size: 1.2em;
		}

		#top_nav li a:hover {
		    background-color: #ededed;
		}

		/* Bottom panel */

		#bottom_panel {
		    position: absolute;
		    bottom: 0;
		    width: 100%;
		    background-color: #f8f8f8;
		}

		.inner_wrapper {
		    padding: 20px 20px 0 20px;
		    font-size: 1em;
		    color: #3e474c;
		}

		.orange_button {
		    display: inline-block;
		    color: white;
		    background-color: #ff9740;
		    text-align: center;
		    padding: 5px 7px;
		    border-radius: 5px;
		    width: 30px;
		}

		.orange_button:hover {
		    cursor: pointer;
		}

		#trash_button {
		    float: right;
		    width: 20px;
		}

		.inner_wrapper input {
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    height: 25px;
		    border-radius: 5px;
		    border: 1px solid #cccbd9;
		    font-size: 1em;
		    width: 100px;
		}

		.personnel {
		    margin-top: 20px;
		}

		.personnel .orange_button {
		    margin-right: 30px;
		    vertical-align: top;
		}

		.personnel input {
		    margin-right: 5px;
		}

		::-webkit-input-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		:-moz-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		::-moz-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}
		:-ms-input-placeholder {
		   font-style: italic;
		    color: #cccbd9;
		}

	</style>
	<script>
		function deleteselected(){
			
			var path = parent.document.getElementById("main_table_wrapper").contentWindow.document.itemform ;
			var nextid = path.nextid.value; 
			var unk = new Date();
			var del_list = "";
			for (var i=0; i < path.id.length; i++){
				if (path.id[i].checked){
					if (del_list == ""){
						del_list = path.id[i].value;
					}
					else{
						del_list = del_list + "," + path.id[i].value;
					}
				}
			}
			var url = "databind/act_delete.cfm?nextid=" + nextid + "&passid=" + del_list + "&unk=" + unk ;
			
			//prompt('',url);
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
		   	} else {// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		   	}
		   	
		   	xmlhttp.open("GET",url,false);
			xmlhttp.send();
			xmlDoc=xmlhttp.responseXML;
			var x=xmlDoc.getElementsByTagName("returnrow");	
			for (i=0;i<x.length;i++){
				//alert(i);
				var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
				var totalsales = x[i].getElementsByTagName("totalsales")[0].childNodes[0].nodeValue;
				if(msgerror == "ok"){
					parent.document.getElementById("totalsales").innerHTML = totalsales ;
					parent.document.getElementById("main_table_wrapper").contentWindow.location.reload();
				} else {
					alert(msgerror);
				}
			}
			
			
			
		}
	</script>


</head>

<body>
    <div class="inner_wrapper">
        <div class="orange_button">UP</div>
        <div class="orange_button">SD</div>
        <div class="orange_button">DV</div>
        <div class="orange_button">CV</div>
        <div class="orange_button">CL</div>
        <div class="orange_button" id="trash_button" onclick="deleteselected();"><i class="icon ion-trash-a"></i></div>
        <div class="personnel">
            Sales Personnel 1:&nbsp;&nbsp;&nbsp;
            <input type="text" id="sales_p1_id" placeholder="Sales Person ID">
            <input type="text" id="sales_p1_name" placeholder="Sales Person Name">
            <div class="orange_button">S</div>
            Comm:&nbsp;&nbsp;&nbsp;
            <input type="text" id="sales_p1_comm" placeholder="% / value">
        </div>
        <div class="personnel">
            Sales Personnel 2:&nbsp;&nbsp;&nbsp;
            <input type="text" id="sales_p2_id" placeholder="Sales Person ID">
            <input type="text" id="sales_p2_name" placeholder="Sales Person Name">
            <div class="orange_button">S</div>
            Comm:&nbsp;&nbsp;&nbsp;
            <input type="text" id="sales_p1_comm" placeholder="% / value">
        </div>
    </div>
</body>

</html>