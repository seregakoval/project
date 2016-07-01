<!DOCTYPE html>
<html style="width:100%;height:100%;">
<head>
	<link rel="stylesheet" href="jstree/dist/themes/default/style.min.css">
 	<script src="jstree/dist/libs/jquery.js"></script>
  	<script src="jstree/dist/jstree.min.js"></script>

	<script>
		ajaxPath = null;
		$(document).ready(function () {
			mytree = $.jstree.create($('#jstree'), {
		        'core': {
		        	'multiple' : false,
		            'check_callback': function (operation, node, node_parent, node_position) { return true; },
		            'error': function (obj) { console.error(obj); },
		            'data': {
		                'url': function (node) {
		                	var unk = new Date();
		                    if (ajaxPath == undefined)
		                        return node.id === '#' ? 'databind/act_get_tree_data.cfm?nodeid=&unk=' + unk  : 'databind/act_get_tree_data.cfm?nodeid=' + node.id + "&unk=" + unk;
		                    else
		                        return ajaxPath;
		                },
		                'data': function (node) {
		                    return { 'id': node.id };
		                }
		            }
		        }
		    });
		});


		function refreshactiveNode() {
			var activenode = mytree.get_selected(true)[0];
		    mytree.refresh(activenode);
		    //mytree.toggle_node(activenode);
		   /*mytree.deselect_node(activenode);
		    if (!mytree.is_open(activenode))
		        mytree.open_node(activenode, 2000);*/

		}

		function getnodeid(){
			//alert("fff");
			var parentNode = mytree.get_selected(true)[0];
			alert(parentNode.id);
		}

		function addNode() {
			var node_id = $('#txt_nodeID').val();
			var node_text = $('#txt_nodeName').val();

		    var dataItem = { 'id': node_id, 'text': node_text, 'state': { 'opened': true, 'selected': true} };
		    var parentNode = mytree.get_selected(true)[0];
		    if (parentNode == undefined) { alert("Select node first"); return; }
		    var newnode = mytree.create_node(parentNode, dataItem);
		    mytree.deselect_node(newnode);
		    if (!mytree.is_open(parentNode))
		        mytree.open_node(parentNode, animSpeed);
		}

		function loaddataframe(level,parentid){
			//alert(level);
			if(level == 1){
				dataframe.location="dsp_right_mainpage1.cfm?level=" + level + "&parentid=" + parentid;
			}
			else if(level == 2){
				dataframe.location="dsp_right_mainpage2.cfm?level=" + level + "&parentid=" + parentid;
			}
			else if(level == 3){
				dataframe.location="dsp_right_mainpage3.cfm?level=" + level + "&parentid=" + parentid;
			}
			else if(level == 4){
				dataframe.location="dsp_right_mainpage4.cfm?level=" + level + "&parentid=" + parentid;
			}
			else{
				mytree.deselect_all(true);//TO DESELECT IF USER ALREADY SELECT A NODE
				dataframe.location="dsp_right_mainpage.cfm?level=&parentid=";
			}
		}

		function expandall(){
			var opt = document.itemform.expanopt.value;
			if(opt == 1){
				document.itemform.expanopt.value = 0;
				document.itemform.btnexpand.value = "Expand All";
				mytree.close_all();
			}
			else if( opt == 0){
				document.itemform.expanopt.value = 1;
				document.itemform.btnexpand.value = "Collaps All";
				mytree.open_all();
			}
		}
		
		function exporttoexcel(){
			var pagelink = "index.cfm?fuseaction=export&doctype=excel";
			//document.location = pagelink;
			WinItem = window.open(pagelink,"popup2","height=600,width=860,scrollbars=yes, resizable=yes");
			WinItem.window.focus();		
		}
	</script>
</head>

<cfoutput>
<body class="mainpage2">
	<form name="itemform" method="post" action="index.cfm">
	<table>
		<tr>
			<td>
				<input type="hidden" name="expanopt" id="expanopt" value="0">
				<input type="button" class="button5" value="Expand All" onclick="expandall();" name="btnexpand">
				<input type="button" class="button5" value="Export" onclick="exporttoexcel();" name="btnexpand">
			</td>
		</tr>
	</table>
	</form>
	<span style="padding-left:5px;cursor:pointer;" class="formnamecell" onclick="loaddataframe(0,0)" title="Go To Start">
		<img src="../../images/home.png" class="imgtop" style="margin-top:2px;">&nbsp;ROOT
	</span>
	<div id="jstree"></div>
</body>
</cfoutput>
</html>
