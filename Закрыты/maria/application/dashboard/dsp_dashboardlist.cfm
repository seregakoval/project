<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADMIN POS</title>
    <link rel="stylesheet" href="../css/ionicons.css">

	<style>
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			font-family: calibri;
		}

		div, iframe {
			margin: 0;
			padding: 0;
			border: 0;
		}

		.container {
			position: relative;
			width: 100%;
			height: 100%;
			background: #ffffff;
		}

		.linkitem {
			position: relative;
			/*height: 50px;*/
			left: 0px;
			top: 0px;
			/*bottom: 0;*/
			width: 100px;
			background: #fff;
		}
		.menutitle {
			font-size: 0.7em;
			color: #47515a;
		}

		.nav_side {
			background: #f7f7f7 none repeat scroll 0 0;
			float: left;
			height: 100%;
			overflow-x: hidden;
			width: 250px;
			margin: -1px;
			border-right: 1px solid #D6D0D0;
		}

		.nav_side > p {
			border-bottom: 1px solid #D6D0D0;
			font-size: 16px;
			margin: 0;
			padding: 16px 16px 16px 11px;
		}

		.nav_side > span {
			color: #72a7cc;
			float: left;
			font-size: 16px;
			padding-bottom: 5px;
			padding-left: 10px;
			padding-top: 10px;
			width: 100%;
		}

		button {
			background-color:#5E68A5;
			border:none;
			border-radius:4px 4px 4px 4px;
			padding: 3px 5px;
	   }

	   	button a {
			text-decoration: none;
			color: white;
	   }

		.nav_side > ul {
			list-style: outside none none;
			margin: 0;
			padding: 0;
		}

		.nav_side ul ul {
			list-style: outside none none;
			padding-left: 0px;
		}

		.nav_side ul ul ul {
			list-style: outside none none;
			padding-left: 15px;
		}

		.nav_side ul ul ul ul{
			padding-left: 0px;
		}

		.nav_side li {
			clear: both;
			color: #72a7cc;
			font-size: 14px;
			height: 20px;
			line-height: 20px;
			margin-bottom: 2px;
			margin-left: 20px;
			padding-bottom: 0;
			padding-left: 10px;
			padding-top: 0;
		}

		.nav_side .main_head, .nav_side .main_head1 {
			font-size: 14px;
			padding: 0 0 5px;
			color:#515e67;
			margin-left:0;
		}

		.nav_side li:hover {
			background: #def3fa none repeat scroll 0 0;
			color: #2F4452;
			cursor: pointer;
		}

		.nav_side li:hover button{
			background:#8BC0E4;
			color:#fff;
		}

		.nav_side .main_head:hover, .nav_side .main_head1:hover{
			background:#f7f7f7
		}

		.bot_icon {
			bottom: 0;
			position: absolute;
			width: 50px;
		}

		.ion-android-sync {
			float: right;
		}

	</style>

		<script>
		function changeframe(filename){
			parent.frames['right-contentframe'].location.href = filename;
			//parent.document.itemform.custid.value = custid;
			//parent.document.getElementById('custname').innerHTML = custname;
		}
	</script>




</head>

<body>
	<div class="container">

		<div class="nav_side">
			<p><b>Dashboard</b><i class="ion-android-sync"></i></p>
			<span><button><a href="#" target="#">Dashboard</a></button></span>
			<ul>
				<li  class="main_head"><img src="../../img/new_arrow.png">MIsc</li>
				<ul id="misc" >
					<li  onclick="changeframe('dsp_tablelist.cfm');">Your unsolved ticket</li>
					<li>All unsolved ticket</li>
					<li>Recently updated ticket</li>
					<li>New ticket in your groups</li>
					<li>Pending ticket</li>
					<li>Recently solved ticket</li>
					<li>Upsolved ticket in your groups</li>
				</ul>
			</ul>

			<ul>
				<li  class="main_head1"><img src="../../img/new_arrow.png">2nd level Support</li>
				<ul id="secndle">
					<li>Unassignticket</li>
				</ul>
			</ul>

			<ul>
				<li class="main_head"><img src="../../img/new_arrow.png">Agents</li>
				<ul id="misc" >
					<ul>
						<li class="main_head"><img src="../../img/new_arrow.png">Sergel Rachmaninov</li>
						<ul id="misc">
							<li>All unsolved</li>
							<li >All sloved and closed</li>
						</ul>
					</ul>
					<ul>
						<li class="main_head"><img src="../../img/new_arrow.png">Louis Armstrong</li>
						<ul id="misc">
							<li>All unsolved</li>
							<li>All solved</li>
							<li>All closed</li>
						</ul>
					</ul>
					<ul>
						<li class="main_head"><img src="../../img/new_arrow.png">Nicki Minaj</li>
						<ul id="misc">
							<li>All tickets</li>
						</ul>
					</ul>
				</ul>
			</ul>
			<hr style="border:1px solid #D6D0D0">
			<span>Manage Views >></span>

		</div>

	</div>
</body>
</html>
