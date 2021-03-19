<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous"> -->
<!--<link rel="stylesheet" type="text/css" href="../css/fontawesome-free-5.13.0-web/css/all.css">  -->
<link
	href="<c:url value="/css/fontawesome-free-5.13.0-web/css/all.css"/>"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="/css/bootstrap.min.css"/>" rel='stylesheet'
	type='text/css' />
<link href="<c:url value="/css/bootstrap.css"/>" rel='stylesheet'
	type='text/css' />
<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/css/css.css"/>" rel='stylesheet'
	type='text/css' />
<title>Giới thiệu</title>
</head>

<body>
	<input type="hidden" value="${tk.tenTaiKhoan }" name="tenTaiKhoan">
	<c:set var="tentk" value="${tk.tenTaiKhoan }" scope="session"></c:set>
	<div class="container-fluid">
		<div class="topheader">
			<div class="row">
				<div class="col-md-4" id="navbar-header">
					<c:if test="${tentk==null}">
						<ul>
							<li><a href="dangnhap"><span>Đăng nhập</span></a></li>
							<li><a href="#"><span>Đăng ký</span></a></li>
						</ul>

					</c:if>
					<c:if test="${tentk!=null}">
						<ul>
							<li><a href="dangnhap"><span>Xin Chào
										${tk.tenTaiKhoan } </span></a></li>
							<li><a href="dangxuat"><span>Đăng Xuất</span></a></li>
						</ul>
					</c:if>
				</div>
				<jsp:include page="check_account.jsp"></jsp:include>
			</div>
		</div>
		<div class="header_menu">
			<div class="row">
				<div class="col-xl-3 col-lg-2 col-md-12 col-sm-12 col-xs-12">
					<div class="logo">
						<a href="#"
							style="display: block; line-height: 100px; height: 100px;"> <img
							src="images/logo.png">
						</a>
					</div>
				</div>
				<div class="col-xl-7 col-lg-8 col-md-12">
					<div class="header_service">
						<div class="row">
							<div class="col-lg-6">
								<div class="wrp">
									<div class="font-awesome">
										<i class="fas fa-truck" style="line-height: 53px;"></i>
									</div>
								</div>
								<div class="text" id="text-vanchuyen">
									<p style="color: #66a182; font-size: 16px;">Miễn phí vận
										chuyển</p>
									<span style="font-size: 14px;">Với đơn hàng trị giá trên
										<strong>1.000.000</strong>
									</span>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="wrp">
									<div class="font-awesome">
										<i class="fas fa-phone" style="line-height: 53px;"></i>
									</div>
								</div>
								<div class="text" id="text-vanchuyen">
									<p style="color: #66a182; font-size: 16px;">Đặt hàng nhanh</p>
									<span style="font-size: 14px;">Gọi ngay <strong>18006750</strong>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-2 col-lg-2 hidden-md hiden-sm hidden-xs"
					id="giohang">
					<div
						class="cart visible-xl visible-lg hidden-md hidden-sm hidden-xs">
						<a href="#" id="icon-cart"> <img src="images/icon-cart.png"
							style="padding-top: 12px;">
						</a>
						<div class="text-giohang">
							<a href="giohang" style="font-size: 16px; color: #66a182;">Giỏ
								hàng</a>
							<p style="margin: 0 0 15px 0;">
								(<span style="color: red;">${cart.soLuongItiem() }</span>) Sản
								phẩm
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header_nav_main section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="heade_menunav">
						<!-- _footer.jsp -->
						<div>
							<jsp:include page="menu2.jsp"></jsp:include>
						</div>



						<div id="menu-overlay" class=""></div>
						<section class="bread-crumb">
							<span class="crumb-border"></span>
							<div class="container ">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<ul class="breadcrumb">
											<li class="home"><a href="trangchu"><span>Trang
														chủ</span></a> <span class="mr_lr">&nbsp;<i
													class="fas fa-chervon-right"></i>&nbsp;
											</span></li>

											<li><strong><span>Giới thiệu</span></strong></li>

										</ul>
									</div>
								</div>
							</div>
						</section>
						<section class="page">
							<div class="container">
								<div
									class="wrap_background_aside padding-top-15 margin-bottom-40">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12">
											<div class="page-title category-title">
												<h1 class="title-head">
													<a href="#">Giới thiệu</a>
												</h1>
											</div>
											<div class="content-page rte">
												<p style="text-align: justify;">
													<strong>Thế giới xe điện - Mua bán trực tuyến xe
														đạp điện trực tuyến hàng đầu Việt Nam</strong>
												</p>

												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">BẠN ĐANG TÌM KIẾM NHỮNG
													MẪU XE ĐIỆN MỚI NHẤT TRÊN MẠNG? HÃY MUA SẮM NGAY HÔM NAY
													TẠI THẾ GIỚI XE ĐIỆN !</p>

												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">Thế giới xe điện&nbsp;sẽ
													mang lại cho khách hàng những mẫu xe đạp điện thời trang
													mới nhất từ các nhà sản xuất hàng đầu quốc tế. Bạn có thể
													tìm thấy những mẫu xe mình muốn. Những trải nghiệm mới chỉ
													có ở trang mua sắm xe đạp điện trực tuyến Thế giới xe điện.</p>

												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">
													<strong>Thế giới xe điện - Nuôi dưỡng tương lai!</strong>
												</p>

												<p style="text-align: justify;">&nbsp;</p>



												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">Thế giới xe
													điện&nbsp;luôn cập nhật những xu hướng phong cách nhất từ
													những nhà sản xuất xe hàng đầu như HonDa hoặc Yamaha. Chất
													lượng, phù hợp túi tiền - chỉ có ở Thế giới xe điện!</p>

												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">
													<strong>PHONG CÁCH MUA SẮM HIỆN ĐẠI - THUẬN TIỆN,
														THANH TOÁN AN TOÀN - DỄ DÀNG</strong>
												</p>

												<p style="text-align: justify;">&nbsp;</p>

												<p style="text-align: justify;">Bạn có thể mua sắm thoải
													mái trên Thế giới xe điện&nbsp;mà không có bất kỳ lo lắng
													nào: Bảo hành 12 tháng, xử lí trong 10 phút. Nhận hàng
													thanh toán. Giao hàng toàn quốc</p>

												<p style="text-align: justify;">&nbsp;</p>
											</div>
										</div>
									</div>
								</div>




							</div>

							<!-- _footer.jsp -->
							<div>
								<jsp:include page="_footer.jsp"></jsp:include>
							</div>
						</section>






					</div>


				</div>


			</div>


		</div>



	</div>




</body>



