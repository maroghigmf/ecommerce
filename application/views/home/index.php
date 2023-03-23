<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>PT. Victoria Care Indonesia Tbk</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbar-fixed/">
		<!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<link href="<?php echo base_url('assets/dist/css/bootstrap.min.css');?>" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<?php echo base_url('assets/css/navbar-fixed.css');?>" rel="stylesheet">
		<style>
			.notification {
				color: white;
				text-decoration: none;
				position: relative;
				display: inline-block;
				border-radius: 4px;
			}

			.notification .badge {
				position: absolute;
				top: -10px;
				right: -10px;
				padding: 5px 10px;
				border-radius: 50%;
				background: red;
				color: white;
			}
		</style>
  </head>
  <body>
    
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">VCI</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">Home</a>
					</li>
				</ul>
			</div>
			<div class="d-flex" role="search">
				<button class="btn btn-primary notification" data-bs-toggle="modal" data-bs-target="#modalCheckout" onClick="openCart();">
					<span class="bi-cart"></span>
					<span class="badge" id="countCart"></span>
				</button>
			</div>
		</div>
	</nav>

	<main class="container">
		<div class="album py-5 bg-light">
			<div class="container">
			<div id="liveAlertPlaceholder"></div>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<?php
						foreach ($getProduct as $key => $value) {
					?>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text"><?php echo $value -> product_name; ?></p>
								<p class="text-muted"><?php echo "Rp " . number_format($value -> price,2,',','.'); ?></p>
								<p class="text-muted">Stock : <?php echo $value -> jumlah; ?></p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="modalCart btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalCart" onClick="openModal('<?php echo $value -> pcode; ?>')"><span class="bi-cart"></span></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php
						}
					?>
				</div>
			</div>
		</div>
	</main>

	<!-- Modal cart -->
	<div class="modal fade" id="modalCart" tabindex="-1" aria-labelledby="modalCartLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="modalCartLabel"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Jumlah:</label>
							<input type="number" value="1" name="jumlah" id="jumlah" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="cart">Masukan Keranjang</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Checkout -->
	<div class="modal fade" id="modalCheckout" tabindex="-1" aria-labelledby="modalCheckoutLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="modalCheckoutLabel">Checkout</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Product Code</th>
								<th scope="col">Product Nama</th>
								<th scope="col">Harga</th>
								<th scope="col">Jumlah</th>
								<th scope="col">Total</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody id="rowCart">
							
						</tbody>
					</table>
					<label for="recipient-name" class="col-form-label">Promo:</label>
					<input type="text" name="promo" id="promo" class="form-control">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="Checkout">Checkout</button>
				</div>
			</div>
		</div>
	</div>

    <script src="<?php echo base_url('assets/dist/js/bootstrap.bundle.min.js');?>"></script>
		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"> </script> 
		<script type="text/javascript">
			$(document).ready(function() {
				countCart();
			});
			
			function openModal(code) {
				$.ajax({
					type: 'get',
					url: "productById/"+code,
					success: function(response) {
						const res = JSON.parse(response)[0];
						$("#modalCartLabel").text(res.product_name);
						$('#cart').attr('onClick', 'cart("'+res.pcode+'");');
						$('input[name=jumlah]').on('input', function () {
								var value = $(this).val();
								if ((value !== '') && (value.indexOf('.') === -1)) {		
										$(this).val(Math.max(Math.min(value, res.jumlah), 1));
								}
						});
					}
				});
			}
			
			function openCart() {
				$.ajax({
					type: 'get',
					url: "getCart",
					success: function(response) {
						var row = '';
						const res = JSON.parse(response);
						for(var i = 0; i < res.length; i++)
						{
							row += '<tr>'+
									'<td>' + res[i].pcode + '</td>' +
									'<td>' + res[i].product_name + '</td>' +
									'<td>' + rupiah(res[i].price) + '</td>' +
									'<td>' + res[i].jml_mutasi + '</td>' +
									'<td>' + rupiah(res[i].price * res[i].jml_mutasi) + '</td>' +
									'<td><button class="btn btn-danger" onClick="deleteCart("'+res[i].order_id+'");"><span class="bi-x-circle"></span></button></td>' +
							'</tr>';
						}
						$('#rowCart').append(row);
						$('#Checkout').attr('onClick', 'checkout("'+res[0].order_id+'");');
					}
				});
			}

			function cart(code) {
				var formData = {
					pcode : code,
					jumlah: $('#jumlah').val(),
				};
				$.ajax({
					type: 'post',
					url: "cart",
					data: formData,
					success: function(res) {
						alert('Berhasil dimasukan ke keranjang!');
						location.reload();
					}
				});
			}

			function countCart() {
				setTimeout(function() {
					$.ajax({
						type: 'get',
						url: "notif",
						success: function(res) {
							$("#countCart").text(res);
						}
					});
				}, 200);
			}

			function deleteCart(id) {
				$.ajax({
					type: 'get',
					url: "deleteCart/"+id,
					success: function(response) {
						alert('Berhasil hapus data !');
						location.reload();
					}
				});
			}

			function checkout(order_id) {
				var pmo_code = $("#promo").val();
				var formData = {
					order_id : order_id,
					pmo_code: pmo_code,
				};
				$.ajax({
					type: 'post',
					url: "checkout",
					data: formData,
					success: function(res) {
						alert('Success !!');
						location.reload();
					}
				});
			}

			function rupiah(price) {
				var	number_string = price.toString(),
					split	= number_string.split(','),
					sisa 	= split[0].length % 3,
					rupiah 	= split[0].substr(0, sisa),
					ribuan 	= split[0].substr(sisa).match(/\d{1,3}/gi);
						
				if (ribuan) {
					separator = sisa ? '.' : '';
					rupiah += separator + ribuan.join('.');
				}
				rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
				return 'Rp. ' + rupiah;
			}
		</script>

  </body>
</html>
