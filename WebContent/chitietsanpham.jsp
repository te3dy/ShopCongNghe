<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import='Model.KHUYENMAI_MOD'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	String masp = request.getParameter("masp");
	SANPHAM_MOD sanpham_mod = new SANPHAM_MOD();
	ResultSet ttSp = sanpham_mod.ThongtinSanpham(masp);

	String tensp = "";
	int giasp = 0;
	String motasp = "";
	String xuatxu = "";
	String donvitinh = "";
	int soluong = 0;
	String hinhanh = "";
	if (ttSp.next()) {
		tensp = ttSp.getString("TENSP");
		giasp = ttSp.getInt("GIASP");
		motasp = ttSp.getString("MOTASP");
		xuatxu = ttSp.getString("XUATXU");
		donvitinh = ttSp.getString("DONVITINH");
		soluong = ttSp.getInt("SOLUONG");
		hinhanh = ttSp.getString("HINHANH");
	}
%>
<div class="container">
	<div class="u-heading-v3-1 g-my-40">
		<h2
			class="text-uppercase h3 u-heading-v3__title g-brd-primary encode-sans">Sản
			Phẩm Lựa Chọn</h2>
	</div>
	<div class="row g-mb-40 u-shadow-v24">
		<div class="col-md-6 g-bg-size-cover g-min-height-250 g-pa-40"
			data-bg-img-src="hinhanh/<%=hinhanh%>"></div>
		<div class="col-md-6 g-bg-secondary g-pa-40">
			<!-- Article Title -->
			<h3 class="h2 g-mb-20">
				<%=tensp%>
			</h3>
			<!-- End Article Title -->
			<h3 class="g-mb-20">Chi tiết sản phẩm</h3>
			<p class="g-mb-25 encode-sans">
				<%=motasp%>
				<span class="d-block">Mã sản phẩm: <%=masp%></span> <span
					class="d-block">Xuất xứ: <%=xuatxu%></span>
			</p>
			<p class="g-mb-25 g-font-size-16">
				Giá gốc: <span class="g-font-weight-600 g-color-primary"><fmt:formatNumber
						value="<%=giasp%>" minFractionDigits="0" /> <sup>vnđ</sup></span>
			</p>
			<%
				KHUYENMAI_MOD khuyenmai = new KHUYENMAI_MOD();
				int giakm = khuyenmai.LaygiaKhuyenmai(masp);
				if (giakm != 0) {
			%>
			<p class="g-mb-25">
				Khuyến mãi : <span class="g-font-weight-600 g-color-primary"><fmt:formatNumber
						value="<%=giakm%>" minFractionDigits="0" /> <sup>vnđ</sup></span>
			</p>
			<%
				}
			%>
			<h3 class="g-mb-20">Chọn số lượng</h3>
			<form action="Giohang.do" method="post" id="frthemvaogiohang">
				<div class="d-inline-block">
					<div
						class="js-quantity input-group u-quantity-v1 g-width-150 g-height-45 g-brd-gray-light-v4 g-brd-primary--focus">
						<div
							class="js-minus input-group-addon d-flex g-font-size-15 g-width-45 g-color-gray-dark-v4 g-bg-gray-light-v4 g-brd-gray-light-v4 g-rounded-0">
							−</div>
						<input
							class="js-result form-control text-center g-brd-gray-light-v4 g-color-gray-dark-v4 g-rounded-0 g-pa-15"
							type="text" name="Soluong" id="Soluong" value="1" min="1"
							max="<%=soluong%>"> <input type="hidden" name="masp"
							value="<%=masp%>"> <input type="hidden" name="tensp"
							value="<%=tensp%>"> <input type="hidden" name="giasp"
							value="<%if (giakm != 0) {
				out.print(giakm);
			} else {
				out.print(giasp);
			}%>">
						<div
							class="js-plus input-group-addon d-flex g-font-size-15 g-width-45 g-color-gray-dark-v4 g-bg-gray-light-v4 g-brd-gray-light-v4 g-rounded-0">
							+</div>
					</div>
				</div>
				<div class="d-inline-block">
					<span>(Còn lại <span
						class="g-font-weight-600 g-color-primary"><%=soluong%></span> sản
						phẩm)
					</span>
				</div>
				<%
					if (soluong <= 0) {
				%>
				<input type="button"
					class="hethang d-block g-mt-20 btn btn-md u-btn-primary g-font-weight-600 g-font-size-default text-uppercase"
					value="Hết hàng">
				<%
					} else {
				%>
				<input type="submit"
					class="muangay d-block g-mt-20 btn btn-md u-btn-primary g-font-weight-600 g-font-size-default text-uppercase"
					value="Mua Ngay">
				<%
					}
				%>

			</form>
		</div>
	</div>
	<div class="u-heading-v3-1 g-mb-40">
		<h2
			class="text-uppercase h3 u-heading-v3__title g-brd-primary encode-sans">Sản
			Phẩm Cùng Loại</h2>
	</div>
	<div class="row">
		<%
			SANPHAM_MOD sanphamcungnhom = new SANPHAM_MOD();
			ResultSet dsSpcungloai = sanphamcungnhom.DanhsachSanphamcungNhom(masp);
			if (dsSpcungloai != null) {
				while (dsSpcungloai.next()) {
					String masp1 = dsSpcungloai.getString("MASP");
					String tensp1 = dsSpcungloai.getString("TENSP");
					String hinhanh1 = dsSpcungloai.getString("HINHANH");
					int giasp1 = dsSpcungloai.getInt("GIASP");
		%>

		<div class="col-md-12 col-lg-4 g-mb-30">
			<!-- Article -->
			<article
				class="text-center g-bg-white u-shadow-v24 u-shadow-v1-5--hover h-100">
				<!-- Article Image -->
				<div class="g-pos-rel">
					<a href="chitietsanpham.jsp?masp=<%=masp1%>"> <img
						class="w-100 product-image" src="hinhanh/<%=hinhanh1%>"
						alt="Image Description">
					</a>
					<div
						class="u-ribbon-v1 g-bg-primary g-font-weight-600 g-font-size-17 g-top-0 g-left-0 p-0">
						<span class="d-block g-color-white g-pa-15"><fmt:formatNumber
								value="<%=giasp1%>" minFractionDigits="0" /> VND</span>
					</div>
				</div>
				<!-- End Article Image -->
				<!-- Article Content -->
				<div class="g-pa-30">
					<!-- Article Info -->
					<h3 class="h4 g-mb-10">
						<a
							class="g-color-main g-color-primary--hover g-text-underline--none--hover"
							href="chitietsanpham.jsp?masp=<%=masp1%>"><%=tensp1%></a>
					</h3>
					<!-- End Article Info -->
				</div>
				<!-- End Article Content -->
			</article>
			<!-- End Article -->
		</div>
		<%
			}
			}
		%>
	</div>
	<div class="u-heading-v3-1 g-my-40">
		<h2
			class="text-uppercase h3 u-heading-v3__title g-brd-primary encode-sans">Nhận
			xét về sản phẩm</h2>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form action="Danhgia.do" onsubmit="return Kiemtra()" method="post">
				<div class="g-mb-30">
					<textarea
						class="form-control g-bg-secondary g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15"
						rows="1" name="tieude" id="tieude" placeholder="Tiêu đề nhận xét"></textarea>
				</div>
				<div class="g-mb-30">
					<textarea
						class="form-control g-bg-secondary g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15"
						rows="5" name="noidung" id="noidung"
						placeholder="Nhập nội dung nhận xét tại đây. Tối thiểu 100 từ, tối đa 2000 từ"></textarea>
				</div>
				<div class="d-flex align-items-center">
					<button
						class="btn u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-py-12 g-px-25 mr-4"
						type="submit" role="button">Gửi nhận xét</button>

					<p class="g-font-size-13 mb-0">
						<%
							if (request.getAttribute("msg") != null) {
								out.print(request.getAttribute("msg"));
							}
						%>
						<input type="hidden" name="masp" value="<%=masp%>">
					</p>
				</div>
			</form>
		</div>
	</div>
	<div class="u-heading-v3-1 g-my-40">
		<h2
			class="text-uppercase h3 u-heading-v3__title g-brd-primary encode-sans">Thảo
			luận</h2>
	</div>
	<div class="g-mb-20 row">
		<div class="col-md-12">
			<div class="fb-comments"
				data-href="chitietsanpham.jsp?masp=<%=masp%>" data-width="auto"
				data-numposts="5" data-colorscheme="light"></div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript">
	function Kiemtra() {
		var tieude = document.getElementById("tieude").value;
		var noidung = document.getElementById("noidung").value
		if (tieude == "") {
			alert("Lỗi ! Chưa nhập tiêu đề");
			document.getElementById("tieude").focus();
			return false;
		}
		if (noidung == "") {
			alert("Lỗi ! Chưa nhập nội dung");
			document.getElementById("tieude").focus();
			return false;
		}
		return true;
	}
</script>