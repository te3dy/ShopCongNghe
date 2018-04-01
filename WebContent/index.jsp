<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp"></jsp:include>
<div id='body-wrapper'>
	<div id='outer-wrapper'>
		<div id='wrap2'>
			<div id='content-wrapper'>
				<div id='main-wrapper' style="margin-top: 25px;">
					<div class='home_navigation' id="ao">
						<h1>Sản phẩm mới</h1>
						<span class='line-home'></span>
					</div>
					<div class="new_products">
						<%
							SANPHAM_MOD sanpham_mod = new SANPHAM_MOD();
							ResultSet dsSPmoi = sanpham_mod.DanhsachSanpham_Trang(1, 9);

							if (dsSPmoi != null) {
								while (dsSPmoi.next()) {
									String masp = dsSPmoi.getString("MASP");
									String tensp = dsSPmoi.getString("TENSP");
									String hinhanh = dsSPmoi.getString("HINHANH");
									int giasp = dsSPmoi.getInt("GIASP");
						%>

						<div class="new_prod_box">
							<div class="new_prod_bg">

								<span class="new_icon"><img src="Images/new_icon.gif" />
								</span>

								<div class="new_prod_img">
									<a href="chitietsanpham.jsp?masp=<%=masp%>"><img
										src="hinhanh/<%=hinhanh%>" class="thumb"
										style="width: 300px; height: 300px;" /></a> <a
										href="chitietsanpham.jsp?masp=<%=masp%>" style="width: 250px;"><%=tensp%></a>
									<a href="chitietsanpham.jsp?masp=<%=masp%>"
										style="width: 250px; color: red; font-size: 20px; font-family: OpenSans-Bold">Giá:<fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>đ</a>
								</div>
							</div>
						</div>

						<%
							}
							}
						%>
					</div>

					<div class="home_navigation" id="ao" style="width: 600px;">
						<!-- style="margin-top: 25px;"> -->
						<h1 class='our_portfolio'
							style="font-family: Timenewroman; font-size: 34px; color: green;">Sản
							phẩm bán chạy</h1>
						<span class='line-home'></span>
					</div>
					<div class="new_products">
						<%
							SANPHAM_MOD sanpham_mod1 = new SANPHAM_MOD();
							ResultSet dsSPmoi1 = sanpham_mod1.DanhsachSanphamBanChay();
							if (dsSPmoi1 != null) {
								while (dsSPmoi1.next()) {
									String masp1 = dsSPmoi1.getString("MASP");
									String tensp1 = dsSPmoi1.getString("TENSP");
									String hinhanh1 = dsSPmoi1.getString("HINHANH");
									int giasp1 = dsSPmoi1.getInt("GIASP");
						%>

						<div class="new_prod_box">
							<div class="new_prod_bg">

								<span class="new_icon"><img src="Images/new_icon.gif" />
								</span>

								<div class="new_prod_img">
									<a href="chitietsanpham.jsp?masp=<%=masp1%>"><img
										src="hinhanh/<%=hinhanh1%>" class="thumb"
										style="width: 300px; height: 300px;" /></a> <a
										href="chitietsanpham.jsp?masp=<%=masp1%>"
										style="width: 250px;"><%=tensp1%></a> <a
										href="chitietsanpham.jsp?masp=<%=masp1%>"
										style="width: 250px; color: red; font-size: 20px; font-family: OpenSans-Bold">Giá:<fmt:formatNumber value="<%=giasp1 %>" minFractionDigits="0"/>đ</a>
								</div>
							</div>
						</div>

						<%
							}
							}
						%>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>