<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.MONHANG_OBJ"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- phần đường khoảng trắng dưới menu  -->
<jsp:include page="header.jsp"></jsp:include>
<%
	GIOHANG_MOD giohang_mod = (GIOHANG_MOD) session.getAttribute("giohang");
%>
<div class="container">
	<div class="g-overflow-x-scroll g-overflow-x-visible--lg">
		<table
			class="text-center g-width-900 g-width-100x--lg g-color-gray-dark-v4">
			<%
				int soluong = 0;
				if (giohang_mod != null) {
					soluong = giohang_mod.SoluongMonhang();
				}
			%>
			<div class="g-mb-20">
				<h2 class="h3 u-heading-v1__title g-color-primary">
					Giỏ hàng của bạn (<%=soluong%>)
				</h2>
			</div>
			<thead
				class="g-color-gray-dark-v5 g-font-weight-700 g-font-size-16 text-uppercase">
				<tr>
					<th class="g-pb-20">Sản phẩm</th>
					<th class="g-pb-20">Giá</th>
					<th class="g-width-250 g-pb-20">Số lượng</th>
					<th class="g-width-130 g-pb-20">Thành tiền</th>
					<th></th>
				</tr>
			</thead>
			<%
				if (giohang_mod != null) {
					for (int i = 0; i < giohang_mod.SoluongMonhang(); i++) {
						MONHANG_OBJ monhang_obj = giohang_mod.getGiohang().get(i);
			%>

			<tbody>
				<tr class="g-bg-secondary">
					<td class="text-left g-pa-15">
						<!-- Table Image --> <img
						class="d-inline-block g-brd-gray-light-v4 g-brd-around g-width-120 g-mr-15"
						src="../../assets/img-temp/150x150/img1.jpg"
						alt="Image Description"> <!-- End Table Image --> <!-- Table Info -->
						<div class="d-inline-block align-middle">
							<h4 class="h6 g-color-black g-font-weight-700 text-uppercase"><%=monhang_obj.getTensp()%></h4>
							<em class="g-font-style-normal g-color-gray-dark-v5">Sed
								aliquam tincidunt tempus</em>
						</div> <!-- End Table Info -->
					</td>

					<td><fmt:formatNumber value="<%=monhang_obj.getGiasp()%>"
							minFractionDigits="0" />đ</td>

					<td>
						<!-- Table Input -->
						<div class="d-inline-block">
							<div
								class="js-quantity input-group u-quantity-v1 g-width-150 g-height-45 g-brd-gray-light-v4 g-brd-primary--focus">
								<div
									class="js-minus input-group-addon d-flex g-font-size-15 g-width-45 g-color-gray-dark-v4 g-bg-gray-light-v4 g-brd-gray-light-v4 g-rounded-0">
									−</div>
								<input
									class="js-result form-control text-center g-brd-gray-light-v4 g-color-gray-dark-v4 g-rounded-0 g-pa-15"
									type="text" value="<%=monhang_obj.getSoluong()%>" readonly="">
								<div
									class="js-plus input-group-addon d-flex g-font-size-15 g-width-45 g-color-gray-dark-v4 g-bg-gray-light-v4 g-brd-gray-light-v4 g-rounded-0">
									+</div>
							</div>
						</div> <!-- End Table Input -->
					</td>

					<td class="g-color-black g-font-weight-600"><fmt:formatNumber
							value="<%=monhang_obj.thanhTien()%>" minFractionDigits="0" />đ</td>

					<td class="g-width-80"><a
						href="Giohang.do?masp=<%=monhang_obj.getMasp()%>"
						class="d-inline-block g-color-main g-color-gray-dark-v1--hover g-font-size-18 g-text-underline--none--hover g-pr-10"
						href="#!">×</a></td>
				</tr>
			</tbody>
			<%
				}
				}
			%>
		</table>
	</div>
	<div class="justify-content-center d-flex">
		<div class="g-my-20">
			<%
				int tongtien = 0;
				if (giohang_mod != null) {
					tongtien = giohang_mod.Tongtien();
				}
			%>
			<a class="">Tổng cộng: <span
				class="g-color-primary g-font-weight-600"><fmt:formatNumber
						value="<%=tongtien%>" minFractionDigits="0" />đ</span></a>
		</div>
	</div>
	<div class="justify-content-center d-flex">
		<a href="index.jsp"
			class="continue btn btn-md u-btn-outline-primary g-mr-10 g-mb-15">Mua
			Tiếp</a> <a href="Thanhtoan.do"
			class="checkout btn btn-md u-btn-outline-primary g-mr-10 g-mb-15">Thanh
			toán</a>
	</div>
	<div class="g-mb-20">
		<div class="g-mb-20">
			<h2 class="h3 u-heading-v1__title g-color-primary">Hướng dẫn
				mua hàng</h2>
		</div>
		<div class="proc-rela">
			<a style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
				1: Tạo tài khoản và đăng nhập</a> <br /> <a
				style="color: black; font-size: 17px">- Nếu bạn chưa có tài
				khoản trên website, hãy thực hiện thao tác <a href="#"
				style="font-size: 17px">tạo tài khoản</a>
			</a> <br /> <br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic;">Bước
				2: Chọn sách</a> <br /> <a style="color: black; font-size: 17px">-
				Sử dụng công cụ tìm kiếm để tìm sản phẩm mà bạn cần</a><br /> <a
				style="color: black; font-size: 17px">- Click chuột vào nút Mua
				ngay để mua sách</a><br /> <a style="color: black; font-size: 17px">-
				Chọn số lượng sản phẩm cần mua</a><br /> <a
				style="color: black; font-size: 17px">- Click chuột vào nút Mua
				tiếp nếu muốn mua tiếp</a><br /> <a
				style="color: black; font-size: 17px">- Click chuột vào nút
				Thanh toán để mua sản phẩm đã chọn</a><br /> <br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
				3: Nhập thông tin về địa chỉ giao hàng</a><br /> <a
				style="color: black; font-size: 17px">- Bạn cần nhập vào các
				thông tin về địa chỉ giao hàng (nhận hàng) như Họ và tên người nhận,
				địa chỉ nhận sách, Email người nhận, Số đt…</a><br /> <br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
				4: Chọn phương thức giao hàng</a><br /> <a
				style="color: black; font-size: 17px">Bạn chọn phương thức giao
				hàng bao gồm 2 phương thức chính:</a><br /> <a
				style="color: black; font-size: 17px">1. Vận chuyển trực tiếp
				trong vòng 24h kể từ khi đặt hàng đối với khách hàng trong TP.HCM</a><br />
			<a style="color: black; font-size: 17px">- Phí vận chuyển:
				15.000đ đối với tất cả các đơn hàng.Nhân viên giao hàng và thu phía
				tại địa chỉ nhận hàng.</a><br /> <a
				style="color: black; font-size: 17px">2. Vận chuyển qua đường
				bưu điện</a><br /> <a style="color: black; font-size: 17px">- Phí
				vận chuyển: 10.000đ đối với tất cả các đơn hàng</a><br /> <br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
				5: Chọn phương thức thanh toán</a><br /> <a
				style="color: black; font-size: 17px">Bạn chọn phương thức thanh
				toán bao gồm 2 phương thức chính:</a><br /> <a
				style="color: black; font-size: 17px">1. Trả tiền trực tiếp khi
				giao hàng</a><br /> <a style="color: black; font-size: 17px">- Nhân
				viên giao hàng sẽ giao hàng và thu tiền tại địa chỉ nhận hàng.</a><br />
			<a style="color: black; font-size: 17px">2. Chuyển khoản qua ngân
				hàng</a><br /> <a style="color: black; font-size: 17px">- Bạn thực
				hiện chuyển khoản tổng giá trị của đơn hàng tại ngân hàng, máy ATM
				hoặc sử dụng dịch vụ Internet Banking (tiền được chuyển bao gồm cả
				phí vận chuyển) vào tài khoản được thông báo sau khi thực hiện đặt
				hàng. Nội dung chuyển khoản đề nghĩ ghi rõ Thanh toán cho đơn đặt
				hàng số…</a><br /> <a style="color: black; font-size: 17px">- Sau
				khi chuyển tiền vui lòng gọi điện về số 0982 44 7171 để xác nhận.</a><br />
			<br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
				6: Hoàn tất mua hàng</a><br /> <a style="color: black; font-size: 17px">-
				Kiểm tra lại các thông tin, thực hiện các thay đổi nếu có</a><br /> <a
				style="color: black; font-size: 17px">- Click vào nút Xác nhận
				để hoàn tất quá trình đặt hàng.</a><br /> <a
				style="color: black; font-size: 17px">- Chúng tôi sẽ gọi điện
				lại cho bạn trước khi giao hàng.</a><br /> <br /> <a
				style="color: #0f7af2; font-weight: bold; font-style: italic">Nếu
				có bất cứ khó khăn nào hãy gọi: 0982 44 7171</a><br />
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
