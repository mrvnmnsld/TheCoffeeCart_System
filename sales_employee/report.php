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
    <h3 style="margin-top: 30px;">Sales Report</h3>
		<hr>
</center>
<center>
<div class="table-responsive pl-5 pr-5">
			<table class="table table-bordered table-striped" id="sales_table" style="margin-top: 10px;">
				<thead>
					<tr>
						<th scope="col" class="column-text">Receipt No.</th>
						<th scope="col" class="column-text">Order Number</th>
						<th scope="col" class="column-text">Cashier</th>
						<th scope="col" class="column-text">Discount(%)</th>
						<th scope="col" class="column-text">Discount Type(%)</th>
						<th scope="col" class="column-text">Value(₱)</th>
						<th scope="col" class="column-text">Date</th>

					</tr>
				</thead>
				<tbody>
    <?php
    	include("../server/connection.php");
        $get_sales_report = mysqli_query($db, "SELECT * from sales");

        while($row = mysqli_fetch_array($get_sales_report)){
    ?>
     <tr>

    <td><?php echo $row['reciept_no']?></td>
    <td><?php echo $row['customer_id']?></td>
    <td><?php echo $row['username']?></td>
    <td><?php echo $row['discount']?></td>
   	<td><?php echo $row['Discounttype']?></td>
    <td><?php echo $row['total']?></td>
    <td><?php echo $row['date']?></td>

 </tr>
    <?php } ?>
</tbody>
        </table>
        <div>
        </center>
        <div class="fixed-bottom">
		<button class="btn m-2 p-2" id="sidebar_button" onclick="window.location.href='../sales/sales.php'"><i class="fas fa-arrow-alt-circle-left"></i> Back</button>
	</div>
</html>
</body>
<style>
  @media print{
    button {
      display: none
    }
  }
</style>
<script>
    const btn = document.getElementById('hide');
    btn.addEventListener('click', () => {
    // 👇️ hide button
    btn.style.display = 'none';
    window.print();

    });
    </script>