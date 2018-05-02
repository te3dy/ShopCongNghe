<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="object.KHACHHANG_OBJ"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TTS Shop</title>

<link rel="shortcut icon" href="/Shopcongnghe/Images/favicon.png" type="image/x-icon" />
<link rel="icon" href="/Shopcongnghe/Images/favicon.png" type="image/x-icon" />
<!-- link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/mystyle.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/product.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/cloudzoom.css" /-->
<link rel="stylesheet" href="/Shopcongnghe/css/bootstrap.min.css">
<link rel="stylesheet" href="/Shopcongnghe/css/font-awesome.min.css">
<link rel="stylesheet" href="/Shopcongnghe/css/icon-hs.css">
<link rel="stylesheet" href="/Shopcongnghe/css/animate.css">
<link rel="stylesheet" href="/Shopcongnghe/css/dzsparallaxer.css">
<link rel="stylesheet" href="/Shopcongnghe/css/scroller.css">
<link rel="stylesheet" href="/Shopcongnghe/css/plugin.css">
<link rel="stylesheet" href="/Shopcongnghe/css/hs.megamenu.css">
<link rel="stylesheet" href="/Shopcongnghe/css/unify-components.css">
<link rel="stylesheet" href="/Shopcongnghe/css/unify-globals.css">
<link rel="stylesheet" href="/Shopcongnghe/css/hamburgers.min.css">
<link rel="stylesheet" href="/Shopcongnghe/css/slick.css">
<link rel="stylesheet" href="/Shopcongnghe/css/hs-bg-video.css">
<link rel="stylesheet" href="/Shopcongnghe/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="/Shopcongnghe/css/unify.css">
<link rel="stylesheet" href="/Shopcongnghe/css/styles.multipage-education.css">
<link rel="stylesheet" href="/Shopcongnghe/css/simple-line-icons.css">
<link rel="stylesheet" href="/Shopcongnghe/css/custom.css">
<link rel="stylesheet" href="/Shopcongnghe/css/responsive.css">

</head>
<body>
	<!-- Header -->
    <header id="js-header" class="u-header u-header--static--lg u-header--show-hide--lg u-header--change-appearance--lg" data-header-fix-moment="500" data-header-fix-effect="slide">
      <div class="u-header__section u-header__section--light g-bg-white g-transition-0_3 g-py-10" data-header-fix-moment-exclude="g-bg-white g-py-10" data-header-fix-moment-classes="g-bg-white-opacity-0_7 u-shadow-v18 g-py-0">
        <nav class="navbar navbar-expand-lg">
          <div class="container">
            <!-- Responsive Toggle Button -->
            <button class="navbar-toggler navbar-toggler-right btn g-line-height-1 g-brd-none g-pa-0 g-pos-abs g-top-3 g-right-0" type="button" aria-label="Toggle navigation" aria-expanded="false" aria-controls="navBar" data-toggle="collapse" data-target="#navBar">
              <span class="hamburger hamburger--slider">
            <span class="hamburger-box">
              <span class="hamburger-inner"></span>
              </span>
              </span>
            </button>
            <!-- End Responsive Toggle Button -->
            <!-- Logo -->
            <a href="/Shopcongnghe" class="navbar-brand">
              <img src="/Shopcongnghe/Images/ttsLogo.png" alt="Image Description">
            </a>
            <!-- End Logo -->

            <!-- Navigation -->
            <div class="js-mega-menu collapse navbar-collapse align-items-center flex-sm-row g-pt-10 g-pt-5--lg" id="navBar">
              <ul class="navbar-nav text-uppercase g-font-weight-600 ml-auto">
              	<%
				DONGSANPHAM_MOD dongsanpham_mod =new DONGSANPHAM_MOD();
				NHOMSANPHAM_MOD nhomsanpham_mod =new NHOMSANPHAM_MOD();
				byte number = 1;
				ResultSet dsDSP,dsNSP;
				dsDSP=dongsanpham_mod.DanhsachdongSanpham();
				if(dsDSP!=null)
				{
					while(dsDSP.next())
					{
						String navLinkId = "nav-link-" + number;
						String navSubMenu = "nav-submenu-" + number;
						number++;
						String madongsp=dsDSP.getString(1);
						String tendsp=dsDSP.getString(2);
						%>
                <li class="nav-item hs-has-sub-menu g-mx-10--lg">
                  <a href="/Shopcongnghe/ChitietDongsanpham.jsp?madongsp=<%=madongsp%>" 
               		class="nav-link g-px-0 g-color-primary--hover" 
               		id="<%=navLinkId %>" 
               		aria-haspopup="true" aria-expanded="false" 
               		aria-controls="<%=navSubMenu%>">
             		<%=tendsp %>
                  </a>
                  <!-- Submenu -->
                  <ul class="hs-sub-menu list-unstyled g-text-transform-none g-brd-top g-brd-primary g-brd-top-2 g-min-width-200 g-mt-20 g-mt-10--lg--scrolling"
                  	id="<%=navSubMenu%>" 
                   	aria-labelledby="<%=navLinkId %>">
                    	<%
						dsNSP=nhomsanpham_mod.DanhsachNhomsanpham_DONGSP(madongsp);
						if(dsNSP!=null)
						{
							while(dsNSP.next())
							{
								String manhomsp=dsNSP.getString(1);
								String tennsp=dsNSP.getString(3);
								%>
                    <li class="dropdown-item">
                      <a class="nav-link g-px-0 g-color-primary--hover" 
                      href="/Shopcongnghe/Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>">
                      	<%=tennsp %>
                      </a>
                    </li>
                    	<%
							}
						}
						%>
                  </ul>
                  <!-- End Submenu -->
	                <%
						}
					}
					%>
                </li>
                <!-- Cart -->
                <li class="nav-item g-ml-10--lg m-auto">
                  <a class="u-link-v5 u-shadow-v19 g-color-white--hover g-bg-white g-bg-primary--hover g-rounded-20 g-px-18 g-py-8" href="giohang.jsp">
                  	<i class="fa fa-shopping-cart"></i> [<%
					GIOHANG_MOD gh_head=(GIOHANG_MOD)session.getAttribute("giohang");
					if(gh_head!=null){ out.print(gh_head.SoluongMonhang());}else{ out.print("0") ;}%>]
                  </a>
                </li>
                <!-- End Cart -->
                <!-- Login -->
                <%
                KHACHHANG_OBJ khachhang_obj=(KHACHHANG_OBJ)session.getAttribute("Khachhang");
				session.setAttribute("urlkh", request.getRequestURI());
                if(khachhang_obj==null){
                %>
                <li class="nav-item g-ml-10--lg m-auto">
                  <a class="u-link-v5 u-shadow-v19 g-color-white--hover g-bg-white g-bg-primary--hover g-rounded-20 g-px-18 g-py-8" href="/Shopcongnghe/client/DangKy.jsp">Đăng ký</a>
                </li>
                <li class="nav-item g-ml-10--lg m-auto">
                  <a class="u-link-v5 u-shadow-v19 g-color-white--hover g-bg-white g-bg-primary--hover g-rounded-20 g-px-18 g-py-8" href="/Shopcongnghe/client/Dangnhap.jsp">Đăng nhập</a>
                </li>
                <%
				}else{
				%>
				<li class="nav-item hs-has-sub-menu g-ml-10--lg m-auto">
                	<a class="u-link-v5 u-shadow-v19 g-color-white--hover g-bg-white g-bg-primary--hover g-rounded-20 g-px-18 g-py-8" href="#"
	                	id="nav-link-4" 
	               		aria-haspopup="true" aria-expanded="false" 
	               		aria-controls="nav-submenu-4"
               		><i class="fa fa-user-circle-o"></i></a>
                	<!-- Submenu -->
                  	<ul class="hs-sub-menu list-unstyled g-text-transform-none g-brd-top g-brd-primary g-brd-top-2 g-min-width-200 g-mt-20 g-mt-10--lg--scrolling"
	                  	id="nav-submenu-4" 
	                   	aria-labelledby="nav-link-4">
	                   	<li class="dropdown-item">
	                    	<a class="nav-link g-px-0 g-color-primary--hover font-weight-bold" 
	                      		href="/Shopcongnghe/client/QuanLyThongTinCaNhan.jsp">
	                    		<%=khachhang_obj.getTenKH()%>
	                    	</a>
	                    </li>
	                    <li class="dropdown-item">
	                    	<a class="nav-link g-px-0 g-color-primary--hover" 
	                      		href="Dangxuat.do?kh=true">
	                    		Đăng xuất
	                    	</a>
	                    </li>
	            	</ul>
                </li>
				<%
				}
				%>
               	<!-- End login -->
              </ul>
            </div>
            <!-- End Navigation -->
            <!-- Search -->
            <div class="d-inline-block g-pos-rel g-valign-middle g-ml-30 g-ml-0--lg g-pa-10--md g-rounded-20 u-shadow-v19">
              <a href="#!" class="g-font-size-18" aria-haspopup="true" aria-expanded="false" aria-controls="searchform-1" data-dropdown-target="#searchform-1" data-dropdown-type="css-animation" data-dropdown-duration="300" data-dropdown-animation-in="fadeInUp"
              data-dropdown-animation-out="fadeOutDown">
                <i class="fa fa-search"></i>
              </a>
              <!-- Search Form -->
              <form id="searchform-1" action="Timkiem.jsp" method="get" class="u-searchform-v1 u-dropdown--css-animation u-dropdown--hidden g-bg-white g-mt-25--lg g-mt-15--lg--scrolling g-rounded-20">
                <div class="input-group g-brd-primary--focus">
                  <input name="q" class="form-control g-brd-none g-bg-white g-font-size-12 text-uppercase g-rounded-left-20 g-pl-20 g-py-9" type="text" placeholder="Tìm kiếm sản phẩm ...">
                    <button class="btn input-group-addon d-flex align-items-center g-brd-none g-color-white g-bg-primary g-bg-primary-light-v1--hover g-font-size-13 g-rounded-right-20 g-transition-0_2" type="submit">
                      <i class="fa fa-search"></i>
                    </button>
                </div>
              </form>

              <!-- End Search Form -->
            </div>
            <!-- End Search -->
          </div>
        </nav>
      </div>
    </header>
    <!-- End Header -->
    <jsp:include page="slide.jsp"></jsp:include>
    <section class="g-min-height-100vh g-flex-centered g-bg-lightblue-radialgradient-circle">
	