<?php
include('server/connection.php');
if (!isset($_SESSION['username'])) {
	header('location: index.php');
}
$added = isset($_GET['added']);
$undelete = isset($_GET['undelete']);
$updated = '';
$deleted = '';
$error = "";
$failure = isset($_GET['failure']);
$query 	= "SELECT * FROM `customer`";
$show	= mysqli_query($db, $query);
if (isset($_SESSION['username'])) {
	$user = $_SESSION['username'];
	$sql = "SELECT firstname FROM users WHERE username='$user'";
	$result	= mysqli_query($db, $sql);
	if (mysqli_num_rows($result) > 0) {
		while ($row = mysqli_fetch_assoc($result)) {
?>
			<!DOCTYPE html>
			<html>

			<head>
				<link rel="manifest" href="manifest.json">
				<title> The Coffee Cart</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
				<link rel="icon" type="image/png" sizes="180x180" href="images/hlogo.png">
				<link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.min.css">
				<link rel="stylesheet" type="text/css" href="bootstrap4/css/style2.css">
				<link rel="stylesheet" type="text/css" href="bootstrap4/css/navr.css">
				<link rel="stylesheet" type="text/css" href="css/css.css">
				<link rel="stylesheet" type="text/css" href="css/bootstrap-mediaqueries.css">
				<script src="bootstrap4/jquery/sweetalert.min.js"></script>
			</head>

			<body>
				<div class="h-100 bg-dark" id="container">
					<div id="header">
						<?php include('alert.php'); ?>

						<nav>
							<div class="navbar">
								<div class="container nav-container">
									<input class="checkbox" type="checkbox" name="" id="" />
									<div class="hamburger-lines">
										<span class="line line1"></span>
										<span class="line line2"></span>
										<span class="line line3"></span>
									</div>
									<div class="logo"><a href="#"><img src="images/hlogo.png" width="130" height="130" style="margin: 0% 0% -64% -9%;"></a>
									</div>
									<div class="menu-items">
										<div class="logotop"><img src="images/hlogo.png" width="130" height="130" style="margin: 0% 0% -77% 13%;"></a>
											<li style="margin: 184% -29% -110% 115%">
											<li><a onclick="window.location.href='employee/profile.php'"><i class="fas fa-user-circle"></i> My Profile</a></li>
											<li><a onclick="window.location.href='employee/inventory.php'"><i class="fas fa-box-open"></i> Inventory</a></li>
											<li><a onclick="window.location.href='sales_employee/employee_sales.php'"><i class="fas fa-shopping-cart"></i> Sales</a></li>
											<li><a name="logout" type="button" onclick="out();"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
											</li>
										</div>
									</div>
								</div>
						</nav>
			</body>
			<div class="navbar">
				<div class="date">
					<h1> WE OFFER ICED COFFEE ON WHEELS</h1>
					<table class="date1">

						<tbody>
							<tr>
								<td valign="baseline">User Logged on:</td>
								<td valign="baseline"><i class="fas fa-user-shield"></i> <?php echo $row['firstname'];
																						}
																					}
																				} ?></p>
								</td>
							</tr>
							<tr>
								<td valign="baseline"><class="pb-0">Date/Time:</td>
								<td valign="baseline"><i class="fas fa-calendar-alt"></i><span id='time'></span></p>
								</td>
							</tr>
							<tr>
								<td valign="baseline">
									<meduim>
										<div class="content p-0 ml-5"><input type="text" value="Order" class="form-control form-control-sm customer_search" autocomplete="off" data-provide="typeahead" id="customer_search" placeholder="Customer Search" name="customer" hidden /></div>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="header_price border">
				<h5>Grand Total</h5>
				<p class="pb-0 mr-2 mb-2 ml-2" style="float: right; font-size: 40px;" id="totalValue">₱ 0.00</p>
			</div>

			</div>

			<div id="content" class="mr-2">
				<div id="price" style="margin: 3% 26% -44% 2%; border: 2px solid black;background-color: white;">
					<form method="POST" action="">
						<table class="table-responsive-sm table-striped w-100 font-weight-bold" style="cursor: pointer;" id="table2">
							<thead>
								<tr class='text-center'>
									<th>Product No.</th>
									<th>Description</th>
									<th>Price</th>
									<th>Unit</th>
									<th>Qty</th>
									<th>Addons</th>
									<th>Sub.Total</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="tableData">
							</tbody>
						</table>
					</form>
				</div>

				<div id="table_buttons" style="margin-top: -136px;margin-left: 16px;">
					<div class="bg-light card" style="padding:5px;width: 300px;">
						<ul>
							<li class="d-flex mt-2 ml- mb-0">Discount: <p id="totalValue1" class="mb-0 ml-0 pl-1"> 0.00</p>
							<li class="d-flex mt-0">Total: <p id="totalBefore" class="mb-0 ml-0 pl-2"> 0.00</p>
							</li>
						</ul>

						<div> Select Discount: </div>
						<select id="discount" style="width:100px">
							<option></option>
							<option>Senior </option>
							<option>PWD</option>
						</select>

						<ul>
							<li class="">Specific Discount: <div><input style="width:105px" class="text-right" type="number" name="s_discount" value="0" min="0" placeholder="Enter Discount" id="s_discount"></li>
						</ul>

						<button id="buttons" type="button" name='enter' class="Enter btn btn-outline-success border " style="width: 137px;height: 56px;"><i class="fas fa-handshake"></i> Finish</button>
						<button id="buttons" class="cancel btn btn-outline-danger border " style="width: 137px;height: 56px;"><i class="fas fa-ban"></i> Cancel</button>
					</div>
				</div>

			</div>

			<div class="product"></div>
			<div class="select">
				<p id="demo"></p>

				<script>
					function myFunction() {
						var x = document.getElementById("mySelect").options.length;
						document.getElementById("demo").innerHTML = "Found " + x + " options in the list.";
					}
				</script>

			</div>

			<div class="img" style="color:#ffffff;">
				<ul>
					<?php

					$productquery 	= "SELECT * FROM products";
					$res = mysqli_query($db, $productquery);

					if (mysqli_num_rows($res) > 0) {
						while ($row = mysqli_fetch_assoc($res)) {
					?>
							<li><input type="radio" name="test" id="<?= $row['product_no'] ?>" value="<?= $row['product_no'] ?>|<?= $row['product_name'] ?>|<?= $row['sell_price'] ?>|<?= $row['coffee'] ?>|<?= $row['sugar'] ?>|<?= $row['milk'] ?>|<?= $row['unit'] ?> " />
								<label for="<?= $row['product_no'] ?>">
									<img src="images/<?= $row['images'] ?>" />
									<small style="font-size: 10px;"><?= $row['product_name'] ?>(<?= $row['unit'] ?>)</small>

								</label>
								<!-- <label></label> -->
							</li>
					<?php
						}
					}
					?>
				</ul>

			</div>

			<div class="addons" style="color:#ffffff;">
				<div>Add ons:</div>

				<span id="addons_container"></span>

			</div>


			<div id="Add" class="add" style="margin-left: 1631px;margin-top: 802px;">
				<button id="Add" onclick="Cproduct()" class="logout btn btn-success " style="width: 137px;height: 56px;"></i> Add
			</div>
			</div>

			</div>
			<?php include('add.php'); ?>
			<?php include('templates/js_popper.php'); ?>\

			<script>
				var newCoffeeAmount;
				var newSugarAmount;
				var newMilkAmount;
				var newAddOnsAmountGlobal =[];
				var newAddOnsKeysGlobal =[];
				var rawMatsIdsUsed=[];
				var quantityGlobal=0;

				function Cproduct() {
					const item = document.getElementsByName('test');
					const value = document.getElementsByName('test').value;
					const addons = document.getElementsByName('addOns');
					// const sizeproduct = document.getElementById('sizeproduct');
					const product_name = document.getElementById('test');

					// const selectedOption = sizeproduct.value;

					const selectedaddons = [];
					const selecteditem = [];

					for (let i = 0; i < item.length; i++) {
						if (item[i].checked) {
							selecteditem.push(item[i].value);
						}
					}

					for (let i = 0; i < addons.length; i++) {
						if (addons[i].checked) {
							selectedaddons.push(addons[i].value);
						}
					}
					const [barcode, product, price, coffee, sugar, milk,unit] = selecteditem[0].split("|");

					console.log(barcode, product, price, coffee, sugar, milk,unit, selectedaddons);

					// return;

					swal({
							title: "Enter number of items:",
							content: "input",
						})
						.then((value) => {
							if (value == "") {
								swal("Error", "Entered none!", "error");
							} else {
								var qtynum = value;
								if (isNaN(qtynum)) {
									swal("Error", "Please enter a valid number!", "error");
								} else if (qtynum == null) {
									swal("Error", "Please enter a number!", "error");
								} else {
									var coffeeAmount= rawMats[searchKeyIndex(rawMats, "name", "Coffee")].kg;
									var sugarAmount= rawMats[searchKeyIndex(rawMats, "name", "Sugar")].kg;
									var milkAmount= rawMats[searchKeyIndex(rawMats, "name", "Milk")].kg;
									var totalprice_per_servingAddons = 0;

									rawMatsIdsUsed.push([rawMats[searchKeyIndex(rawMats, "name", "Coffee")].id,qtynum*coffee]);
									rawMatsIdsUsed.push([rawMats[searchKeyIndex(rawMats, "name", "Sugar")].id,qtynum*sugar]);
									rawMatsIdsUsed.push([rawMats[searchKeyIndex(rawMats, "name", "Milk")].id,qtynum*milk]);

									if(coffeeAmount<(qtynum*coffee)){
										swal("Error","Coffee materials not enough. Please restock",'error');
										return false;
									}

									if(sugarAmount<(qtynum*sugar)){
										swal("Error","Sugar materials not enough. Please restock",'error');
										return false;
									}

									if(milkAmount<(qtynum*milk)){
										swal("Error","Milk not enough. Please restock",'error');
										return false;
									}

									newCoffeeAmount = coffeeAmount-(qtynum*coffee);
									newSugarAmount = sugarAmount-(qtynum*sugar);
									newMilkAmount = milkAmount-(qtynum*milk);

									for (let index = 0; index < selectedaddons.length; index++) {
										var addOnsAmount = rawMats[searchKeyIndex(rawMats, "name", selectedaddons[index])].kg;
										var price_per_serving = rawMats[searchKeyIndex(rawMats, "name", selectedaddons[index])].price_per_serving;
										
										var newAddOnsAmount = addOnsAmount-(.01*qtynum);

										totalprice_per_servingAddons = totalprice_per_servingAddons+(price_per_serving*qtynum);
									
										
										if(addOnsAmount<newAddOnsAmount){
											swal("Error",selectedaddons[index]+" not enough. Please restock",'error');
											return false;
										}

										rawMatsIdsUsed.push([rawMats[searchKeyIndex(rawMats, "name", selectedaddons[index])].id,.01*qtynum]);
										newAddOnsAmountGlobal.push(newAddOnsAmount);
										newAddOnsKeysGlobal.push(selectedaddons[index]);
									}
									
									var total = totalprice_per_servingAddons +(parseInt(value, 10) * parseFloat(price));
									console.log(total);

									$('#tableData').append("<tr class='prd'><td class='barcode text-center'>" + barcode +
										"</td><td class='text-center'>" + product +
										"</td><td class='price text-center'>" + accounting.formatMoney(price, {
											symbol: "₱",
											format: "%s %v"
										}) +
										"</td><td class='text-center'>" + unit + "</td><td class='qty text-center'>" + value +
										"</td><td class='totalprice_per_servingAddons text-center'>" + accounting.formatMoney(totalprice_per_servingAddons, {
											symbol: "₱",
											format: "%s %v"
										}) +
										"</td><td class='totalPrice text-center'>" + accounting.formatMoney(total, {
											symbol: "₱",
											format: "%s %v"
										}) +
										"</td><td class='text-center p-1'> " +
										"<button class='btn btn-danger btn-sm' type='button' id='delete-row'><i class='fas fa-times-circle'></i></button><tr>"
									);
									GrandTotal();


								}
							}
						});
				}

				function loadproducts() {
					var name = $("#search").val();
					if (name) {
						$.ajax({
							type: 'post',
							data: {
								products: name,
							},
							url: 'loadproducts.php',
							success: function(Response) {
								$('#products').html(Response);
							}
						});
					}
				};


				function GrandTotal() {
					var TotalValue = 0;
					var TotalPriceArr = $('#tableData tr .totalPrice').get()
					var discount = $('#discount').val();
					var specific_discount = $('#s_discount').val();

					$(TotalPriceArr).each(function() {
						TotalValue += parseFloat($(this).text().replace(/,/g, "").replace("₱", ""));
					});


					if (discount == "Senior" || discount == "PWD") {

						var f_discount = 20;

						var newdiscount = TotalValue * f_discount / 100;
						var discountPrice = TotalValue - newdiscount;

						$("#s_discount").prop("disabled", true);
						$("#s_discount").val("");

						$("#totalValue").text(accounting.formatMoney(discountPrice, {
							symbol: "₱",
							format: "%s %v"
						}));
						$("#totalValue1").text(accounting.formatMoney(newdiscount, {
							symbol: "₱",
							format: "%s %v"
						}));
						$("#totalBefore").text(accounting.formatMoney(TotalValue, {
							symbol: "₱",
							format: "%s %v"
						}));

					} else {
						$("#s_discount").prop("disabled", false);

						var newdiscount = 0;
						var discountPrice = 0;

						if (specific_discount != null || specific_discount != "") {

							newdiscount = TotalValue * specific_discount / 100;
							discountPrice = TotalValue - newdiscount;

						}
						console.log(newdiscount);
						console.log(discountPrice);

						$("#totalValue").text(accounting.formatMoney(discountPrice, {
							symbol: "₱",
							format: "%s %v"
						}));
						$("#totalValue1").text(accounting.formatMoney(newdiscount, {
							format: "%v"
						}));
						$("#totalBefore").text(accounting.formatMoney(TotalValue, {
							symbol: "₱",
							format: "%s %v"
						}));
					}
				};

				$(document).on('change', '#discount', function() {
					GrandTotal();
				});
				$(document).on('change', '#s_discount', function() {
					GrandTotal();
				});

				$('body').on('click', '.js-add', function() {
					GrandTotal();

					var totalPrice = 0;
					var target = $(this);
					var product = target.attr('data-product');
					var price = target.attr('data-price');
					var barcode = target.attr('data-barcode');
					var unit = target.attr('data-unt');
					var quantity = target.attr('data-quantity');

					swal({
							title: "Enter number of items:",
							content: "input",
						})
						.then((value) => {
							if (value == "") {
								swal("Error", "Entered none!", "error");
							} else {
								var qtynum = value;
								if (isNaN(qtynum)) {
									swal("Error", "Please enter a valid number!", "error");
								} else if (qtynum == null) {
									swal("Error", "Please enter a number!", "error");
								} else {
									if (qtynum <= quantity) {
										var total = parseInt(value, 10) * parseFloat(price);
										$('#tableData').append("<tr class='prd'><td class='barcode text-center'>" + barcode + "</td><td class='text-center'>" + product + "</td><td class='price text-center'>" + accounting.formatMoney(price, {
											symbol: "₱",
											format: "%s %v"
										}) + "</td><td class='text-center'>" + unit + "</td><td class='qty text-center'>" + value + "</td><td class='totalPrice text-center'>" + accounting.formatMoney(total, {
											symbol: "₱",
											format: "%s %v"
										}) + "</td><td class='text-center p-1'><button class='btn btn-danger btn-sm' type='button' id='delete-row'><i class='fas fa-times-circle'></i></button><tr>");
										GrandTotal();
									} else {
										swal({
											title: "Out of Stock!",
											icon: "warning",
											dangerMode: true,
										})
									}

								}
							}
						});
				});


				$(document).ready(function() {
					document.getElementById("search").focus();
				});

				$("body").on('click', '#delete-row', function() {
					var target = $(this);
					swal({
							title: "Remove this item?",
							icon: "warning",
							buttons: true,
							dangerMode: true,
						})
						.then((willDelete) => {
							if (willDelete) {
								$(this).parents("tr").remove();
								swal("Removed Successfully!", {
									icon: "success",
									timer: 2000,
								});
								GrandTotal();
							}
						});
				});

				$(document).on('click', '.Enter', function() {

					var TotalPriceArr = $('#tableData tr .totalPrice').get();

					if (TotalPriceArr == 0) {
						swal("Warning", "No products ordered!", "warning");
						return false;
					} else {

						var product = [];
						var quantity = [];
						var price = [];
						var user = $('#uname').val();
						// var customer = $('#customer_search').val();
						var discount = $('#discount').val();
						var discount_type = "Regular";
						var dis_num = 0;
						var specific_discount = $('#s_discount').val();

						if (discount == "Senior" || discount == "PWD") {
							discount_type = $('#discount').val();
							dis_num = 20;
						} else {
							if (s_discount != null || s_discount != "") {
								discount_type = "Manual";
								dis_num = specific_discount;
							}
						}

						$('.barcode').each(function() {
							product.push($(this).text());
						});
						$('.qty').each(function() {
							quantity.push($(this).text());
						});
						$('.price').each(function() {
							price.push($(this).text().replace(/,/g, "").replace("₱", ""));
						});

						swal({
								title: "Enter Cash",
								content: "input",
							})
							.then((value) => {
								if (value == "") {
									swal("Error", "Entered None!", "error");
								} else {

									var qtynum = value;
									if (isNaN(qtynum)) {
										swal("Error", "Please enter a valid number!", "error");
									} else if (qtynum == null) {
										swal("Error", "Entered None!", "error");
									} else {

										var change = 0;
										var TotalPriceArr = $('#tableData tr .totalPrice').get()
										$(TotalPriceArr).each(function() {
											TotalValue += parseFloat($(this).text().replace(/,/g, "").replace("₱", ""));
										});
										var TotalValue = parseFloat($('#totalValue').text().replace(/,/g, "").replace("₱", ""));

										if (TotalValue > qtynum) {
											swal("Error", "Can't process a smaller number", "error");
										} else {
											change = parseInt(value, 10) - parseFloat(TotalValue);

											console.log("newCoffeeAmount: "+newCoffeeAmount);
											console.log("newSugarAmount: "+newSugarAmount);
											console.log("newMilkAmount: "+newMilkAmount);
											console.log("newAddOnsAmountGlobal: "+newAddOnsAmountGlobal);
											console.log("newAddOnsKeysGlobal: "+newAddOnsKeysGlobal);
											// return;

											$.ajax({
												url: "insert_sales.php",
												method: "POST",
												data: {
													totalvalue: TotalValue,
													product: product,
													price: price,
													user: user,
													quantity: quantity,
													discount: parseFloat($("#totalValue1").text().replace('₱', '')),
													discount_type: discount_type,
													"newCoffeeAmount": newCoffeeAmount,
													"newSugarAmount": newSugarAmount,
													"newMilkAmount": newMilkAmount,
													"newAddOnsAmountGlobal": newAddOnsAmountGlobal,
													"newAddOnsKeysGlobal": newAddOnsKeysGlobal,
													"rawMatsIdsUsed": rawMatsIdsUsed,
												},
												success: function(data) {
													console.log(data);
													if (data == "success") {
														swal({
																title: "Change is " + accounting.formatMoney(change, {
																	symbol: "₱",
																	format: "%s %v"
																}),
																icon: "success",
																buttons: "Okay",
															})
															.then((okay) => {
																console.log(okay);
																if (okay) {
																	window.location.href = 'print_view.php?totalvalue=' + TotalValue + '&product=' + product + '&price=' + price + '&user=' + user + '&quantity=' + quantity + '&discount=' + discount;
																}
															})
													} else {
														window.location.href = 'employee_page.php?' + data;
													}

												}
											});
										}
									}
								}
							});
					}
				});

				$(document).on('click', '.cancel', function(e) {
					var TotalPriceArr = $('#tableData tr .totalPrice').get();
					if (TotalPriceArr == 0) {
						return 0;
					} else {
						swal({
								title: "Cancel orders?",
								text: "By doing this,orders will remove!",
								icon: "warning",
								buttons: ["No", "Yes"],
								dangerMode: true,
							})
							.then((reload) => {
								if (reload) {
									location.reload();
								}
							});
					}
				});

				function out() {
					var lag = "logout";
					swal({
							title: "Logout?",
							icon: "warning",
							buttons: ["Cancel", "Yes"],
							dangerMode: true,
						})
						.then((value) => {
							if (value) {
								if (lag) {
									$.ajax({
										type: 'post',
										data: {
											logout: lag
										},
										url: 'server/connection.php',
										success: function(data) {
											window.location.href = 'main.php';
										}
									});
								}
							}
						})
				};
			</script>
			<script src="bootstrap4/js/time.js"></script>
			</body>

			</html>

			<script>
				var rawMats = [];

				$.ajax({
					url: "model.php",
					method: "POST",
					data: {
						"action": "getAllAddOns",
					},
					success: function(data) {
						data = JSON.parse(data)

						for (let index = 0; index < data.length; index++) {
							$("#addons_container").append('<label><input type="checkbox" name="addOns" class="addOns" value="' + data[index].name + '">' + data[index].name + '</label>');
						}
					}
				});

				$.ajax({
					url: "delivery/add.php",
					method: "POST",
					data: {
						"action": "getAllRawMats",
					},
					success: function(data) {
						console.log();
						rawMats = JSON.parse(data);
					}
				});

				function searchKeyIndex(jsonArray, searchKey, searchValue) {
					for (let i = 0; i < jsonArray.length; i++) {
						if (jsonArray[i][searchKey] === searchValue) {
							return i;
						}
					}
					return -1; // Return -1 if no match is found
				}
			</script>