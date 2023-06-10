<?php 
	include '../products/add.php';
	include '../set.php';
?>
<!DOCTYPE html>
<html>
<head>
	<?php include('../templates/head1.php');?>
</head>
<body>
	<div class="contain h-100">
		<?php include('../products/base.php');?>
		<div class="main">
			<div class="side">
				<h1 class="ml-4 mt-2"><i class="fas fa-user-tie"></i> Product Management</h1>
				<hr>
			</div>
			<div class="first_side ml-5 mt-5 mr-3">
				<div style="border:1px dashed black; width: 250px;height: 250px;">
					<img class="img-fluid p-2 h-100 w-100" src="../images/--">
				</div>
			<form method="post" enctype="multipart/form-data">
				<input type="hidden" name="size" class="form-control-sm" value="1000000">
				<input class="form-control-sm" type="file" name="image" required>
				<p class="bg-danger mt-3"><?php echo $msg;?></p>
			</div>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="dashboard.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link active" href="add_product.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-archive"></i></div>
                                Manage Product
                            </a>
                            <a class="nav-link" href="add_new_company.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-building"></i></div>
                                Manage Product Company
                            </a>
                            <a class="nav-link" href="add_new_unit.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-stream"></i></div>
                                Manage Product Unit
                            </a>
                            <a class="nav-link" href="add_new_user.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Manage User
                            </a>
                            <!-- <a class="nav-link" href="add_new_vendor.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                                Manage Vendor
                            </a>
                            <a class="nav-link" href="add_purchase.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                Manage Purchase
                            </a> -->
                            <a class="nav-link" href="CategoryList.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-cogs"></i></div>
                                Profile Settings
                            </a>
                        </div> 
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <div class="small">
                            Shackra006
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage Product</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Add Product</li>
                        </ol>
                        <form class="mx-5" action="" method="POST" name="form1">
                            <div class="alert alert-danger text-center" id="error" style="display: none;">
                                This Product is already exist!
                            </div>
                            <div class="alert alert-success text-center" id="success" style="display: none;">
                                Product successfully added!
                            </div>
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <div class="row mb-4">
                                <div class="col">
                                    <div class="form-outline">
                                        <label class="form-label" for="form6Example2">Product Name</label>
                                        <input type="text" id="form6Example2" class="form-control" name="product_name"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col">
                                    <div class="form-outline">
                                        <label class="form-label" for="form6Example3">Select a Unit</label>
                                        <select class="form-select" aria-label="Default select example" id="form6Example3" name="unit">
                                            <?php
                                                $res=mysqli_query($link,"select * from units");
                                                while($row=mysqli_fetch_array($res))
                                                {
                                                    echo "<option>";
                                                    echo $row["unit"];
                                                    echo "</option>";
                                                }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline">
                                        <label class="form-label" for="form6Example1">Select a Company</label>
                                        <select class="form-select" aria-label="Default select example" id="form6Example1" name="company_name">
                                            <?php
                                                $res=mysqli_query($link,"select * from company_name");
                                                while($row=mysqli_fetch_array($res))
                                                {
                                                    echo "<option>";
                                                    echo $row["company_name"];
                                                    echo "</option>";
                                                }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- Submit button -->
                            <div class="d-grid gap-2 mt-3">
                                <button type="submit" name="submit1" class="btn btn-success btn-block mb-4">Add</button>
                            </div>
                        </form>
                        <!-- Table -->
                        <div class="widget-content mx-5">
                            <table class="table table-bordered table-striped table-responsive-lg text-center">
                            <thead>
                                <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Unit</th>
                                <th>Company Name</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- Display users in table -->
                                <?php
                                    $res=mysqli_query($link,"select * from products");
                                    while($row=mysqli_fetch_array($res))
                                    {
                                        ?>
                                            <tr>
                                                <td><?php echo $row["id"];?></td>
                                                <td><?php echo $row["product_name"];?></td>
                                                <td><?php echo $row["unit"];?></td>
                                                <td><?php echo $row["company_name"];?></td>
                                                <td><a href="edit_product.php?id=<?php echo $row["id"]; ?>" class="btn btn-secondary"><i class="fas fa-pencil"><i>Edit</a></td>
                                                <td><a href="delete_product.php?id=<?php echo $row["id"]; ?>" class="btn btn-danger"><i class="fas fa-trash">Delete<i></a></td>
                                            </tr>
                                        <?php
                                    }
                                ?>

                            </tbody>
                            </table>
                        </div>
            </div>
                        <?php
                            if(isset($_POST["submit1"]))
                            {
                                $count=0;
                                $res=mysqli_query($link,"select * from products where product_name='$_POST[product_name]' && unit='$_POST[unit]' && company_name='$_POST[company_name]'") or die(mysqli_error($link)); 
                                $count=mysqli_num_rows($res);
                                if($count>0)
                                {
                                    ?>
                                        <script type="text/javascript">
                                            document.getElementById("success").style.display="none";
                                            document.getElementById("error").style.display="block";
                                        </script>       
                                    <?php
                                }
                                else{
                                  mysqli_query($link, "insert into products values(NULL,'$_POST[product_name]','$_POST[unit]','$_POST[company_name]')") or die(mysqli_error($link)); 
                                  ?>
	<script src="../bootstrap4/jquery/jquery.min.js"></script>
	<script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function () {
  			$('[data-toggle="popover"]').popover()
	})
	</script>  
                                    <?php
                                }
                            }
                        ?>
                </main>
            </div>
        </div>
