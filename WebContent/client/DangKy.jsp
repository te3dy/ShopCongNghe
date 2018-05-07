<%@page import="Model.KHACHANG_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"></jsp:include>
<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/moment.min.js"></script>
<script src="/Shopcongnghejs/combodate.js"></script>
<script src="/Shopcongnghe/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<script src="/Shopcongnghe/js/jquery.validate.js" type="text/javascript"></script>
<style type="text/css">
label.error {
	display: inline-block;
	color: red;
	width: 200px;
}
</style>

<script>
	$(function() {
		$('#date').combodate();
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#txtTenDNKH").val("");
		$("#frmThem").validate({
			rules : {
				txtTenKH : {
					required : true
				},
				txtEmailKH : {
					required : true
				},
				txtDiaChiKH : {
					required : true
				},
				txtSoDTKH : {
					required : true
				},
				txtTenDNKH : {
					required : true
				},
				txtMatKhauKH : {
					required : true,
					minlength : 5
				},

				txtMatKhauKHNhapLai : {
					required : true,
					minlength : 5,
					equalTo : "#txtMatKhauKH"
				},
				txtKiemTraNS : {
					required : true
				},
			},
			messages : {
				txtTenKH : {
					required : "Bạn chưa nhập tên!"
				},
				txtEmailKH : {
					required : "Bạn chưa nhập email!"
				},
				txtDiaChiKH : {
					required : "Bạn chưa nhập địa chỉ!"
				},
				txtSoDTKH : {
					required : "Bạn chưa nhập số điện thoại!"
				},
				txtTenDNKH : {
					required : "Bạn chưa nhập tên đăng nhập!"
				},
				txtMatKhauKH : {
					required : "Vui lòng nhập mật khẩu!",
					minlength : "Vui lòng nhập ít nhất 5 kí tự!"
				},
				txtMatKhauKHNhapLai : {
					required : "Vui lòng nhập mật khẩu!",
					minlength : "Vui lòng nhập ít nhất 5 kí tự!",
					equalTo : "Mật khẩu không trùng khớp!",
				},

				txtKiemTraNS : {
					required : "Ngày sinh chưa hợp lệ!"
				},
			},
			submitHandler : function(form) {
				form.submit();
				/* if(confirm("Dữ liệu đã hợp lệ. Bạn có muốn lưu lại không?"))
				    {
				    	form.submit();
				   	} */
			}
		});
	});
</script>
<!-- Signup -->
<div class="g-bg-lightblue-radialgradient-circle">
	<section class="container g-pt-100 g-pb-20">
		<div class="row justify-content-center">
			<div class="g-mb-80">
				<div class="u-shadow-v24 g-bg-white rounded g-px-30 g-py-50 mb-4">
					<header class="text-center mb-4">
						<h1 class="h3 g-color-black g-font-weight-300 text-capitalize">Đăng
							ký thành viên</h1>
					</header>
					<form method="post" action="/Shopcongnghe/KHACHHANG_CTR"
						id="frmThem" class="g-py-15">
						<%
							String maKH = KHACHANG_MOD.taoMaKhachHang();
						%>
						<div class="row">
							<input id="txtMaKH" class="cotphai_input" type="text"
								name="txtMaKH" value=<%=maKH%> style="display: none"
								readonly="readonly">
							<div class="col-md-6 g-mb-20">
								<input id="txtTenKH" type="text" name="txtTenKH"
									placeholder="Họ tên đầy đủ"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
							<select id="optMaLoaiKH" name="optMaLoaiKH" style="display: none">
								<option value="LKH01"></option>
							</select>
							<div class="col-md-6 g-mb-20 form-group">
								<select
									class="js-custom-select u-select-v1 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-py-12 h-100"
									style="width: 100%;" data-placeholder="Giới tính"
									data-open-icon="fa fa-angle-down"
									data-close-icon="fa fa-angle-up" id="ckGioiTinhKH"
									name="ckGioiTinhKH">
									<option value="male">Nam</option>
									<option value="female">Nữ</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 g-mb-20">
								<input id="date" data-format="DD/MM/YYYY"
									placeholder="Ngày sinh: dd/MM/yyyy" data-template="DD MMM YYYY"
									type="text" name="date"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
							<div class="col-md-6 g-mb-20">
								<input id="txtEmailKH" type="email" name="txtEmailKH"
									placeholder="Email"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 g-mb-20">
								<input id="txtDiaChiKH" type="text" name="txtDiaChiKH" value=""
									placeholder="Địa chỉ"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
							<div class="col-md-6 g-mb-20">
								<input id="txtSoDTKH" type="text" name="txtSoDTKH" value=""
									placeholder="Số điện thoại"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
									onkeyup="this.value=this.value.replace(/[^\d]/,'')">
							</div>
						</div>
						<div class="g-mb-20">
							<input id="txtTenDNKH" type="text" name="txtTenDNKH"
								placeholder="Tên đăng nhập" value=""
								class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
						</div>
						<div class="row">
							<div class="col-md-6 g-mb-20">
								<input id="txtMatKhauKH" type="password" name="txtMatKhauKH"
									value="" placeholder="Mật khẩu"
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
							<div class="col-md-6 g-mb-20">
								<input id="txtMatKhauKHNhapLai" type="password"
									placeholder="Nhập lại mật khẩu" name="txtMatKhauKHNhapLai"
									value=""
									class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15">
							</div>
						</div>
						<p class="text-center g-color-primary g-py-13">
							<%
								if (request.getAttribute("thongbao") != null)
									out.print(request.getAttribute("thongbao"));
							%>
						</p>
						<input type="hidden" name="url"
							value="<%=request.getRequestURI().toString()%>"> <input
							type="submit"
							class="checkout btn btn-block u-btn-primary rounded g-py-13"
							id="hanhdong" name="hanhdong" value="Submit"> <input
							type="button"
							class="continue btn btn-block u-btn-primary rounded g-py-13"
							onclick="nhapLai();" value="Nhập lại" />

					</form>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- End Signup -->
<script type="text/javascript">
	function nhapLai() {
		document.getElementById("txtTenKH").value = "";
		document.getElementById("txtDiaChiKH").value = "";
		document.getElementById("txtEmailKH").value = "";
		document.getElementById("txtSoDTKH").value = "";
		document.getElementById("txtTenDNKH").value = "";
		document.getElementById("txtMatKhauKH").value = "";
		document.getElementById("txtMatKhauKHNhapLai").value = "";
	}
</script>
<script type="text/javascript">
	function Get(idname) {
		if (document.getElementById) {
			return document.getElementById(idname);
		} else if (document.all) {
			return document.all[idname];
		} else if (document.layers) {
			return document.layers[idname];
		} else {
			return null;
		}
	}
	function toggleXPMenu(block) {
		var CloseImage = "imagesAdmin/closed.gif";
		var OpenImage = "imagesAdmin/open.gif";
		var divid = block;
		var img = "img" + block;
		if (Get(divid).style.display == "") {
			Get(divid).style.display = "none";
			Get(img).src = OpenImage;
			return false;
		} else {
			Get(divid).style.display = "";
			Get(img).src = CloseImage;
			return false;
		}
	}
</script>
</body>
</html>