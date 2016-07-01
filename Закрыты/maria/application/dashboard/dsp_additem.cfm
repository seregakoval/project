<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page 01</title>

	<style>
#form-content {
  width: 100%;
}
#row, #row2, row3 {
  width: 100%;
  height: 140px;
    margin-top: 5px;
}
#row2 #col1, #row2 #col2 {
	height: 188px;
}
#row3 #col1, #row3 #col2 {
	height: 108px;
}
#col1 {
  background: #fff none repeat scroll 0 0;
  border: 1px solid #cfcfcf;
  border-radius: 10px;
  float: left;
  height: 148px;
  margin-right: 12px;
  padding: 0 10px;
  width: 45%;
  margin-bottom: 15px;
}
#col2 {
  border: 1px solid #cfcfcf;
  float: left;
  height: 148px;
  width: 45%;
  border-radius: 10px;
  padding:0 10px;
  background:#fff;
  margin-bottom: 15px;
}
#col1 > input, #col2 > input {
  float: left;
  width:98%;
}
#col1 select, #col2 select {
  width: 98%;
}
.col1_row {
  float: left;
  width: 50%;
  padding-top: 10px;
}
#col1 > label, #col2 > label{
  float: left;
  padding-top: 8px;
}
#dialog {
  background: #f7f7f7 none repeat scroll 0 0;
  border-radius: 10px;
  margin: 0 auto !important;
  width: 600px !important;
  padding:20px;
  height: 525px !important;
}
.row4 > button {
  border: none;
  padding: 7px 20px;
  margin: 0 2px;
  border-radius: 10px;
}
.row4 {
  float: right;
  margin-right: 10px;
}
.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front.ui-draggable.ui-resizable {
  width: 700px !important;
  height: calc(100vh - 40px - 0px) !important;
}
.ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-icon-only.ui-dialog-titlebar-close {
  background: rgba(0, 0, 0, 0) url("../img/close.png") no-repeat scroll 0 0;
  border: medium none;
  color: transparent;
  float: right;
  margin-right: 10px;
  margin-top: 20px;
cursor: pointer;
}
    </style>
</head>

<div id="dialog" >
   <form>
            <div id="form-content">
                <div id="row">
                    <div id="col1">
                        <label>Requester</label>
                        <input type="text">
                        <label>Assignee*</label>
                        <select><option>-</option></select>
						 <label>CCs</label>
                        <input type="text">


                    </div>
                    <div id="col2">
                        <label>Requester</label>
                        <input type="text">
                        <label>Assignee*</label>
                        <select><option>-</option></select>
						 <label>CCs</label>
                        <input type="text">


                    </div>

                </div>
                <div id="row2">
                    <div id="col1">
					<div class="col1_row">
                        <label>Type</label>
                        <select><option>-</option></select>
					</div>
					<div class="col1_row">
						<label>Priority</label>
						<select><option>-</option></select>
					</div>

                        <label>Tages</label>
                        <input type="text">
						<label>Store Name</label>
						<select><option>-</option></select>
						<label>Category</label>
						<select><option>-</option></select>

                    </div>
                   <div id="col2">
					<div class="col1_row">
                        <label>Type</label>
                        <select><option>-</option></select>
					</div>
					<div class="col1_row">
						<label>Priority</label>
						<select><option>-</option></select>
					</div>

                        <label>Tages</label>
                        <input type="text">
						<label>Store Name</label>
						<select><option>-</option></select>
						<label>Category</label>
						<select><option>-</option></select>

                    </div>

                </div>
                <div id="row3">
                    <div id="col1">
                        <div class="col1_row">
                        <label>Type</label>
                        <select><option>-</option></select>
					</div>
					<div class="col1_row">
						<label>Priority</label>
						<select><option>-</option></select>
					</div>
                        <label>Tags</label>
                        <input type="file">


                    </div>
                    <div id="col2">
                        <div class="col1_row">
                        <label>Type</label>
                        <select><option>-</option></select>
					</div>
					<div class="col1_row">
						<label>Priority</label>
						<select><option>-</option></select>
					</div>
                        <label>name</label>
                        <input type="file">


                    </div>

                </div>
            <div class="row4">
				<button>Submit</button> <button>Cancle</button>
			</div>

            </div>
        </form>

</div>
