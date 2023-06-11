<?php
$TotalValue = $_GET["totalvalue"];
$product = $_GET["product"];
$price = $_GET["price"];
$user = $_GET["user"];
$quantity = $_GET["quantity"];
$discount = $_GET["discount"];

$new_product = explode(",", $product);
$new_qty = explode(",", $quantity);
$new_discount = explode(",", $discount);
$i = 0;
$productsOnlyValue = 0;

?>

<!DOCTYPE html> 
<html>
    <head>
        <style>#invoice-POS{
    box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
    padding: 4mm;
    margin: 0 auto;
    width: 110mm;
    background: #ffffff00;

  h1{
    font-size: 1.5em;
    color: #222;
  }
  h2{font-size: .10em;}
  h3{
    font-size: 1.2em;
    font-weight: 300;
    line-height: 2em;
  }
  p{
    font-size: .7em;
    color: #666;
    line-height: 1.2em;
  }
   
  #top, #mid,#bot{ /* Targets all id with 'col-' */
    border-bottom: 1px solid #EEE;
  }
  
  #top{min-height: 1000px;}
  #mid{min-height: 80px;} 
  #bot{ min-height: 500px;}
  
 
  }
  .tabletitle{
    padding: 1px;
    font-size: .5em;
    background: #EEE;
  }
  .service{border-bottom: 5px solid #EEE;}
  .item{width: 60mm;}
  .itemtext{font-size: .100em;}
  
  #legalcopy{
    margin-top: 5mm;
  }
  
  table,
  table td {
    border: 2px solid #cccccc48;
  }
  
  td {

    width: 160px;
    text-align: center;
  }
</style>
        <div id="invoice-POS">
    <center id="top">
      <div class="logo"><a href="#"><img src="images/hlogo.png" width="90" height="90"></a></div>
      <div class="info"> 
        <h2>The Coffee Cart</h2>Receipt 
            </div><!--End Info-->
    </center><!--End InvoiceTop-->
    <div id="mid">
      <div class="info">
        <p> Ayala Harborpoint Mall </br>
        Contact : +92 3222563301 </br>
        E-mail Address : thecoffeecart.ph@gmail.com</br>
        fb.com/thecoffeecart.ph</br>
        </p>
      </div>
      <p><?=date("m/d/Y H:i:s")?></p>
    </div><!--End Invoice Mid-->

    <div id="bot">

<div id="table">
    <table>
        <tr class="tabletitle">
            <td class="item"><h2>Menu</h2></td>
            <td class="Hours"><h2>Price</h2></td>
            <td class="Hours"><h2>Qty</h2></td>
            <!-- <td class="Dsc"><h2>Discount</h2></td> -->
            <td class="Rate"><h2>Total Price</h2></td>
                    <?php
						

                    foreach ($new_product as $key) {
                       
                                include('server/connection.php');
                                $sql = "SELECT * FROM products WHERE product_no = $key limit 1";
                                $result	= mysqli_query($db, $sql);
                                
                                while($row = mysqli_fetch_assoc($result)){       
                                  $productsOnlyValue = $productsOnlyValue+floatval($row['sell_price'])
                            ?>
                            <tr>
                                    <td><?=$row['product_name']?></td>
                                    <td><?=$row['sell_price']?></td>
                                    <td><?=$new_qty[$i]?></td>
                                    <!-- <td><?=$row['discount']?></td> -->
                                    <td><?=$row['sell_price'] * $new_qty[$i]?></td>
                                </tr>
                                
                            <?php
                                }
                        $i += 1;

                        }

                        $addOnTotal = $TotalValue-$productsOnlyValue;

                        
                            ?>


              </tbody>

              <tr class="">
                <td>Add-ons:</td>
                <td></td>
                <td></td>
                <td><?=$addOnTotal?></td>

              <tr>

            </table>
            <hr>     

<div id="value">  <center>
        <tr>Total Value:</tr>
        <center>
        <tr><?=$TotalValue;?></tr>
        <br>
        <center>
        <button type="submit"  id="hide" class="btn btn-primary">Print</button>
    </body>
    <script>
    const btn = document.getElementById('hide');
    btn.addEventListener('click', () => {
    // 👇️ hide button
    btn.style.display = 'none';
    window.print();

    });
    </script>
    </center>
      <center>
    <div>
		<p class="legal"><strong>Thank you!</strong> <br>Enjoy your Iced Coffee. </p>
	</div></center>
</html>
</script>
</body>

<button onclick="history.back()">Back</button>

<style>
  @media print{
    button {
      display: none
    }
  }
</style>