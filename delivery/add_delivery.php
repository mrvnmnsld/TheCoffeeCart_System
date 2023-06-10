<?php
include('../server/connection.php');
include '../set.php';
$success = isset($_GET['success']);
$failure = isset($_GET['failure']);
?>
<!DOCTYPE html>
<html>

<head>
	<?php include('../templates/head1.php'); ?>
	<style type="text/css">
		#invoice-item-table tr th {
			font-size: 12px;
		}

		ul.typeahead.dropdown-menu {
			margin-top: 0px;
		}
	</style>
</head>

<body>

	<div class="contain h-100">
		<?php 
			include('base.php');
			// if ($failure) {
			// 	echo '<script>swal("Unsuccesful","Customer not found!","error");</script>';
			// }
		?>
		<div>
			<!-- <div class="mt-1 ml-5"><label><b>New Supplier:</b></label><button class="btn-sm btn-info border" data-toggle="modal" data-target=".modal" style="padding:5px;"><span class="badge badge-info"><i class="fas fa-user-plus"></i> New</span></button></div> -->
			<form method="post" id="invoice_id">
				<div class="table-responsive mt-1 pl-5 pr-5">
					<table class="table table-striped table-bordered table-sm">
						<tr>
							<td>
								<div class="row mb-1">
									<div class="col-md h1">Add new product</div>
									
									<!-- <div class="col-md-4">
										<b>SUPPLIER(From)</b><br />
										<div class="input-group">
											<div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">
													<i class="fas fa-user-tie"></i></span></div>
											<input type="text" class="form-control form-control-sm supplier_search" autocomplete="off" data-provide="typeahead" id="supplier_search" placeholder="Supplier Search" name="supplier" />
										</div>
									</div> -->
									<!-- <div class="col-md-4">
										Transaction No.
										<div class="input-group">
											<div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">
													<i class="fas fa-hands-helping"></i></span></div>
											<input type="text" name="order_no" id="order_no" class="form-control input-sm" required readonly value="<?php echo strtoupper(uniqid()) ?>" />
										</div>
									</div> -->
								</div>
								<table id="invoice-item-table" class="table table-bordered table-sm">
									<tr>
										<th>No</th>
										<th>Barcode</th>
										<th>Product Name</th>
										<th>Unit</th>
										<th>Coffee (grams)</th>
										<th>Sugar (grams)</th>
										<th>Milk (grams)</th>
										<th>Sell Price</th>
										<th>Remarks</th>
										<th><button type="button" name="add_row" id="add_row" class="btn btn-success btn-sm btn-xs"><i class="fas fa-plus-circle"></i> </button></th>
									</tr>

									<tr>
										<td><span id="sr_no">1</span></td>
										<td><input type="text" name="barcode" id="barcode1" class="form-control form-control-sm input-sm barcode" placeholder="Barcode" /></td>
										<td><input type="text" name="product_name" id="product_name1" class="form-control form-control-sm input-sm product_name" placeholder="Title" /></td>
										<td><select id="unit1" name="unit" class="form-control form-control-sm input-sm unit"><option>small</option><option>large</option></select></td>

										<td><input type="number" name="coffee" id="coffee1" class="form-control form-control-sm input-sm coffee" placeholder="0.01" /></td>
										<td><input type="number" name="sugar" id="sugar1" class="form-control form-control-sm input-sm sugar" placeholder="0.01" /></td>
										<td><input type="number" name="milk" id="milk1" class="form-control form-control-sm input-sm milk" placeholder="0.01" /></td>


										<td><input type="text" name="sell_price" id="sell_price1" data-srno="1" class="form-control form-control-sm input-sm sell_price" placeholder="59.00"></td>
										<td><input type="text" name="remarks" id="remarks1" data-srno="1" class="form-control input-sm form-control-sm remarks" placeholder="Remarks"></td>
									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<input type="button" name="create_delivery" value="Save new product(s)" id="create_delivery" class="btn btn-sm btn-info" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<script src="../bootstrap4/jquery/jquery.min.js"></script>
	<script src="../bootstrap4/jquery/datepicker.js"></script>
	<script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
	<script src="../bootstrap4/js/typeahead1.js"></script>
	<script src="../delivery/javascript.js"></script>

</body>

</html>
<?php include('../delivery/add_supplier.php'); ?>