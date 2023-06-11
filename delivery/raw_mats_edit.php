<?php
include('../server/connection.php');
include '../set.php';
?>
<!DOCTYPE html>
<html>

<head>
    <?php include('../templates/head1.php'); ?>
    <style type="text/css">
    #invoice-item-table tr th {
        font-size: 12px;
    }

    ul.typeahead.dropdown-menu {
        margin-top: 0px;
    }
    </style>
</head>


<body>

    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Adding new raw material</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <form id="newRawMatsForm">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter name"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="kg">Kilograms:</label>
                            <input type="number" name="kg" class="form-control" id="kg" placeholder="Enter kilograms"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="supplier">Supplier:</label>
                            <select id="supplier" name="supplier_id" class="form-control" required>
                                <option value="">
                                    Select supplier...
                                </option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="remarks">type:</label>
                            <select id="remarks" name="remarks" class="form-control" required>
                                <option>
                                    main
                                </option>

                                <option>
                                    addons
                                </option>
                            </select>
                        </div>
                    </form>

                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button form="newRawMatsForm" type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </div>


    <div class="contain h-100">
        <?php
        include('base.php');
        // if ($failure) {
        // 	echo '<script>swal("Unsuccesful","Customer not found!","error");</script>';
        // }
        ?>
        <div style="overflow: auto;">
            <form method="post" id="invoice_id">
                <div class="table-responsive mt-5 pl-5 pr-5">
                    <button type="button" class="btn btn-info border mb-4" onclick="$('#myModal').modal('show');"
                        style="padding:5px;"><span class="badge badge-info"><i class="fas fa-plus"></i> Add new
                            material</span></button>

                    <table class="table table-striped table-bordered table-sm">
                        <tr>
                            <td>
                                <div class="row mb-1">
                                    <div class="col-md h1">Edit Raw Materials</div>
                                </div>
                                <table id="invoice-item-table" class="table table-bordered table-sm">
                                    <tr>
                                        <th>Tittle</th>
                                        <th>type</th>
                                        <th>Amount</th>
                                        <th>Price/Serving (Applicable only for addons)</th>
                                        <th>supplier</th>
                                        <th></th>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <input type="button" value="Save edits" id="save_btn" class="btn btn-sm btn-info" />

                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>

    <script src="../bootstrap4/jquery/jquery.min.js"></script>
    <script src="../bootstrap4/jquery/datepicker.js"></script>
    <script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
    <script src="../bootstrap4/js/typeahead1.js"></script>
    <script src="../delivery/javascript.js"></script>

</body>

</html>
<?php include('../delivery/add_supplier.php'); ?>

<script>
var rawMatsIds = [];
var rawMats = [];

$.ajax({
    url: "add.php",
    method: "POST",
    data: {
        "action": "getAllRawMats",
    },
    success: function(data) {
        console.log(data);
        data = JSON.parse(data);

        for (let index = 0; index < data.length; index++) {
            rawMatsIds.push(data[index].id);
            rawMats.push(data[index]);


            $("#invoice-item-table").append(
                '<tr>' +
                '    <td><input type="text" value="' + data[index].name +
                '" class="form-control form-control-sm input-sm name" readonly placeholder="' + data[
                    index].name + '" /></td>' +
                '    <td><input type="text" value="' + data[index].remarks +
                '" class="form-control form-control-sm input-sm name" readonly placeholder="' + data[
                    index].remarks + '" /></td>' +
                '    <td><input type="text" value="' + data[index].kg +
                '" class="form-control form-control-sm input-sm kg" placeholder="' + data[index].kg +
                '" /></td>' +
                '    <td><input type="text" value="' + data[index].price_per_serving +
                '" class="form-control form-control-sm input-sm price_per_serving" placeholder="' +
                data[index].price_per_serving + '" /></td>' +
                '    <td><select type="text" value="' + data[index].supplier_id +
                '" class="form-control form-control-sm input-sm supplier"><option value="">Please select a supplier</option></select></td>' +
                '    <td><button type="button" class="btn btn-danger btn-sm" onclick="deleteThis(' +
                data[index].id + ')"><i class="fa fa-trash"></i></button></td>' +
                '</tr>'
            );
        }
    }
});

$.ajax({
    url: "add.php",
    method: "POST",
    data: {
        "action": "getAllSupplier",
    },
    success: function(data) {
        data = JSON.parse(data);

        for (let index = 0; index < data.length; index++) {
            $("#supplier, .supplier").append(
                '<option value="' + data[index].supplier_id + '">' +
                data[index].company_name +
                '</option>'
            );
        }

        $('.supplier').each(function(index) {
            $(this).val(rawMats[index].supplier_id);
        });

    }
});

$("#save_btn").on("click", function() {
    var kg = [];
    var supplier = [];
    var price_per_serving = [];

    $('.kg').each(function() {
        kg.push($(this).val());
    });

    $('.supplier').each(function() {
        supplier.push($(this).val());
    });

    $('.price_per_serving').each(function() {
        price_per_serving.push($(this).val());
    });

    $.ajax({
        url: "add.php",
        method: "POST",
        data: {
            "action": "saveNewRawMats",
            "rawMatsIds": rawMatsIds,
            "supplier": supplier,
            "kg": kg,
            "price_per_serving": price_per_serving,
        },
        success: function(data) {
            if (data == "success") {
                swal("", "Successfully saved edits", "success").then(() => {
                    location.reload();
                });
            } else {
                swal("", "Please contact system admin and report this error", "error");
            }
        }
    });
})

document.getElementById("newRawMatsForm").addEventListener("submit", function(e) {
    e.preventDefault();

    var dataToSend = $("#newRawMatsForm").serializeArray();
    console.log(dataToSend);

    dataToSend.push({
        "name": "action",
        "value": "addNewRawMats",
    })

    $.ajax({
        url: "add.php",
        method: "POST",
        data: dataToSend,
        success: function(data) {
            if (data == "success") {
                swal("", "Successfully saved new raw material", "success").then(() => {
                    location.reload();
                });
            } else {
                swal("", "Please contact system admin and report this error", "error");
            }
        }
    });
});

function deleteThis(id) {
    swal({
        title: "Are you sure you want to delete this material?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((confirmed) => {
        if (confirmed) {
            $.ajax({
                url: "add.php",
                method: "POST",
                data: {
                    "action": "deleteThisRawMat",
                    "id": id,
                },
                success: function(data) {
                    if (data == "success") {
                        swal("", "Successfully saved edits", "success").then(() => {
                            location.reload();
                        });
                    } else {
                        swal("", "Please contact system admin and report this error", "error");
                    }
                }
            });
        }
    });

}
</script>