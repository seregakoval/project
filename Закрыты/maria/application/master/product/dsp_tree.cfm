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
		        },
		        // The plugins are required to detect drag n drop and state ready
		        plugins : ['dnd', 'state']
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




		/************************** Code added for drag and drop *****************************************/
		var _tree_old, _tree;

		function getChildren(list) {
			if(!list || list.length == 0) return null;
			var children = [];
			for(var i = 0; i < list.length; i++) {
				var child = _tree_old[list[i]];
				if(child) {
					child.children = getChildren(child.children);
					children.push(child);
				}
			}
			return children;
		}

		function buildTree(t) {
			var tree = [];
			for(var i in t) {
				if(t[i].id == '#') continue;
				if(t[i].parent == '#') {
					var el = { id: t[i].id, text: t[i].text };
					if(t[i].children) el.children = getChildren(t[i].children);
					tree.push(el);
				}
			}
			return tree;
		}

		function restoreTree() {
			// Completely remove the new tree structure and replace it with previous state of the tree
			$('#jstree').remove();
			$('body').append($('<div id="jstree"></div>'));
			$('#jstree').jstree({
		    	core : {
		      		check_callback : true,
		      		data: buildTree(_tree_old)
		    	},
		    	plugins : ['dnd', 'state']
		  	});
		}

		function extractData(nodes) {
			var t = {};
			for(var i in nodes) {
				t[i] = { id: nodes[i].id, text: nodes[i].text, children: nodes[i].children, parent: nodes[i].parent }
			}
			return t;
		}

		// Event to be fired when tree is ready
		$('#jstree').on('ready.jstree', function(e, data) {
			// function extractData is being used instead of direct equation to avoid _tree_old from changing dynamically
			_tree_old = extractData(data.instance._model.data);
		});

		// Event to detect the completion drag and drop. Fired when drop is complete
		$(document).on('dnd_stop.vakata', function(e, data) {
			// This variable is used to get the parent id
			var parent = data.event.target.id.replace('_anchor', '');

			// ids is a list of ids of selected element that are being dragged
			// parent is the id of the destination folder where the element is dropped 
			// Make an ajax request to the server to notify the drag and drop
			$.post('AJAX_URL', { parent: parent, ids: data.data.nodes }, function(dataXml) {
				if(!dataXml || dataXml.getElementsByTagName('updated')[0].textContent != 'true') {
					// Execute this if the server responds OK
					if(_tree) _tree_old = extractData(_tree);
					_tree = extractData(data.data.origin._model.data);
				} else {
					// Execute this if there is an error
					// restoreTree is a function that restores the jstree to the state before drag and drop
					// That's why _tree_old is required to remember the old state.
					restoreTree();
				}
			});
		});










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
