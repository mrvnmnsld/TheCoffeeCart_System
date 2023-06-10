<?php  
      //export.php  
 if(isset($_POST["export"]))  
 {  
      $db = mysqli_connect("localhost", "root", "", "pos_db");  
      header('Content-Type: text/csv; charset=utf-8');  
      header('Content-Disposition: attachment; filename=data.csv');  
      $output = fopen("php://output", "w");  
      fputcsv($output, array('transaction_no', 'product_id', 'total_qty', 'buy_price', 'tax_rate'));  
      $get_product_report = mysqli_query($db, "SELECT * from product_delivered");
      while($row = mysqli_fetch_assoc($get_product_report))  
      {  
           fputcsv($output, $row);  
      }  
      fclose($output);  
 }  
 ?>  
 