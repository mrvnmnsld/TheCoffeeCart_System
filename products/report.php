<?php
	include("../server/connection.php");
	include '../set.php';
?>
<?php 
 $db = mysqli_connect("localhost", "root", "", "pos_db");  
 $get_sales_report = mysqli_query($db, "SELECT * from sales"); 
?>
<!DOCTYPE html>
<html>
<head>
	<?php include('../templates/head1.php');?>

</head>
<body>
</body>	
<body onload="print()">
<div class="container">
<center>
<br></br>
    <div class="container" style="width:500px;">
    <h3 style="margin-top: 30px;">Product Report</h3>
		<hr>
</center>
<center>
<div class="table-responsive pl-5 pr-5">
			<table class="table table-bordered table-striped" id="sales_table" style="margin-top: 10px;">
				<thead>
					<tr>
						<th scope="col" class="column-text">Barcode</th>
						<th scope="col" class="column-text">Product_name</th>
                        <th scope="col" class="column-text">Sell_price</th>
						<th scope="col" class="column-text">Quantity</th>
						<th scope="col" class="column-text">Unit</th>
						<th scope="col" class="column-text">Min_stocks</th>

					</tr>
				</thead>
				<tbody>
    <?php
    	include("../server/connection.php");
        $get_product_report = mysqli_query($db, "SELECT * from products");

        while($row = mysqli_fetch_array($get_product_report)){
    ?>
     <tr>

    <td><?php echo $row['product_no']?></td>
    <td><?php echo $row['product_name']?></td>
    <td><?php echo $row['sell_price']?></td>
    <td><?php echo $row['quantity']?></td>
    <td><?php echo $row['unit']?></td>
    <td><?php echo $row['min_stocks']?></td>
 </tr>
    <?php } ?>
</tbody>
        </table>
        <div>
        </center>
        <div class="fixed-bottom">
		<button class="btn m-2 p-2" id="sidebar_button" onclick="window.location.href='../products/products.php'"><i class="fas fa-arrow-alt-circle-left"></i> Back</button>
	</div>
</html>
</body>
