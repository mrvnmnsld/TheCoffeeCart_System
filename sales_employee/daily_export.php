<?php  
      //export.php  
 if(isset($_POST["export"]))  
 {  
      $db = mysqli_connect("localhost", "root", "", "pos_db");  
      header('Content-Type: text/csv; charset=utf-8');  
      header('Content-Disposition: attachment; filename=data.csv');  
      $output = fopen("php://output", "w");  
      fputcsv($output, array('Reciept_no', 'Customer_id', 'Username', 'Discount','Discounttype', 'Total', 'Date'));  
      $get_sales_report = mysqli_query($db, "SELECT * from sales WHERE date LIKE '%".date('Y-m-d')."%'");
      while($row = mysqli_fetch_assoc($get_sales_report))  
      {  
           fputcsv($output, $row);  
      }  
      fclose($output);  
 }  
 ?>  
 