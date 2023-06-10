<?php
include("../server/connection.php");
include '../set.php';
?>
<!DOCTYPE html>
<html>

<head>
    <?php include('../templates/head1.php'); ?>

</head>

<body>
    <div class="contain h-100">
        <?php
        include('../sales_employee/base.php');
        ?>
        <div class="pr-1">
            <div>
                <h1 class="ml-5 pt-2"><i class="fas fa-shopping-cart"></i>Daily Sales Records</h1>
            </div>
            <div class="form-group row pl-5 " id="input-daterange">
                <div class="col-md-1 pr-3 ml-1">

                    <a href="daily_report.php" class="btn btn-info" type="button" id="filter"><i class="fas fa-print"></i>Print Report</spam></a>
                    <br>
                    <br>

                    <form method="post" action="daily_export.php">
                        <input type="submit" name="export" value="CSV" type="submit" id="hide" class="btn btn-success" />
                    </form>
                    <br>
                </div>
                <div class="col-md-1 pr-3">
                </div>
                <div class="table-responsive pl-3 pr-5">
                    <table class="table table-bordered table-striped" id="sales_table" style="margin-top: -20px;">
                        <thead>
                            <tr>
                                <th scope="col" class="column-text">Receipt No.</th>
                                <th scope="col" class="column-text">Order Number</th>
                                <th scope="col" class="column-text">Cashier</th>
                                <th scope="col" class="column-text">Dsc Type</th>
                                <th scope="col" class="column-text">Value(₱)</th>
                                <th scope="col" class="column-text">Date</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                        <tfoot>
                            <th colspan="3" class="text-right">Total:</th>
                            <th id="discount"></th>
                            <th id="sales"></th>
                            <th></th>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <script src="../bootstrap4/jquery/jquery.min.js"></script>
        <script src="../bootstrap4/jquery/accounting.min.js"></script>
        <script src="../bootstrap4/jquery/datepicker.js"></script>
        <script src="../bootstrap4/js/jquery.dataTables.js"></script>
        <script src="../bootstrap4/js/dataTables.bootstrap4.min.js"></script>
        <script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function() {

                fetch_data()

                $('#start_date, #end_date').datepicker({
                    todayBtn: 'linked',
                    format: "yyyy-mm-dd",
                    autoclose: true
                });


                function fetch_data() {
                    var dataTable = $('#sales_table').DataTable({
                        "processing": true,
                        "serverSide": true,
                        "order": [],
                        searching: false,
                        "ajax": {
                            url: "model.php",
                            type: "POST",
                            data: {
                                "action":"getDailySales",
                            },

                        }
                    });
                }

                // $.ajax({
				// 	url: "model.php",
                //     type: "POST",
                //     data: {
                //         "action":"getDailySales",
                //     },
				// 	success: function(data) {
				// 		console.log();
				// 		rawMats = JSON.parse(data);
				// 	}
				// });
            });


            $(function() {
                $('[data-toggle="popover"]').popover()
            });

            $(document).ready(function() {
                /* function for activating modal to show data when click using ajax */
                $(document).on('click', '.view_data', function() {
                    var id = $(this).attr("id");
                    if (id != '') {
                        $.ajax({
                            url: "view_cashflow.php",
                            method: "POST",
                            data: {
                                id: id
                            },
                            success: function(data) {
                                $('#Contact_Details').html(data);
                                $('#dataModal').modal('show');
                            }
                        });
                    }
                });
            });


            setInterval(function() {
                total();
            }, 1000);

            function total() {
                $(document).ready(function() {
                    var discount = 0;
                    var sales = 0;

                    $('#sales_table tbody tr td:nth-child(4)').each(function() {
                        discount += parseInt($(this).text());
                    });

                    $('#sales_table tbody tr td:nth-child(5)').each(function() {
                        sales += parseFloat($(this).text().replace(/,/g, "").replace("₱", ""));
                    });

                    $('#sales_table tfoot #discount').text(discount);
                    $('#sales_table tfoot #sales').text(formatNumber(sales));
                });
            }

            function formatNumber(num) {
                return '₱' + num.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, '1,')
            }
        </script>

</body>

</html>