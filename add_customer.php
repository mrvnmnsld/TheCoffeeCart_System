<?php 
	include('server/connection.php');
	if(isset($_POST['submit'])){
		$user 		= mysqli_real_escape_string($db, $_POST['user']);
		$fname 		= mysqli_real_escape_string($db, $_POST['fname']);
	  	$image   	= $_FILES['image']['name'];
		$target   	= "images/".basename($_FILES['image']['name']);
		
		$sql  = "INSERT INTO customer (firstname,image) VALUES ('$fname','$image')";
	  	$result = mysqli_query($db, $sql);
 		if(move_uploaded_file($_FILES['image']['tmp_name'], $target) && $result == true){
 			$query 	= "INSERT INTO logs (username,purpose,logs_time) VALUES('$user','Customer $fname Added',CURRENT_TIMESTAMP)";
 			$insert 	= mysqli_query($db,$query);
			header('location: main.php?username='.$user.'&added');
	  	}else{
			$msg = "Something went wrong!";
	  	}
	}
