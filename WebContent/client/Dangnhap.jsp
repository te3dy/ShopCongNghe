<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../header.jsp" flush="true"></jsp:include>
<script src="/Shopcongnghe/js/checkValid.js"></script>
<!-- Login -->
<div class="container g-py-100">
	<div class="row justify-content-center">
		<div class="col-sm-8 col-lg-5">
			<div class="u-shadow-v24 g-bg-white rounded g-py-40 g-px-30">
				<header class="text-center mb-4">
				<h2 class="h2 g-color-black g-font-weight-600">Đăng Nhập</h2>
				</header>

				<!-- Form -->
				<form class="g-py-15" name="frmDangnhap" action="../Dangnhapkh.do" method="post" id="frmDangnhap">
					<div class="mb-4">
						<label
							class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Tài
							khoản</label> <input
							class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15"
							type="text" placeholder="c0_b3_ng0k_ngh3ck" name="Taikhoan" id="Taikhoan">
					</div>

					<div class="g-mb-35">
						<div class="row justify-content-between">
							<div class="col align-self-center">
								<label
									class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-13">Mật
									khẩu:</label>
							</div>
							<div class="col align-self-center text-right">
								<a class="d-inline-block g-font-size-12 mb-2" href="#!">Quên
									mật khẩu?</a>
							</div>
						</div>
						<input
							class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--hover rounded g-py-15 g-px-15 mb-3"
							type="password" placeholder="Mật khẩu" name="Matkhau" id="Matkhau">
						<div class="row justify-content-between">
							<div class="col-7 align-self-center">
								<label
									class="form-check-inline u-check g-color-gray-dark-v5 g-font-size-12 g-pl-25 mb-0">
									<input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0"
									type="checkbox" name="ghinho" id="ghinho">
									<div
										class="u-check-icon-checkbox-v6 g-absolute-centered--y g-left-0">
										<i class="fa" data-check-icon="&#xf00c"></i>
									</div> Ghi nhớ
								</label>
							</div>
							<div class="col-5 align-self-center text-right">
								<button class="btn btn-md u-btn-primary rounded g-py-13 g-px-25"
									type="submit" name="wp-submit" id="login" onclick="return check(this.form);">Đăng nhập</button>
							</div>
						</div>
						
						<p class="g-color-primary g-my-30 text-center" id = "check">
							<%
								//HttpSession a=r
								session = request.getSession();
								/* if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao")); */
								if (session.getAttribute("thongbao") != null)
									out.print(session.getAttribute("thongbao"));
							%>
						</p>
					</div>
				</form>
				<!-- End Form -->

				<footer class="text-center">
				<p class="g-color-gray-dark-v5 g-font-size-13 mb-0">
					Chưa có tài khoản? <a class="g-font-weight-600"
						href="#">Đăng Ký</a>
				</p>
				</footer>
			</div>
		</div>
	</div>
</div>
<!-- End Login -->
<jsp:include page="../footer.jsp" flush="true"></jsp:include>