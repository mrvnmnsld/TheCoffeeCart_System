<?php 
	include('server/connection.php');
	if(!isset($_SESSION['username'])){
		header('location: index.php');
	}
	$added = isset($_GET['added']);
	$print = isset($_GET['print']);
	$error = isset($_GET['error']);
	$undelete = isset($_GET['undelete']);
	$updated = '';
	$deleted = '';
	$failure = isset($_GET['failure']);
	
	$query 	= "SELECT * FROM `customer`";
	$show	= mysqli_query($db,$query);
	if(isset($_SESSION['username'])){
		$user = $_SESSION['username'];
		$sql = "SELECT firstname FROM users WHERE username='$user'";
		$result	= mysqli_query($db, $sql);
		if (mysqli_num_rows($result) > 0){
			while($row = mysqli_fetch_assoc($result)){
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
	<!-- <link rel="stylesheet" href="bootstrap4/css/all.min.css"/> -->
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
			<div class="logotop"><img src="images/hlogo.png" width="130" height="130"style="margin: 0% 0% -77% 13%;"></a>
			<li style="margin: 184% -29% -110% 115%">
			<li><a onclick="window.location.href='user/user.php'"><i class="fas fa-user-circle"></i> My Profile</a></li>
            <li><a onclick="window.location.href='employee/inventory.php'"><i class="fas fa-box-open"></i> Inventory</a></li>
			<li><a onclick="window.location.href='sales/sales.php'"><i class="fas fa-shopping-cart"></i> Sales</a></li>
			<li><a onclick="window.location.href='logs/logs.php'"><i class="fas fa-shopping-cart"></i> Logs</a></li>
			<li><a class="btn m-2 p-2" id="sidebar_button" onclick="window.location.href='./index.html'"><i class="fas fa-arrow-alt-circle-left"></i> Back</a></li>
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
							<td valign="baseline"><i class="fas fa-user-shield"></i> <?php echo $row['firstname'];}}}?></p></td>
						</tr>
						<tr>
							<td valign="baseline"><class="pb-0">Date/Time:</td>
							<td valign="baseline"><i class="fas fa-calendar-alt"></i><span id='time'></span></p></td>
						</tr>
						<tr>
							<td valign="baseline"><meduim><div class="content p-0 ml-5"><input type="text" value ="Order"class="form-control form-control-sm customer_search" autocomplete="off" data-provide="typeahead" id="customer_search" placeholder="Customer Search" name="customer" hidden /></div>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			<div class="header_price border p-2 pl-2">
				<h5>Grand Total</h5>
				<p class="pb-0 mr-2 mb-2 ml-2" style="float: right; font-size: 40px;" id="totalValue">₱ 0.00</p>
			</div>
		</div>
		<div id="content" class="mr-2">
			<div id="price"style="margin: 3% 26% -44% 2%; border: 2px solid black;background-color: white;">
				<form method="POST" action="">
				<table class="table-responsive-sm table-striped w-100 font-weight-bold" style="cursor: pointer;" id="table2">
					<thead>
						<tr class='text-center'>
							<th>Product No.</th>
							<th>Description</th>
							<th>Price</th>
							<th>Unit</th>
							<th>Qty</th>
							<th>Sub.Total</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tableData">
					</tbody>
				</table>
				</form>
			
			</div>
			<div id="table_buttons">
				<div class="bt">
				<button id="buttons" type="button" name='enter' class="Enter btn btn-outline-success border "style="width: 137px;height: 56px;"><i class="fas fa-handshake"></i> Finish</button>
				<button id="buttons" class="cancel btn btn-outline-danger border " style="width: 137px;height: 56px;" ><i class="fas fa-ban"></i> Cancel</button>
			</div>
				<div class="">
				<small>
				<ul class="table-responsive-sm text-white justify-content-center">
						<div class="dt">
								<li class="d-flex mt-2 ml- mb-0">Discount: <p id="totalValue1" class="mb-0 ml-0 pl-1"> 0.00</p><li class="d-flex mt-0">Total: <p id="totalBefore" class="mb-0 ml-0 pl-2"> 0.00</p> </li>	
						</div>
			</ul>
						<ul class="SD">
						<div> Select Discount: </div>
						<select id="discount" style="width:100px">
							<option></option>
							<option>Senior </option>
							<option>PWD</option>
						</select>
				</ul>
			
				<ul class="Sd"> 
						<li class="">Specific Discount: <div><input style="width:105px" class="text-right" type="number" name="s_discount" value="0" min="0" placeholder="Enter Discount" id="s_discount" ></li>
				</ul>
				</small>
				</div>
			</div>
		</div>
		<!-- <div>
			<ul style="color:#ffffff; margin: 5% 0% 2% -39%;">
		     <li> <button class="cancel btn btn-outline-success border" style="width:50px;"  type="submit">All</button></li>	
		     <li> <button class="cancel btn btn-outline-success border" style="width:100px; color: rgb(242 225 207);" type="submit">Arabica</button></li>	
		     <li> <button class="cancel btn btn-outline-success border" style="width:100px; color: rgb(242 225 207);" type="submit">Robusta</button></li>	
		     <li> <button class="cancel btn btn-outline-success border" style="width:100px; color: rgb(242 225 207);"  type="submit">Excelsa</button></li>	
		     <li> <button class="cancel btn btn-outline-success border" style="width:100px; color: rgb(242 225 207);" type="submit">Liberica</button></li>	
			</ul>
			</div> -->

		    <div class="product"></div>
			<div class="select">
               <!-- <ul style="color:#ffffff;">
						<div> Select Coffee: </div>
						<select id="SelectC" style="width:200px">
							<option></option>
							<option>Americano </option>
							<option>Caramel Macchiatto </option>
							<option>Cold Brew Mocha </option>
							<option>French Vanilla Latte </option>
							<option>Salted Caramel Macchiato </option>
							<option>Cookie Latte </option>
							<option>Almond Latte </option>
							<option>Choco-Caramel </option>
						</select>
				</ul> -->
				<ul style="color:#ffffff;">
						<div> Size: </div>
						<select id="sizeproduct" name="sizeproduct" style="width:100px">
							<option ></option>
							<option value="Regular">Regular</option>
							<!-- <option value="Medium">Medium</option> -->
							<option value="Large">Large</option>=
						</select>
				</ul>

</form>



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
					$res = mysqli_query($db,$productquery);

					if (mysqli_num_rows($res) > 0){
						while($row = mysqli_fetch_assoc($res)){
						?>
						<li><input type="radio"name="test" id="test" value="<?=$row['product_no']?>| <?=$row['product_name']?>|<?=$row['sell_price']?> | <?=$row['quantity']?>  " />
							<label for="cb1"><img src="images/<?=$row['images']?>" /></label>
						</li>
						<?php
						}
					}
					?>
			</ul>

		</div>
	
			<div class="addons"style="color:#ffffff;">
				<div>Add ons:</div>
				<label><input type="checkbox" name="addOns">Pearl</label>
				<label><input type="checkbox" name="addOns">Milk</label>
				<label><input type="checkbox" name="addOns">Oreo Cookie</label>
				<label><input type="checkbox" name="addOns">Ice Cream</label>
				<label><input type="checkbox" name="addOns">Peanut</label>
		  </div>


		<div id="Add" class="add" align="center">
			<button id="Add"onclick="Cproduct()" class="logout btn btn-outline-success border " style="width: 137px;height: 56px;" ></i> Add</div>
		</div>
		<!-- </div>
		<div id="footer" class="w-100" align="center">
			<button id="buttons" onclick="window.location.href='employee/profile.php'" class="btn btn-outline-light border mr-2 ml-2"><i class="fas fa-user-circle"></i> My Profile</button>
			<button id="buttons" onclick="window.location.href='employee/inventory.php'" class="btn btn-outline-light border mr-2"><i class="fas fa-box-open"></i> Inventory</button>
			<button id="buttons" onclick="window.location.href='employee/cashflow.php'" class="btn btn-outline-light border mr-2"><i class="fas fa-money-bill-wave"></i> Cash-Flow</button>
			<button id="buttons" name="logout" type="button" onclick="out();" class="logout btn btn-outline-success border mr-2"> <i class="fas fa-sign-out-alt"></i> Logout</div>
		</div> -->


	</div>
	<?php include('add.php');?>
	<?php include('templates/js_popper.php');?>\
	
	<script>

		function Cproduct(){
			const item = document.getElementsByName('test');
			const value = document.getElementsByName('test').value;
			const addons = document.getElementsByName('addOns');
			const sizeproduct = document.getElementById('sizeproduct');
			const product_name  = document.getElementById('test');
		
			const selectedOption = sizeproduct.value;
		
			const selectedaddons= [];
			const selecteditem = [];
			
			for (let i = 0; i < item.length; i++) 
			{
				if (item[i].checked) 
				{
					selecteditem.push(item[i].value);
				}
			}

			for (let i = 0; i < addons.length; i++) 
			{
				if (addons[i].checked) 
				{
					selectedaddons.push(addons[i].value);
				}
			}
			const [barcode, product, price, quantity] = selecteditem[0].split("|");

			console.log(barcode, product, JSON.parse(price), JSON.parse(quantity));
			swal({
				title: "Enter number of items:",
					content: "input",
					})
				.then((value) => {
					if (value == "") {
						swal("Error","Entered none!","error");
					}else{
						var qtynum = value;
							if (isNaN(qtynum))
							{
								swal("Error","Please enter a valid number!","error");
							}else if(qtynum == null)
							{
								swal("Error","Please enter a number!","error");
							}else{
								if(qtynum <= JSON.parse(quantity))
								{
									var total = parseInt(value,10) * parseFloat(price);
									$('#tableData').append("<tr class='prd'><td class='barcode text-center'>"+barcode+
									"</td><td class='text-center'>"+product+
									"</td><td class='price text-center'>"+accounting.formatMoney(price,{symbol:"₱",format: "%s %v"})+
									"</td><td class='text-center'>"+selectedOption+"</td><td class='qty text-center'>"+value+
									"</td><td class='totalPrice text-center'>"+accounting.formatMoney(total,{symbol:"₱",format: "%s %v"})+
									"</td><td class='text-center p-1'> " + 
									"<button class='btn btn-danger btn-sm' type='button' id='delete-row'><i class='fas fa-times-circle'></i></button><tr>");
									GrandTotal();
								}else
								{
									swal({
									title: "Out of Stock!",
									icon: "warning",
									dangerMode: true,
									})
								}
							
						}
					}
				});
		}

	function loadproducts(){
	var name = $("#search").val();
			if(name){
				$.ajax({
					type: 'post',
					data: {
						products:name,
					},
					url: 'loadproducts.php',
					success: function (Response){
						$('#products').html(Response);
					}
				});
			}
		};


	function GrandTotal(){
	var TotalValue = 0;
	var TotalPriceArr = $('#tableData tr .totalPrice').get()
	var discount = $('#discount').val();
	var specific_discount = $('#s_discount').val();

	$(TotalPriceArr).each(function(){
		TotalValue += parseFloat($(this).text().replace(/,/g, "").replace("₱",""));
	});


	if(discount == "Senior" || discount == "PWD" ){
		
		var f_discount = 20;

		var newdiscount = TotalValue * f_discount / 100;
		var discountPrice = TotalValue - newdiscount;
		
		$("#s_discount").prop("disabled", true);
		$("#s_discount").val("");

		$("#totalValue").text(accounting.formatMoney(discountPrice,{symbol:"₱",format: "%s %v"}));
		$("#totalValue1").text(accounting.formatMoney(newdiscount,{symbol:"₱",format: "%s %v"}));
		$("#totalBefore").text(accounting.formatMoney(TotalValue,{symbol:"₱",format: "%s %v"}));
		
	}else{
		$("#s_discount").prop("disabled", false);

		var newdiscount  = 0;
		var discountPrice = 0;

		if (specific_discount != null || specific_discount != "") {
			
			newdiscount = TotalValue * specific_discount / 100;
			discountPrice = TotalValue - newdiscount;

		}
		console.log(newdiscount);
		console.log(discountPrice);

		$("#totalValue").text(accounting.formatMoney(discountPrice,{symbol:"₱",format: "%s %v"}));
		$("#totalValue1").text(accounting.formatMoney(newdiscount,{format: "%v"}));
		$("#totalBefore").text(accounting.formatMoney(TotalValue,{symbol:"₱",format: "%s %v"}));
	}
	};

$(document).on('change', '#discount', function(){
  GrandTotal();
});
$(document).on('change', '#s_discount', function(){
  GrandTotal();
});

$('body').on('click','.js-add',function(){
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
				  swal("Error","Entered none!","error");
			  }else{
				  var qtynum = value;
				  	if (isNaN(qtynum))
					{
    					swal("Error","Please enter a valid number!","error");
					}else if(qtynum == null)
					{
						swal("Error","Please enter a number!","error");
					}else{
						if(qtynum <= quantity)
						{
							var total = parseInt(value,10) * parseFloat(price);
							$('#tableData').append("<tr class='prd'><td class='barcode text-center'>"+barcode+"</td><td class='text-center'>"+product+"</td><td class='price text-center'>"+accounting.formatMoney(price,{symbol:"₱",format: "%s %v"})+"</td><td class='text-center'>"+unit+"</td><td class='qty text-center'>"+value+"</td><td class='totalPrice text-center'>"+accounting.formatMoney(total,{symbol:"₱",format: "%s %v"})+"</td><td class='text-center p-1'><button class='btn btn-danger btn-sm' type='button' id='delete-row'><i class='fas fa-times-circle'></i></button><tr>");
							GrandTotal();
						}else
						{
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


$(document).ready(function(){
  	document.getElementById("search").focus();
 });

$("body").on('click','#delete-row', function(){
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

$(document).on('click','.Enter',function(){

  var TotalPriceArr = $('#tableData tr .totalPrice').get();

  if (TotalPriceArr == 0){
    swal("Warning","No products ordered!","warning");
    return false; 
  }else{

    var product = [];
    var quantity = [];
    var price = [];
    var user = $('#uname').val();
    // var customer = $('#customer_search').val();
    var discount = $('#discount').val();
	var discount_type = "Regular";
	var dis_num = 0;
	var specific_discount = $('#s_discount').val();

	if(discount == "Senior Citizen" || discount == "PWD" ){
		discount_type = $('#discount').val();
		dis_num = 20;
	}else{
		if(s_discount != null || s_discount != "")
		{
			discount_type = "Manual";
			dis_num = specific_discount;
		}
	}

    $('.barcode').each(function(){
      product.push($(this).text());
    });
    $('.qty').each(function(){
      quantity.push($(this).text());
    });
    $('.price').each(function(){
      price.push($(this).text().replace(/,/g, "").replace("₱",""));
    });

    swal({
      title: "Enter Cash",
      content: "input",
    })
    .then((value) => {  
      if(value == "") {
        swal("Error","Entered None!","error");
      }else{

        var qtynum = value;
        if(isNaN(qtynum)){
          swal("Error","Please enter a valid number!","error");
        }else if(qtynum == null){
          swal("Error","Entered None!","error");
        }else{

          var change = 0;
          var TotalPriceArr = $('#tableData tr .totalPrice').get()
           $(TotalPriceArr).each(function(){
          TotalValue += parseFloat($(this).text().replace(/,/g, "").replace("₱",""));
          });
          var TotalValue = parseFloat($('#totalValue').text().replace(/,/g, "").replace("₱",""));

          if(TotalValue > qtynum){
            swal("Error","Can't process a smaller number","error");
          }else{
            change = parseInt(value,10) - parseFloat(TotalValue);
            $.ajax({
              url:"insert_sales.php",
              method:"POST",
              data:{totalvalue:TotalValue, product:product, price:price, user:user, quantity:quantity, discount:dis_num ,discount_type:discount_type},
              success: function(data){
                console.log(data);
                if( data == "success"){
                  swal({
                    title: "Change is " + accounting.formatMoney(change,{symbol:"₱",format: "%s %v"}),
                    icon: "success",
                    buttons: "Okay",
                  })
                  .then((okay)=>{
                    if(okay){
                      window.location.href='print_view.php?totalvalue='+TotalValue+ '&product='+product+ '&price='+price+ '&user='+user+ '&quantity='+quantity + '&discount='+ discount ;
                    }
                  })
                }else{
                  window.location.href='main.php?'+data;
                }
                
              }
            });
          }
        }
      }
    });
  }
});

$(document).on('click','.cancel',function(e){
  var TotalPriceArr = $('#tableData tr .totalPrice').get();
  if (TotalPriceArr == 0){
    return 0;
  }else{
    swal({
      title: "Cancel orders?",
      text: "By doing this,orders will remove!",
      icon: "warning",
      buttons: ["No","Yes"],
      dangerMode: true,
    })
    .then((reload) => {
      if (reload) {
        location.reload();
      }
    });
  }
});

function out(){
  var lag = "logout";
  swal({
      title: "Logout?",
      icon: "warning",
      buttons: ["Cancel","Yes"],
      dangerMode: true,
    })
    .then((value) => {
      if(value){
        if(lag){
            $.ajax({
              type: 'post',
              data: {
                logout:lag
              },
              url: 'server/connection.php',
              success: function (data){
                window.location.href='index.php';
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



