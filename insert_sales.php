<?php include 'server/connection.php';
if(isset($_POST['product'])){
	$user = $_SESSION['username'];
	$discount = $_POST['discount'];
	$Discounttype = $_POST['discount_type'];
	$total = $_POST['totalvalue'];
	$price = $_POST['price'];
	$product = $_POST['product'];
	// $customer = $_POST['customer'];
	$quantity = $_POST['quantity'];
	$reciept = array();
	
	$query = '';
	// $customer_id = mysqli_query($db, "SELECT customer_id FROM customer WHERE CONCAT(firstname,' ',lastname) LIKE '$customer'");

	// if(mysqli_num_rows($customer_id) == 0){
	// 	echo "failure";
	// }else{
		// $cust_id 	= mysqli_fetch_array($customer_id);
		$cust_id_new = rand();
		

		$sql  = "INSERT INTO customer (firstname,lastname,address,contact_number,image) VALUES ('$cust_id_new','','','','')";
	  	$result = mysqli_query($db, $sql);

		$sql = "INSERT INTO sales(customer_id,username,discount,Discounttype,total) VALUES($cust_id_new,'$user',$discount,'$Discounttype', $total)";
		$result = mysqli_query($db,$sql);

		if($result == true){
			$select = "SELECT reciept_no FROM sales ORDER BY reciept_no DESC LIMIT 1";
			$res = mysqli_query($db,$select);
			$id = mysqli_fetch_array($res);
			for($i = 0;  $i < count($product); $i++){
				$reciept[] = $id[0];
			}

			for($num=0; $num<count($product); $num++){
				$product_id = mysqli_real_escape_string($db, $product[$num]);
				$qtyold = mysqli_real_escape_string($db, $quantity[$num]);

				$sql1 = "SELECT quantity FROM products WHERE product_no='$product_id'";
				$result1 = mysqli_query($db, $sql1);
				$qty = mysqli_fetch_array($result1);

				$newqty = $qty['quantity'] - $qtyold;

				$sql2 = "UPDATE products SET quantity=$newqty WHERE product_no='$product_id'";
				$result2 = mysqli_query($db, $sql2);

			}

			$query1 	= "INSERT INTO logs (username,purpose) VALUES('$user','Product sold')";
	 		$insert 	= mysqli_query($db,$query1);

			for($count = 0; $count < count($product); $count++){
				$price_clean = mysqli_real_escape_string($db, $price[$count]);
				$reciept_clean = mysqli_real_escape_string($db, $reciept[$count]);
				$product_clean = mysqli_real_escape_string($db, $product[$count]);
				$quantity_clean = mysqli_real_escape_string($db, $quantity[$count]);
				if($product_clean != '' && $quantity_clean != '' && $price_clean != '' && $reciept_clean != ''){
					$query .= "
						INSERT INTO sales_product(reciept_no,product_id,price,qty) 
						VALUES($reciept_clean,$product_clean,$price_clean,$quantity_clean);
						";
				}
			} 

			$updateCoffeeQuery = "UPDATE raw_mats SET kg='".$_POST["newCoffeeAmount"]."' WHERE name='Coffee'";
			mysqli_query($db, $updateCoffeeQuery);

			$updateSugarQuery = "UPDATE raw_mats SET kg='".$_POST["newSugarAmount"]."' WHERE name='Sugar'";
			mysqli_query($db, $updateSugarQuery);

			$updateMilkQuery = "UPDATE raw_mats SET kg='".$_POST["newMilkAmount"]."' WHERE name='Milk'";
			mysqli_query($db, $updateMilkQuery);

			for ($i=0; $i < count($_POST["newAddOnsKeysGlobal"]); $i++) { 
				$updateMilkQuery = "UPDATE raw_mats SET kg='".$_POST["newAddOnsAmountGlobal"][$i]."' WHERE name='".$_POST["newAddOnsKeysGlobal"][$i]."'";
				mysqli_query($db, $updateMilkQuery);
			}

			for ($i=0; $i < count($_POST["rawMatsIdsUsed"]); $i++) { 
				$updateMilkQuery = "INSERT INTO raw_mats_sales (raw_mats_id,quantity,sales_id,date_created) VALUES('".$_POST["rawMatsIdsUsed"][$i][0]."','".$_POST["rawMatsIdsUsed"][$i][1]."','".$result."','".date('Y-m-d')."')";
				mysqli_query($db, $updateMilkQuery);
			}
			

		}else{
			echo "failure";
		}
	
		if ($query != ''){
			if(mysqli_multi_query($db,$query)){
				echo "success";
			}else{
				echo "failure";
			}
		}else{
			echo 'failure';
		}
	// }
}