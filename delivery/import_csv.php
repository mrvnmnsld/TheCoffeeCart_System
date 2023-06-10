<?php
include('../server/connection.php');
include '../set.php';
$success = isset($_GET['success']);
$failure = isset($_GET['failure']);
$error = array();
$alert = array();
?>
<!DOCTYPE html>
<html>

<head>
	<?php include('../templates/head1.php'); ?>
	<style type="text/css">
		input[name='file'] {
			width: 150px;
		}
	</style>

	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
</head>

<body>
	<div class="contain h-100">
		<?php include('../delivery/base.php');
		if ($success) {
			echo '<script>swal("Success","Successfully Added!","success");</script>';
		}
		if ($failure) {
			echo '<script>swal("Error","Supplier name not found!","error");</script>';
		}
		?>
		<div class="main">
			<div class="side">
				<h1 class="ml-4 pt-2"><i class="fas fa-truck"></i> Import Raw Materials CSV</h1>
				<hr>
			</div>
			<div class="first_side ml-5 mt-4 mr-3">
				<div class="shadow-lg p-3 mb-5 bg-white rounded" style="width: 260px;padding-right:20px;height: 250px;">
					<h4 class="text-danger">Important Reminder!</h4>
					<p>
						In importing CSV file, please make sure the required(<span class="text-danger">*</span>) is filled up in your excel file or spreadsheet.Please make it in order.<br /><small>Image is not required so you can edit the products anytime.</small>
					</p>
				</div>

				<label><i class="fas fa-file-upload"></i> <small>Upload CSV:</small></label>
				<input class="form-control-sm" type="file" name="file" id="fileInput" required onchange="handleFile()" />
				<p class="bg-danger mt-3"><?php echo $msg; ?></p>
			</div>

			<div class="second_side">
				<table class="mt-4">
					<tbody>
						<tr>
							<td valign="baseline"><small>Supplier Name:</small></td>

							<td class="pl-5 pb-1">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">
											<i class="fas fa-user-tie"></i></span></div>
									<input type="text" class="form-control form-control-sm supplier_search" autocomplete="off" data-provide="typeahead" id="supplier_search" placeholder="Supplier Search" name="supplier" />
							</td>

							<td valign="baseline">
								<div class="ml-3">
									<button class="btn-sm btn-info border" data-toggle="modal" data-target=".modal" style="padding:1px;">
										<span class="badge badge-info">
											<i class="fas fa-user-plus"></i>
											New
										</span>
									</button>
								</div>
							</td>
						</tr>


					</tbody>
				</table>

				<table class="mt-4 table table-striped table-bordered table-sm" id="xls_container">
					<thead>
						<tr>
							<th>Raw Material Title</th>
							<th>Amount (kg)</th>
							<th>Type</th>
						<tr>
					</thead>
					
					<tbody>
						
					</tbody>
				</table>

				<div class="text-left mt-2 pt-1">
					<input type="button" name="upload" class="btn btn-secondary" value="Save raw materials from excel" id="saveButton"/>
				</div>
			</div>
		</div>

	</div>
	<script src="../bootstrap4/jquery/jquery.min.js"></script>
	<script src="../bootstrap4/jquery/datepicker.js"></script>
	<script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
	<script src="../bootstrap4/js/typeahead1.js"></script>
	<script src="../delivery/javascript.js"></script>
	<?php include('../delivery/add_supplier1.php'); ?>

	<script>
		var nameArray = [];
		var kgArray = [];
		var remarksArray = [];

		function handleFile() {
			var fileInput = document.getElementById('fileInput');
			var file = fileInput.files[0];

			var extension = file.name.split('.').pop().toLowerCase();
			console.log(extension);
    
			if (extension != 'xlsx') {
				swal("","File is not .xlsx","error")
				return;
			}

			$("#xls_container tbody tr").remove();
			nameArray = [];
			kgArray = [];
			remarksArray = [];

			var reader = new FileReader();

			reader.onload = function(e) {
				var data = new Uint8Array(e.target.result);

				var workbook = XLSX.read(data, {
					type: 'array'
				});

				var worksheet = workbook.Sheets[workbook.SheetNames[0]];
				var jsonData = XLSX.utils.sheet_to_json(worksheet, {
					header: 1
				});


				for (let index = 0; index < jsonData.length; index++) {

					if (jsonData[index].length >= 1) {
						nameArray.push(jsonData[index][0])
						kgArray.push(jsonData[index][1])
						remarksArray.push(jsonData[index][2])

						$("#xls_container tbody").append(
							"<tr>" +
							"	<td>" + jsonData[index][0] + "</td>" +
							"	<td>" + jsonData[index][1] + "</td>" +
							"	<td>" + jsonData[index][2] + "</td>" +
							"<tr>"
						);
					}

				}

			};
			reader.readAsArrayBuffer(file);
		}

		$("#saveButton").on("click",function(){
			if($("#fileInput").val()==""){
				swal("","Please upload file first","error");
				return;
			}

			if($("input[name='supplier']").val()==""){
				swal("","Please fill the supplier name","error");
				return;
			}

			console.log(nameArray);
			console.log(kgArray);
			console.log(remarksArray);

			$.ajax({
				url: "add.php",
				method: "POST",
				data: {
					"action": "saveRawMatsFromExcel",
					"name": nameArray,
					"kg": kgArray,
					"remarks": remarksArray,
					"supplier_name": $("input[name='supplier']").val(),
				},
				success: function(data) {
					console.log(data)
					if (data == "success") {
						swal("", "Successfully saved the transaction from XLSX", "success").then(() => {
							location.reload();
						});
					} else {
						swal("", "Please contact system admin and report this error", "error");
					}
				}
			});
		});
	</script>
</body>

</html>