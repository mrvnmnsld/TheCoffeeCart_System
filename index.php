<?php include('server/connection.php'); ?>
<?php include('login.php');?>
<!DOCTYPE html>
<html>
<head>
<link rel="manifest" href="manifest.json">
	<?php include('templates/head.php'); ?>
	<script src="bootstrap4/jquery/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="bootstrap4/css/style.css">
</head>
<body class="bg-dark"><div class="blur"></div>
	<div class="mb-2 text-center">
		<div class="main">
			<img class="text-align:center;" src="images/Oogo.png"/>
  			<?php include('error.php');?>
		</div>

		<div class="fixed-bottom mb-5">
			<div class="d-inline">
				<button type="button" id="admin" class="btn btn-outline-light" data-toggle="modal" data-target=".bd-example-modal-sm"><i class="fas fa-user-tie"></i> Administrator</button>
			</div>
			
			<div class="d-inline">
				<button type="button" id="user" class="btn btn-outline-light" data-toggle="modal" data-target="#modal-user"><i class="fas fa-user"></i> Employee</button>
			</div>
		</div>

	</div>
	<script src="bootstrap4/jquery/jquery.min.js"></script>
	<script src="bootstrap4/js/bootstrap.bundle.min.js"></script>
	<?php include('modals/admin_login_modal.php');?>
	<?php include('modals/employee_login_modal.php');?>
	<script src="index.js"></script>
</body>
</html>