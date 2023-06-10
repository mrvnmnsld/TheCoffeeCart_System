
$(document).ready(function(){
	$('#sales_table').dataTable();
	
});

$(document).ready(function(){
	$('#order_date').datepicker({
  				todayBtn:'linked',
  				format: "yyyy-mm-dd",
  				autoclose: true
 			});
	});
$(function () {
  	$('[data-toggle="popover"]').popover()
});

$(document).ready(function(){
	var final_total_amount = $('#final_total_amount').text();
	var count = 1;
	$(document).on('click','#add_row', function(){
		count += 1;
		$('#quantity').val(count);
		var html_code = ''; 
		html_code += '<tr id="row_id_'+count+'">';
		html_code += '<td><span id="sr_no">'+count+'</span></td>'
		html_code += '<td><input type="text" name="barcode" id="barcode'+count+'" class="form-control form-control-sm input-sm barcode" placeholder="Barcode" /></td>'
		html_code += '<td><input type="text" name="product_name" id="product_name'+count+'" class="form-control form-control-sm input-sm product_name" placeholder="Title" /></td>'
		html_code += '<td><select id="unit'+count+'" name="unit"class="form-control form-control-sm input-sm unit"><option>small</option><option>large</option></select></td>'
		html_code += '<td><input type="number" name="coffee" id="coffee'+count+'" class="form-control form-control-sm input-sm coffee" placeholder="0.01" /></td>'
		html_code += '<td><input type="number" name="coffee" id="sugar'+count+'" class="form-control form-control-sm input-sm sugar" placeholder="0.01" /></td>'
		html_code += '<td><input type="number" name="coffee" id="milk'+count+'" class="form-control form-control-sm input-sm milk" placeholder="0.01" /></td>'
		html_code += '<td><input type="text" name="sell_price" id="sell_price'+count+'" data-srno="1" class="form-control form-control-sm input-sm sell_price" placeholder="59.00"></td>'
		html_code += '<td><input type="text" name="remarks" id="remarks'+count+'" data-srno="1" class="form-control input-sm form-control-sm remarks" placeholder="Remarks"></td>'
		html_code += '<td><button type="button" name="remove_row" id="'+count+'" class="btn btn-sm btn-danger btn-xs remove_row"><i class="fas fa-minus-circle"></i></button></td></tr>';
		$("#invoice-item-table").append(html_code);
	});

	$(document).on('click','.remove_row',function(){
		var row_id = $(this).attr("id");

		$('#row_id_'+row_id).remove();
		count -= 1;
	});
	function barcode_load(count){
			var barcode = $("#barcode"+count).val();
			$.ajax({
				url: "../delivery/loadbarcode.php",
				data : {
					barcode:barcode
				},
				method : "POST",
				dataType: "json",
				success :function(data){
					for(x in data){
						$('#product_name'+count).val(data.product_name);
						$('#quantity'+count).val(data.quantity);
						$('#buy_price'+count).val(data.buy_price);
						$('#unit'+count).val(data.unit);
						$('#tax_rate'+count).val(data.tax_rate);
						$('#sell_price'+count).val(data.sell_price);
					}
				}
			});

	}
	function final_total(count){
		var final_product_amount = 0;
		for(j=1;j<=count;j++){
			var quantity = 0;
			var buy_price = 0;
			var sell_price = 0;
			var tax_rate = 0;
			var total_amount = 0;
			var total_sell = 0;
			var actual_amount = 0;
			var total_tax = 0;
			var min_qty = 0;
			quantity = $('#quantity'+j).val();
			if(quantity>0){
				buy_price = $('#buy_price'+j).val().replace(",","");
				if(buy_price > 0 ){
					total_amount = parseFloat(quantity).toFixed(2) * parseFloat(buy_price).toFixed(2);
					$('#total_amount'+j).val('P '+total_amount);
					tax_rate = $('#tax_rate'+j).val();
					if(tax_rate>0){	
						total_sell = parseFloat(buy_price) * parseFloat(tax_rate)/100;
						total_tax = parseFloat(buy_price) + parseFloat(total_sell);
						$('#sell_price'+j).val('P '+total_tax.toFixed(2));
						min_qty = $('#min_qty'+j).val();
						if(min_qty>0){
							$('#sell_price'+j).val('P '+total_tax);
						}
					}				
				}
				actual_amount = $('#total_amount'+j).val().replace("P ","");
				final_product_amount = parseFloat(final_product_amount) + parseFloat(actual_amount);	
			}
		}
		$('#final_total_amount').text('₱ '+final_product_amount);
	}

	$(document).on('blur', '.min_qty', function(){
		final_total(count);
	});

	$(document).on('change', '.barcode', function(){
		barcode_load(count);
	});

	$(document).on('click','#create_delivery',function(){
		var barcode = [];
		var product_name = [];
		var unit = [];
		var coffee = [];
		var sugar = [];
		var milk = [];
		var sell_price = [];
		var remarks = [];

		$('.barcode').each(function(){
			barcode.push($(this).val());
		});

		$('.product_name').each(function(){
			product_name.push($(this).val());
		});

		$('.unit').each(function(){
			unit.push($(this).val());
		});

		$('.coffee').each(function(){
			coffee.push($(this).val());
		});

		$('.sugar').each(function(){
			sugar.push($(this).val());
		});

		$('.milk').each(function(){
			milk.push($(this).val());
		});

		$('.sell_price').each(function(){
			sell_price.push($(this).val());
		});

		$('.remarks').each(function(){
			remarks.push($(this).val());
		});

		for(var no=1; no<=count; no++){
			if($.trim($('#barcode'+no).val()).length == 0){
				swal("Warning","Please Enter barcode!","warning");
				$('#barcode'+no).focus();
				return false;
			}

			if($.trim($('#product_name'+no).val()).length == 0){
				swal("Warning","Please Enter product_name!","warning");
				$('#product_name'+no).focus();
				return false;
			}

			if($.trim($('#unit'+no).val()).length == 0){
				swal("Warning","Please Enter unit!","warning");
				$('#unit'+no).focus();
				return false;
			}

			if($.trim($('#coffee'+no).val()).length == 0){
				swal("Warning","Please Enter coffee!","warning");
				$('#coffee'+no).focus();
				return false;
			}

			if($.trim($('#sugar'+no).val()).length == 0){
				swal("Warning","Please Enter sugar!","warning");
				$('#sugar'+no).focus();
				return false;
			}

			if($.trim($('#milk'+no).val()).length == 0){
				swal("Warning","Please Enter milk!","warning");
				$('#milk'+no).focus();
				return false;
			}

			if($.trim($('#sell_price'+no).val()).length == 0){
				swal("Warning","Please Enter sell_price!","warning");
				$('#sell_price'+no).focus();
				return false;
			}

			if($.trim($('#remarks'+no).val()).length == 0){
				swal("Warning","Please Enter remarks!","warning");
				$('#remarks'+no).focus();
				return false;
			}
		}

		$.ajax({
			url: "add.php",
			method: "POST",
			data: {
				"barcode":barcode,
				"product_name":product_name,
				"unit":unit,
				"coffee":coffee,
				"sugar":sugar,
				"milk":milk,
				"sell_price":sell_price,
				"remarks":remarks,
			},
			success: function(data){
				console.log(data);
				if(data=="success"){
					swal("","Successfully saved new product","success").then(()=>{
						location.reload();
					});
				}else{
					swal("","Please contat system admin and report this error","error");
				}
			}
		});
		
		return false;

	})
});

$(document).ready(function(){

  $('#supplier_search').typeahead({

    source: function(query, result)
    {

        $.ajax({
          url: '../delivery/loadsupplier.php',
          method: "POST",
          data:{
            query:query
          },
          dataType: "json",
          success:function(data)
          {
            result($.map(data,function(item){
              return item;
            }));
          }
        })
    }
  });
});
