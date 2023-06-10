<?php 
	$database	= 'pos_db';
	$username	= 'root';
	$host		= 'localhost';
	$password	= '';
	
	$db = mysqli_connect($host,$username,$password,$database);

	if(isset($_POST['barcode'])){
		$barcode = $_POST["barcode"];
		$product_name = $_POST["product_name"];
		$unit = $_POST["unit"];
		$coffee = $_POST["coffee"];
		$sugar = $_POST["sugar"];
		$milk = $_POST["milk"];
		$sell_price = $_POST["sell_price"];
		$remarks = $_POST["remarks"];
		
		$insertStringCol = '';
		$insertStringVal = '';

		for ($i=0; $i < count($barcode); $i++) { 
			$insertString = "INSERT INTO products (product_no,product_name,sell_price,unit,remarks,coffee,sugar,milk) VALUES('".$barcode[$i]."','".$product_name[$i]."','".$sell_price[$i]."','".$unit[$i]."','".$remarks[$i]."','".$coffee[$i]."','".$sugar[$i]."','".$milk[$i]."')";

			$res = mysqli_query($db, $insertString);
		}

		echo "success";
	}

	if(isset($_POST['action'])&&$_POST['action']=="getAllRawMats"){
		$sql = "SELECT raw_mats.*,supplier.company_name FROM raw_mats JOIN supplier ON raw_mats.supplier_id = supplier.supplier_id";
		$result = mysqli_query($db, $sql);

		$rows = array();
		if (mysqli_num_rows($result) > 0) {
			while ($row = mysqli_fetch_assoc($result)) {
				$rows[] = $row;
			}
		}

		echo json_encode($rows);
	}

	if(isset($_POST['action'])&&$_POST['action']=="getAllSupplier"){
		$sql = "SELECT * FROM supplier";
		$result = mysqli_query($db, $sql);

		$rows = array();
		if (mysqli_num_rows($result) > 0) {
			while ($row = mysqli_fetch_assoc($result)) {
				$rows[] = $row;
			}
		}

		echo json_encode($rows);
	}

	if(isset($_POST['action'])&&$_POST['action']=="saveNewRawMats"){

		for ($i=0; $i < count($_POST["rawMatsIds"]); $i++) { 
			$sql = "
			UPDATE raw_mats SET 
				supplier_id = '".$_POST["supplier"][$i]."', 
				kg = '".$_POST["kg"][$i]."',
				price_per_serving = '".$_POST["price_per_serving"][$i]."'
			WHERE id = ".$_POST["rawMatsIds"][$i];

			mysqli_query($db, $sql);
		}

		echo "success";
	}

	if(isset($_POST['action'])&&$_POST['action']=="addNewRawMats"){

		$insertString = "INSERT INTO raw_mats (name,kg,supplier_id,remarks) VALUES('".$_POST["name"]."','".$_POST["kg"]."','".$_POST["supplier_id"]."','".$_POST["remarks"]."')";

		$res = mysqli_query($db, $insertString);

		echo "success";
	}

	if(isset($_POST['action'])&&$_POST['action']=="saveRawMatsFromExcel"){
		$supplier_id;
		

		// getSupplier
			$sql = "SELECT * FROM supplier WHERE company_name = '".$_POST['supplier_name']."'";
			$result = mysqli_query($db, $sql);

			$rows = array();
			if (mysqli_num_rows($result) > 0) {
				while ($row = mysqli_fetch_assoc($result)) {
					$supplier_id = $row["supplier_id"];
				}
			}

		// getSupplier


		for ($i=0; $i < count($_POST['name']); $i++) { 
			$raw_mats_id = "";
			$raw_mats_current_kg = "";

			// getRawMatsInfo
				$sql = "SELECT * FROM raw_mats WHERE name = '".$_POST['name'][$i]."'";
				$result = mysqli_query($db, $sql);

				$rows = array();
				if (mysqli_num_rows($result) > 0) {
					while ($row = mysqli_fetch_assoc($result)) {
						$raw_mats_id = $row["id"];
						$raw_mats_current_kg = $row["kg"];
					}
				}
			// getRawMatsInfo

			// echo $raw_mats_id;

			if($raw_mats_id == ""){
				$insertString = "INSERT INTO raw_mats (name,kg,supplier_id,remarks) VALUES('".$_POST["name"][$i]."','".$_POST["kg"][$i]."','".$supplier_id."','".$_POST["remarks"][$i]."')";
				$res = mysqli_query($db, $insertString);
			}else{
				$newKg = floatval($_POST["kg"][$i])+floatval($raw_mats_current_kg);
				$sql = "
					UPDATE raw_mats SET 
							supplier_id = '".$supplier_id."', 
							kg = '".$newKg."' 
					WHERE 
						id = ".$raw_mats_id
				;

				mysqli_query($db, $sql);
			}
		}

		echo "success";

		


		
	}

	

	


	

	

