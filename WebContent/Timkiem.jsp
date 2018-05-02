<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String tukhoa = request.getParameter("q");
	SANPHAM_MOD sanpham_mod = new SANPHAM_MOD();
%>
<div class="container">
	<div class="u-heading-v3-1 g-mb-40">
		<h2
			class="h3 u-heading-v3__title g-brd-primary encode-sans">
			Kết quả tìm kiếm cho:
			<%=tukhoa%>
		</h2>
	</div>
	<div class="row">
		<%
			ResultSet dskq = sanpham_mod.TimSanphamKhachhang(tukhoa);
			if (dskq != null) {
				while (dskq.next()) {
					String masp = dskq.getString("MASP");
					String tensp = dskq.getString("TENSP");
					String hinhanh = dskq.getString("HINHANH");
					int giasp = dskq.getInt("GIASP");
		%>
		<div class="col-md-12 col-lg-4 g-mb-30">
			<!-- Article -->
			<article
				class="text-center g-bg-white u-shadow-v24 u-shadow-v1-5--hover h-100 g-overflow-hidden">
			<!-- Article Image -->
			<div class="g-pos-rel">
				<a href="chitietsanpham.jsp?masp=<%=masp%>"> <img
					class="w-100 product-image" src="hinhanh/<%=hinhanh%>"
					alt="Image Description">
				</a>
				<div
					class="u-ribbon-v1 g-bg-primary g-font-weight-600 g-font-size-17 g-top-0 g-left-0 p-0">
					<span class="d-block g-color-white g-pa-15"><fmt:formatNumber
							value="<%=giasp%>" minFractionDigits="0" /> VND</span>
				</div>
			</div>
			<!-- End Article Image --> 
			<!-- Article Content -->
			<div class="g-pa-30">
				<!-- Article Info -->
				<h3 class="h4 g-mb-10">
					<a
						class="g-color-main g-color-primary--hover g-text-underline--none--hover"
						href="chitietsanpham.jsp?masp=<%=masp%>"><%=tensp%></a>
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
</div>
<jsp:include page="footer.jsp"></jsp:include>