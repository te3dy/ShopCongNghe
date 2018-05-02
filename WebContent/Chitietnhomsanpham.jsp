<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<%
	String madongsp = request.getParameter("madongsp");
	String manhomsp = request.getParameter("manhomsp");
	NHOMSANPHAM_MOD nhomsanpham_mod = new NHOMSANPHAM_MOD();
	DONGSANPHAM_MOD dongsanpham_mod = new DONGSANPHAM_MOD();
	SANPHAM_MOD sanpham_mod = new SANPHAM_MOD();
%>
<!-- Products Block -->
<div class="container">
	<div class="u-heading-v3-1 g-mb-40">
		<%
			String getpage = request.getParameter("p");
			int p = 1;
			if (getpage != null) {
				p = Integer.parseInt(getpage);
			}
		%>
		<h2
			class="text-uppercase h3 u-heading-v3__title g-brd-primary encode-sans"><%=nhomsanpham_mod.layTennhomsp(manhomsp)%></h2>
	</div>
	<div class="row">
		<%
			ResultSet dsSp = sanpham_mod.DanhsachSanpham_NHOMSP_DONGSP_Trang(6, p, madongsp, manhomsp);
			if (dsSp != null) {
				while (dsSp.next()) {
					String masp = dsSp.getString("MASP");
					String tensp = dsSp.getString("TENSP");
					String hinhanh = dsSp.getString("HINHANH");
					int giasp = dsSp.getInt("GIASP");
		%>
		<div class="col-md-12 col-lg-4 g-mb-30">
			<!-- Article -->
			<article class="text-center g-bg-white u-shadow-v24 u-shadow-v1-5--hover h-100 g-overflow-hidden"> 
			<!-- Article Image -->
			<div class="g-pos-rel">
				<a href="chitietsanpham.jsp?masp=<%=masp%>">
					<img class="w-100 product-image" src="hinhanh/<%=hinhanh%>"
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
			<!-- End Article Content --> </article>
			<!-- End Article -->
		</div>
		<%
			}
			}
		%>
	</div>
</div>
<!-- End Products Block -->
<jsp:include page="footer.jsp"></jsp:include>